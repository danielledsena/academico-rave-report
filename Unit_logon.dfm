object Form_logon: TForm_logon
  Left = 375
  Top = 214
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Logon'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 336
    Top = 120
    Width = 43
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 336
    Top = 160
    Width = 36
    Height = 13
    Caption = 'Senha'
  end
  object edt_usuario: TEdit
    Left = 336
    Top = 136
    Width = 161
    Height = 21
    MaxLength = 30
    TabOrder = 0
  end
  object edt_senha: TEdit
    Left = 336
    Top = 176
    Width = 161
    Height = 21
    MaxLength = 10
    PasswordChar = '*'
    TabOrder = 1
  end
  object btn_ok: TBitBtn
    Left = 336
    Top = 208
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = btn_okClick
    Kind = bkOK
  end
  object btn_fechar: TBitBtn
    Left = 424
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 3
    OnClick = btn_fecharClick
    Kind = bkAbort
  end
  object ConexaoBD: TADOConnection
    LoginPrompt = False
    Left = 504
    Top = 112
  end
  object ADOQuery_aux: TADOQuery
    Connection = ConexaoBD
    Parameters = <>
    Left = 504
    Top = 144
  end
end
