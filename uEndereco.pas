unit uEndereco;

interface
uses uCidades, uUF, uTipos, System.SysUtils;

type
   TEndereco = class
      private
      FOperacaoCadastro : TOperacaoCadastro;
      FAtivo : Boolean;
      FCEP   : String;
      FCidade: TCidade;
      FBairro : String;
      FDatCadastro : TDateTime;
      FDataExclusao: TDateTime;
      FEndereco    : String;
      fExcluido    : Boolean;
      FIdEmpresa   : Integer;
      fIdEndereco  : Integer;
      fIdTitular   : Integer;
      fNumero      : String;
      fUF          : TUf;

    function getAtivo: Boolean;
    function getCEP: String;
    function getCidade: TCidade;
    function getDataCadastro: TDateTime;
    function getDataExclusao: TDateTime;
    function getEndereco: String;
    function getExcluido: Boolean;
    function getIdEmpresa: Integer;
    function getIdEndereco: Integer;
    function getIdTitular: Integer;
    function getNumero: String;
    function getUf: TUf;
    procedure setAtivo(const Value: Boolean);
    procedure setCEP(const Value: String);
    procedure setCidade(const Value: TCidade);
    procedure setDataCadastro(const Value: TDateTime);
    procedure setDataExclusao(const Value: TDateTime);
    procedure setEndereco(const Value: String);
    procedure setExcluido(const Value: Boolean);
    procedure setIdEmpresa(const Value: Integer);
    procedure setIdEndereco(const Value: Integer);
    procedure setIdTitular(const Value: Integer);
    procedure setNumero(const Value: String);
    procedure setUf(const Value: TUf);
    function getOperacaoCadastro: TOperacaoCadastro;
    procedure setOperacaoCadastro(const Value: TOperacaoCadastro);
    function getBairro: String;
    procedure setBairro(const Value: String);

      public
         Constructor Create;
         Destructor Destroy; Override;
         property OperacaoCadastro : TOperacaoCadastro read getOperacaoCadastro write setOperacaoCadastro;
         property IdEndereco : Integer read getIdEndereco write setIdEndereco;
         property IdTitular  : Integer read getIdTitular write setIdTitular;
         property IdEmpresa  : Integer read getIdEmpresa write setIdEmpresa;
         property Endereco   : String read getEndereco write setEndereco;
         property Numero     : String Read getNumero write setNumero;
         property Bairro     : String read getBairro write setBairro;
         property Cidade     : TCidade read getCidade write setCidade;
         property Uf         : TUf read getUf write setUf;
         property Cep        : String read getCEP write setCEP;
         property Ativo      : Boolean read getAtivo write setAtivo;
         property Excluido   : Boolean read getExcluido write setExcluido;
         property DataExclusao : TDateTime read getDataExclusao write setDataExclusao;
         property DataCadastro : TDateTime read getDataCadastro write setDataCadastro;

   end;

implementation

{ TEndereco }
constructor TEndereco.Create;
begin
   FAtivo       := True;
   FCEP         := '';
   FCidade      := TCidade.Create;
   FBairro      := '';
   FDatCadastro := Date;
   FDataExclusao:= 0;
   FEndereco    := '';
   fExcluido    := False;
   FIdEmpresa   := -1;
   fIdEndereco  := -1;
   fIdTitular   := -1;
   fNumero      := '';
   fUF          := TUf.Create;
end;

destructor TEndereco.Destroy;
begin
   FCidade.Free;
   fUF.Free;
  inherited;
end;

function TEndereco.getAtivo: Boolean;
begin
   Result := FAtivo;
end;

function TEndereco.getBairro: String;
begin
   Result := FBairro;
end;

function TEndereco.getCEP: String;
begin
   Result := FCEP;
end;

function TEndereco.getCidade: TCidade;
begin
   Result := FCidade;
end;

function TEndereco.getDataCadastro: TDateTime;
begin
   Result := FDatCadastro;
end;

function TEndereco.getDataExclusao: TDateTime;
begin
   Result := FDataExclusao;
end;

function TEndereco.getEndereco: String;
begin
   Result := FEndereco;
end;

function TEndereco.getExcluido: Boolean;
begin
   Result := fExcluido;
end;

function TEndereco.getIdEmpresa: Integer;
begin
   Result := FIdEmpresa;
end;

function TEndereco.getIdEndereco: Integer;
begin
   Result := fIdEndereco;
end;

function TEndereco.getIdTitular: Integer;
begin
   Result := fIdTitular;
end;

function TEndereco.getNumero: String;
begin
   Result := fNumero;
end;

function TEndereco.getOperacaoCadastro: TOperacaoCadastro;
begin
   Result := FOperacaoCadastro;
end;

function TEndereco.getUf: TUf;
begin
   Result := fUF;
end;

procedure TEndereco.setAtivo(const Value: Boolean);
begin
   FAtivo := Value;
end;

procedure TEndereco.setBairro(const Value: String);
begin
   FBairro := Value;
end;

procedure TEndereco.setCEP(const Value: String);
begin
   FCEP := Value;
end;

procedure TEndereco.setCidade(const Value: TCidade);
begin
   FCidade := Value;
end;

procedure TEndereco.setDataCadastro(const Value: TDateTime);
begin
   FDatCadastro := Value;
end;

procedure TEndereco.setDataExclusao(const Value: TDateTime);
begin
   FDataExclusao := Value;
end;

procedure TEndereco.setEndereco(const Value: String);
begin
   FEndereco := Value;
end;

procedure TEndereco.setExcluido(const Value: Boolean);
begin
    fExcluido := Value;
end;

procedure TEndereco.setIdEmpresa(const Value: Integer);
begin
   FIdEmpresa := Value;
end;

procedure TEndereco.setIdEndereco(const Value: Integer);
begin
   fIdEndereco := Value;
end;

procedure TEndereco.setIdTitular(const Value: Integer);
begin
   fIdTitular := Value;
end;

procedure TEndereco.setNumero(const Value: String);
begin
   fNumero := Value;
end;

procedure TEndereco.setOperacaoCadastro(const Value: TOperacaoCadastro);
begin
   FOperacaoCadastro := Value;
end;

procedure TEndereco.setUf(const Value: TUf);
begin
   fUF := Value;
end;

end.
