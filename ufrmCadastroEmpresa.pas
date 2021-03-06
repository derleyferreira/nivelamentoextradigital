unit ufrmCadastroEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, uEmpresa, uDmEmpresa,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.DBCtrls, Data.DB, uDMCidade, uDMUF,
  Vcl.Grids, Vcl.DBGrids, uDMFuncionarios, uDMEndereco;

type
  TfrmCadastroEmpresa = class(TForm)
    pnlBotoes: TPanel;
    pnlGeral: TPanel;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    pnlControlesCadastro: TPanel;
    Label1: TLabel;
    edtCodigo: TEdit;
    edtRazaoSocial: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtInscricao: TEdit;
    cbAtiva: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    edtEmail: TEdit;
    mskCNPJ: TMaskEdit;
    mskDtAbertura: TMaskEdit;
    Label7: TLabel;
    mskTelefone: TMaskEdit;
    Label8: TLabel;
    mskCelular: TMaskEdit;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnGravar: TBitBtn;
    btnConsultar: TBitBtn;
    btnExcluir: TBitBtn;
    Bevel1: TBevel;
    Label9: TLabel;
    edtEndereco: TEdit;
    Label10: TLabel;
    edtNumero: TEdit;
    Label11: TLabel;
    edtBairro: TEdit;
    Label12: TLabel;
    edtUF: TEdit;
    Label13: TLabel;
    dblCidade: TDBLookupComboBox;
    Label14: TLabel;
    mskCEP: TMaskEdit;
    DS_CIDADE: TDataSource;
    StatusBar: TStatusBar;
    dbgFuncionarios: TDBGrid;
    dbgOutrosEnderecos: TDBGrid;
    DS_FUNCIONARIOS: TDataSource;
    DS_OUTROSENDERECOS: TDataSource;
    Panel1: TPanel;
    spbFuncionarios: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure edtUFExit(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dblCidadeCloseUp(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure spbFuncionariosClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }

    objEmpresa   : TEmpresa;
    objDmEmpresa : TDM_EMPRESA;

    objDmCidade  : TDM_CIDADES;
    objDmUf      : TDM_UF;

    objDmFuncionarios : TDM_FUNCIONARIOS;

    objDmEndereco     : TDM_ENDERECO;

    procedure InstanciaObjetos;
    procedure DestroiObjetos;

    Procedure LimpaCampos;

    Procedure Incluir;
    Procedure Alterar;
    procedure Excluir;

    Procedure MostraDados;
    Procedure Gravar;

    function ValidaDados : Boolean;

    procedure ConsultarEmpresa;

    Procedure PreencheObjeto;
    Procedure CarregaCidades(pUf : String);

    procedure TrataBotoes;

    procedure reiniciaObjEmprea;

    procedure CancelaOperacao;

    Procedure HabilitaCampos(pOpcao : Boolean);

    procedure FechaTabelasVinculadas;

  public
    { Public declarations }
  end;

var
  frmCadastroEmpresa: TfrmCadastroEmpresa;

implementation

{$R *.dfm}

uses uTipos, ufrmConsultaEmpresa;

{ TfrmCadastroEmpresa }

procedure TfrmCadastroEmpresa.Alterar;
begin

   objEmpresa.OperacaoCadastro := ocAlterar;
   edtRazaoSocial.SetFocus;

end;

procedure TfrmCadastroEmpresa.btnGravarClick(Sender: TObject);
begin

   if not btnGravar.Enabled then
      Exit;

   if not ValidaDados then
      Exit;

   Gravar;

   LimpaCampos;

   reiniciaObjEmprea;

   HabilitaCampos(False);

   FechaTabelasVinculadas;

   TrataBotoes;

end;

procedure TfrmCadastroEmpresa.btnConsultarClick(Sender: TObject);
begin

   if not btnConsultar.Enabled then
      Exit;

   ConsultarEmpresa;
   HabilitaCampos(False);
end;

procedure TfrmCadastroEmpresa.btnExcluirClick(Sender: TObject);
begin
   if not btnExcluir.Enabled then
      Exit;

   Excluir;

   LimpaCampos;

   reiniciaObjEmprea;

   HabilitaCampos(False);

   FechaTabelasVinculadas;

   TrataBotoes;
end;

procedure TfrmCadastroEmpresa.btnAlterarClick(Sender: TObject);
begin

   if not btnAlterar.Enabled then
      Exit;

   HabilitaCampos(True);
   objEmpresa.OperacaoCadastro := ocAlterar;
   edtRazaoSocial.SetFocus;
   TrataBotoes;
end;

procedure TfrmCadastroEmpresa.btnIncluirClick(Sender: TObject);
begin

   if not btnIncluir.Enabled then
      Exit;

   HabilitaCampos(True);
   Incluir;
   FechaTabelasVinculadas;
   TrataBotoes;
end;

procedure TfrmCadastroEmpresa.CancelaOperacao;
begin

   if not (objEmpresa.OperacaoCadastro in [ocIncluir, ocAlterar]) then
      Exit;

   reiniciaObjEmprea;
   HabilitaCampos(False);
   LimpaCampos;
   TrataBotoes;

   FechaTabelasVinculadas;
end;

procedure TfrmCadastroEmpresa.CarregaCidades(pUf: String);
begin
   objDmCidade.SelecionarPorEstado(pUf);
end;

procedure TfrmCadastroEmpresa.ConsultarEmpresa;
var
   frmConsulta : TfrmConsultaEmpresas;
begin

   frmConsulta := TfrmConsultaEmpresas.Create(Self);
   try
      objEmpresa := frmConsulta.Consultar;

      if not Assigned(objEmpresa) then
      begin
         objEmpresa := TEmpresa.Create;
      end
      else
      begin
         MostraDados;
         objDmFuncionarios.SelecionarFuncionariosEmpresa(objEmpresa.IdEmpresa);
         objDmEndereco.SelecionarEnderecosInativosEmpresa(objEmpresa.IdEmpresa);
      end;

      TrataBotoes;

   finally
      FreeAndNil(frmConsulta);
   end;

end;

procedure TfrmCadastroEmpresa.dblCidadeCloseUp(Sender: TObject);
begin
   objEmpresa.Endereco.Cidade := objDmCidade.RetornaCidadeSelecionada;
end;

procedure TfrmCadastroEmpresa.DestroiObjetos;
begin
   objEmpresa.Free;
   objDmEmpresa.free;
   objDmCidade.Free;
   objDmUf.Free;
   objDmFuncionarios.Free;
   objDmEndereco.Free;

end;

procedure TfrmCadastroEmpresa.edtUFExit(Sender: TObject);
begin
   if Trim(edtUF.Text) = EmptyStr then
   begin
      dblCidade.KeyValue := null;
      Exit;
   end;

   if not objDmUf.EstadoCadastrado(edtUF.Text) then
   begin
      edtUF.SetFocus;
      Application.MessageBox('Estado n?o cadastrado','Aten??o',MB_OK + MB_ICONWARNING);
      dblCidade.KeyValue := null;
      objDmCidade.SelecionarPorEstado('-1');
      Exit;
   end;

   objEmpresa.Endereco.Uf := objDmUf.RetornaEstadoSelecionado;

   objDmCidade.SelecionarPorEstado(edtUF.Text);

end;

procedure TfrmCadastroEmpresa.Excluir;
begin

   if Application.MessageBox('Confirma a exclus?o da empresa selecionada?', 'Confirma??o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
      Exit;

   objEmpresa.OperacaoCadastro := ocExcluir;

   objDmEmpresa.ExecutaOperacao(objEmpresa);
end;

procedure TfrmCadastroEmpresa.FechaTabelasVinculadas;
begin
   objDmFuncionarios.CDS_CONSULTA.Close;
   objDmEndereco.CDS_ENDERECO_INATIVO.Close;

end;

procedure TfrmCadastroEmpresa.FormCreate(Sender: TObject);
begin
   InstanciaObjetos;
   LimpaCampos;
   HabilitaCampos(False);
end;

procedure TfrmCadastroEmpresa.FormDestroy(Sender: TObject);
begin
   DestroiObjetos;
end;

procedure TfrmCadastroEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of

      VK_ESCAPE: CancelaOperacao;

      VK_F2: btnIncluirClick(Sender);

      VK_F3: btnAlterarClick(Sender);

      VK_F4: btnExcluirClick(Sender);

      vk_f5: btnConsultarClick(Sender);

      VK_F6: btnGravarClick(Sender);

   end;
end;

procedure TfrmCadastroEmpresa.Gravar;
begin

   PreencheObjeto;

   objDmEmpresa.ExecutaOperacao(objEmpresa);

end;

procedure TfrmCadastroEmpresa.HabilitaCampos(pOpcao: Boolean);
var i : Integer;
begin

   for I := 0 to Pred(self.ComponentCount) do
   begin

      if self.Components[i] is TCustomEdit then
         TCustomEdit(Self.Components[i]).Enabled := pOpcao
      else if Self.Components[i] is TCustomDBLookupComboBox then
         TCustomDBLookupComboBox(self.Components[i]).Enabled := pOpcao;

   end;

   edtCodigo.Enabled := False;

end;

procedure TfrmCadastroEmpresa.Incluir;
begin

   LimpaCampos;
   objEmpresa.OperacaoCadastro := ocIncluir;

   edtRazaoSocial.SetFocus;

end;

procedure TfrmCadastroEmpresa.InstanciaObjetos;
begin

   objEmpresa   := TEmpresa.Create;
   objDmEmpresa := TDM_EMPRESA.Create(Self);
   objDmCidade  := TDM_CIDADES.Create(Self);
   objDmUf      := TDM_UF.Create(Self);
   objDmFuncionarios := TDM_FUNCIONARIOS.Create(Self);
   objDmEndereco     := TDM_ENDERECO.Create(Self);

   objDmUf.SelecionarEstados;

   DS_CIDADE.DataSet := objDmCidade.CDS_CONSULTA;
   DS_FUNCIONARIOS.DataSet := objDmFuncionarios.CDS_CONSULTA;
   DS_OUTROSENDERECOS.DataSet := objDmEndereco.CDS_ENDERECO_INATIVO;


end;

procedure TfrmCadastroEmpresa.LimpaCampos;
begin

   edtCodigo.Clear;
   edtRazaoSocial.Clear;
   edtEmail.Clear;
   mskCNPJ.Clear;
   edtInscricao.Clear;
   mskDtAbertura.Clear;
   cbAtiva.Checked := True;
   mskTelefone.Clear;
   mskCelular.Clear;

   edtEndereco.Clear;
   edtNumero.Clear;
   mskCEP.Clear;
   edtBairro.Clear;
   edtUF.Clear;
   dblCidade.KeyValue := null;

end;

procedure TfrmCadastroEmpresa.MostraDados;
begin

   edtCodigo.Text := IntToStr(objEmpresa.IdEmpresa);
   edtRazaoSocial.Text := objEmpresa.NomeEmpresa;
   edtEmail.Text       := objEmpresa.Email;
   mskCNPJ.Text        := objEmpresa.CNPJ;
   edtInscricao.Text   := objEmpresa.Inscricao;
   cbAtiva.Checked     := objEmpresa.Ativo;
   mskTelefone.Text    := objEmpresa.TelComercial;
   mskCelular.Text     := objEmpresa.TelCelular;

   try
      mskDtAbertura.Text  := DateToStr(objEmpresa.DataAbertura);
   except
      mskDtAbertura.Clear;
   end;

   edtEndereco.Text   := objEmpresa.Endereco.Endereco;
   edtNumero.Text     := objEmpresa.Endereco.Numero;
   mskCEP.Text        := objEmpresa.Endereco.Cep;
   edtBairro.Text     := objEmpresa.Endereco.Bairro;
   edtUF.Text         := objEmpresa.Endereco.Uf.Sigla;

   objDmCidade.SelecionarPorEstado(edtUF.Text);

   dblCidade.KeyValue := objEmpresa.Endereco.Cidade.IdCidade;

end;

procedure TfrmCadastroEmpresa.PreencheObjeto;
begin

   objEmpresa.NomeEmpresa  := edtRazaoSocial.Text;
   objEmpresa.CNPJ         := mskCNPJ.Text;
   objEmpresa.Email        := edtEmail.Text;
   objEmpresa.Inscricao    := edtInscricao.Text;
   objEmpresa.Ativo        := True; //Padr?o para novos cadastros
   objEmpresa.DataCadastro := Date;
   objEmpresa.DataAbertura := StrToDate(mskDtAbertura.Text);
   objEmpresa.TelComercial := mskTelefone.Text;
   objEmpresa.TelCelular   := mskCelular.Text;

   objEmpresa.Endereco.Endereco := edtEndereco.Text;
   objEmpresa.Endereco.Numero   := edtNumero.Text;
   objEmpresa.Endereco.Bairro   := edtBairro.Text;
   objEmpresa.Endereco.Cep      := mskCEP.Text;
   objEmpresa.Endereco.Ativo    := true; //padr?o ativo para o endere?o principal
   objEmpresa.Endereco.Excluido := false;

end;

procedure TfrmCadastroEmpresa.reiniciaObjEmprea;
begin
   freeAndNil(objEmpresa);
   objEmpresa := TEmpresa.Create;
end;

procedure TfrmCadastroEmpresa.spbFuncionariosClick(Sender: TObject);
begin
   Application.MessageBox('Funcionalidade n?o implementada - Tela de teste de nivelamento','Informa??o',MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmCadastroEmpresa.SpeedButton1Click(Sender: TObject);
begin
   Application.MessageBox('Funcionalidade n?o implementada - Tela de teste de nivelamento','Informa??o',MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmCadastroEmpresa.TrataBotoes;
begin
   btnIncluir.Enabled := not (objEmpresa.OperacaoCadastro in [ocIncluir, ocAlterar]);
   btnAlterar.Enabled := (btnIncluir.Enabled) and (Trim(edtCodigo.Text) <> EmptyStr);
   btnExcluir.Enabled := btnAlterar.Enabled;
   btnGravar.Enabled  := objEmpresa.OperacaoCadastro in [ocIncluir, ocAlterar];
   btnConsultar.Enabled := not btnGravar.Enabled;

   if objEmpresa.OperacaoCadastro in [ocIncluir, ocAlterar] then
   begin
      StatusBar.Panels[0].Text := 'Pressione ESC para cancelar';
   end
   else
   begin
      StatusBar.Panels[0].Text := EmptyStr;
   end;

end;

function TfrmCadastroEmpresa.ValidaDados: Boolean;
begin

   Result := False;

   if Trim(edtRazaoSocial.Text) = EmptyStr then
   begin
      edtRazaoSocial.SetFocus;
      Application.MessageBox('A raz?o social da empresa deve ser informada.','Aten??o',MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if Trim(mskCNPJ.Text) = EmptyStr then
   begin
      mskCNPJ.SetFocus;
      Application.MessageBox('O CNPJ deve ser informado.','Aten??o',MB_OK + MB_ICONWARNING);
      Exit;
   end;

   if objEmpresa.OperacaoCadastro = ocIncluir then
   begin
      if not cbAtiva.Checked then
      begin
         if Application.MessageBox('Confirma a inclus?o de uma emprea inativa?','Confirma??o',MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> IDYES then
            Exit;
      end;
   end;

   if Trim(mskDtAbertura.Text) <> EmptyStr then
   begin
      try
         StrToDate(mskDtAbertura.Text);
      Except
         mskDtAbertura.SetFocus;
         Application.MessageBox('Data Inv?lida','Aten??o',MB_OK + MB_ICONWARNING);
         Exit;
      end;
   end
   else
   begin
      mskDtAbertura.SetFocus;
      Application.MessageBox('A data de abertura deve ser informada.','Aten??o',MB_OK + MB_ICONWARNING);
      Exit;
   end;

   Result := True;



end;

end.
