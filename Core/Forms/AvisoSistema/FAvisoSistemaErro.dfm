object FrmAvisoSistemaErro: TFrmAvisoSistemaErro
  Left = 268
  Top = 106
  BorderStyle = bsDialog
  Caption = 'Aten'#231#227'o'
  ClientHeight = 262
  ClientWidth = 600
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object painelbottom: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 226
    Width = 594
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Tecle ESC para sair'
    Ctl3D = False
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 594
    Height = 40
    Align = alTop
    Color = clRed
    Enabled = False
    ParentBackground = False
    TabOrder = 1
    object LblBarraTitulo: TLabel
      Left = 9
      Top = 9
      Width = 159
      Height = 23
      Alignment = taCenter
      Caption = 'Usu'#225'rio(a), aten'#231#227'o:'
      Color = clBlack
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 49
    Width = 594
    Height = 171
    Align = alClient
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 2
    object MemoAviso: TMemo
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 588
      Height = 165
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
end
