unit uDMCidade;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uCidades;

type
  TDM_CIDADES = class(TDataModule)
    Q_CONSULTA: TFDQuery;
    DSP_CONSULTA: TDataSetProvider;
    CDS_CONSULTA: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function Sql_Consulta : String;
    procedure PreencheObjCidadeConsulta(pCidade : TCidade);
  public
    { Public declarations }
    Procedure SelecionarListaCidadesPesquisa;
    Procedure SelecionarPorEstado(pSigla : String);
    function RetornaCidadeSelecionada : TCidade;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDMConexao;

{$R *.dfm}

procedure TDM_CIDADES.DataModuleCreate(Sender: TObject);
begin
   DM_CONEXAO.AtribuiConexao(Self)
end;

procedure TDM_CIDADES.PreencheObjCidadeConsulta(pCidade: TCidade);
begin
   pCidade.IdCidade   := CDS_CONSULTA.FieldByName('IDCIDADE').AsInteger;
   pCidade.NomeCidade := CDS_CONSULTA.FieldByName('NMCIDADE').AsString;

end;

function TDM_CIDADES.RetornaCidadeSelecionada: TCidade;
begin
   Result := TCidade.Create;

   if not CDS_CONSULTA.Active then
      Exit;

   if CDS_CONSULTA.IsEmpty then
      Exit;

   Result.IdCidade   := CDS_CONSULTA.FieldByName('IDCIDADE').AsInteger;
   Result.NomeCidade := CDS_CONSULTA.FieldByName('NMCIDADE').AsString;

end;

procedure TDM_CIDADES.SelecionarListaCidadesPesquisa;
begin

   CDS_CONSULTA.Close;
   CDS_CONSULTA.CommandText := Sql_Consulta;
   CDS_CONSULTA.Open;

end;

procedure TDM_CIDADES.SelecionarPorEstado(pSigla: String);
begin

   CDS_CONSULTA.Close;
   CDS_CONSULTA.CommandText := Sql_Consulta;

   CDS_CONSULTA.CommandText := CDS_CONSULTA.CommandText +
                               ' WHERE SGESTADO = ' + QuotedStr(pSigla);
   CDS_CONSULTA.Open;

end;

function TDM_CIDADES.Sql_Consulta: String;
begin

   Result := 'SELECT CADCIDADE.IDCIDADE,     '+
             '         CADCIDADE.NMCIDADE,   '+
             '         CADUF.SGESTADO        '+
             '  FROM CADCIDADE               '+
             '  INNER JOIN CADUF ON CADUF.IDUF = CADCIDADE.IDUF ';


end;

end.
