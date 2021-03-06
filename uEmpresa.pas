unit uEmpresa;

interface
uses uTipos, uEndereco;

Type
   TEmpresa = class
     private

     FOperacaoCadastro : TOperacaoCadastro;
     FIdEmpresa : Integer;
     FNomeEmpresa : String;
     FCNPJ        : String;
     FInscricao   : String;
     FAtivo       : Boolean;
     FDataCadastro : TDateTime;
     FDataAbertura : TDateTime;
     FTelComercial : String;
     FTelCelular   : String;
     FObs          : Integer;
     FEmail        : String;
     FExcluido     : Boolean;
     FDataExclusao : TDateTime;
     FEndereco     : TEndereco;

    function getAtivo: Boolean;
    function getCNPJ: String;
    function getDataAbertura: TDateTime;
    function getDataCadastro: TDateTime;
    function getDataExclusao: TDateTime;
    function getEmail: String;
    function getExcluido: Boolean;
    function getIdEmpresa: Integer;
    function getInscricao: String;
    function getNomeEmpresa: String;
    function getObs: Integer;
    function getTelCelular: String;
    function getTelComercial: String;
    procedure setAtivo(const Value: Boolean);
    procedure setCNPJ(const Value: String);
    procedure setDataAbertura(const Value: TDateTime);
    procedure setDataCadastro(const Value: TDateTime);
    procedure setDataExclusao(const Value: TDateTime);
    procedure setEmail(const Value: String);
    procedure setExcluido(const Value: Boolean);
    procedure setIdEmpresa(const Value: Integer);
    procedure setInscricao(const Value: String);
    procedure setNomeEmpresa(const Value: String);
    procedure setObs(const Value: Integer);
    procedure setTelCelular(const Value: String);
    procedure setTelComercial(const Value: String);
    function getOperacaoCadastro: TOperacaoCadastro;
    procedure SetOperacaoCadastro(const Value: TOperacaoCadastro);
    function getEndereco: TEndereco;
    procedure setEndereco(const Value: TEndereco);


     public
        constructor Create;
        destructor Destroy; Override;

        property OperacaoCadastro : TOperacaoCadastro Read getOperacaoCadastro write SetOperacaoCadastro;
        property IdEmpresa : Integer read getIdEmpresa write setIdEmpresa;
        property NomeEmpresa : String read getNomeEmpresa write setNomeEmpresa;
        property CNPJ        : String read getCNPJ        write setCNPJ;
        property Inscricao   : String read getInscricao   write setInscricao;
        property Ativo       : Boolean read getAtivo      write setAtivo;
        property DataCadastro : TDateTime read getDataCadastro write setDataCadastro;
        property DataAbertura : TDateTime read getDataAbertura write setDataAbertura;
        property TelComercial : String    read getTelComercial write setTelComercial;
        property TelCelular   : String    read getTelCelular   write setTelCelular;
        property Obs          : Integer   read getObs          write setObs;
        property Email        : String    read getEmail        write setEmail;
        property Excluido     : Boolean   read getExcluido     write setExcluido;
        property DataExclusao : TDateTime read getDataExclusao write setDataExclusao;

        property Endereco     : TEndereco read getEndereco     write setEndereco;
   end;

implementation

{ TEmpresa }

constructor TEmpresa.Create;
begin
   FEndereco := TEndereco.Create;
   OperacaoCadastro := ocNone;
end;

destructor TEmpresa.Destroy;
begin

   FEndereco.Free;
  inherited;
end;

function TEmpresa.getAtivo: Boolean;
begin
   Result := FAtivo;
end;

function TEmpresa.getCNPJ: String;
begin
   Result := FCNPJ;
end;

function TEmpresa.getDataAbertura: TDateTime;
begin
   Result := FDataAbertura;
end;

function TEmpresa.getDataCadastro: TDateTime;
begin
   Result := FDataCadastro;
end;

function TEmpresa.getDataExclusao: TDateTime;
begin
   Result := FDataExclusao;
end;

function TEmpresa.getEmail: String;
begin
   Result := FEmail;
end;

function TEmpresa.getEndereco: TEndereco;
begin
   Result := FEndereco;
end;

function TEmpresa.getExcluido: Boolean;
begin
   Result := FExcluido;
end;

function TEmpresa.getIdEmpresa: Integer;
begin
   Result := FIdEmpresa;
end;

function TEmpresa.getInscricao: String;
begin
   Result := FInscricao;
end;

function TEmpresa.getNomeEmpresa: String;
begin
   Result := FNomeEmpresa;
end;

function TEmpresa.getObs: Integer;
begin
   Result := FObs;
end;

function TEmpresa.getOperacaoCadastro: TOperacaoCadastro;
begin
   Result := FOperacaoCadastro;
end;

function TEmpresa.getTelCelular: String;
begin
   Result := FTelCelular;
end;

function TEmpresa.getTelComercial: String;
begin
   Result := FTelComercial;
end;

procedure TEmpresa.setAtivo(const Value: Boolean);
begin
   FAtivo := Value;
end;

procedure TEmpresa.setCNPJ(const Value: String);
begin
   FCNPJ := Value;
end;

procedure TEmpresa.setDataAbertura(const Value: TDateTime);
begin
   FDataAbertura := Value;
end;

procedure TEmpresa.setDataCadastro(const Value: TDateTime);
begin
   FDataCadastro := Value;
end;

procedure TEmpresa.setDataExclusao(const Value: TDateTime);
begin
    FDataExclusao := Value;
end;

procedure TEmpresa.setEmail(const Value: String);
begin
   FEmail := Value;
end;

procedure TEmpresa.setEndereco(const Value: TEndereco);
begin
   FEndereco := Value;
end;

procedure TEmpresa.setExcluido(const Value: Boolean);
begin
   FExcluido := Value;
end;

procedure TEmpresa.setIdEmpresa(const Value: Integer);
begin
   FIdEmpresa := Value;
end;

procedure TEmpresa.setInscricao(const Value: String);
begin
   FInscricao := Value;
end;

procedure TEmpresa.setNomeEmpresa(const Value: String);
begin
   FNomeEmpresa := Value;
end;

procedure TEmpresa.setObs(const Value: Integer);
begin
   FObs := Value;
end;

procedure TEmpresa.SetOperacaoCadastro(const Value: TOperacaoCadastro);
begin

   FOperacaoCadastro         := Value;
   Endereco.OperacaoCadastro := Value;

end;

procedure TEmpresa.setTelCelular(const Value: String);
begin
   FTelCelular := Value;
end;

procedure TEmpresa.setTelComercial(const Value: String);
begin
   FTelComercial := Value;
end;

end.
