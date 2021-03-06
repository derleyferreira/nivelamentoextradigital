unit uDMEmpresa;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uEmpresa, Datasnap.DBClient,
  Datasnap.Provider, uDMEndereco;

type
  TDM_EMPRESA = class(TDataModule)
    Q_OPERACAO: TFDQuery;
    Q_PESQUISA: TFDQuery;
    Q_CONSULTA: TFDQuery;
    DSP_CONSULTA: TDataSetProvider;
    CDS_CONSULTA: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }

    DM_ENDERECO : TDM_ENDERECO;

    Procedure IncluirEmpresa(pEmpresa : TEmpresa);
    procedure AlterarEmprea(pEmpresa : TEmpresa);
    Procedure ExcluirEmpresa(pEmpresa : TEmpresa);

    Procedure PassaParametros(pEmpresa : TEmpresa);

    function Sql_Padrao  : String;
    function Sql_Incluir : String;
    function Sql_Alterar : String;
    function Sql_Excluir : String;
    function serializaObjetoEmpresaConsulta: TEmpresa;

  public
    { Public declarations }
    Procedure ExecutaOperacao(pEmpresa : TEmpresa);
    function ConsultarEmpresas(pFiltro : String; pOrdem : String) : Boolean;

    function retornaObjetoEmpresaConsulta : TEmpresa;

  end;


implementation

uses uTipos, strUtils, uDMConexao;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM_EMPRESA }

procedure TDM_EMPRESA.AlterarEmprea(pEmpresa: TEmpresa);
begin

   DM_CONEXAO.AbrirTransacao;

   try
      Q_OPERACAO.Close;
      Q_OPERACAO.SQL.Text := Sql_Alterar;
      PassaParametros(pEmpresa);
      Q_OPERACAO.ExecSQL;

      DM_ENDERECO.ExecutaOperacao(pEmpresa.Endereco);
      DM_CONEXAO.FecharTransacao;
   except
      on E: Exception do
      begin
         DM_CONEXAO.CancelarTransacao;
         raise Exception.Create('N?o foi poss?vel concluir a opera??o.'+#13#10+
                                  'Motivo: ' + e.Message);

      end;
   end;


end;

function TDM_EMPRESA.ConsultarEmpresas(pFiltro, pOrdem: String) : Boolean;
begin

   CDS_CONSULTA.Close;
   CDS_CONSULTA.CommandText := Sql_Padrao;

   CDS_CONSULTA.CommandText := CDS_CONSULTA.CommandText + ' WHERE STEXCLUIDO <> ''S'' ';

   if pFiltro <> EmptyStr then
   begin
      CDS_CONSULTA.CommandText := CDS_CONSULTA.CommandText + pFiltro;
   end;

   if pOrdem <> EmptyStr then
   begin
      CDS_CONSULTA.CommandText := CDS_CONSULTA.CommandText + ' ORDER BY ' + pOrdem;
   end;

   CDS_CONSULTA.Open;

   Result := not CDS_CONSULTA.IsEmpty;

end;


procedure TDM_EMPRESA.DataModuleCreate(Sender: TObject);
begin
   DM_CONEXAO.AtribuiConexao(Self);

   DM_ENDERECO := TDM_ENDERECO.Create(Self)

end;


procedure TDM_EMPRESA.DataModuleDestroy(Sender: TObject);
begin
   FreeAndNil(DM_ENDERECO);
end;

procedure TDM_EMPRESA.ExcluirEmpresa(pEmpresa: TEmpresa);
begin

   pEmpresa.Excluido := true;

   AlterarEmprea(pEmpresa);

end;

procedure TDM_EMPRESA.ExecutaOperacao(pEmpresa: TEmpresa);
begin

   case pEmpresa.OperacaoCadastro of

      ocIncluir: IncluirEmpresa(pEmpresa);

      ocAlterar: AlterarEmprea(pEmpresa);

      ocExcluir: ExcluirEmpresa(pEmpresa);

   end;

end;

procedure TDM_EMPRESA.IncluirEmpresa(pEmpresa: TEmpresa);
begin


   if pEmpresa.IdEmpresa <= 0 then
   begin
      pEmpresa.IdEmpresa := DM_CONEXAO.RetornaProximoGenerator('GEN_CADEMPRESA_ID');
      pEmpresa.Endereco.IdEmpresa := pEmpresa.IdEmpresa;
   end;

   DM_CONEXAO.AbrirTransacao;

   try

      Q_OPERACAO.Close;
      Q_OPERACAO.SQL.Text := Sql_Incluir;

      PassaParametros(pEmpresa);

      Q_OPERACAO.ExecSQL;

      DM_ENDERECO.ExecutaOperacao(pEmpresa.Endereco);

      DM_CONEXAO.FecharTransacao;
   except
      on E: Exception do
      begin
         DM_CONEXAO.CancelarTransacao;
         raise Exception.Create('N?o foi poss?vel concluir a grava??o.'+#13#10+
                                'Motivo: ' + e.Message);
      end;
   end;

end;

procedure TDM_EMPRESA.PassaParametros(pEmpresa: TEmpresa);
begin

   Q_OPERACAO.ParamByName('IDEMPRESA'  ).AsInteger := pEmpresa.IdEmpresa;


   Q_OPERACAO.ParamByName('NMEMPRESA'  ).AsString  := pEmpresa.NomeEmpresa;
   Q_OPERACAO.ParamByName('NUCNPJ'     ).AsString  := pEmpresa.CNPJ;
   Q_OPERACAO.ParamByName('NUINSCRICAO').AsString  := pEmpresa.Inscricao;
   Q_OPERACAO.ParamByName('STATIVO'    ).AsString   := ifThen(pEmpresa.Ativo, 'S','N');
   Q_OPERACAO.ParamByName('DTCADASTRO' ).AsDateTime := pEmpresa.DataCadastro;
   Q_OPERACAO.ParamByName('DTABERTURA' ).AsDateTime := pEmpresa.DataAbertura;
   Q_OPERACAO.ParamByName('TLCOMERCIAL').AsString   := pEmpresa.TelComercial;
   Q_OPERACAO.ParamByName('TLCELULAR'  ).AsString   := pEmpresa.TelCelular;
   Q_OPERACAO.ParamByName('TXOBS'      ).AsInteger  := pEmpresa.Obs;
   Q_OPERACAO.ParamByName('TXEMAIL'    ).AsString   := pEmpresa.Email;
   Q_OPERACAO.ParamByName('STEXCLUIDO' ).AsString   := IfThen(pEmpresa.Excluido, 'S','N');

end;

function TDM_EMPRESA.retornaObjetoEmpresaConsulta: TEmpresa;
begin

   Result := nil;

   if not CDS_CONSULTA.Active then
      Exit;

   if CDS_CONSULTA.IsEmpty then
      Exit;

   Result := TEmpresa.Create;

   Result.IdEmpresa    := CDS_CONSULTA.FieldByName('IDEMPRESA'  ).AsInteger;
   Result.NomeEmpresa  := CDS_CONSULTA.FieldByName('NMEMPRESA'  ).AsString;
   Result.CNPJ         := CDS_CONSULTA.FieldByName('NUCNPJ'     ).AsString;
   Result.Inscricao    := CDS_CONSULTA.FieldByName('NUINSCRICAO').AsString;
   Result.Ativo        := CDS_CONSULTA.FieldByName('STATIVO'    ).AsString = 'S';
   Result.DataCadastro := CDS_CONSULTA.FieldByName('DTCADASTRO' ).AsDateTime;
   Result.DataAbertura := CDS_CONSULTA.FieldByName('DTABERTURA' ).AsDateTime;
   Result.TelComercial := CDS_CONSULTA.FieldByName('TLCOMERCIAL').AsString;
   Result.TelCelular   := CDS_CONSULTA.FieldByName('TLCELULAR'  ).AsString;
   Result.Obs          := CDS_CONSULTA.FieldByName('TXOBS'      ).AsInteger;
   Result.Email        := CDS_CONSULTA.FieldByName('TXEMAIL'    ).AsString;
   Result.Excluido     := CDS_CONSULTA.FieldByName('STEXCLUIDO' ).AsString = 'S';
   Result.DataExclusao := CDS_CONSULTA.FieldByName('DTEXCLUIDO' ).AsDateTime;

   DM_ENDERECO.PreenchDadosEnderecoEmpresa(Result.Endereco,Result.IdEmpresa);

end;

function TDM_EMPRESA.serializaObjetoEmpresaConsulta: TEmpresa;
begin

end;

function TDM_EMPRESA.Sql_Alterar: String;
begin
   Result := 'UPDATE CADEMPRESA SET                            '+
             '         CADEMPRESA.NMEMPRESA   = :NMEMPRESA,    '+
             '         CADEMPRESA.NUCNPJ      = :NUCNPJ,       '+
             '         CADEMPRESA.NUINSCRICAO = :NUINSCRICAO,  '+
             '         CADEMPRESA.STATIVO     = :STATIVO,      '+
             '         CADEMPRESA.DTCADASTRO  = :DTCADASTRO,   '+
             '         CADEMPRESA.DTABERTURA  = :DTABERTURA,   '+
             '         CADEMPRESA.TLCOMERCIAL = :TLCOMERCIAL,  '+
             '         CADEMPRESA.TLCELULAR   = :TLCELULAR,    '+
             '         CADEMPRESA.TXOBS       = :TXOBS,        '+
             '         CADEMPRESA.TXEMAIL     = :TXEMAIL,      '+
             '         CADEMPRESA.STEXCLUIDO  = :STEXCLUIDO,   '+
             '         CADEMPRESA.DTEXCLUIDO  = :DTEXCLUIDO    '+
             '     WHERE CADEMPRESA.IDEMPRESA = :IDEMPRESA     ';

end;

function TDM_EMPRESA.Sql_Excluir: String;
begin
   Result := 'DELETE FROM CADEMPRESA '+
             ' WHERE CADEMPRESA.IDEMPRESA = :IDEMPRESA ';
end;

function TDM_EMPRESA.Sql_Incluir: String;
begin
   Result := 'INSERT INTO CADEMPRESA        '+
             '           (IDEMPRESA,        '+
             '           NMEMPRESA,         '+
             '           NUCNPJ,            '+
             '           NUINSCRICAO,       '+
             '           STATIVO,           '+
             '           DTCADASTRO,        '+
             '           DTABERTURA,        '+
             '           TLCOMERCIAL,       '+
             '           TLCELULAR,         '+
             '           TXOBS,             '+
             '           TXEMAIL,           '+
             '           STEXCLUIDO,        '+
             '           DTEXCLUIDO )       '+
             '   VALUES (:IDEMPRESA,        '+
             '           :NMEMPRESA,        '+
             '           :NUCNPJ,           '+
             '           :NUINSCRICAO,      '+
             '           :STATIVO,          '+
             '           :DTCADASTRO,       '+
             '           :DTABERTURA,       '+
             '           :TLCOMERCIAL,      '+
             '           :TLCELULAR,        '+
             '           :TXOBS,            '+
             '           :TXEMAIL,          '+
             '           :STEXCLUIDO,       '+
             '           :DTEXCLUIDO)       ';
end;

function TDM_EMPRESA.Sql_Padrao: String;
begin
   Result := 'SELECT CADEMPRESA.IDEMPRESA,        '+
             '         CADEMPRESA.NMEMPRESA,      '+
             '         CADEMPRESA.NUCNPJ,         '+
             '         CADEMPRESA.NUINSCRICAO,    '+
             '         CADEMPRESA.STATIVO,        '+
             '         CADEMPRESA.DTCADASTRO,     '+
             '         CADEMPRESA.DTABERTURA,     '+
             '         CADEMPRESA.TLCOMERCIAL,    '+
             '         CADEMPRESA.TLCELULAR,      '+
             '         CADEMPRESA.TXOBS,          '+
             '         CADEMPRESA.TXEMAIL,        '+
             '         CADEMPRESA.STEXCLUIDO,     '+
             '         CADEMPRESA.DTEXCLUIDO      '+
             '  FROM CADEMPRESA                   ';
end;

end.
