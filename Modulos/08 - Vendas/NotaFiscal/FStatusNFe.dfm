object FrmStatusNFe: TFrmStatusNFe
  Left = 231
  Top = 166
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FrmStatusNFe'
  ClientHeight = 105
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 105
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 4
    TabOrder = 0
    inline FrmFrameBarra1: TFrmFrameBarra
      Left = 8
      Top = 8
      Width = 884
      Height = 33
      Align = alTop
      Constraints.MinHeight = 33
      Color = 14120960
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 8
      ExplicitWidth = 884
      ExplicitHeight = 33
      inherited Image3: TImage
        Width = 884
        Height = 33
        ExplicitTop = 33
        ExplicitWidth = 723
      end
      inherited pnTitulo: TPanel
        Width = 884
        Height = 33
        Constraints.MinHeight = 33
        ExplicitWidth = 884
        ExplicitHeight = 33
        inherited LblBarraTitulo: TLabel
          Width = 741
          Height = 25
          Caption = 'Processo em andamento...'
          ExplicitWidth = 314
          ExplicitHeight = 33
        end
        inherited Image1: TImage
          Height = 31
          ExplicitLeft = 828
          ExplicitHeight = 31
        end
        inherited Image2: TImage
          Left = 825
          Height = 25
          ExplicitLeft = 667
          ExplicitHeight = 31
        end
      end
    end
    object lblStatus: TPanel
      Left = 8
      Top = 41
      Width = 884
      Height = 56
      Align = alClient
      BevelOuter = bvLowered
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
