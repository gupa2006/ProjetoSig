unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, ControllerPrincipal, DaoPrincipal, Data.DB, Data.Win.ADODB,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvMaskEdit,
  JvCheckedMaskEdit, JvDatePickerEdit, JvDBDatePickerEdit, JvBaseEdits,
  JvDBControls, VCLTee.TeEngine, VCLTee.Series, JvExControls, JvChart,
  VCLTee.TeeData, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart,Unit1;

type
  TfrmPrincipal = class(TForm)
    pnTopo: TPanel;
    pnMenu: TPanel;
    PnDashBoard: TPanel;
    PnFuncionario: TPanel;
    PnRelatorio: TPanel;
    lbDashboard: TLabel;
    lbFuncionario: TLabel;
    lbRel: TLabel;
    btSair: TButton;
    lbLogin: TLabel;
    dbGridFuncionario: TDBGrid;
    dsGrid: TDataSource;
    qryGrid: TADOQuery;
    btIncluir: TButton;
    btAlterar: TButton;
    btDesativar: TButton;
    pnFuncionarioCadastro: TPanel;
    lbModo: TLabel;
    cbFuncao: TDBLookupComboBox;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtNome: TEdit;
    mOBS: TMemo;
    imgFOTO: TImage;
    btSalvarFoto: TButton;
    odCaminhoFoto: TOpenDialog;
    Login: TLabel;
    lbSenha: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Observação: TLabel;
    btSalvar: TButton;
    btCancelar: TButton;
    qryFuncao: TADOQuery;
    dsFuncao: TDataSource;
    qryFuncionario: TADOQuery;
    dtDemissao: TJvDBDatePickerEdit;
    dtAdmissao: TJvDBDatePickerEdit;
    edtSalario: TJvCalcEdit;
    qryFuncoes: TADOQuery;
    dbcGrafico: TDBChart;
    Series1: TPieSeries;
    dbcBarras: TDBChart;
    Series2: TBarSeries;
    btAcao: TButton;
    pnAcoes: TPanel;
    lbCodigo: TLabel;
    lbLoginFunc: TLabel;
    lbAdmissao: TLabel;
    btAdicionarAcao: TButton;
    dbAcao: TDBGrid;
    mAcao: TMemo;
    qryAcao: TADOQuery;
    dsAcao: TDataSource;
    btSairAcao: TButton;
    pnAdicionarAcoes: TPanel;
    btSairAdicionarAcao: TButton;
    lbCodAcao: TLabel;
    lbLoginAcao: TLabel;
    lbAdmissaoAcao: TLabel;
    cbAcao: TDBLookupComboBox;
    DataAcao: TJvDBDatePickerEdit;
    mmAcao: TMemo;
    gravar: TButton;
    qryTodasAcao: TADOQuery;
    dsTodasAcoes: TDataSource;
    dbgPesquisar: TDBGrid;
    dbcbLogin: TDBLookupComboBox;
    dbcbFuncao: TDBLookupComboBox;
    dpDataInicio: TJvDBDatePickerEdit;
    dpDataFim: TJvDBDatePickerEdit;
    btPesquisar: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    qryLogin: TADOQuery;
    dsLogin: TDataSource;
    dsPesquisa: TDataSource;
    qryPesquisar: TADOQuery;
    qryPesquisarLogin: TStringField;
    qryPesquisarTipo: TStringField;
    qryPesquisarDescricao: TMemoField;
    qryPesquisarData: TStringField;
    qryFuncaoPesquisa: TADOQuery;
    dsFuncaoPesquisa: TDataSource;
    procedure lbRelClick(Sender: TObject);
    procedure lbFuncionarioClick(Sender: TObject);
    procedure lbDashboardClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbGridFuncionarioCellClick(Column: TColumn);
    procedure btIncluirClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btDesativarClick(Sender: TObject);
    procedure btSalvarFotoClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btAcaoClick(Sender: TObject);
    procedure btAdicionarAcaoClick(Sender: TObject);
    procedure dbAcaoCellClick(Column: TColumn);
    procedure btSairAcaoClick(Sender: TObject);
    procedure btSairAdicionarAcaoClick(Sender: TObject);
    procedure gravarClick(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure qryPesquisarDescricaoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
    FController : TfrmControllerPrincipal;
    Id_Func, FCaminhoFoto, Mensagem, FLogin, FAdmissao: String;
    Inativado,FModo: Integer;
    Procedure Tela(Modo:integer);
    Procedure IniciaGrid();
    Procedure IniciaCadastro;
    function Validacao:Boolean;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btAlterarClick(Sender: TObject);
begin
//cadastro de funcionario, ação de alterar
  if Id_Func = '' then
    ShowMessage('Escolha um funcionário')
  else
  begin
      lbModo.Caption := 'Alteração do cadastro de Funcionário';
      pnFuncionarioCadastro.Align := alClient;
      pnFuncionarioCadastro.Visible := True;
      //alterando o parametro modo - 1 para alteração
      FModo := 1;
      IniciaCadastro;
  end;
end;

procedure TfrmPrincipal.btCancelarClick(Sender: TObject);
begin
  //Inicia na Tela de funcionario
  Tela(2);
  IniciaGrid;
end;

procedure TfrmPrincipal.btDesativarClick(Sender: TObject);
begin
//botão desativar funcionario, insere uma data de desligamento do dia do acionamento do botao
  if Id_Func = '' then
    ShowMessage('Escolha um funcionário')
  else
  Begin
    if Inativado = 1 then
      ShowMessage('Escolha um funcionário Ativo')
    Else
      FController.DesativarFuncionario(Id_Func);
  End;
  IniciaGrid;
end;

procedure TfrmPrincipal.btIncluirClick(Sender: TObject);
begin
//cadastro de funcionario, açao incluir
  lbModo.Caption := 'Inclusão de Funcionário';
  pnFuncionarioCadastro.Align := alClient;
  pnFuncionarioCadastro.Visible := True;
  //alterando o parametro modo - 0 para inclusao
  FModo := 0;
  IniciaCadastro;
end;

procedure TfrmPrincipal.btSairAcaoClick(Sender: TObject);
begin
//botão de sair do painel de ações
  Tela(2);
  IniciaGrid;
end;

procedure TfrmPrincipal.btSairClick(Sender: TObject);
begin
//fechar o sistema
  Close;
end;

procedure TfrmPrincipal.btSalvarClick(Sender: TObject);
Var
  DataAdmissao, DataDemissao: String;
begin
//botão salvar da tela de cadastro (incluir ou alterar)
  if not Validacao then
    exit;
  DataAdmissao := FormatDateTime('yyyy-mm-dd', dtAdmissao.Date);
  if dtDemissao.Text <> '' then
    DataDemissao := FormatDateTime('yyyy-mm-dd', dtDemissao.Date);
  if FModo = 1 then
  Begin
    FController.AlterarFuncionario(cbFuncao.KeyValue, Id_Func, edtLogin.Text, edtSenha.Text,
    edtNome.Text, edtSalario.Text, mOBS.Text, FCaminhoFoto, DataAdmissao, DataDemissao);
  End
  else
  begin
    FController.IncluirFuncionario(cbFuncao.KeyValue, edtLogin.Text, edtSenha.Text,
    edtNome.Text, edtSalario.Text, mOBS.Text, FCaminhoFoto, DataAdmissao, DataDemissao);
  end;
  ShowMessage(Mensagem);
  //Inicia na Tela de funcionario
  Tela(2);
  IniciaGrid;
end;

procedure TfrmPrincipal.btSalvarFotoClick(Sender: TObject);
begin
///ação de salvar caminha da foto
  if odCaminhoFoto.execute then
    FCaminhoFoto := odCaminhoFoto.FileName;
  imgFOTO.Picture.LoadFromFile(FCaminhoFoto);
end;

procedure TfrmPrincipal.btSairAdicionarAcaoClick(Sender: TObject);
begin
//ação de sair da tela de cadastro de ação
    pnAdicionarAcoes.Align := alCustom;
    pnAdicionarAcoes.Visible := False;
end;

procedure TfrmPrincipal.btPesquisarClick(Sender: TObject);
Var
  Login, Tipo, DataIni, DataFim:String;
begin
//ação do botao pesquisar
  if ((Trim(dbcbLogin.Text) = '') OR (Trim(dbcbLogin.Text) = 'Todos'))
    then Login := 'Null' else Login := IntToStr(dbcbLogin.KeyValue);
  if ((Trim(dbcbFuncao.Text) = '') OR (Trim(dbcbFuncao.Text) = 'Todos'))
    then Tipo := 'Null' else Tipo := IntToStr(dbcbFuncao.KeyValue);
  if Trim(dpDataInicio.Text) = '' then DataIni := '' else DataIni := FormatDateTime('yyyy-mm-dd', dpDataInicio.Date);
  if Trim(dpDataFim.Text) = '' then DataFim := '' else DataFim := FormatDateTime('yyyy-mm-dd', dpDataFim.Date);
  qryPesquisar.Close;
  qryPesquisar.SQL.Text := '';
  qryPesquisar.SQL.Text := 'Select Login, Descricao Tipo, Destaque Descricao, ';
  qryPesquisar.SQL.Text := qryPesquisar.SQL.Text + 'Convert(Varchar(10),Data,103) Data From Funcionario Func ';
  qryPesquisar.SQL.Text := qryPesquisar.SQL.Text + 'Join Funcionario_Destaque FD ON Func.ID_Func = FD.ID_Funcionario ';
  qryPesquisar.SQL.Text := qryPesquisar.SQL.Text + 'Join Destaque Dest On FD.ID_Destaque = Dest.ID_Dest ';
  qryPesquisar.SQL.Text := qryPesquisar.SQL.Text + 'Where ('+Login +' is Null OR Func.ID_Func = '+Login+') ';
  qryPesquisar.SQL.Text := qryPesquisar.SQL.Text + 'And ('+Tipo +' is Null OR Func.Funcao = '+Tipo+') ';
  qryPesquisar.SQL.Text := qryPesquisar.SQL.Text + 'And ('''+DataIni +'''= '''' OR Data >= '''+DataIni+''') ';
  qryPesquisar.SQL.Text := qryPesquisar.SQL.Text + 'And ('''+DataFim +'''= '''' OR Data <= '''+DataFim+''') ';
  qryPesquisar.SQL.Text := qryPesquisar.SQL.Text + 'Order By Year(Data) desc, MONTH(Data) desc, DAY(Data) desc ';
  qryPesquisar.Open;
  //FController.Pesquisar(Login, Tipo, DataIni, DataFim);
end;

procedure TfrmPrincipal.btAdicionarAcaoClick(Sender: TObject);
begin
//botão de abrir tela de cadastro de ações
  pnAdicionarAcoes.Align := alClient;
  pnAdicionarAcoes.Visible := True;
  lbCodAcao.Caption := 'Código: ' + Id_Func;
  lbLoginAcao.Caption := 'Login: ' + FLogin;
  lbAdmissaoAcao.Caption := 'Admissão: ' + FAdmissao;
  qryTodasAcao.Close;
  qryTodasAcao.Open;
end;

procedure TfrmPrincipal.btAcaoClick(Sender: TObject);
begin
//botão da tela de funcionar pra abrir tela de ação
  if Id_Func = '' then
    ShowMessage('Escolha um funcionário')
  else
  Begin
    lbCodigo.Caption := 'Código: ' + Id_Func;
    lbLoginFunc.Caption := 'Login: ' + FLogin;
    lbAdmissao.Caption := 'Admissão: ' + FAdmissao;
    pnAcoes.Align := alClient;
    pnAcoes.Visible := True;
    qryAcao.Close;
    qryAcao.SQL.Text := 'Select Descricao Tipo,Convert(Varchar(10),Data,112) Data, Destaque Acao From Funcionario_Destaque FD ';
    qryAcao.SQL.Text := qryAcao.SQL.Text + 'Join Destaque Dest On FD.ID_Destaque = Dest.ID_Dest ';
    qryAcao.SQL.Text := qryAcao.SQL.Text + 'Where ID_Funcionario = ' + Id_Func;
    qryAcao.SQL.Text := qryAcao.SQL.Text + 'Order By Year(Data) desc, MONTH(Data) desc, DAY(Data) desc';
    qryAcao.Open;
  End;
end;

procedure TfrmPrincipal.dbAcaoCellClick(Column: TColumn);
begin
//função para pegar da grid de ação a descrição da ação
  mAcao.Text := dbAcao.Columns.Items[2].Field.AsString;
end;

procedure TfrmPrincipal.dbGridFuncionarioCellClick(Column: TColumn);
begin
//ação de click na grid pra pegar atributos do funcionario
  Id_Func := dbGridFuncionario.Columns.Items[0].Field.AsString;
  FLogin := dbGridFuncionario.Columns.Items[3].Field.AsString;
  Inativado := dbGridFuncionario.Columns.Items[5].Field.AsInteger;
  FAdmissao := dbGridFuncionario.Columns.Items[6].Field.AsString;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FController := TfrmControllerPrincipal.Create(FController);
  Id_Func := '';
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FController.Free;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  //Inicia na Tela de funcionario
  Tela(2);
  IniciaGrid;
end;

procedure TfrmPrincipal.gravarClick(Sender: TObject);
begin
//botão de gravar açãodo funcionario
  FController.GravaAcao(Id_Func,IntToStr(cbAcao.KeyValue),FormatDateTime('yyyy-mm-dd', DataAcao.Date),mmAcao.Text);
  ShowMessage('Ação gravada com sucesso!');
  pnAdicionarAcoes.Align := alCustom;
  pnAdicionarAcoes.Visible := False;
  qryAcao.Close;
  qryAcao.Open;
end;

procedure TfrmPrincipal.IniciaCadastro;
begin
//procedure criada para iniciar a tela de cadastro - 1 alterar
  qryFuncao.Close;
  qryFuncao.SQL.Text := '';
  qryFuncao.SQL.Text := 'Select ID_Funcao, Nome_Funcao From Empresa_Funcao';
  qryFuncao.Open;
  if FModo = 1 then
  Begin
    Mensagem := 'Cadastro do funcionário '+edtNome.Text+' alterado com sucesso!';
    qryFuncionario.Close;
    qryFuncionario.SQL.Text := 'Select ID_Func, Login, Senha, Nome, ';
    qryFuncionario.SQL.Text := qryFuncionario.SQL.Text + 'IsNull(Foto,'''') As Foto, Funcao, Salario, Admissao, ';
    qryFuncionario.SQL.Text := qryFuncionario.SQL.Text + 'IsNull(Convert(Varchar(10),Desligamento,112),'''') Desligamento, IsNull(Obs,'''') As OBS ';
    qryFuncionario.SQL.Text := qryFuncionario.SQL.Text + 'From Funcionario Where ID_Func = ' + Id_Func;
    qryFuncionario.Open;
    cbFuncao.KeyValue := qryFuncionario.FieldByName('Funcao').Value;
    edtLogin.Text := qryFuncionario.FieldByName('Login').Value;
    edtSenha.Text := qryFuncionario.FieldByName('Senha').Value;
    edtNome.Text := qryFuncionario.FieldByName('Nome').Value;
    edtSalario.Value := qryFuncionario.FieldByName('Salario').Value;
    dtAdmissao.Date := qryFuncionario.FieldByName('Admissao').Value;
    if qryFuncionario.FieldByName('Desligamento').Value <> '' then
      dtDemissao.Date := qryFuncionario.FieldByName('Desligamento').Value;
    mOBS.Text := qryFuncionario.FieldByName('Obs').Value;
    FCaminhoFoto := qryFuncionario.FieldByName('Foto').Value;
    if FCaminhoFoto <> '' then
      imgFOTO.Picture.LoadFromFile(FCaminhoFoto);
  End
  else
  begin
    Mensagem := 'Cadastro do funcionário incluído com sucesso!';
  end;
end;

procedure TfrmPrincipal.IniciaGrid;
begin
  qryGrid.Close;
  qryGrid.Open;
  Id_Func := '';
end;

procedure TfrmPrincipal.lbDashboardClick(Sender: TObject);
begin
  //Tela de DashBoard
  Tela(1);
  qryFuncoes.Close;
  qryFuncoes.Open;
end;

procedure TfrmPrincipal.lbFuncionarioClick(Sender: TObject);
begin
  //Tela de funcionario
  Tela(2);
  IniciaGrid;
end;

procedure TfrmPrincipal.lbRelClick(Sender: TObject);
begin
  //Tela de Relatório
  Tela(3);
  qryFuncaoPesquisa.Close;
  qryFuncaoPesquisa.Open;
  qryLogin.Close;
  qryLogin.Open;
end;

procedure TfrmPrincipal.qryPesquisarDescricaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := qryPesquisar.FieldByName('Descricao').AsString;
end;

procedure TfrmPrincipal.Tela(Modo: integer);
begin
  //Altera as funções da tela e as cores das labels
  if Modo = 1 then
  Begin
    lbDashboard.Font.Color := clRed;
    lbFuncionario.Font.Color := clBlack;
    lbRel.Font.Color := clBlack;
    PnDashBoard.Align := alClient;
    PnDashBoard.Visible := True;
    PnRelatorio.Align := alCustom;
    PnRelatorio.Visible := False;
    PnFuncionario.Align := alCustom;
    PnFuncionario.Visible := False;
  End
  else if Modo = 2 then
  Begin
    lbDashboard.Font.Color := clBlack;
    lbFuncionario.Font.Color := clRed;
    lbRel.Font.Color := clBlack;
    PnFuncionario.Align := alClient;
    PnFuncionario.Visible := True;
    PnDashBoard.Align := alCustom;
    PnDashBoard.Visible := False;
    PnRelatorio.Align := alCustom;
    PnRelatorio.Visible := False;
  End
  else
  Begin
    lbDashboard.Font.Color := clBlack;
    lbFuncionario.Font.Color := clBlack;
    lbRel.Font.Color := clRed;
    PnRelatorio.Align := alClient;
    PnRelatorio.Visible := True;
    PnDashBoard.Align := alCustom;
    PnDashBoard.Visible := False;
    PnFuncionario.Align := alCustom;
    PnFuncionario.Visible := False;
  End;
  pnFuncionarioCadastro.Align := alCustom;
  pnFuncionarioCadastro.Visible := False;
  pnAcoes.Align := alCustom;
  pnAcoes.Visible := False;
  pnAdicionarAcoes.Align := alCustom;
  pnAdicionarAcoes.Visible := False;
end;

function TfrmPrincipal.Validacao: Boolean;
begin
//validação da tela de cadastro de funcionario
  if Trim(edtLogin.Text) = '' then
  begin
    ShowMessage('Favor escolher um Login');
    Result := False;
  end
  else if Trim(edtSenha.Text) = '' then
  begin
    ShowMessage('Favor escolher uma Senha');
    Result := False;
  end
  else if Trim(edtNome.Text) = '' then
  begin
    ShowMessage('Favor escolher um Nome');
    Result := False;
  end
  else if Trim(cbFuncao.Text) = '' then
  begin
    ShowMessage('Favor escolher uma Função');
    Result := False;
  end
  else if Trim(edtSalario.Text) = '' then
  begin
    ShowMessage('Favor Salário acima de 0');
    Result := False;
  end
  else if Trim(dtAdmissao.Text) = '' then
  begin
    ShowMessage('Favor escolher uma Data de Admissão');
    Result := False;
  end
  else
    Result := True;
end;

end.
