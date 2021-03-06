unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Forms, IniFiles, WinAPI.Windows;

type
  TDM_CONEXAO = class(TDataModule)
    FDConexao: TFDConnection;
    FDTransacao: TFDTransaction;
    Q_COMANDOS: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

    procedure ConectarBD;
    function RetornaCaminhoBD : String;

  public
    { Public declarations }
    Procedure AtribuiConexao(pDM : TDataModule);

    Procedure AbrirTransacao;
    Procedure FecharTransacao;
    Procedure CancelarTransacao;

    function RetornaProximoGenerator(pGenerator : String) : Integer;

  end;

var
  DM_CONEXAO: TDM_CONEXAO;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_CONEXAO }

procedure TDM_CONEXAO.AbrirTransacao;
begin
   if not FDConexao.InTransaction then
      FDConexao.StartTransaction;

end;

procedure TDM_CONEXAO.AtribuiConexao(pDM: TDataModule);
var
   i : Integer;
begin

   for i := 0 to Pred(pDM.ComponentCount) do
   begin
      if pDM.Components[i].ClassType = TFDQuery then
      begin
         TFDQuery(pDM.Components[i]).Connection := FDConexao;
      end;
   end;

end;

procedure TDM_CONEXAO.CancelarTransacao;
begin
   if FDConexao.InTransaction then
      FDConexao.Rollback;
end;

procedure TDM_CONEXAO.ConectarBD;
begin

   FDConexao.Params.Database := RetornaCaminhoBD;
   try
      FDConexao.Open;
   except
      on E: Exception do
      begin
         Application.MessageBox(pWideChar('N?o foi poss?vel conectar ao banco de dados. ' + #13#10+
                                'Motivo: ' + e.Message), 'Aten??o', mb_ok + mb_IconWarning);
         Application.Terminate;
      end;

   end;

end;

procedure TDM_CONEXAO.DataModuleCreate(Sender: TObject);
begin
   ConectarBD;
end;

procedure TDM_CONEXAO.FecharTransacao;
begin

   if FDConexao.InTransaction then
      FDConexao.Commit;

end;

function TDM_CONEXAO.RetornaCaminhoBD: String;
var
   sCaminhoBD : String;
   ArqConf    : TIniFile;
begin

   sCaminhoBD := ExtractFilePath(Application.ExeName) + 'Dados\Dados.fdb';

   try
      ArqConf := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Conf.ini');

      sCaminhoBD := ArqConf.ReadString('CONEXAO','CaminhoBD',sCaminhoBD);

   finally
       ArqConf.Free;
   end;


   Result := sCaminhoBD;

end;

function TDM_CONEXAO.RetornaProximoGenerator(pGenerator: String): Integer;
begin

   Q_COMANDOS.Close;
   Q_COMANDOS.SQL.Text := 'select gen_id(' + pGenerator + ', 1) from rdb$database';
   Q_COMANDOS.Open;
   Result := Q_COMANDOS.Fields[0].AsInteger;

end;

end.
