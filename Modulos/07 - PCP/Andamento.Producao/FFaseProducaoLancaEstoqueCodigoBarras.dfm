object FrmFaseProducaoLancaEstoqueCodigoBarras: TFrmFaseProducaoLancaEstoqueCodigoBarras
  Left = 306
  Top = 110
  BorderStyle = bsDialog
  Caption = 'Andamento de Produ'#231#227'o | Conclus'#227'o | C'#243'digo de Barras'
  ClientHeight = 191
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial Black'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    592
    191)
  PixelsPerInch = 96
  TextHeight = 17
  object Image2: TImage
    Left = 27
    Top = 36
    Width = 542
    Height = 36
    Anchors = [akLeft, akTop, akRight]
    Center = True
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000001900000
      0023080200000035F4CBF4000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000003
      DC4944415478DAED9A3F56E3301087E5BB100A1E2780136C2A2A5A3A28370D1D
      251D0D5B2E1D2D155538019C601F0570976C6C8F65FDB395A5D88CADEF57F012
      8DECCC0C3F7D4F56526D361B831042535005B010425311C042084D46000B2134
      1909B0AAAA7ED1FEB56FDB17DBBF6DC85E13CC0C06ED25F20195C744F7ED7FFE
      D0F883E268724EFC71C1A07B1377C4AD228E6673F0FE4FF42AD72B5A34EF1649
      0860697658B6047A859D0A69918400966687654BA057D8A99016490860697658
      B6047A859D0A69918400966687654BA057D8A99016490860697658B6047A859D
      0A69918400966687654BA057D8A99016490860697658B6047A859D0A69918400
      966687654BA057D8A99016490860697658B6047A859D0A69918400966687654B
      A057D8A99016490860697658B6047A859D0A69918400966687654BA057D8A990
      16490860697658B6047A859D0A699184009666870D95B02F2949239909761ACF
      61EA2D9210C0D2ECB091F5B9172949C3002C8005B0143A6C647DEE454AD23000
      0B60012C850E1B599F7B9192340CC00258004BA1C346D6E75EA4240D03B00016
      C052E8B074095FBF4E17ABB766FC72BDF9FDA379F572552D1F82B14EF505EF37
      32EA5CED4EB6C327F79FAF3F0F826932F561E967D84FEAEE138FB8C9C9BD8752
      33BB9736B3D508B000D61C1C969AB0BEAA6E8FDA755F2FEFA7F3ED6BD32FFB80
      00160276AD6F97FFF35988B47EF0A5BFBD176E06175E86FDD42E91C3BB6A699A
      0FB2A91D381985B90989DCD4762D6D66AB116001AC39382C31617DE9F226419F
      78CF72F17E6C1ECC8DDD025D98C7184831C4DCA87024DCE8F5776AEEF07974EB
      8DB457393777726B607572BF3E7F5A76D9FA598C9736B3D508B000D61C1C3654
      42A7C476C8E7550B954773B170A820CF57C6EE6D9A59E7C7AB55EAB16D785F13
      EDB0B69F1303CB045CF3138E3784BB9536B3D508B000D61C1C3654825DBFF2D4
      D50FACDE1CE2747BA0E0B1CA5EE4C657C70EBC9C1D98078E288DE070AA7EDB3F
      12AE4C3DFAE9DE604760E54B9BD96A0458006B0E0E1B568D863FD11176170AB6
      3663DB98FAB16B31BC094A1E69B572A96249D59D9A370F7BB742C37FDB61ED50
      5A221BEC04B000D6BE1D96D697B3214AA9C5D0F547F8355FFC1D5D774EF47275
      FA719D62CA18213213ED1954FA0CCBA925FC96305B5A328A9DB2769A748B2404
      B0343B2CA1E492CEB0C33FEBEE83DBF1BBC357191610788F84C9137AF7AEC10E
      EBECD93DD58A9E4213DB2977E83BA5F5C24E593B4DBA451202589A1D162BF9F3
      A8EECCA81DCFFCD86960A63D8C0F7E3F350808EF227B2B3BE265B1D3EFB0BE55
      5A2FEC94B5D3A45B24A1CCD3074208A911C042084D46000B213419FD05CD2452
      E6E48671B60000000049454E44AE426082}
    ExplicitWidth = 400
  end
  object StringGridOpcoes: TStringGrid
    Left = 458
    Top = 118
    Width = 126
    Height = 73
    TabOrder = 3
    Visible = False
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object Panel3: TPanel
    Left = 0
    Top = 165
    Width = 592
    Height = 26
    Align = alBottom
    BorderStyle = bsSingle
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object Label18: TLabel
      Left = 1
      Top = 6
      Width = 586
      Height = 15
      Align = alBottom
      AutoSize = False
      Caption = '<ESC>-Sair'
      Color = 14811135
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      ExplicitLeft = -2
      ExplicitWidth = 495
    end
  end
  object EditCodigo: TLabeledEdit
    Left = 27
    Top = 106
    Width = 542
    Height = 50
    Anchors = [akLeft, akTop, akRight]
    BevelInner = bvLowered
    BevelKind = bkSoft
    CharCase = ecUpperCase
    Color = clBlack
    EditLabel.Width = 121
    EditLabel.Height = 24
    EditLabel.Caption = 'Identificador:'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -21
    EditLabel.Font.Name = 'Arial'
    EditLabel.Font.Style = []
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -40
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = EditCodigoKeyPress
  end
  inline FrmFrameBarra1: TFrmFrameBarra
    Left = 0
    Top = 0
    Width = 592
    Height = 33
    Align = alTop
    Constraints.MinHeight = 33
    Color = 14120960
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    ExplicitWidth = 592
    ExplicitHeight = 33
    inherited Image3: TImage
      Width = 592
      Height = 33
      ExplicitWidth = 592
    end
    inherited pnTitulo: TPanel
      Width = 592
      Height = 33
      Constraints.MinHeight = 33
      ExplicitWidth = 592
      ExplicitHeight = 33
      inherited LblBarraTitulo: TLabel
        Width = 467
        Height = 25
        Caption = 'Andamento de Produ'#231#227'o | Conclus'#227'o | C'#243'digo de Barras'
        ExplicitWidth = 663
        ExplicitHeight = 25
      end
      inherited Image1: TImage
        Height = 31
        ExplicitHeight = 31
      end
      inherited Image2: TImage
        Left = 536
        Height = 31
        ExplicitLeft = 536
        ExplicitHeight = 31
      end
    end
  end
  object SP_DefinirIdentificador: TFDStoredProc
    Connection = FrmPrincipal.DBConexao
    StoredProcName = 'SPPROD_DEFINIRIDENTIFICADOR;1'
    Left = 32
    Top = 56
  end
end
