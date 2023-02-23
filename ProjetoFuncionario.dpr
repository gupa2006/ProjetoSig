program ProjetoFuncionario;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  vcl.forms,
  Gustavo in 'Gustavo.pas' {frmLogin},
  Unit1 in 'Unit1.pas' {dmConexao: TDataModule},
  ControllerGeral in 'ControllerGeral.pas' {frmControllerGeral},
  DaoGeral in 'DaoGeral.pas' {frmDaoGeral},
  Principal in 'Principal.pas' {frmPrincipal},
  ControllerPrincipal in 'ControllerPrincipal.pas' {frmControllerPrincipal},
  DaoPrincipal in 'DaoPrincipal.pas' {frmDaoPrincipal};

begin
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TfrmControllerGeral, frmControllerGeral);
  Application.CreateForm(TfrmDaoGeral, frmDaoGeral);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmControllerPrincipal, frmControllerPrincipal);
  Application.CreateForm(TfrmDaoPrincipal, frmDaoPrincipal);
  Application.Run;
end.
