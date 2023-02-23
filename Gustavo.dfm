object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 354
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnLogin: TPanel
    Left = 0
    Top = 0
    Width = 518
    Height = 354
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 144
      Top = 144
      Width = 25
      Height = 13
      Caption = 'Login'
    end
    object Label2: TLabel
      Left = 144
      Top = 175
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object edtLogin: TEdit
      Left = 176
      Top = 136
      Width = 169
      Height = 21
      TabOrder = 0
    end
    object edtSenha: TEdit
      Left = 176
      Top = 167
      Width = 169
      Height = 21
      Hint = 'Somente n'#250'meros'
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnOK: TButton
      Left = 190
      Top = 208
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
    object btnSair: TButton
      Left = 270
      Top = 208
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btnSairClick
    end
  end
  object qryLoginold: TADOQuery
    Connection = dmConexao.Conect
    Parameters = <
      item
        Name = 'Login'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end
      item
        Name = 'Senha'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end>
    SQL.Strings = (
      'Select Count(*) As Func From Funcionario'
      'Where Login = :Login'
      'And Senha = :Senha'
      'And Desligamento >= GetDate()')
    Left = 216
    Top = 64
  end
end
