unit DaoGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB;

type
  TfrmDaoGeral = class(TForm)
    qryLogin: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function SqlValidaLogin(aLogin, aSenha : String):boolean;
  end;

var
  frmDaoGeral: TfrmDaoGeral;

implementation

{$R *.dfm}

{ TfrmDaoGeral }

function TfrmDaoGeral.SqlValidaLogin(aLogin, aSenha: String): boolean;
Var
  Resultado:integer;
begin
  qryLogin.Close;
  qryLogin.SQL.Text := 'Select Count(*) As Func From Funcionario';
  qryLogin.SQL.Text := qryLogin.SQL.Text + ' Where Login = ''' + aLogin +'''';
  qryLogin.SQL.Text := qryLogin.SQL.Text + ' And Senha = ' + aSenha;
  qryLogin.SQL.Text := qryLogin.SQL.Text + ' And IsNull(Desligamento,GetDate()) >= GetDate()';
  qryLogin.Open;
  Resultado := qryLogin.FieldByName('Func').AsInteger;
  Result := (0 < Resultado);
end;

end.

