object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 486
  ClientWidth = 786
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnTopo: TPanel
    Left = 0
    Top = 0
    Width = 786
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 669
    object lbLogin: TLabel
      Left = 7
      Top = 15
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object btSair: TButton
      Left = 704
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btSairClick
    end
  end
  object pnMenu: TPanel
    Left = 0
    Top = 41
    Width = 89
    Height = 445
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 376
    object lbDashboard: TLabel
      Left = 7
      Top = 6
      Width = 70
      Height = 16
      Caption = 'DashBoard'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lbDashboardClick
    end
    object lbFuncionario: TLabel
      Left = 7
      Top = 29
      Width = 73
      Height = 16
      Caption = 'Funcion'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lbFuncionarioClick
    end
    object lbRel: TLabel
      Left = 7
      Top = 52
      Width = 59
      Height = 16
      Caption = 'Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lbRelClick
    end
  end
  object PnDashBoard: TPanel
    Left = 500
    Top = 150
    Width = 176
    Height = 79
    Align = alCustom
    TabOrder = 2
    object dbcGrafico: TDBChart
      Left = 1
      Top = 1
      Width = 350
      Height = 77
      Title.Text.Strings = (
        'Gr'#225'fico em Pizza')
      View3DOptions.Elevation = 315
      View3DOptions.Orthogonal = False
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = -5
      ExplicitTop = 327
      ExplicitHeight = 443
      PrintMargins = (
        30
        15
        30
        15)
      ColorPaletteIndex = 13
      object Series1: TPieSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        DataSource = qryFuncoes
        Title = 'Fun'#231#245'es'
        XLabelsSource = 'Nome_Funcao'
        XValues.Order = loAscending
        YValues.Name = 'Pie'
        YValues.Order = loNone
        YValues.ValueSource = 'Perc'
        Frame.InnerBrush.BackColor = clRed
        Frame.InnerBrush.Gradient.EndColor = clGray
        Frame.InnerBrush.Gradient.MidColor = clWhite
        Frame.InnerBrush.Gradient.StartColor = 4210752
        Frame.InnerBrush.Gradient.Visible = True
        Frame.MiddleBrush.BackColor = clYellow
        Frame.MiddleBrush.Gradient.EndColor = 8553090
        Frame.MiddleBrush.Gradient.MidColor = clWhite
        Frame.MiddleBrush.Gradient.StartColor = clGray
        Frame.MiddleBrush.Gradient.Visible = True
        Frame.OuterBrush.BackColor = clGreen
        Frame.OuterBrush.Gradient.EndColor = 4210752
        Frame.OuterBrush.Gradient.MidColor = clWhite
        Frame.OuterBrush.Gradient.StartColor = clSilver
        Frame.OuterBrush.Gradient.Visible = True
        Frame.Visible = False
        Frame.Width = 4
        OtherSlice.Legend.Visible = False
      end
    end
    object dbcBarras: TDBChart
      Left = -170
      Top = 1
      Width = 345
      Height = 77
      Title.Text.Strings = (
        'Gr'#225'fico em Barras')
      Align = alRight
      TabOrder = 1
      ExplicitLeft = 351
      ExplicitHeight = 443
      ColorPaletteIndex = 13
      object Series2: TBarSeries
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Emboss.Color = 8487297
        Marks.Shadow.Color = 8487297
        Marks.Visible = True
        DataSource = qryFuncoes
        XLabelsSource = 'Nome_Funcao'
        BarStyle = bsCilinder
        BarWidthPercent = 65
        Shadow.Color = 9211020
        XValues.Name = 'X'
        XValues.Order = loAscending
        XValues.ValueSource = 'Perc'
        YValues.Name = 'Bar'
        YValues.Order = loNone
        YValues.ValueSource = 'Perc'
      end
    end
  end
  object PnFuncionario: TPanel
    Left = 559
    Top = 54
    Width = 219
    Height = 40
    Align = alCustom
    Caption = 'FUNCIONARIO'
    TabOrder = 3
    object btAcao: TButton
      Left = 249
      Top = 3
      Width = 75
      Height = 25
      Caption = 'A'#231#245'es'
      TabOrder = 4
      OnClick = btAcaoClick
    end
    object dbGridFuncionario: TDBGrid
      Left = 6
      Top = 35
      Width = 683
      Height = 398
      DataSource = dsGrid
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbGridFuncionarioCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_Func'
          Title.Caption = 'Nome'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Width = 227
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome_Funcao'
          Title.Caption = 'Fun'#231#227'o'
          Width = 163
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Admissao'
          Title.Caption = 'Data Admiss'#227'o'
          Width = 137
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Desligamento'
          Title.Caption = 'Data Desligamento'
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Inativado'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Login'
          Visible = False
        end>
    end
    object btIncluir: TButton
      Left = 6
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 1
      OnClick = btIncluirClick
    end
    object btAlterar: TButton
      Left = 87
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = btAlterarClick
    end
    object btDesativar: TButton
      Left = 168
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Desativar'
      TabOrder = 3
      OnClick = btDesativarClick
    end
    object pnFuncionarioCadastro: TPanel
      Left = 168
      Top = 19
      Width = 217
      Height = 38
      Align = alCustom
      TabOrder = 5
      object lbModo: TLabel
        Left = 5
        Top = 5
        Width = 46
        Height = 16
        Caption = 'lbModo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object imgFOTO: TImage
        Left = 473
        Top = 47
        Width = 161
        Height = 161
        Proportional = True
      end
      object Login: TLabel
        Left = 18
        Top = 28
        Width = 25
        Height = 13
        Caption = 'Login'
      end
      object lbSenha: TLabel
        Left = 234
        Top = 28
        Width = 30
        Height = 13
        Caption = 'Senha'
      end
      object Label1: TLabel
        Left = 18
        Top = 69
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 18
        Top = 109
        Width = 35
        Height = 13
        Caption = 'Fun'#231#227'o'
      end
      object Label3: TLabel
        Left = 288
        Top = 109
        Width = 32
        Height = 13
        Caption = 'Sal'#225'rio'
      end
      object Label4: TLabel
        Left = 18
        Top = 150
        Width = 71
        Height = 13
        Caption = 'Data Admiss'#227'o'
      end
      object Label5: TLabel
        Left = 288
        Top = 150
        Width = 71
        Height = 13
        Caption = 'Data Demiss'#227'o'
      end
      object Observação: TLabel
        Left = 18
        Top = 190
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object cbFuncao: TDBLookupComboBox
        Left = 18
        Top = 127
        Width = 199
        Height = 21
        KeyField = 'ID_Funcao'
        ListField = 'Nome_Funcao'
        ListSource = dsFuncao
        TabOrder = 0
      end
      object edtLogin: TEdit
        Left = 18
        Top = 47
        Width = 175
        Height = 21
        TabOrder = 1
      end
      object edtSenha: TEdit
        Left = 234
        Top = 47
        Width = 175
        Height = 21
        NumbersOnly = True
        TabOrder = 2
      end
      object edtNome: TEdit
        Left = 18
        Top = 87
        Width = 391
        Height = 21
        TabOrder = 3
      end
      object mOBS: TMemo
        Left = 18
        Top = 209
        Width = 449
        Height = 89
        TabOrder = 4
      end
      object btSalvarFoto: TButton
        Left = 473
        Top = 214
        Width = 75
        Height = 25
        Caption = 'Salvar Foto'
        TabOrder = 5
        OnClick = btSalvarFotoClick
      end
      object btSalvar: TButton
        Left = 18
        Top = 313
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 6
        OnClick = btSalvarClick
      end
      object btCancelar: TButton
        Left = 114
        Top = 313
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 7
        OnClick = btCancelarClick
      end
      object dtDemissao: TJvDBDatePickerEdit
        Left = 288
        Top = 169
        Width = 121
        Height = 21
        AllowNoDate = True
        TabOrder = 8
      end
      object dtAdmissao: TJvDBDatePickerEdit
        Left = 18
        Top = 169
        Width = 121
        Height = 21
        AllowNoDate = True
        TabOrder = 9
      end
      object edtSalario: TJvCalcEdit
        Left = 288
        Top = 127
        Width = 121
        Height = 21
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Alignment = taLeftJustify
        DisplayFormat = ',0.00'
        ShowButton = False
        TabOrder = 10
        DecimalPlacesAlwaysShown = True
      end
    end
    object pnAcoes: TPanel
      Left = 401
      Top = 344
      Width = 185
      Height = 41
      Align = alCustom
      TabOrder = 6
      object lbCodigo: TLabel
        Left = 16
        Top = 10
        Width = 4
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbLoginFunc: TLabel
        Left = 16
        Top = 25
        Width = 4
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbAdmissao: TLabel
        Left = 16
        Top = 40
        Width = 4
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btAdicionarAcao: TButton
        Left = 275
        Top = 5
        Width = 75
        Height = 25
        Caption = 'Adicionar'
        TabOrder = 0
        OnClick = btAdicionarAcaoClick
      end
      object dbAcao: TDBGrid
        Left = 5
        Top = 78
        Width = 339
        Height = 180
        DataSource = dsAcao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbAcaoCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Data'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Tipo'
            Width = 196
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Acao'
            Visible = False
          end>
      end
      object mAcao: TMemo
        Left = 5
        Top = 264
        Width = 669
        Height = 121
        ReadOnly = True
        TabOrder = 2
      end
      object btSairAcao: TButton
        Left = 275
        Top = 36
        Width = 75
        Height = 25
        Caption = 'Sair'
        TabOrder = 3
        OnClick = btSairAcaoClick
      end
      object pnAdicionarAcoes: TPanel
        Left = 368
        Top = 152
        Width = 185
        Height = 41
        Align = alCustom
        TabOrder = 4
        Visible = False
        object lbCodAcao: TLabel
          Left = 24
          Top = 18
          Width = 4
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbLoginAcao: TLabel
          Left = 24
          Top = 33
          Width = 4
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbAdmissaoAcao: TLabel
          Left = 24
          Top = 48
          Width = 4
          Height = 16
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btSairAdicionarAcao: TButton
          Left = 128
          Top = 236
          Width = 75
          Height = 25
          Caption = 'Sair'
          TabOrder = 0
          OnClick = btSairAdicionarAcaoClick
        end
        object cbAcao: TDBLookupComboBox
          Left = 24
          Top = 81
          Width = 145
          Height = 21
          KeyField = 'ID_Dest'
          ListField = 'Descricao'
          ListSource = dsTodasAcoes
          TabOrder = 1
        end
        object DataAcao: TJvDBDatePickerEdit
          Left = 222
          Top = 81
          Width = 121
          Height = 21
          AllowNoDate = True
          TabOrder = 2
        end
        object mmAcao: TMemo
          Left = 24
          Top = 108
          Width = 648
          Height = 116
          TabOrder = 3
        end
        object gravar: TButton
          Left = 24
          Top = 236
          Width = 75
          Height = 25
          Caption = 'gravar'
          TabOrder = 4
          OnClick = gravarClick
        end
      end
    end
  end
  object PnRelatorio: TPanel
    Left = 579
    Top = 330
    Width = 185
    Height = 41
    Align = alCustom
    Caption = 'RELATORIO'
    TabOrder = 4
    Visible = False
    object Label6: TLabel
      Left = 6
      Top = 9
      Width = 25
      Height = 13
      Caption = 'Login'
    end
    object Label7: TLabel
      Left = 157
      Top = 9
      Width = 35
      Height = 13
      Caption = 'Fun'#231#227'o'
    end
    object Label8: TLabel
      Left = 318
      Top = 9
      Width = 36
      Height = 13
      Caption = 'Per'#237'odo'
    end
    object dbgPesquisar: TDBGrid
      Left = 6
      Top = 55
      Width = 675
      Height = 306
      DataSource = dsPesquisa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Login'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Tipo'
          Width = 108
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Title.Caption = 'Descri'#231#227'o'
          Width = 368
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Data'
          Visible = True
        end>
    end
    object dbcbLogin: TDBLookupComboBox
      Left = 6
      Top = 28
      Width = 145
      Height = 21
      KeyField = 'ID_Func'
      ListField = 'Login'
      ListSource = dsLogin
      TabOrder = 1
    end
    object dbcbFuncao: TDBLookupComboBox
      Left = 157
      Top = 28
      Width = 145
      Height = 21
      KeyField = 'ID_Funcao'
      ListField = 'Nome_Funcao'
      ListSource = dsFuncaoPesquisa
      TabOrder = 2
    end
    object dpDataInicio: TJvDBDatePickerEdit
      Left = 318
      Top = 28
      Width = 121
      Height = 21
      AllowNoDate = True
      TabOrder = 3
    end
    object dpDataFim: TJvDBDatePickerEdit
      Left = 445
      Top = 28
      Width = 121
      Height = 21
      AllowNoDate = True
      TabOrder = 4
    end
    object btPesquisar: TButton
      Left = 600
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 5
      OnClick = btPesquisarClick
    end
  end
  object dsGrid: TDataSource
    DataSet = qryGrid
    Left = 544
    Top = 88
  end
  object qryGrid: TADOQuery
    Connection = dmConexao.Conect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select '
      'ID_Func,'
      'Nome, '
      'Nome_Funcao,'
      'Convert(Varchar(10),Admissao,103) Admissao, '
      'IsNull(Convert(Varchar(10),Desligamento,103),'#39#39') Desligamento,'
      'Case When Desligamento IS NOT NULL Then 1 Else 0 End Inativado,'
      'Login '
      'From Funcionario Func'
      'Join Empresa_Funcao Emp ON Func.Funcao = Emp.ID_Funcao')
    Left = 472
    Top = 88
  end
  object odCaminhoFoto: TOpenDialog
    Left = 360
  end
  object qryFuncao: TADOQuery
    Connection = dmConexao.Conect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select ID_Funcao, Nome_Funcao From Empresa_Funcao')
    Left = 472
    Top = 288
  end
  object dsFuncao: TDataSource
    DataSet = qryFuncao
    Left = 528
    Top = 288
  end
  object qryFuncionario: TADOQuery
    Connection = dmConexao.Conect
    Parameters = <>
    Left = 400
    Top = 288
  end
  object qryFuncoes: TADOQuery
    Connection = dmConexao.Conect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select Emp.Nome_Funcao,'
      
        'ROUND(((CAST(COUNT(ID_Func) AS DECIMAL)*100)/(CAST(Total AS DECI' +
        'MAL))),2) Perc'
      'From Funcionario Func'
      'Join Empresa_Funcao Emp ON Func.Funcao = Emp.ID_Funcao'
      
        'Join (Select Count(*) Total From Funcionario Where Desligamento ' +
        'Is Null) T on 1=1'
      'Where Desligamento Is Null'
      'group by Emp.Nome_Funcao, Total')
    Left = 328
    Top = 288
  end
  object qryAcao: TADOQuery
    Connection = dmConexao.Conect
    Parameters = <>
    Left = 592
    Top = 288
  end
  object dsAcao: TDataSource
    DataSet = qryAcao
    Left = 640
    Top = 288
  end
  object qryTodasAcao: TADOQuery
    Connection = dmConexao.Conect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select ID_Dest, Descricao from Destaque')
    Left = 656
    Top = 376
  end
  object dsTodasAcoes: TDataSource
    DataSet = qryTodasAcao
    Left = 712
    Top = 376
  end
  object qryLogin: TADOQuery
    Connection = dmConexao.Conect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select ID_Func,Login from Funcionario'
      'Union All'
      'Select 0,'#39'Todos'#39)
    Left = 472
    Top = 352
  end
  object dsLogin: TDataSource
    DataSet = qryLogin
    Left = 528
    Top = 360
  end
  object dsPesquisa: TDataSource
    DataSet = qryPesquisar
    Left = 264
    Top = 144
  end
  object qryPesquisar: TADOQuery
    Connection = dmConexao.Conect
    CursorType = ctStatic
    Parameters = <>
    Left = 208
    Top = 152
    object qryPesquisarLogin: TStringField
      FieldName = 'Login'
      Size = 30
    end
    object qryPesquisarTipo: TStringField
      FieldName = 'Tipo'
      Size = 30
    end
    object qryPesquisarDescricao: TMemoField
      FieldName = 'Descricao'
      OnGetText = qryPesquisarDescricaoGetText
      BlobType = ftMemo
    end
    object qryPesquisarData: TStringField
      FieldName = 'Data'
      ReadOnly = True
      Size = 10
    end
  end
  object qryFuncaoPesquisa: TADOQuery
    Connection = dmConexao.Conect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select ID_Funcao, Nome_Funcao From Empresa_Funcao'
      'Union All'
      'Select 0, '#39'Todos'#39)
    Left = 328
    Top = 360
  end
  object dsFuncaoPesquisa: TDataSource
    DataSet = qryFuncaoPesquisa
    Left = 384
    Top = 360
  end
end
