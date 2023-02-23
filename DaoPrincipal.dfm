object frmDaoPrincipal: TfrmDaoPrincipal
  Left = 0
  Top = 0
  Caption = 'frmDaoPrincipal'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object qryAcao: TADOQuery
    Connection = dmConexao.Conect
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select '
      'Nome, '
      'Nome_Funcao,'
      'Convert(Varchar(10),Admissao,103) Admissao, '
      'IsNull(Convert(Varchar(10),Desligamento,103),'#39#39') Desligamento '
      'From Funcionario Func'
      'Join Empresa_Funcao Emp ON Func.Funcao = Emp.ID_Funcao')
    Left = 32
    Top = 24
  end
end
