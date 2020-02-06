inherited FrmAlertasLancamentos: TFrmAlertasLancamentos
  Caption = ''
  ClientHeight = 427
  ExplicitHeight = 466
  PixelsPerInch = 96
  TextHeight = 15
  inherited FrmFrameBarra1: TFrmFrameBarra
    inherited pnTitulo: TPanel
      inherited LblBarraTitulo: TLabel
        Caption = 'Lan'#231'amento de Alertas'
        ExplicitWidth = 234
      end
    end
  end
  inherited FrmFrameBotoes1: TFrmFrameBotoes
    Top = 367
    ExplicitTop = 367
  end
  inherited pgControl: TPageControl
    Height = 334
    ExplicitHeight = 334
    inherited tabPrincipal: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 26
      ExplicitWidth = 922
      ExplicitHeight = 304
      inherited GroupBox1: TGroupBox
        Height = 304
        ExplicitHeight = 304
        inherited cxGrid: TcxGrid
          Height = 285
          ExplicitHeight = 285
        end
      end
    end
    inherited tabDetalhe: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 26
      ExplicitWidth = 922
      ExplicitHeight = 304
      inherited lblCodigo: TLabel
        Left = 490
        Top = 14
        Width = 81
        Alignment = taRightJustify
        Caption = 'Controle: 0000'
        ExplicitLeft = 490
        ExplicitTop = 14
        ExplicitWidth = 81
      end
      inherited lblNome: TLabel
        Left = 306
        Top = 263
        ExplicitLeft = 306
        ExplicitTop = 263
      end
      object lblData: TLabel [2]
        Left = 13
        Top = 14
        Width = 98
        Height = 15
        Caption = 'Data: 00/00/0000'
      end
      object lblHoras: TLabel [3]
        Left = 213
        Top = 14
        Width = 99
        Height = 15
        Caption = 'Hora: 00/00/0000'
      end
      object lblUsuario: TLabel [4]
        Left = 13
        Top = 41
        Width = 77
        Height = 15
        Caption = 'Usu'#225'rio: Teste'
      end
      object Label1: TLabel [5]
        Left = 13
        Top = 63
        Width = 24
        Height = 15
        Caption = 'Tipo'
      end
      object Label2: TLabel [6]
        Left = 214
        Top = 66
        Width = 104
        Height = 15
        Caption = 'Nivel de Gravidade'
      end
      object Label3: TLabel [7]
        Left = 12
        Top = 90
        Width = 26
        Height = 15
        Caption = 'Para'
      end
      object Label4: TLabel [8]
        Left = 12
        Top = 168
        Width = 113
        Height = 13
        Caption = 'Descri'#231#227'o do Alerta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      inherited EditCodigo: TDBEdit
        Left = 512
        Top = 232
        TabOrder = 7
        Visible = False
        ExplicitLeft = 512
        ExplicitTop = 232
      end
      inherited EditNome: TDBEdit
        Left = 306
        Top = 277
        Width = 274
        TabOrder = 8
        ExplicitLeft = 306
        ExplicitTop = 277
        ExplicitWidth = 274
      end
      inherited rgStatus: TDBRadioGroup
        Left = 330
        Top = 232
        Width = 198
        TabOrder = 9
        Visible = False
        ExplicitLeft = 330
        ExplicitTop = 232
        ExplicitWidth = 198
      end
      object DBComboBox1: TDBComboBox
        Left = 40
        Top = 63
        Width = 145
        Height = 23
        Items.Strings = (
          'Notifica'#231#227'o'
          'Operacional')
        TabOrder = 0
      end
      object DBComboBox2: TDBComboBox
        Left = 322
        Top = 63
        Width = 249
        Height = 23
        Items.Strings = (
          'Normal'
          'Baixo'
          'Moderado'
          'Alto'
          'Critico')
        TabOrder = 1
      end
      object DBComboBox3: TDBComboBox
        Left = 40
        Top = 90
        Width = 145
        Height = 23
        Items.Strings = (
          'Clientes'
          'Fornecedores'
          'Assessores'
          'Ag'#234'ncias de Assessores'
          'Vendedores'
          'Transpotadoras')
        TabOrder = 2
      end
      object EditCliente: TIDBEditDialog
        Left = 40
        Top = 132
        Width = 65
        Height = 23
        HelpKeyWord = ''
        CharCase = ecUpperCase
        Color = clWindow
        Enabled = True
        TabOrder = 3
        Text = ''
        Visible = True
        LabelCaption = 'Localizar'
        LabelAlwaysEnabled = True
        LabelFont.Charset = DEFAULT_CHARSET
        LabelFont.Color = clWindowText
        LabelFont.Height = -11
        LabelFont.Name = 'Tahoma'
        LabelFont.Style = []
        Lookup.Separator = ';'
        Version = '5.0.0.0'
        ButtonStyle = bsButton
        ButtonWidth = 16
        ButtonHint = 'Procurar...'
        Etched = False
        ButtonCaption = '...'
        DataField = 'CLIENTE'
        ButtonKeyClickBtn = 119
        SQLdbFazBusca = True
        SQLdbFocusControl = EditNomeCliente
        SQLdbCampoRetorno = 'NOME'
        SQLdbRetornoVazio = ' *** '
        SQLdbCampoParametro = 'CODIGO'
        SQLdbSQL.Strings = (
          'SELECT * FROM CAD_CLIENTES'
          'WHERE'
          'CODIGO=:CODIGO')
        SQLdbMaxLenght = 10
        SearchQuery.Strings = (
          'SELECT * FROM CAD_CLIENTES'
          'WHERE'
          'COALESCE(ATIVO,'#39'S'#39')<>'#39'N'#39
          'AND'
          '%WHERE%')
        SearchDialogFieldList = <
          item
            FieldName = 'CODIGO'
            WhereSyntax = 'CODIGO'
            DisplayLabel = 'C'#243'digo:'
            DisplayWidth = 10
            DisplayColumnWidth = 0
            FieldType = ftInteger
            Search = True
            EmptyOperation = eoNull
            DefaultComparison = scEqual
            SearchCase = scMixed
          end
          item
            FieldName = 'NOME'
            WhereSyntax = 'NOME'
            DisplayLabel = 'Nome:'
            DisplayWidth = 90
            DisplayColumnWidth = 0
            FieldType = ftString
            Search = True
            EmptyOperation = eoNull
            DefaultComparison = scContains
            SearchCase = scUpper
          end>
        SearchPresetList = <>
        DialogCaption = 'Pesquisa'
        DialogWidth = 0
        DialogHeight = 0
        Store = dsFields
        CompareFormatDate = 'DDMMYYYY'
        CompareFormatTime = 'HHMMSS'
        CompareFormatDateTime = 'DDMMYYYY'
        TrueExpression = '1=1'
        DefaultSet = [ddSearchStyle, ddCriteriaCount, ddMaxCriteria, ddMax, ddCaseFormatUpper, ddCaseFormatLower, ddRegistryPath, ddDialogCaption, ddDialogWidth, ddDialogHeight, ddStore, ddCompareFormatDate, ddCompareFormatTime, ddCompareFormatDateTime, ddQuotedDateTime, ddQuoteChar, ddDecimalChar, ddTrueExpression, ddStartOpen, ddIgnoreEmptyValues, ddShowPresets, ddClearValueOnFieldChange, ddShowPresetsCustomization, ddShowHint]
        ConnectionDialog = FrmPrincipal.DBConexao
        Connection = FrmPrincipal.DBConexao
      end
      object EditNomeCliente: TEdit
        Left = 110
        Top = 132
        Width = 461
        Height = 23
        CharCase = ecUpperCase
        Color = clBtnFace
        Enabled = False
        TabOrder = 4
      end
      object DBEdit1: TDBEdit
        Left = 13
        Top = 184
        Width = 558
        Height = 23
        TabOrder = 5
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 212
        Width = 922
        Height = 92
        Align = alBottom
        Caption = 'Descri'#231#227'o'
        TabOrder = 6
        object Memo1: TMemo
          Left = 2
          Top = 17
          Width = 918
          Height = 73
          Align = alClient
          Lines.Strings = (
            'Memo1')
          TabOrder = 0
        end
      end
    end
  end
  inherited dbTabela: TFDQuery
    SQL.Strings = (
      'SELECT * FROM CAD_ALERTAS')
  end
  inherited cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
  end
end