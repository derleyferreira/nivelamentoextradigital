unit uDMEndereco;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uEndereco, uTipos;

type
  TDM_ENDERECO = class(TDataModule)
    Q_OPERACAO: TFDQuery;
    Q_PESQUISA: TFDQuery;
    Q_CONSULTA: TFDQuery;
    DSP_CONSULTA: TDataSetProvider;
    CDS_CONSULTA: TClientDataSet;
    Q_ENDERECO_INATIVO: TFDQuery;
    DSP_ENDERECO_INATIVO: TDataSetProvider;
    CDS_ENDERECO_INATIVO: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

    Procedure IncluirEndereco(pEndereco : TEndereco);
    procedure AlterarEndereco(pEndereco : TEndereco);
    Procedure ExcluirEndereco(pEndereco : TEndereco);

    Procedure PassaParametros(pEndereco : TEndereco);


    function Sql_Padrao  : String;
    function Sql_Incluir : String;
    function Sql_Alterar : String;
    function Sql_Excluir : String;

    function Sql_Completo : String;

    procedure PesquisaEnderecoPorId(pId : Integer);

    Procedure PreencheDadosEnderecoCompleto(pEndereco : TEndereco);

  public
    { Public declarations }
    Procedure ExecutaOperacao(pEndereco : TEndereco);
    function retornaEndereco(pIdEndereco : Integer) : TEndereco;
    Procedure PreencheDadosEndereco(pEndereco : TEndereco; pId : Integer);
    procedure PreenchDadosEnderecoEmpresa(pEndereco :TEndereco; pIdEmpresa : Integer);
    function  SelecionarEnderecosInativosEmpresa(pIdEmpresa : Integer) : Boolean;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDMConexao, strUtils;

{$R *.dfm}

procedure TDM_ENDERECO.AlterarEndereco(pEndereco: TEndereco);
begin

   Q_OPERACAO.Close;
   Q_OPERACAO.SQL.Text := Sql_Alterar;
   PassaParametros(pEndereco);
   Q_OPERACAO.ExecSQL;

end;

procedure TDM_ENDERECO.DataModuleCreate(Sender: TObject);
begin
   DM_CONEXAO.AtribuiConexao(Self);
end;

procedure TDM_ENDERECO.ExcluirEndereco(pEndereco: TEndereco);
begin

end;

procedure TDM_ENDERECO.ExecutaOperacao(pEndereco: TEndereco);
begin

   case pEndereco.OperacaoCadastro of

      ocIncluir: IncluirEndereco(pEndereco);

      ocAlterar: AlterarEndereco(pEndereco);

      ocExcluir: ExcluirEndereco(pEndereco);

   end;

end;

procedure TDM_ENDERECO.IncluirEndereco(pEndereco: TEndereco);
begin

   Q_OPERACAO.Close;
   Q_OPERACAO.SQL.Text := Sql_Incluir;
   PassaParametros(pEndereco);
   Q_OPERACAO.ExecSQL;

end;

procedure TDM_ENDERECO.PassaParametros(pEndereco: TEndereco);
begin

   if pEndereco.IdTitular > 0 then
      Q_OPERACAO.ParamByName('IDTITULAR').AsInteger := pEndereco.IdTitular
   else
      Q_OPERACAO.ParamByName('IDTITULAR').Clear;

   if pEndereco.IdEmpresa > 0 then
      Q_OPERACAO.ParamByName('IDEMPRESA').AsInteger := pEndereco.IdEmpresa
   else
      Q_OPERACAO.ParamByName('IDTITULAR').Clear;

   Q_OPERACAO.ParamByName('NMENDERECO').AsString  := pEndereco.Endereco;
   Q_OPERACAO.ParamByName('NUENDERECO').AsString  := pEndereco.Numero;
   Q_OPERACAO.ParamByName('NMBAIRRO'  ).AsString  := pEndereco.Bairro;
   Q_OPERACAO.ParamByName('IDCIDADE'  ).AsInteger := pEndereco.Cidade.IdCidade;
   Q_OPERACAO.ParamByName('IDUF'      ).AsInteger   := pEndereco.Uf.IdEstado;
   Q_OPERACAO.ParamByName('NUCEP').AsString := pEndereco.Cep;
   Q_OPERACAO.ParamByName('STATIVO').AsString := IfThen(pEndereco.Ativo,'S','N');
   Q_OPERACAO.ParamByName('STEXCLUIDO').AsString := IfThen(pEndereco.Excluido,'S','N');

   if pEndereco.IdEndereco > 0 then
      Q_OPERACAO.ParamByName('IDENDERECO').AsInteger := pEndereco.IdEndereco
   else
      Q_OPERACAO.ParamByName('IDENDERECO').Clear;

   if pEndereco.DataExclusao > 0 then
      Q_OPERACAO.ParamByName('DTEXCLUIDO').AsDateTime := pEndereco.DataExclusao
   else
      Q_OPERACAO.ParamByName('DTEXCLUIDO').Clear;



end;

procedure TDM_ENDERECO.PesquisaEnderecoPorId(pId: Integer);
begin
   Q_PESQUISA.Close;
   Q_PESQUISA.SQL.Text := Sql_Completo;
   Q_PESQUISA.SQL.Add(' WHERE IDENDERECO = ' + IntToStr(pId));
   Q_PESQUISA.Open;

end;

procedure TDM_ENDERECO.PreenchDadosEnderecoEmpresa(pEndereco: TEndereco;
  pIdEmpresa: Integer);
begin
   Q_PESQUISA.Close;
   Q_PESQUISA.SQL.Text := Sql_Completo;
   Q_PESQUISA.SQL.Add(' WHERE IDEMPRESA = ' + IntToStr(pIdEmpresa));
   Q_PESQUISA.SQL.Add('   AND STATIVO = ''S'' ');
   Q_PESQUISA.Open;

   PreencheDadosEnderecoCompleto(pEndereco);
end;

procedure TDM_ENDERECO.PreencheDadosEndereco(pEndereco: TEndereco;
  pId: Integer);
begin

   PesquisaEnderecoPorId(pId);

   PreencheDadosEnderecoCompleto(pEndereco);
end;

procedure TDM_ENDERECO.PreencheDadosEnderecoCompleto(pEndereco: TEndereco);
begin
   pEndereco.IdEndereco       := Q_PESQUISA.FieldByName('IDENDERECO').AsInteger;
   pEndereco.IdEmpresa        := Q_PESQUISA.FieldByName('IDEMPRESA' ).AsInteger;
   pEndereco.IdTitular        := Q_PESQUISA.FieldByName('IDTITULAR' ).AsInteger;
   pEndereco.Endereco         := Q_PESQUISA.FieldByName('NMENDERECO').AsString;
   pEndereco.Bairro           := Q_PESQUISA.FieldByName('NMBAIRRO'  ).AsString;
   pEndereco.Numero           := Q_PESQUISA.FieldByName('NUENDERECO').AsString;
   pEndereco.Cidade.IdCidade  := Q_PESQUISA.FieldByName('IDCIDADE'  ).AsInteger;
   pEndereco.Cidade.NomeCidade := Q_PESQUISA.FieldByName('NMCIDADE' ).AsString;
   pEndereco.Uf.Sigla         := Q_PESQUISA.FieldByName('SGESTADO'  ).AsString;
   pEndereco.Uf.IdEstado      := Q_PESQUISA.FieldByName('IDUF'      ).AsInteger;
   pEndereco.Cep              := Q_PESQUISA.FieldByName('NUCEP'     ).AsString;
   pEndereco.Ativo            := Q_PESQUISA.FieldByName('STATIVO'   ).AsString = 'S';
   pEndereco.Excluido         := Q_PESQUISA.FieldByName('STEXCLUIDO').AsString = 'S';
   pEndereco.DataExclusao     := Q_PESQUISA.FieldByName('DTEXCLUIDO').AsDateTime;

end;

function TDM_ENDERECO.retornaEndereco(pIdEndereco: Integer): TEndereco;
begin

   Result := TEndereco.Create;

   PreencheDadosEndereco(Result, pIdEndereco);

end;

function TDM_ENDERECO.SelecionarEnderecosInativosEmpresa(
  pIdEmpresa: Integer): Boolean;
begin
   CDS_ENDERECO_INATIVO.Close;
   CDS_ENDERECO_INATIVO.CommandText := Sql_Completo;
   CDS_ENDERECO_INATIVO.CommandText := CDS_ENDERECO_INATIVO.CommandText + ' WHERE IDEMPRESA = ' + IntToStr(pIdEmpresa) +
                                                                          '   AND STATIVO <> ''S'' ';
   CDS_ENDERECO_INATIVO.Open;
   Result := not CDS_ENDERECO_INATIVO.IsEmpty;
end;

function TDM_ENDERECO.Sql_Alterar: String;
begin
   Result := 'UPDATE CADENDERECOS SET  '+
             '                 CADENDERECOS.IDTITULAR    =    :IDTITULAR  ,   '+
             '                 CADENDERECOS.IDEMPRESA    =    :IDEMPRESA  ,   '+
             '                 CADENDERECOS.NMENDERECO   =    :NMENDERECO ,   '+
             '                 CADENDERECOS.NUENDERECO   =    :NUENDERECO ,   '+
             '                 CADENDERECOS.NMBAIRRO     =    :NMBAIRRO   ,   '+
             '                 CADENDERECOS.IDCIDADE     =    :IDCIDADE   ,   '+
             '                 CADENDERECOS.IDUF         =    :IDUF       ,   '+
             '                 CADENDERECOS.NUCEP        =    :NUCEP      ,   '+
             '                 CADENDERECOS.STATIVO      =    :STATIVO    ,   '+
             '                 CADENDERECOS.STEXCLUIDO   =    :STEXCLUIDO ,   '+
             '                 CADENDERECOS.DTEXCLUIDO   =    :DTEXCLUIDO ,   '+
             '                 CADENDERECOS.TPCADASTRO   =    :TPCADASTRO    '+
             ' WHERE IDENDERECO = :IDENDERECO ';


end;

function TDM_ENDERECO.Sql_Completo: String;
begin
   Result := 'SELECT CADENDERECOS.IDENDERECO,    '+
             '      CADENDERECOS.IDTITULAR,      '+
             '      CADENDERECOS.IDEMPRESA,      '+
             '      CADENDERECOS.NMENDERECO,     '+
             '      CADENDERECOS.NUENDERECO,     '+
             '      CADENDERECOS.NMBAIRRO,       '+
             '      CADENDERECOS.IDCIDADE,       '+
             '      CADENDERECOS.IDUF,           '+
             '      CADENDERECOS.NUCEP,          '+
             '      CADENDERECOS.STATIVO,        '+
             '      CADENDERECOS.STEXCLUIDO,     '+
             '      CADENDERECOS.DTEXCLUIDO,     '+
             '      CADENDERECOS.TPCADASTRO,     '+
             '      CADCIDADE.NMCIDADE,          '+
             '      CADUF.SGESTADO               '+
             ' FROM CADENDERECOS                 '+
             ' LEFT JOIN CADCIDADE ON CADCIDADE.IDCIDADE = CADENDERECOS.IDCIDADE '+
             ' LEFT JOIN CADUF ON CADENDERECOS.IDUF = CADUF.IDUF                 ';
end;

function TDM_ENDERECO.Sql_Excluir: String;
begin

end;

function TDM_ENDERECO.Sql_Incluir: String;
begin
   Result := 'INSERT INTO CADENDERECOS (CADENDERECOS.IDENDERECO,  '+
             '                      CADENDERECOS.IDTITULAR,       '+
             '                      CADENDERECOS.IDEMPRESA,       '+
             '                      CADENDERECOS.NMENDERECO,      '+
             '                      CADENDERECOS.NUENDERECO,      '+
             '                      CADENDERECOS.NMBAIRRO,        '+
             '                      CADENDERECOS.IDCIDADE,        '+
             '                      CADENDERECOS.IDUF,            '+
             '                      CADENDERECOS.NUCEP,           '+
             '                      CADENDERECOS.STATIVO,         '+
             '                      CADENDERECOS.STEXCLUIDO,      '+
             '                      CADENDERECOS.DTEXCLUIDO,      '+
             '                      CADENDERECOS.TPCADASTRO)      '+
             '       VALUES ( :IDENDERECO,                        '+
             '                :IDTITULAR,                         '+
             '                :IDEMPRESA,                         '+
             '                :NMENDERECO,                        '+
             '                :NUENDERECO,                        '+
             '                :NMBAIRRO,                          '+
             '                :IDCIDADE,                          '+
             '                :IDUF,                              '+
             '                :NUCEP,                             '+
             '                :STATIVO,                           '+
             '                :STEXCLUIDO,                        '+
             '                :DTEXCLUIDO,                        '+
             '                :TPCADASTRO)                        ';
end;

function TDM_ENDERECO.Sql_Padrao: String;
begin
   Result := 'SELECT CADENDERECOS.IDENDERECO,    '+
             '      CADENDERECOS.IDTITULAR,      '+
             '      CADENDERECOS.IDEMPRESA,      '+
             '      CADENDERECOS.NMENDERECO,     '+
             '      CADENDERECOS.NUENDERECO,     '+
             '      CADENDERECOS.NMBAIRRO,       '+
             '      CADENDERECOS.IDCIDADE,       '+
             '      CADENDERECOS.IDUF,           '+
             '      CADENDERECOS.NUCEP,          '+
             '      CADENDERECOS.STATIVO,        '+
             '      CADENDERECOS.STEXCLUIDO,     '+
             '      CADENDERECOS.DTEXCLUIDO,     '+
             '      CADENDERECOS.TPCADASTRO      '+
             ' FROM CADENDERECOS                 ';
end;

end.
