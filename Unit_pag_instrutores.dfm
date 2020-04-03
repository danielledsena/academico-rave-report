object Form_pag_instrutores: TForm_pag_instrutores
  Left = 301
  Top = 191
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pagamento de Instrutores'
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
    Left = 144
    Top = 136
    Width = 50
    Height = 13
    Caption = 'Instrutor'
  end
  object Label2: TLabel
    Left = 424
    Top = 136
    Width = 48
    Height = 13
    Caption = 'M'#234's/ano'
  end
  object edt_instrutor: TEdit
    Left = 144
    Top = 152
    Width = 225
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object cb_mes_ano: TComboBox
    Left = 424
    Top = 152
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnEnter = cb_mes_anoEnter
  end
  object btn_gerar: TBitBtn
    Left = 232
    Top = 192
    Width = 161
    Height = 25
    Caption = 'Gerar demonstrativo'
    TabOrder = 2
    OnClick = btn_gerarClick
  end
  object btn_cancelar: TBitBtn
    Left = 400
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btn_cancelarClick
  end
  object btn_instrutor: TBitBtn
    Left = 376
    Top = 152
    Width = 33
    Height = 25
    TabOrder = 4
    OnClick = btn_instrutorClick
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
  object ADOQuery_demonstrativo: TADOQuery
    Connection = Form_logon.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    Left = 152
    Top = 184
    object ADOQuery_demonstrativoCOD_INSTRUTOR: TAutoIncField
      FieldName = 'COD_INSTRUTOR'
      ReadOnly = True
    end
    object ADOQuery_demonstrativoNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object ADOQuery_demonstrativoCOD_TURMA: TStringField
      FieldName = 'COD_TURMA'
      Size = 9
    end
    object ADOQuery_demonstrativoDATA: TDateTimeField
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object ADOQuery_demonstrativoVALOR_AULA: TBCDField
      FieldName = 'VALOR_AULA'
      DisplayFormat = 'R$ ,0.00'
      Precision = 19
    end
  end
  object ADOQuery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 184
    Top = 184
  end
  object rel_demonstrativo: TRvProject
    Left = 488
    Top = 184
  end
  object ds_demonstrativo: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOQuery_demonstrativo
    Left = 520
    Top = 184
  end
end
