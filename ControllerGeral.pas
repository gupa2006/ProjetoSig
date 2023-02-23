unit ControllerGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, DaoGeral,
  Vcl.StdCtrls;

type
  TfrmControllerGeral = class(TForm)
    Label1: TLabel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FdaoValida:TfrmDaoGeral;
  public
    { Public declarations }
    Function ValidarLogin(aLogin, aSenha : String):boolean;
  end;

var
  frmControllerGeral: TfrmControllerGeral;

implementation

{$R *.dfm}

{ TfrmControllerGeral }

procedure TfrmControllerGeral.FormDestroy(Sender: TObject);
begin
  FdaoValida.Free;
end;

function TfrmControllerGeral.ValidarLogin(aLogin, aSenha: String): boolean;
begin
  FdaoValida := TfrmDaoGeral.Create(FdaoValida);
  Result := FdaoValida.SqlValidaLogin(aLogin, aSenha);
end;

end.
