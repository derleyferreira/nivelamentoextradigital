unit uDMUF;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uUF;

type
  TDM_UF = class(TDataModule)
    Q_CONSULTA: TFDQuery;
    DSP_CONSULTA: TDataSetProvider;
    CDS_CONSULTA: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function Sql_Padrao : String;
  public
    { Public declarations }
    procedure SelecionarEstados;
    function EstadoCadastrado(pEstado : String) : Boolean;
    function RetornaEstadoSelecionado : TUf;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDMConexao;

{$R *.dfm}

{ TDataModule1 }

procedure TDM_UF.DataModuleCreate(Sender: TObject);
begin
   DM_CONEXAO.AtribuiConexao(Self);
end;

function TDM_UF.EstadoCadastrado(pEstado: String): Boolean;
begin
   Result := CDS_CONSULTA.Locate('SGESTADO',pEstado,[]);
end;

function TDM_UF.RetornaEstadoSelecionado: TUf;
begin

   Result := TUf.Create;

   if not CDS_CONSULTA.Active then
      Exit;

   Result.IdEstado := CDS_CONSULTA.FieldByName('IDUF').AsInteger;
   Result.Estado   := CDS_CONSULTA.FieldByName('NMESTADO').AsString;
   Result.Sigla    := CDS_CONSULTA.FieldByName('SGESTADO').AsString;

end;

procedure TDM_UF.SelecionarEstados;
begin

   CDS_CONSULTA.Close;
   CDS_CONSULTA.CommandText := Sql_Padrao;
   CDS_CONSULTA.Open;
   CDS_CONSULTA.IndexFieldNames := 'SGESTADO';

end;

function TDM_UF.Sql_Padrao: String;
begin
   Result := 'SELECT CADUF.IDUF,      '+
             '         CADUF.NMESTADO,'+
             '         CADUF.SGESTADO '+
             '  FROM CADUF            ';
end;

end.
