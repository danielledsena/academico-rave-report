object Form_lanca_presenca: TForm_lanca_presenca
  Left = 248
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento de Presen'#231'a'
  ClientHeight = 443
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
    Left = 160
    Top = 80
    Width = 37
    Height = 13
    Caption = 'Turma'
  end
  object Label2: TLabel
    Left = 384
    Top = 80
    Width = 74
    Height = 13
    Caption = 'Data de Aula'
  end
  object edt_turma: TEdit
    Left = 160
    Top = 96
    Width = 169
    Height = 25
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object cb_aulas: TComboBox
    Left = 384
    Top = 96
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnEnter = cb_aulasEnter
  end
  object btn_listar_alunos: TBitBtn
    Left = 552
    Top = 96
    Width = 97
    Height = 25
    Caption = 'Listar Alunos'
    TabOrder = 2
    OnClick = btn_listar_alunosClick
  end
  object btn_confirmar: TBitBtn
    Left = 288
    Top = 312
    Width = 145
    Height = 25
    Caption = 'Confirmar Frequ'#234'ncia'
    TabOrder = 3
    OnClick = btn_confirmarClick
  end
  object btn_fechar: TBitBtn
    Left = 440
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btn_fecharClick
  end
  object btn_turma: TBitBtn
    Left = 336
    Top = 96
    Width = 41
    Height = 25
    TabOrder = 5
    OnClick = btn_turmaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object ck_lista_alunos: TCheckListBox
    Left = 160
    Top = 136
    Width = 489
    Height = 161
    ItemHeight = 13
    TabOrder = 6
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 224
    Top = 312
  end
end
