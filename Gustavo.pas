unit Gustavo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Unit1,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Data.Win.ADODB, ControllerGeral, Principal;

type
  TfrmLogin = class(TForm)
    pnLogin: TPanel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnOK: TButton;
    btnSair: TButton;
    qryLoginold: TADOQuery;
    procedure btnSairClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FControle:TfrmControllerGeral;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}


procedure TfrmLogin.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmLogin.btnOKClick(Sender: TObject);
begin
  FControle := TfrmControllerGeral.Create(FControle);
  if FControle.ValidarLogin(edtLogin.Text, edtSenha.Text) then
  Begin
    Application.CreateForm(TfrmPrincipal,frmPrincipal);
    try
      frmPrincipal.lbLogin.Caption := 'Olá, '+AnsiUpperCase(edtLogin.Text) + '  ';
      frmPrincipal.ShowModal;
    finally
      FreeAndNil(frmPrincipal);
    end;
  End
  else
    ShowMessage('Login ou Senha incorreta');
end;


end.
