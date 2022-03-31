unit uUF;

interface
type
 TUf = class
   private
    FIdEstado: Integer;
    FSigla: String;
    FEstado: String;

  public
    property IdEstado : Integer read FIdEstado write FIdEstado;
    property Estado : String read FEstado write FEstado;
    property Sigla  : String read FSigla write FSigla;
 end;

implementation

end.
