unit uDMFuncionarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM_FUNCIONARIOS = class(TDataModule)
    Q_CONSULTA: TFDQuery;
    DSP_CONSULTA: TDataSetProvider;
    CDS_CONSULTA: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    function Sql_Padrao : String;

  public
    { Public declarations }

    function SelecionarFuncionariosEmpresa(pIdEmpresa : Integer) : Boolean;

  end;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDMConexao;

{$R *.dfm}

{ TDM_FUNCIONARIOS }

procedure TDM_FUNCIONARIOS.DataModuleCreate(Sender: TObject);
begin
   DM_CONEXAO.AtribuiConexao(Self);
end;

function TDM_FUNCIONARIOS.SelecionarFuncionariosEmpresa(
  pIdEmpresa: Integer): Boolean;
begin

   CDS_CONSULTA.Close;
   CDS_CONSULTA.CommandText := Sql_Padrao;
   CDS_CONSULTA.CommandText := CDS_CONSULTA.CommandText +
                               ' WHERE IDEMPRESA = ' + IntToStr(pIdEmpresa) +
                               '   AND STEXCLUIDO <> ''S'' ' ;
   CDS_CONSULTA.Open;

   Result := not CDS_CONSULTA.IsEmpty;


end;

function TDM_FUNCIONARIOS.Sql_Padrao: String;
begin
   Result := 'SELECT CADFUNCIONARIOS.IDFUNCIONARIO,            '+
             '         CADFUNCIONARIOS.IDEMPRESA,              '+
             '         CADFUNCIONARIOS.NMFUNCIONARIO,          '+
             '         CADFUNCIONARIOS.NUCPF,                  '+
             '         CADFUNCIONARIOS.NURG,                   '+
             '         CADFUNCIONARIOS.DTNASCIMENTO,           '+
             '         CADFUNCIONARIOS.TXEMAIL,                '+
             '         CADFUNCIONARIOS.NUCARTEIRATRAB,         '+
             '         CADFUNCIONARIOS.NUTITULOELEITOR,        '+
             '         CADFUNCIONARIOS.NUCARTEIRAMOTORISTA,    '+
             '         CADFUNCIONARIOS.TPCATERORIA,            '+
             '         CADFUNCIONARIOS.DTVALIDADECARTEIRAMOT,  '+
             '         CADFUNCIONARIOS.TLRESIDENCIAL,          '+
             '         CADFUNCIONARIOS.TLCELULAR,              '+
             '         CADFUNCIONARIOS.TLCONTATO,              '+
             '         CADFUNCIONARIOS.NMCONTATO,              '+
             '         CADFUNCIONARIOS.DTCONTRATACAO,          '+
             '         CADFUNCIONARIOS.DTDEMISSAO,             '+
             '         CADFUNCIONARIOS.DTCADASTRO,             '+
             '         CADFUNCIONARIOS.STATIVO,                '+
             '         CADFUNCIONARIOS.TXOBS,                  '+
             '         CADFUNCIONARIOS.NMENDERECO,             '+
             '         CADFUNCIONARIOS.NUENDERECO,             '+
             '         CADFUNCIONARIOS.NMBAIRRO,               '+
             '         CADFUNCIONARIOS.IDCIDADE,               '+
             '         CADFUNCIONARIOS.IDUF,                   '+
             '         CADFUNCIONARIOS.NUCEP,                  '+
             '         CADFUNCIONARIOS.STEXCLUIDO,             '+
             '         CADFUNCIONARIOS.DTEXCLUIDO              '+
             '  FROM CADFUNCIONARIOS                           ';
end;

end.
