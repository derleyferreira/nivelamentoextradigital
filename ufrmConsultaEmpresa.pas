unit ufrmConsultaEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, uEmpresa, udmEmpresa;

type
  TfrmConsultaEmpresas = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    dbgConsulta: TDBGrid;
    btnCopiar: TBitBtn;
    DS_CONSULTA: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgConsultaDblClick(Sender: TObject);
  private
    { Private declarations }
    objdmEmpresa : TDM_EMPRESA;
    Procedure InstanciaObjetos;
    Procedure DestroiObjetos;
  public
    { Public declarations }

    function Consultar : TEmpresa;

  end;


implementation

{$R *.dfm}

{ TfrmConsultaEmpresas }

procedure TfrmConsultaEmpresas.btnCopiarClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

function TfrmConsultaEmpresas.Consultar: TEmpresa;
begin
   Result := nil;

   ShowModal;

   if ModalResult = mrOk then
   begin
      if not DS_CONSULTA.DataSet.IsEmpty then
         Result := objdmEmpresa.retornaObjetoEmpresaConsulta;
   end;

end;

procedure TfrmConsultaEmpresas.dbgConsultaDblClick(Sender: TObject);
begin
   btnCopiarClick(Sender)
end;

procedure TfrmConsultaEmpresas.DestroiObjetos;
begin
   objDmEmpresa.Free;
end;

procedure TfrmConsultaEmpresas.FormCreate(Sender: TObject);
begin

   InstanciaObjetos;

   DS_CONSULTA.DataSet := objDmEmpresa.CDS_CONSULTA;

   objDmEmpresa.ConsultarEmpresas(EmptyStr, EmptyStr);

end;

procedure TfrmConsultaEmpresas.FormDestroy(Sender: TObject);
begin
   DestroiObjetos;
end;

procedure TfrmConsultaEmpresas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of

      VK_F8 : btnCopiarClick(Sender)

   end;
end;

procedure TfrmConsultaEmpresas.InstanciaObjetos;
begin
   objDmEmpresa := TDM_EMPRESA.Create(Self);
end;

end.
