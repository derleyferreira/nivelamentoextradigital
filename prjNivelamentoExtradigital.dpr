program prjNivelamentoExtradigital;

uses
  Vcl.Forms,
  ufrmCadastroEmpresa in 'ufrmCadastroEmpresa.pas' {frmCadastroEmpresa},
  uDMConexao in 'uDMConexao.pas' {DM_CONEXAO: TDataModule},
  uEmpresa in 'uEmpresa.pas',
  uDMEmpresa in 'uDMEmpresa.pas' {DM_EMPRESA: TDataModule},
  uTipos in 'uTipos.pas',
  ufrmConsultaEmpresa in 'ufrmConsultaEmpresa.pas' {frmConsultaEmpresas},
  uEndereco in 'uEndereco.pas',
  uUF in 'uUF.pas',
  uCidades in 'uCidades.pas',
  uDMEndereco in 'uDMEndereco.pas' {DM_ENDERECO: TDataModule},
  uDMCidade in 'uDMCidade.pas' {DM_CIDADES: TDataModule},
  uDMUF in 'uDMUF.pas' {DM_UF: TDataModule},
  uDMFuncionarios in 'uDMFuncionarios.pas' {DM_FUNCIONARIOS: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM_CONEXAO, DM_CONEXAO);
  Application.CreateForm(TfrmCadastroEmpresa, frmCadastroEmpresa);

  Application.Run;
end.
