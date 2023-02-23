unit DaoPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Unit1;

type
  TfrmDaoPrincipal = class(TForm)
    qryAcao: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DesativarFuncionario(aId_Func: String);
    procedure AlterarFuncionario(iFuncao:Integer; sId_Func, sLogin, sSenha, sNome, sSalario, sOBS, sFoto, sAdmissao, sDemissao: string);
    procedure IncluirFuncionario(iFuncao:Integer; sLogin, sSenha, sNome, sSalario, sOBS, sFoto, sAdmissao, sDemissao: string);
    procedure GravaAcao(sId_Func, sAcao, sData, sDescricao:String);
    procedure Pesquisar(sLogin, sTipo, sDataIni, sDataFim:String);
  end;

var
  frmDaoPrincipal: TfrmDaoPrincipal;

implementation

{$R *.dfm}

{ TfrmDaoPrincipal }


{ TfrmDaoPrincipal }

procedure TfrmDaoPrincipal.AlterarFuncionario(iFuncao: Integer; sId_Func, sLogin, sSenha,
  sNome, sSalario, sOBS, sFoto, sAdmissao, sDemissao: string);
begin
  qryAcao.Close;
  qryAcao.SQL.Text := '';
  qryAcao.SQL.Text := 'Update Funcionario Set ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Funcao = '+ IntToStr(iFuncao)+ ', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Login ='''+ sLogin+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Senha = '''+ sSenha+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Nome = '''+ sNome+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Salario = '+ StringReplace(StringReplace(sSalario, '.', '', [rfReplaceAll]),',','.',[rfReplaceAll])+ ', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'OBS = '''+ sOBS+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Foto = '''+ sFoto+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Admissao = ''' + sAdmissao+ ''', ';
  if sDemissao = '' then
    qryAcao.SQL.Text := qryAcao.SQL.Text + 'Desligamento = NULL '
  else
    qryAcao.SQL.Text := qryAcao.SQL.Text + 'Desligamento = ''' + sDemissao+ ''' ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Where ID_Func = '+sId_Func;
  qryAcao.ExecSQL;
end;

procedure TfrmDaoPrincipal.DesativarFuncionario(aId_Func: String);
begin
  qryAcao.Close;
  qryAcao.SQL.Text := '';
  qryAcao.SQL.Text := 'Update Funcionario Set Desligamento = GetDate() Where ID_Func = ' + aId_Func;
  qryAcao.ExecSQL;
end;

procedure TfrmDaoPrincipal.GravaAcao(sId_Func, sAcao, sData,
  sDescricao: String);
begin
  qryAcao.Close;
  qryAcao.SQL.Text := '';
  qryAcao.SQL.Text := 'Insert Into Funcionario_Destaque Select';
  qryAcao.SQL.Text := qryAcao.SQL.Text + sId_Func+ ', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + sAcao+ ', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + ''''+ sData+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + ''''+ sDescricao+ '''';
  qryAcao.ExecSQL;
end;

procedure TfrmDaoPrincipal.IncluirFuncionario(iFuncao: Integer; sLogin, sSenha,
  sNome, sSalario, sOBS, sFoto, sAdmissao, sDemissao: string);
begin
  qryAcao.Close;
  qryAcao.SQL.Text := '';
  qryAcao.SQL.Text := 'Insert Into Funcionario Select';
  qryAcao.SQL.Text := qryAcao.SQL.Text + ''''+ sLogin+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + ''''+ sSenha+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + ''''+ sNome+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + ''''+ sFoto+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + IntToStr(iFuncao)+ ', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + StringReplace(StringReplace(sSalario, '.', '', [rfReplaceAll]),',','.',[rfReplaceAll])+ ', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + '''' + sAdmissao+ ''', ';
  if sDemissao = '' then
    qryAcao.SQL.Text := qryAcao.SQL.Text + 'NULL, '
  else
    qryAcao.SQL.Text := qryAcao.SQL.Text + '''' + sDemissao+ ''', ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + ''''+ sOBS+ '''';
  qryAcao.ExecSQL;
end;

procedure TfrmDaoPrincipal.Pesquisar(sLogin, sTipo, sDataIni, sDataFim: String);
begin
  qryAcao.Close;
  qryAcao.SQL.Text := '';
  qryAcao.SQL.Text := 'Select Login, Descricao Tipo, Destaque Descricao, ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Convert(Varchar(10),Data,103) Data From Funcionario Func ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Join Funcionario_Destaque FD ON Func.ID_Func = FD.ID_Funcionario ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Join Destaque Dest On FD.ID_Destaque = Dest.ID_Dest ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Where ('''+sLogin +'''= '''' OR Login = ''' + sLogin + ''') ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'And ('''+sTipo +'''= '''' OR Login = '''+sTipo+''') ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'And ('''+sDataIni +'''= '''' OR Data >= '''+sDataIni+''') ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'And ('''+sDataFim +'''= '''' OR Data <= '''+sDataFim+''') ';
  qryAcao.SQL.Text := qryAcao.SQL.Text + 'Order By Year(Data) desc, MONTH(Data) desc, DAY(Data) desc ';
  qryAcao.Open;
end;

end.
