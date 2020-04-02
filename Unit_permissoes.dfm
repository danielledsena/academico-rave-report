object Form_permissoes: TForm_permissoes
  Left = 327
  Top = 208
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Permiss'#245'es'
  ClientHeight = 442
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 64
    Width = 114
    Height = 13
    Caption = 'Fun'#231#245'es do Sistema'
  end
  object Label2: TLabel
    Left = 152
    Top = 112
    Width = 65
    Height = 13
    Caption = 'Permiss'#245'es'
  end
  object cb_funcoes: TComboBox
    Left = 152
    Top = 80
    Width = 281
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnEnter = cb_funcoesEnter
  end
  object btn_inserir: TBitBtn
    Left = 440
    Top = 80
    Width = 33
    Height = 25
    Caption = '+'
    TabOrder = 1
    OnClick = btn_inserirClick
  end
  object btn_retirar: TBitBtn
    Left = 440
    Top = 256
    Width = 33
    Height = 25
    Caption = '-'
    TabOrder = 2
    OnClick = btn_retirarClick
  end
  object btn_fechar: TBitBtn
    Left = 256
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btn_fecharClick
  end
  object grid_permissoes: TDBGrid
    Left = 152
    Top = 128
    Width = 320
    Height = 120
    DataSource = ds_permissoes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
  end
  object ADOQuery_permissoes: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 168
    Top = 256
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 352
    Top = 256
  end
  object ds_permissoes: TDataSource
    DataSet = ADOQuery_permissoes
    Left = 200
    Top = 256
  end
end
