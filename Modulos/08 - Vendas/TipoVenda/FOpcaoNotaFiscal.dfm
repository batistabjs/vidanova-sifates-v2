object FrmOpcaoNotaFiscal: TFrmOpcaoNotaFiscal
  Left = 229
  Top = 107
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Nota Fiscal'
  ClientHeight = 265
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inline FrmFrameBarra1: TFrmFrameBarra
    Left = 0
    Top = 0
    Width = 396
    Height = 33
    Align = alTop
    Constraints.MinHeight = 33
    Color = 14120960
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    ExplicitWidth = 396
    ExplicitHeight = 33
    inherited Image3: TImage
      Width = 396
      Height = 33
      ExplicitTop = 50
      ExplicitWidth = 396
    end
    inherited pnTitulo: TPanel
      Width = 396
      Height = 33
      Constraints.MinHeight = 33
      ExplicitWidth = 396
      ExplicitHeight = 33
      inherited LblBarraTitulo: TLabel
        Width = 253
        Height = 25
        Caption = 'Venda - Tipo de Nota Fiscal'
        ExplicitWidth = 328
        ExplicitHeight = 42
      end
      inherited Image1: TImage
        Height = 31
        ExplicitLeft = 340
        ExplicitHeight = 48
      end
      inherited Image2: TImage
        Left = 337
        Height = 25
        ExplicitHeight = 48
      end
    end
  end
  object Panel2: TPanel
    Left = 48
    Top = 96
    Width = 315
    Height = 41
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 3
    Caption = 'F3 - Nota Fiscal Eletr'#244'nica (NF-e)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Panel4: TPanel
    Left = 48
    Top = 158
    Width = 315
    Height = 41
    Alignment = taLeftJustify
    BevelOuter = bvLowered
    BevelWidth = 3
    BorderWidth = 3
    Caption = 'ESC - Sair'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel5: TPanel
    Left = 0
    Top = 33
    Width = 396
    Height = 41
    Align = alTop
    BorderWidth = 3
    Caption = 'pressione a tecla correspondente'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
end
