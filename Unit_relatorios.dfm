object Form_relatorios: TForm_relatorios
  Left = 231
  Top = 144
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rios'
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
  object btn_rel_cursos: TBitBtn
    Left = 312
    Top = 96
    Width = 193
    Height = 25
    Caption = 'Rela'#231#227'o de Cursos'
    TabOrder = 0
    OnClick = btn_rel_cursosClick
  end
  object btn_rel_turmas: TBitBtn
    Left = 312
    Top = 136
    Width = 193
    Height = 25
    Caption = 'Rela'#231#227'o de Turmas por Curso'
    TabOrder = 1
    OnClick = btn_rel_turmasClick
  end
  object btn_rel_alunos: TBitBtn
    Left = 312
    Top = 176
    Width = 193
    Height = 25
    Caption = 'Rela'#231#227'o de Alunos por Turma'
    TabOrder = 2
    OnClick = btn_rel_alunosClick
  end
  object btn_rel_faltas: TBitBtn
    Left = 312
    Top = 216
    Width = 193
    Height = 25
    Caption = 'Relat'#243'rio de Faltas dos Alunos'
    TabOrder = 3
    OnClick = btn_rel_faltasClick
  end
  object btn_rel_aulas: TBitBtn
    Left = 312
    Top = 256
    Width = 193
    Height = 25
    Caption = 'Relat'#243'rio de Aulas por Instrutor'
    TabOrder = 4
    OnClick = btn_rel_aulasClick
  end
  object btn_fechar: TBitBtn
    Left = 368
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = btn_fecharClick
    Kind = bkAbort
  end
  object ADOQuery_rel_cursos: TADOQuery
    Connection = Form_logon.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CURSOS ORDER BY NOME')
    Left = 520
    Top = 96
  end
  object rel_cursos: TRvProject
    Left = 552
    Top = 96
  end
  object ds_rel_cursos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = ADOQuery_rel_cursos
    Left = 584
    Top = 96
  end
end
