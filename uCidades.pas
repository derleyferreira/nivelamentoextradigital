unit uCidades;

interface
uses uUF;

Type
  TCidade = class
  private
    FUF: TUf;
    FIdCidade: Integer;
    FCodigoIBGE: String;
    FNomeCidade: String;

  public
    constructor Create;
    Destructor Destroy; Override;
    property IdCidade : Integer read FIdCidade Write fIdCidade;
    property NomeCidade : String read FNomeCidade Write FNomeCidade;
    property UF         : TUf read FUF write FUF;
    property CodigoIBGE : String read FCodigoIBGE write FCodigoIBGE;

   end;

implementation

{ TCidade }

constructor TCidade.Create;
begin
   FUF := TUf.Create;
end;

destructor TCidade.Destroy;
begin
   UF.Free;
   inherited;
end;

end.
