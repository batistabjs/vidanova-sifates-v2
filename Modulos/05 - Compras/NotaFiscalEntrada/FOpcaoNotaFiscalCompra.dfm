object FrmOpcaoNotaFiscalCompra: TFrmOpcaoNotaFiscalCompra
  Left = 229
  Top = 107
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Nota Fiscal'
  ClientHeight = 304
  ClientWidth = 424
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
    Width = 424
    Height = 33
    Align = alTop
    Constraints.MinHeight = 33
    Color = 14120960
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
    ExplicitWidth = 424
    ExplicitHeight = 33
    inherited Image3: TImage
      Width = 424
      Height = 33
      ExplicitTop = 33
      ExplicitWidth = 344
    end
    inherited pnTitulo: TPanel
      Width = 424
      Height = 33
      Constraints.MinHeight = 33
      ExplicitWidth = 424
      ExplicitHeight = 33
      inherited LblBarraTitulo: TLabel
        Width = 281
        Height = 25
        Caption = 'Nota Fiscal de Entrada (compras)'
        ExplicitWidth = 201
        ExplicitHeight = 33
      end
      inherited Image1: TImage
        Height = 31
        ExplicitLeft = 368
        ExplicitHeight = 31
      end
      inherited Image2: TImage
        Left = 365
        Height = 25
        ExplicitLeft = 288
        ExplicitHeight = 31
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 33
    Width = 424
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
    TabOrder = 3
  end
  object BtnDigitar: TButton
    Left = 71
    Top = 96
    Width = 265
    Height = 49
    Caption = 'F3 - Digita'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BtnDigitarClick
  end
  object BtnImportar: TButton
    Left = 71
    Top = 160
    Width = 265
    Height = 49
    Caption = 'F4 - Importar Pedido de Compra'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtnImportarClick
  end
  object BtnSair: TButton
    Left = 71
    Top = 224
    Width = 265
    Height = 49
    Caption = 'ESC - Sair'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BtnSairClick
  end
end
