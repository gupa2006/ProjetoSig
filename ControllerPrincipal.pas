unit ControllerPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DaoPrincipal;

type
  TfrmControllerPrincipal = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FDaoPrincipal : TfrmDaoPrincipal;
  public
    { Public declarations }
    procedure DesativarFuncionario(aId_Func: String);
    procedure AlterarFuncionario(iFuncao:Integer; sId_Func, sLogin, sSenha, sNome, sSalario, sOBS, sFoto, sAdmissao, sDemissao: string);
    procedure IncluirFuncionario(iFuncao:Integer; sLogin, sSenha, sNome, sSalario, sOBS, sFoto, sAdmissao, sDemissao: string);
    procedure GravaAcao(sId_Func, sAcao, sData, sDescricao:String);
    procedure Pesquisar(sLogin, sTipo, sDataIni, sDataFim:String);
end;

var
  frmControllerPrincipal: TfrmControllerPrincipal;

implementation

{$R *.dfm}

{ TfrmControllerPrincipal }

procedure TfrmControllerPrincipal.AlterarFuncionario(iFuncao: Integer; sId_Func, sLogin,
  sSenha, sNome, sSalario, sOBS, sFoto, sAdmissao, sDemissao: string);
begin
  FDaoPrincipal.AlterarFuncionario(iFuncao, sId_Func, sLogin,
  sSenha, sNome, sSalario, sOBS, sFoto, sAdmissao, sDemissao);
end;

procedure TfrmControllerPrincipal.DesativarFuncionario(aId_Func: String);
begin
  FDaoPrincipal.DesativarFuncionario(aId_Func);
end;

procedure TfrmControllerPrincipal.FormCreate(Sender: TObject);
begin
  FDaoPrincipal := TfrmDaoPrincipal.Create(FDaoPrincipal);
end;

procedure TfrmControllerPrincipal.FormDestroy(Sender: TObject);
begin
  FDaoPrincipal.Free;
end;

procedure TfrmControllerPrincipal.GravaAcao(sId_Func, sAcao, sData, sDescricao:String);
begin
  FDaoPrincipal.GravaAcao(sId_Func, sAcao, sData, sDescricao);
end;

procedure TfrmControllerPrincipal.IncluirFuncionario(iFuncao: Integer; sLogin,
  sSenha, sNome, sSalario, sOBS, sFoto, sAdmissao, sDemissao: string);
begin
  FDaoPrincipal.IncluirFuncionario(iFuncao, sLogin,
  sSenha, sNome, sSalario, sOBS, sFoto, sAdmissao, sDemissao);
end;

procedure TfrmControllerPrincipal.Pesquisar(sLogin, sTipo, sDataIni,
  sDataFim: String);
begin
  FDaoPrincipal.Pesquisar(sLogin, sTipo, sDataIni, sDataFim);
end;

end.
