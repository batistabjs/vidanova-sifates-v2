object FrmTerceirizadosRelatorios: TFrmTerceirizadosRelatorios
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Relat'#243'rio de Produ'#231#227'o'
  ClientHeight = 464
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopUpBarraBotoesImprimir
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PainelPrincipal: TPanel
    Left = 0
    Top = 44
    Width = 709
    Height = 374
    Align = alClient
    BevelWidth = 2
    ParentBackground = False
    TabOrder = 0
    object PainelParametros: TPanel
      Left = 252
      Top = 2
      Width = 455
      Height = 370
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 3
      ParentBackground = False
      TabOrder = 0
      object Panel3: TPanel
        Left = 5
        Top = 242
        Width = 445
        Height = 123
        Align = alClient
        BevelInner = bvLowered
        BorderWidth = 3
        TabOrder = 3
        object GroupBox_OP_Lote: TGroupBox
          AlignWithMargins = True
          Left = 8
          Top = 8
          Width = 202
          Height = 107
          Align = alClient
          Caption = '&Ordem de Produ'#231#227'o (lote)'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object chk_OP: TCheckBox
            Left = 8
            Top = 20
            Width = 128
            Height = 13
            Cursor = crHandPoint
            Hint = 'Todas as ordens de produ'#231#245'es (lotes)'
            Caption = 'Todas as OP'#180's'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
            OnClick = chk_OPClick
          end
          object Painel_OP: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 57
            Width = 192
            Height = 45
            Align = alBottom
            Enabled = False
            TabOrder = 1
            object Edit_OP1: TIDBEditDialog
              Left = 8
              Top = 18
              Width = 53
              Height = 21
              Hint = 'Ordem de Produ'#231#227'o'
              HelpKeyWord = ''
              CharCase = ecUpperCase
              Color = clWindow
              Enabled = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 0
              Text = '0'
              Visible = True
              EditType = etNumeric
              LabelCaption = 'De:'
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
              ButtonKeyClickBtn = 119
              SQLdbCampoRetorno = 'NATUREZA'
              SQLdbRetornoVazio = ' *** '
              SQLdbCampoParametro = 'CODIGO'
              SQLdbMaxLenght = 10
              SearchQuery.Strings = (
                'SELECT *  FROM VIEW_ORDEMPRODUCAO'
                'WHERE'
                '%WHERE%')
              CountQuery.Strings = (
                'SELECT COUNT(REFERENCIA)  FROM VIEW_ORDEMPRODUCAO'
                'WHERE'
                '%WHERE%')
              SearchDialogFieldList = <
                item
                  FieldName = 'CODIGO'
                  WhereSyntax = 'CODIGO'
                  DisplayLabel = 'O.P:'
                  DisplayWidth = 8
                  DisplayColumnWidth = 0
                  FieldType = ftInteger
                  Search = True
                  EmptyOperation = eoNull
                  DefaultComparison = scEqual
                  SearchCase = scMixed
                end
                item
                  FieldName = 'PEDIDO'
                  WhereSyntax = 'PEDIDO'
                  DisplayLabel = 'PEDIDO:'
                  DisplayWidth = 8
                  DisplayColumnWidth = 0
                  FieldType = ftInteger
                  Search = True
                  EmptyOperation = eoNull
                  DefaultComparison = scEqual
                  SearchCase = scMixed
                end
                item
                  FieldName = 'NATUREZA'
                  WhereSyntax = 'NATUREZA'
                  DisplayLabel = 'NATUREZA:'
                  DisplayWidth = 25
                  DisplayColumnWidth = 0
                  FieldType = ftString
                  Search = False
                  EmptyOperation = eoNull
                  DefaultComparison = scBeginsWith
                  SearchCase = scMixed
                end
                item
                  FieldName = 'DATA'
                  WhereSyntax = 'DATA'
                  DisplayLabel = 'DATA:'
                  DisplayFormat = 'dd/mm/yyyy'
                  DisplayWidth = 10
                  DisplayColumnWidth = 0
                  FieldType = ftDate
                  Search = False
                  EmptyOperation = eoNull
                  DefaultComparison = scEqual
                  SearchCase = scMixed
                end
                item
                  FieldName = 'HORA'
                  WhereSyntax = 'HORA'
                  DisplayLabel = 'HORA:'
                  DisplayWidth = 8
                  DisplayColumnWidth = 0
                  FieldType = ftTime
                  Search = False
                  EmptyOperation = eoNull
                  DefaultComparison = scEqual
                  SearchCase = scMixed
                end
                item
                  FieldName = 'CLIENTE_NOME'
                  WhereSyntax = 'CLIENTE_NOME'
                  DisplayLabel = 'CLIENTE:'
                  DisplayWidth = 35
                  DisplayColumnWidth = 0
                  FieldType = ftString
                  Search = True
                  EmptyOperation = eoNull
                  DefaultComparison = scBeginsWith
                  SearchCase = scMixed
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
            object Edit_OP2: TIDBEditDialog
              Left = 67
              Top = 18
              Width = 53
              Height = 21
              Hint = 'Ordem de Produ'#231#227'o'
              HelpKeyWord = ''
              CharCase = ecUpperCase
              Color = clWindow
              Enabled = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 30
              ParentFont = False
              TabOrder = 1
              Text = '0'
              Visible = True
              EditType = etNumeric
              LabelCaption = 'At'#233':'
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
              ButtonKeyClickBtn = 119
              SQLdbFazBusca = True
              SQLdbCampoRetorno = 'NATUREZA'
              SQLdbRetornoVazio = ' *** '
              SQLdbCampoParametro = 'CODIGO'
              SQLdbMaxLenght = 10
              SearchQuery.Strings = (
                'SELECT *  FROM VIEW_ORDEMPRODUCAO'
                'WHERE'
                '%WHERE%')
              CountQuery.Strings = (
                'SELECT COUNT(REFERENCIA)  FROM VIEW_ORDEMPRODUCAO'
                'WHERE'
                '%WHERE%')
              SearchDialogFieldList = <
                item
                  FieldName = 'CODIGO'
                  WhereSyntax = 'CODIGO'
                  DisplayLabel = 'O.P:'
                  DisplayWidth = 8
                  DisplayColumnWidth = 0
                  FieldType = ftInteger
                  Search = True
                  EmptyOperation = eoNull
                  DefaultComparison = scEqual
                  SearchCase = scMixed
                end
                item
                  FieldName = 'PEDIDO'
                  WhereSyntax = 'PEDIDO'
                  DisplayLabel = 'PEDIDO:'
                  DisplayWidth = 8
                  DisplayColumnWidth = 0
                  FieldType = ftInteger
                  Search = True
                  EmptyOperation = eoNull
                  DefaultComparison = scEqual
                  SearchCase = scMixed
                end
                item
                  FieldName = 'NATUREZA'
                  WhereSyntax = 'NATUREZA'
                  DisplayLabel = 'NATUREZA:'
                  DisplayWidth = 25
                  DisplayColumnWidth = 0
                  FieldType = ftString
                  Search = False
                  EmptyOperation = eoNull
                  DefaultComparison = scBeginsWith
                  SearchCase = scMixed
                end
                item
                  FieldName = 'DATA'
                  WhereSyntax = 'DATA'
                  DisplayLabel = 'DATA:'
                  DisplayFormat = 'dd/mm/yyyy'
                  DisplayWidth = 10
                  DisplayColumnWidth = 0
                  FieldType = ftDate
                  Search = False
                  EmptyOperation = eoNull
                  DefaultComparison = scEqual
                  SearchCase = scMixed
                end
                item
                  FieldName = 'HORA'
                  WhereSyntax = 'HORA'
                  DisplayLabel = 'HORA:'
                  DisplayWidth = 8
                  DisplayColumnWidth = 0
                  FieldType = ftTime
                  Search = False
                  EmptyOperation = eoNull
                  DefaultComparison = scEqual
                  SearchCase = scMixed
                end
                item
                  FieldName = 'CLIENTE_NOME'
                  WhereSyntax = 'CLIENTE_NOME'
                  DisplayLabel = 'CLIENTE:'
                  DisplayWidth = 35
                  DisplayColumnWidth = 0
                  FieldType = ftString
                  Search = True
                  EmptyOperation = eoNull
                  DefaultComparison = scBeginsWith
                  SearchCase = scMixed
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
          end
        end
        object GroupBox_OP_Produtos: TGroupBox
          AlignWithMargins = True
          Left = 216
          Top = 8
          Width = 221
          Height = 107
          Align = alRight
          Caption = '&Refer'#234'ncias'
          Color = clBtnFace
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          object chk_Referencia: TCheckBox
            Left = 3
            Top = 20
            Width = 112
            Height = 13
            Cursor = crHandPoint
            Hint = 'Rastrear todos os produtos'
            Caption = 'Todos os produtos'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
            OnClick = chk_ReferenciaClick
          end
          object PainelProdutos: TPanel
            AlignWithMargins = True
            Left = 5
            Top = 57
            Width = 211
            Height = 45
            Align = alBottom
            Enabled = False
            TabOrder = 1
            object EditProdutoB: TIDBEditDialog
              Left = 108
              Top = 18
              Width = 97
              Height = 19
              HelpKeyWord = ''
              Color = clWindow
              Enabled = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Text = ''
              Visible = True
              FocusColor = clBtnFace
              LabelCaption = 'At'#233':'
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
              ButtonKeyClickBtn = 119
              SQLdbCampoRetorno = 'DESCRICAO'
              SQLdbRetornoVazio = ' *** '
              SQLdbCampoParametro = 'REFERENCIA'
              SQLdbSQL.Strings = (
                ''
                'SELECT * FROM CAD_PRODUTOS'
                'WHERE'
                'TIPO_PRODUTO='#39'ACA'#39
                'AND'
                'REFERENCIA=:REFERENCIA')
              SQLdbMaxLenght = 10
              SearchQuery.Strings = (
                'SELECT * FROM CAD_PRODUTOS'
                'WHERE'
                'TIPO_PRODUTO='#39'ACA'#39
                'AND'
                '%WHERE%')
              CountQuery.Strings = (
                'SELECT COUNT(*) FROM CAD_PRODUTOS'
                'WHERE'
                'TIPO_PRODUTO='#39'ACA'#39
                'AND'
                '%WHERE%')
              SearchDialogFieldList = <
                item
                  FieldName = 'REFERENCIA'
                  WhereSyntax = 'REFERENCIA'
                  DisplayLabel = 'Refer'#234'ncia:'
                  DisplayWidth = 20
                  DisplayColumnWidth = 0
                  FieldType = ftString
                  Search = True
                  EmptyOperation = eoNull
                  DefaultComparison = scContains
                  SearchCase = scUpper
                end
                item
                  FieldName = 'DESCRICAO'
                  WhereSyntax = 'DESCRICAO'
                  DisplayLabel = 'Descri'#231#227'o'
                  DisplayWidth = 80
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
            object EditProdutoA: TIDBEditDialog
              Left = 5
              Top = 18
              Width = 97
              Height = 19
              HelpKeyWord = ''
              Color = clWindow
              Enabled = True
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = ''
              Visible = True
              FocusColor = clBtnFace
              LabelCaption = 'De:'
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
              ButtonKeyClickBtn = 119
              SQLdbCampoRetorno = 'DESCRICAO'
              SQLdbRetornoVazio = ' *** '
              SQLdbCampoParametro = 'REFERENCIA'
              SQLdbSQL.Strings = (
                ''
                'SELECT * FROM CAD_PRODUTOS'
                'WHERE'
                'TIPO_PRODUTO='#39'ACA'#39
                'AND'
                'REFERENCIA=:REFERENCIA')
              SQLdbMaxLenght = 10
              SearchQuery.Strings = (
                'SELECT * FROM CAD_PRODUTOS'
                'WHERE'
                'TIPO_PRODUTO='#39'ACA'#39
                'AND'
                '%WHERE%')
              CountQuery.Strings = (
                'SELECT COUNT(*) FROM CAD_PRODUTOS'
                'WHERE'
                'TIPO_PRODUTO='#39'ACA'#39
                'AND'
                '%WHERE%')
              SearchDialogFieldList = <
                item
                  FieldName = 'REFERENCIA'
                  WhereSyntax = 'REFERENCIA'
                  DisplayLabel = 'Refer'#234'ncia:'
                  DisplayWidth = 20
                  DisplayColumnWidth = 0
                  FieldType = ftString
                  Search = True
                  EmptyOperation = eoNull
                  DefaultComparison = scContains
                  SearchCase = scUpper
                end
                item
                  FieldName = 'DESCRICAO'
                  WhereSyntax = 'DESCRICAO'
                  DisplayLabel = 'Descri'#231#227'o'
                  DisplayWidth = 80
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
          end
        end
      end
      object GRPPeriodo: TGroupBox
        AlignWithMargins = True
        Left = 8
        Top = 8
        Width = 439
        Height = 73
        Cursor = crHandPoint
        Align = alTop
        Caption = '&Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label3: TLabel
          Left = 5
          Top = 32
          Width = 14
          Height = 13
          Caption = 'De'
        end
        object Label4: TLabel
          Left = 104
          Top = 32
          Width = 16
          Height = 13
          Caption = 'At'#233
        end
        object MskDataFim: TMaskEdit
          Left = 123
          Top = 29
          Width = 69
          Height = 21
          EditMask = '99/99/9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
        end
        object MskDataIni: TMaskEdit
          Left = 24
          Top = 29
          Width = 70
          Height = 21
          EditMask = '99/99/9999'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Text = '  /  /    '
        end
      end
      object RadioData_OP: TRadioGroup
        Left = 5
        Top = 84
        Width = 445
        Height = 79
        Align = alTop
        Caption = '&Aplicar periodo a:'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Envio'
          'Retorno')
        TabOrder = 1
      end
      object RadioGroup_Estagio: TRadioGroup
        AlignWithMargins = True
        Left = 8
        Top = 166
        Width = 439
        Height = 73
        Align = alTop
        Caption = '&Est'#225'gio dos Servi'#231'os'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Todos'
          'Pendentes'
          'Encerrados')
        TabOrder = 2
      end
    end
    object RadioTipo_Relatorio: TRadioGroup
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 244
      Height = 364
      Align = alLeft
      Caption = '&Selecione o Relat'#243'rio:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Remessas de Servi'#231'os'
        'Retornos de Servi'#231'os'
        'Agenda de Produ'#231#227'o - Terceirizados'
        'Agenda de Produ'#231#227'o - Fases')
      ParentFont = False
      TabOrder = 1
    end
  end
  inline FrameRelatoriosBotoes1: TFrameRelatoriosBotoes
    Left = 0
    Top = 418
    Width = 709
    Height = 46
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 418
    ExplicitWidth = 709
    inherited Panel1: TPanel
      Width = 709
      ExplicitWidth = 709
      inherited SpbImprimir: TBitBtn
        Left = 8
        Anchors = [akTop]
        OnClick = FrameRelatoriosBotoes1SpbImprimirClick
        ExplicitLeft = 8
      end
      inherited SpbSair: TBitBtn
        Left = 79
        Anchors = [akTop]
        OnClick = FrameRelatoriosBotoes1SpbSairClick
        ExplicitLeft = 79
      end
    end
  end
  inline FrameRelatorios1: TFrameRelatorios
    Left = 0
    Top = 0
    Width = 709
    Height = 44
    Align = alTop
    Color = clWhite
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    TabStop = True
    ExplicitWidth = 709
    inherited Image3: TImage
      Width = 709
      ExplicitWidth = 690
    end
    inherited LblBarraTitulo: TLabel
      Width = 297
      Height = 23
      Caption = 'Terceirizados | Relat'#243'rios de Servi'#231'os'
      ExplicitWidth = 297
    end
    inherited Image2: TImage
      Left = 636
      ExplicitLeft = 617
    end
  end
  object FRXAgendaProducaoTerceirizados: TfrxReport
    Version = '6.2.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbNoFullScreen]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39917.957612847200000000
    ReportOptions.Name = 'Listagem de Ordem de Produ'#231#227'o'
    ReportOptions.LastChange = 40784.568815520800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 329
    Top = 72
    Datasets = <
      item
        DataSet = frxDB_AgendaProducaoTerceirizados
        DataSetName = 'AgendaProducaoTerceirizados'
      end
      item
        DataSet = FrmPrincipal.frx_dsEmpresa
        DataSetName = 'frx_dsEmpresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 15.118110240000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        DataSet = frxDB_AgendaProducaoTerceirizados
        DataSetName = 'AgendaProducaoTerceirizados'
        RowCount = 0
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataField = 'REMESSA'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."REMESSA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 75.078850000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataField = 'DATA'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."DATA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 598.299212600000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'QTDEREMESSA'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."QTDEREMESSA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 637.984251968504000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'QTDERETORNO'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."QTDERETORNO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 677.669291338583000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'QTDERESTANTE'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."QTDERESTANTE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 130.212740000000000000
          Width = 68.031478980000000000
          Height = 15.118120000000000000
          DataField = 'DATARETORNO'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."DATARETORNO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 49.913420000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          DataField = 'ORDEMPRODUCAO'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."ORDEMPRODUCAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 201.567100000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          DataField = 'FASE_NOME'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."FASE_NOME"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 500.118430000000000000
          Width = 52.913390710000000000
          Height = 15.118110240000000000
          DataField = 'COR'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."COR"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 555.551181100000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'TAMANHO'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."TAMANHO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 335.008040000000000000
          Width = 45.354330710000000000
          Height = 15.118110240000000000
          DataField = 'REFERENCIA'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."REFERENCIA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 383.582677170000000000
          Width = 113.385870710000000000
          Height = 15.118110240000000000
          DataField = 'DESCRICAO'
          DataSet = frxDB_AgendaProducaoTerceirizados
          DataSetName = 'AgendaProducaoTerceirizados'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoTerceirizados."DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 60.472440940000000000
        ParentFont = False
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        object Memo50: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 181.417440000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          DataField = 'NOMESISTEMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frx_dsEmpresa."NOMESISTEMA"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 536.693260000000000000
          Width = 181.417440000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          DataField = 'SITEEMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frx_dsEmpresa."SITEEMPRESA"]')
          ParentFont = False
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 79.370095830000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Top = 62.362204724409400000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'REMESSA:')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 75.078850000000000000
          Top = 62.362204724409400000
          Width = 52.913420000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA ENVIO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 598.259842520000000000
          Top = 62.362204724409400000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'REMESSA:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 637.944881890000000000
          Top = 62.362204724409400000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'RETORNO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 677.629921260000000000
          Top = 62.362204724409400000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'RESTANTE:')
          ParentFont = False
          WordWrap = False
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 554.590910000000000000
          Width = 162.511750000000000000
          Height = 49.133858270000000000
          Fill.BackColor = 15724527
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 566.149603860000000000
          Top = 1.889763780000000000
          Width = 57.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Emiss'#227'o:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 567.149603860000000000
          Top = 16.629921260000000000
          Width = 36.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Hora:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 567.149603860000000000
          Top = 31.748031500000000000
          Width = 50.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 1.889763780000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 16.629921260000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 31.748031500000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 77.913420000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line2: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 52.574830000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object MemoTitulo: TfrxMemoView
          AllowVectorExport = True
          Left = 1.220470000000000000
          Width = 550.464750000000000000
          Height = 49.133858270000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Georgia'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15724527
          Memo.UTF8W = (
            'Terceirizados | Relat'#243'rios de Servi'#231'os:'
            'Agenda de Produ'#231#227'o')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 130.212740000000000000
          Top = 62.362204724409400000
          Width = 68.031478980000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA RETORNO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 49.913420000000000000
          Top = 62.362204724409400000
          Width = 22.677180000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'O.P:')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 201.567100000000000000
          Top = 62.362204724409400000
          Width = 22.677118980000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FASE:')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 500.118430000000000000
          Top = 62.362204724409400000
          Width = 30.236210710000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'COR:')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 555.551181100000000000
          Top = 62.362204724409400000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TAMANHO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 335.008040000000000000
          Top = 62.362204724409400000
          Width = 45.354330710000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'REFER'#202'NCIA:')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 383.582677170000000000
          Top = 62.362204724409400000
          Width = 56.692920710000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O:')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 598.299212600000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoTerceirizados."QTDEREMESSA">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 677.669291340000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoTerceirizados."QTDERESTANTE">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 637.984251970000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoTerceirizados."QTDERETORNO">,MasterData1)]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 158.740260000000000000
        Width = 718.110700000000000000
        Condition = 'AgendaProducaoTerceirizados."TERCEIRIZADOORIGEM"'
        object Memo27: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 366.614348980000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            
              'TERCEIRIZADO: [AgendaProducaoTerceirizados."FORNECEDOR"]-[Agenda' +
              'ProducaoTerceirizados."FORNECEDOR_NOME"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897640240000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 598.299212600000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoTerceirizados."QTDEREMESSA">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 677.669291340000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoTerceirizados."QTDERESTANTE">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 637.984251970000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoTerceirizados."QTDERETORNO">,MasterData1)]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 17.338590000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
    end
  end
  object frxDB_AgendaProducaoTerceirizados: TfrxDBDataset
    UserName = 'AgendaProducaoTerceirizados'
    CloseDataSource = False
    FieldAliases.Strings = (
      'EMPRESA=EMPRESA'
      'CODIGO=CODIGO'
      'APROVADO=APROVADO'
      'DATA=DATA'
      'REFERENCIA=REFERENCIA'
      'COR_ID=COR_ID'
      'COR=COR'
      'TAMANHO_ID=TAMANHO_ID'
      'TAMANHO=TAMANHO'
      'ORDEM_GRADE=ORDEM_GRADE'
      'QTDE_TOTAL=QTDE_TOTAL'
      'QTDE_ENVIADA=QTDE_ENVIADA'
      'QTDE_RESTANTE=QTDE_RESTANTE')
    DataSet = DB_AgendaProducaoTerceirizados
    BCDToCurrency = False
    Left = 328
    Top = 200
  end
  object DB_AgendaProducaoTerceirizados: TFDQuery
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT * FROM VIEW_PCPFASETRANSFERENCIA'
      'ORDER BY DATA'
      ''
      '--, FORNECEDOR_NOME, FASE_NOME, COR, ORDEM_GRADE')
    Left = 328
    Top = 144
  end
  object PopUpBarraBotoesImprimir: TPopupMenu
    Left = 536
    Top = 16
    object Imprimir1: TMenuItem
      Caption = 'Imprimir'
      ShortCut = 16464
      OnClick = Imprimir1Click
    end
  end
  object DB_RetornoServicos: TFDQuery
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT * FROM VIEW_PCPFASETRANSFERENCIA')
    Left = 192
    Top = 136
  end
  object frxRetornoServicos: TfrxReport
    Version = '6.2.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39917.957612847200000000
    ReportOptions.Name = 'Listagem de Ordem de Produ'#231#227'o'
    ReportOptions.LastChange = 40784.192466041700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 192
    Top = 72
    Datasets = <
      item
        DataSet = FrmPrincipal.frx_dsEmpresa
        DataSetName = 'frx_dsEmpresa'
      end
      item
        DataSet = frxDB_RetornoServicos
        DataSetName = 'RetornoServicos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDB_RetornoServicos
        DataSetName = 'RetornoServicos'
        RowCount = 0
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataField = 'CODIGO'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RetornoServicos."CODIGO"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 91.196970000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataField = 'DATA'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RetornoServicos."DATA"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 449.763828350000000000
          Width = 41.574800710000000000
          Height = 15.118110240000000000
          DataField = 'QTDE_ENVIADA'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[RetornoServicos."QTDE_ENVIADA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 497.007898430000000000
          Width = 41.574800710000000000
          Height = 15.118110240000000000
          DataField = 'QTDE_RETORNADA'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[RetornoServicos."QTDE_RETORNADA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 544.251980710000000000
          Width = 45.354328270000000000
          Height = 15.118110240000000000
          DataField = 'QTDE_RESTANTE'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[RetornoServicos."QTDE_RESTANTE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 146.771800000000000000
          Width = 68.031478980000000000
          Height = 15.118120000000000000
          DataField = 'DATARETORNO'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RetornoServicos."DATARETORNO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165361650000000000
          Top = 0.000041500000000000
          Width = 52.913383390000000000
          Height = 15.118110240000000000
          DataField = 'CONCLUIDO'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          DisplayFormat.FormatStr = '###,##0%'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[RetornoServicos."CONCLUIDO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 657.637795280000000000
          Top = 0.000041500000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          DataField = 'ENCERRADO'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RetornoServicos."ENCERRADO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 49.913420000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataField = 'ORDEMPRODUCAO'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RetornoServicos."ORDEMPRODUCAO"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DataField = 'VLR_TOTAL'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[RetornoServicos."VLR_TOTAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 220.464750000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          DataField = 'FASE_NOME'
          DataSet = frxDB_RetornoServicos
          DataSetName = 'RetornoServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RetornoServicos."FASE_NOME"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 60.472440940000000000
        ParentFont = False
        Top = 366.614410000000000000
        Width = 718.110700000000000000
        object Memo50: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 181.417440000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          DataField = 'SRV_EMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frx_dsEmpresa."SRV_EMPRESA"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 536.693260000000000000
          Width = 181.417440000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          DataField = 'EMP_SITE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frx_dsEmpresa."EMP_SITE"]')
          ParentFont = False
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 79.370095830000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Top = 62.362204720000000000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'REMESSA:')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 91.196970000000000000
          Top = 62.362204720000000000
          Width = 52.913420000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA ENVIO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 449.763828350000000000
          Top = 62.362204724409400000
          Width = 45.354330710000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'REMESSA:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 497.007898430000000000
          Top = 62.362204720000000000
          Width = 45.354330710000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'RETORNO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 544.251980710000000000
          Top = 62.362204720000000000
          Width = 49.133858270000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'RESTANTE:')
          ParentFont = False
          WordWrap = False
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 554.590910000000000000
          Width = 162.511750000000000000
          Height = 49.133858270000000000
          Fill.BackColor = 15724527
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 566.149603860000000000
          Top = 1.889763780000000000
          Width = 57.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Emiss'#227'o:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 567.149603860000000000
          Top = 16.629921260000000000
          Width = 36.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Hora:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 567.149603860000000000
          Top = 31.748031500000000000
          Width = 50.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 1.889763780000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 16.629921260000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 31.748031500000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 77.913420000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line2: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 52.574830000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object MemoTitulo: TfrxMemoView
          AllowVectorExport = True
          Left = 1.220470000000000000
          Width = 550.464750000000000000
          Height = 49.133858270000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Georgia'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15724527
          Memo.UTF8W = (
            'Terceirizados | Relat'#243'rios de Servi'#231'os:'
            'Retorno de Servi'#231'os')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 146.771800000000000000
          Top = 62.362204720000000000
          Width = 68.031478980000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA RETORNO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165361650000000000
          Top = 62.362204720000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CONCLUS'#195'O:')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 657.637795280000000000
          Top = 62.362204720000000000
          Width = 52.913385826771700000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENCERRADO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 49.913420000000000000
          Top = 62.362204720000000000
          Width = 37.795300000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'O.P:')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 220.464750000000000000
          Top = 62.362204720000000000
          Width = 90.708658980000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FASE DE PRODU'#199#195'O:')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393700787402000000
          Top = 62.362204720000000000
          Width = 71.811023622047200000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR A PAGAR:')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 298.582870000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL A PAGAR:')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Top = 3.779530000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<RetornoServicos."VLR_TOTAL">,MasterData1)]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 158.740260000000000000
        Width = 718.110700000000000000
        Condition = 'RetornoServicos."TERCEIRIZADOORIGEM"'
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 525.354608980000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'TERCEIRIZADO: [RetornoServicos."TERCEIRIZADOORIGEM"]-[RetornoSer' +
              'vicos."TERCEIRIZADOORIGEM_NOME"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<RetornoServicos."VLR_TOTAL">,MasterData1)]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
    end
  end
  object frxDB_RetornoServicos: TfrxDBDataset
    UserName = 'RetornoServicos'
    CloseDataSource = False
    DataSet = DB_RetornoServicos
    BCDToCurrency = False
    Left = 192
    Top = 200
  end
  object frxDBD_PerdasProducao: TfrxDBDataset
    UserName = 'PerdasProducao'
    CloseDataSource = False
    DataSet = DB_PerdasProducao
    BCDToCurrency = False
    Left = 600
    Top = 192
  end
  object frxPerdasProducao: TfrxReport
    Version = '6.2.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40698.799368414400000000
    ReportOptions.Name = 'Estoque Dispon'#237'vel'
    ReportOptions.LastChange = 40698.799368414400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 600
    Top = 64
    Datasets = <
      item
        DataSet = FrmPrincipal.frx_dsEmpresa
        DataSetName = 'frx_dsEmpresa'
      end
      item
        DataSet = frxDBD_PerdasProducao
        DataSetName = 'PerdasProducao'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 71.811070000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        Child = frxPerdasProducao.Child1
        object MemoTitulo: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 7.559060000000000000
          Width = 554.244280000000000000
          Height = 49.133858270000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15724527
          Memo.UTF8W = (
            'Relat'#243'rio - PCP'
            'Estoque Dispon'#237'vel')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 553.370440000000000000
          Top = 7.559060000000000000
          Width = 162.511750000000000000
          Height = 49.133858270000000000
          Fill.BackColor = 15724527
          Frame.Color = clWhite
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 562.929133860000000000
          Top = 9.448823780000000000
          Width = 57.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Emiss'#227'o:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 563.929133860000000000
          Top = 24.188981260000000000
          Width = 36.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Hora:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 563.929133860000000000
          Top = 39.307091500000000000
          Width = 50.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 629.078745040000000000
          Top = 9.448823780000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 629.078745040000000000
          Top = 24.188981260000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 629.078745040000000000
          Top = 39.307091500000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Frame.Typ = []
        Height = 139.842610000000000000
        Top = 113.385900000000000000
        Width = 718.110700000000000000
        ToNRows = 0
        ToNRowsMode = rmCount
        object DBCross1: TfrxDBCrossView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 7.559060000000000000
          Width = 369.000000000000000000
          Height = 126.000000000000000000
          Hint = 'Produ'#231#227'o necess'#225'ria para atender pedidos de vendas'
          ShowHint = True
          DownThenAcross = True
          PlainCells = True
          RowLevels = 3
          CellFields.Strings = (
            'estoqueliquido')
          ColumnFields.Strings = (
            'TAMANHO')
          DataSet = frxDBD_PerdasProducao
          DataSetName = 'PerdasProducao'
          RowFields.Strings = (
            'REFERENCIA'
            'DESCRICAO'
            'COR')
          Memos = {
            3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D227574
            662D3822207374616E64616C6F6E653D226E6F223F3E3C63726F73733E3C6365
            6C6C6D656D6F733E3C546672784D656D6F5669657720416C6C6F77566563746F
            724578706F72743D225472756522204C6566743D223233382C38393736352220
            546F703D223137382C3934343936222057696474683D22373122204865696768
            743D22313922205265737472696374696F6E733D2232342220416C6C6F774578
            7072657373696F6E733D2246616C73652220466F6E742E436861727365743D22
            302220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D
            31312220466F6E742E4E616D653D22417269616C204E6172726F772220466F6E
            742E5374796C653D223022204672616D652E5479703D2231352220476170583D
            22332220476170593D2233222048416C69676E3D226861526967687422205061
            72656E74466F6E743D2246616C7365222056416C69676E3D22766143656E7465
            722220546578743D2230222F3E3C546672784D656D6F5669657720416C6C6F77
            566563746F724578706F72743D225472756522204C6566743D22333232222054
            6F703D223537222057696474683D22373522204865696768743D223139222052
            65737472696374696F6E733D2232342220416C6C6F7745787072657373696F6E
            733D2246616C73652220466F6E742E436861727365743D22302220466F6E742E
            436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E74
            2E4E616D653D225461686F6D612220466F6E742E5374796C653D223122204672
            616D652E5479703D223135222046696C6C2E4261636B436F6C6F723D22313537
            32343532372220476170583D22332220476170593D2233222048416C69676E3D
            22686152696768742220506172656E74466F6E743D2246616C7365222056416C
            69676E3D22766143656E7465722220546578743D2230222F3E3C546672784D65
            6D6F5669657720416C6C6F77566563746F724578706F72743D22547275652220
            4C6566743D223135362220546F703D223832222057696474683D223832222048
            65696768743D22323222205265737472696374696F6E733D2232342220416C6C
            6F7745787072657373696F6E733D2246616C73652220466F6E742E4368617273
            65743D22302220466F6E742E436F6C6F723D22302220466F6E742E4865696768
            743D222D31312220466F6E742E4E616D653D225461686F6D612220466F6E742E
            5374796C653D223022204672616D652E5479703D22313522204672616D652E54
            6F704C696E652E57696474683D22322220476170583D22332220476170593D22
            33222048416C69676E3D22686152696768742220506172656E74466F6E743D22
            46616C7365222056416C69676E3D22766143656E7465722220546578743D2230
            222F3E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F
            72743D225472756522204C6566743D223233382C38393736352220546F703D22
            3139372C3934343936222057696474683D22373122204865696768743D223239
            22205265737472696374696F6E733D2232342220416C6C6F7745787072657373
            696F6E733D2246616C73652220466F6E742E436861727365743D22302220466F
            6E742E436F6C6F723D22302220466F6E742E4865696768743D222D3131222046
            6F6E742E4E616D653D22417269616C204E6172726F772220466F6E742E537479
            6C653D223122204672616D652E5479703D223135222046696C6C2E4261636B43
            6F6C6F723D2231353732343532372220476170583D22332220476170593D2233
            222048416C69676E3D22686152696768742220506172656E74466F6E743D2246
            616C7365222056416C69676E3D22766143656E7465722220546578743D223022
            2F3E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F72
            743D225472756522204C6566743D223330392C38393736352220546F703D2231
            37382C3934343936222057696474683D22353822204865696768743D22313922
            205265737472696374696F6E733D2232342220416C6C6F774578707265737369
            6F6E733D2246616C73652220466F6E742E436861727365743D22302220466F6E
            742E436F6C6F723D22302220466F6E742E4865696768743D222D31312220466F
            6E742E4E616D653D22417269616C204E6172726F772220466F6E742E5374796C
            653D223122204672616D652E5479703D223135222046696C6C2E4261636B436F
            6C6F723D2231353732343532372220476170583D22332220476170593D223322
            2048416C69676E3D22686152696768742220506172656E74466F6E743D224661
            6C7365222056416C69676E3D22766143656E7465722220546578743D2230222F
            3E3C546672784D656D6F5669657720416C6C6F77566563746F724578706F7274
            3D225472756522204C6566743D22302220546F703D2230222057696474683D22
            3022204865696768743D223022205265737472696374696F6E733D2238222041
            6C6C6F7745787072657373696F6E733D2246616C736522204672616D652E5479
            703D2231352220476170583D22332220476170593D2233222048416C69676E3D
            2268615269676874222056416C69676E3D22766143656E746572222054657874
            3D22222F3E3C546672784D656D6F5669657720416C6C6F77566563746F724578
            706F72743D225472756522204C6566743D223230302220546F703D2237362220
            57696474683D2231323222204865696768743D22323922205265737472696374
            696F6E733D2232342220416C6C6F7745787072657373696F6E733D2246616C73
            6522204672616D652E5479703D2231352220476170583D22332220476170593D
            2233222048416C69676E3D2268615269676874222056416C69676E3D22766143
            656E7465722220546578743D2230222F3E3C546672784D656D6F566965772041
            6C6C6F77566563746F724578706F72743D225472756522204C6566743D223330
            392C38393736352220546F703D223139372C3934343936222057696474683D22
            353822204865696768743D22323922205265737472696374696F6E733D223234
            2220416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E
            436861727365743D22302220466F6E742E436F6C6F723D22302220466F6E742E
            4865696768743D222D31312220466F6E742E4E616D653D22417269616C204E61
            72726F772220466F6E742E5374796C653D223122204672616D652E5479703D22
            31352220476170583D22332220476170593D2233222048416C69676E3D226861
            52696768742220506172656E74466F6E743D2246616C7365222056416C69676E
            3D22766143656E7465722220546578743D2230222F3E3C2F63656C6C6D656D6F
            733E3C63656C6C6865616465726D656D6F733E3C546672784D656D6F56696577
            20416C6C6F77566563746F724578706F72743D225472756522204C6566743D22
            3230302220546F703D223338222057696474683D223132322220486569676874
            3D22313922205265737472696374696F6E733D22382220416C6C6F7745787072
            657373696F6E733D2246616C736522204672616D652E5479703D223135222047
            6170583D22332220476170593D2233222056416C69676E3D22766143656E7465
            722220546578743D226573746F7175656C69717569646F222F3E3C546672784D
            656D6F5669657720416C6C6F77566563746F724578706F72743D225472756522
            204C6566743D223332322220546F703D223338222057696474683D2237352220
            4865696768743D22313922205265737472696374696F6E733D22382220416C6C
            6F7745787072657373696F6E733D2246616C736522204672616D652E5479703D
            2231352220476170583D22332220476170593D2233222056416C69676E3D2276
            6143656E7465722220546578743D226573746F7175656C69717569646F222F3E
            3C546672784D656D6F5669657720416C6C6F77566563746F724578706F72743D
            225472756522204C6566743D223339372220546F703D22333822205769647468
            3D2231323222204865696768743D22313922205265737472696374696F6E733D
            22382220416C6C6F7745787072657373696F6E733D2246616C73652220467261
            6D652E5479703D2231352220476170583D22332220476170593D223322205641
            6C69676E3D22766143656E7465722220546578743D226573746F7175656C6971
            7569646F222F3E3C546672784D656D6F5669657720416C6C6F77566563746F72
            4578706F72743D225472756522204C6566743D223531392220546F703D223338
            222057696474683D22373522204865696768743D223139222052657374726963
            74696F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C73
            6522204672616D652E5479703D2231352220476170583D22332220476170593D
            2233222056416C69676E3D22766143656E7465722220546578743D226573746F
            7175656C69717569646F222F3E3C2F63656C6C6865616465726D656D6F733E3C
            636F6C756D6E6D656D6F733E3C546672784D656D6F5669657720416C6C6F7756
            6563746F724578706F72743D225472756522204C6566743D223233382C383937
            36352220546F703D223135392C3934343936222057696474683D223731222048
            65696768743D22313922205265737472696374696F6E733D2232342220416C6C
            6F7745787072657373696F6E733D2246616C73652220466F6E742E4368617273
            65743D22302220466F6E742E436F6C6F723D22302220466F6E742E4865696768
            743D222D31312220466F6E742E4E616D653D2256657264616E612220466F6E74
            2E5374796C653D223022204672616D652E5479703D2231352220476170583D22
            332220476170593D2233222048416C69676E3D22686152696768742220506172
            656E74466F6E743D2246616C7365222056416C69676E3D22766143656E746572
            2220546578743D22222F3E3C2F636F6C756D6E6D656D6F733E3C636F6C756D6E
            746F74616C6D656D6F733E3C546672784D656D6F5669657720416C6C6F775665
            63746F724578706F72743D225472756522204C6566743D223330392C38393736
            352220546F703D223135392C3934343936222057696474683D22353822204865
            696768743D22313922205265737472696374696F6E733D22382220416C6C6F77
            45787072657373696F6E733D2246616C73652220466F6E742E43686172736574
            3D22302220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D
            222D31312220466F6E742E4E616D653D22417269616C204E6172726F77222046
            6F6E742E5374796C653D223122204672616D652E5479703D2231352220476170
            583D22332220476170593D2233222048416C69676E3D22686152696768742220
            506172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E
            7465722220546578743D22535542544F54414C3A222F3E3C2F636F6C756D6E74
            6F74616C6D656D6F733E3C636F726E65726D656D6F733E3C546672784D656D6F
            5669657720416C6C6F77566563746F724578706F72743D225472756522204C65
            66743D2233382C38393736352220546F703D223134302C393434393622205769
            6474683D2232303022204865696768743D22313922205265737472696374696F
            6E733D22382220416C6C6F7745787072657373696F6E733D2246616C73652220
            466F6E742E436861727365743D22302220466F6E742E436F6C6F723D22302220
            466F6E742E4865696768743D222D31312220466F6E742E4E616D653D22417269
            616C204E6172726F772220466F6E742E5374796C653D223122204672616D652E
            5479703D2231352220476170583D22332220476170593D2233222048416C6967
            6E3D22686143656E7465722220506172656E74466F6E743D2246616C73652220
            56416C69676E3D22766143656E7465722220546578743D226573746F7175656C
            69717569646F222F3E3C546672784D656D6F5669657720416C6C6F7756656374
            6F724578706F72743D225472756522204C6566743D223233382C383937363522
            20546F703D223134302C3934343936222057696474683D223132392220486569
            6768743D22313922205265737472696374696F6E733D22382220416C6C6F7745
            787072657373696F6E733D2246616C73652220466F6E742E436861727365743D
            22302220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D22
            2D31312220466F6E742E4E616D653D22417269616C204E6172726F772220466F
            6E742E5374796C653D223122204672616D652E5479703D223135222047617058
            3D22332220476170593D2233222048416C69676E3D22686143656E7465722220
            506172656E74466F6E743D2246616C7365222056416C69676E3D22766143656E
            7465722220546578743D2254414D414E484F3A222F3E3C546672784D656D6F56
            69657720416C6C6F77566563746F724578706F72743D225472756522204C6566
            743D223132372220546F703D223231222057696474683D223934222048656967
            68743D22323222205265737472696374696F6E733D2238222056697369626C65
            3D2246616C73652220416C6C6F7745787072657373696F6E733D2246616C7365
            22204672616D652E5479703D2231352220476170583D22332220476170593D22
            33222048416C69676E3D22686143656E746572222056416C69676E3D22766143
            656E7465722220546578743D22222F3E3C546672784D656D6F5669657720416C
            6C6F77566563746F724578706F72743D225472756522204C6566743D2233382C
            38393736352220546F703D223135392C3934343936222057696474683D223638
            22204865696768743D22313922205265737472696374696F6E733D2238222041
            6C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E436861
            727365743D22302220466F6E742E436F6C6F723D22302220466F6E742E486569
            6768743D222D31312220466F6E742E4E616D653D22417269616C204E6172726F
            772220466F6E742E5374796C653D223122204672616D652E5479703D22313522
            204672616D652E52696768744C696E652E436F6C6F723D223136373737323135
            2220476170583D22332220476170593D2233222048416C69676E3D2268614365
            6E7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D
            22766143656E7465722220546578743D225245464552C38A4E4349413A222F3E
            3C546672784D656D6F5669657720416C6C6F77566563746F724578706F72743D
            225472756522204C6566743D223130362C38393736352220546F703D22313539
            2C3934343936222057696474683D22363422204865696768743D223139222052
            65737472696374696F6E733D22382220416C6C6F7745787072657373696F6E73
            3D2246616C73652220466F6E742E436861727365743D22302220466F6E742E43
            6F6C6F723D22302220466F6E742E4865696768743D222D31312220466F6E742E
            4E616D653D22417269616C204E6172726F772220466F6E742E5374796C653D22
            3122204672616D652E5479703D2231352220476170583D22332220476170593D
            2233222048416C69676E3D22686143656E7465722220506172656E74466F6E74
            3D2246616C7365222056416C69676E3D22766143656E7465722220546578743D
            22444553435249C387C3834F3A222F3E3C546672784D656D6F5669657720416C
            6C6F77566563746F724578706F72743D225472756522204C6566743D22313730
            2C38393736352220546F703D223135392C3934343936222057696474683D2236
            3822204865696768743D22313922205265737472696374696F6E733D22382220
            416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E4368
            61727365743D22302220466F6E742E436F6C6F723D22302220466F6E742E4865
            696768743D222D31312220466F6E742E4E616D653D22417269616C204E617272
            6F772220466F6E742E5374796C653D223122204672616D652E5479703D223135
            2220476170583D22332220476170593D2233222048416C69676E3D2268614365
            6E7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D
            22766143656E7465722220546578743D22434F523A222F3E3C2F636F726E6572
            6D656D6F733E3C726F776D656D6F733E3C546672784D656D6F5669657720416C
            6C6F77566563746F724578706F72743D225472756522204C6566743D2233382C
            38393736352220546F703D223137382C3934343936222057696474683D223638
            22204865696768743D22313922205265737472696374696F6E733D2232342220
            416C6C6F7745787072657373696F6E733D2246616C73652220466F6E742E4368
            61727365743D22302220466F6E742E436F6C6F723D22302220466F6E742E4865
            696768743D222D31312220466F6E742E4E616D653D22417269616C204E617272
            6F772220466F6E742E5374796C653D223022204672616D652E5479703D223135
            2220476170583D22332220476170593D2233222048416C69676E3D2268614365
            6E7465722220506172656E74466F6E743D2246616C7365222056416C69676E3D
            22766143656E7465722220546578743D22222F3E3C546672784D656D6F566965
            7720416C6C6F77566563746F724578706F72743D225472756522204C6566743D
            223130362C38393736352220546F703D223137382C3934343936222057696474
            683D22363422204865696768743D22313922205265737472696374696F6E733D
            2232342220416C6C6F7745787072657373696F6E733D2246616C73652220466F
            6E742E436861727365743D22302220466F6E742E436F6C6F723D22302220466F
            6E742E4865696768743D222D31312220466F6E742E4E616D653D22417269616C
            204E6172726F772220466F6E742E5374796C653D223022204672616D652E5479
            703D2231352220476170583D22332220476170593D2233222048416C69676E3D
            22686143656E7465722220506172656E74466F6E743D2246616C736522205641
            6C69676E3D22766143656E7465722220546578743D22222F3E3C546672784D65
            6D6F5669657720416C6C6F77566563746F724578706F72743D22547275652220
            4C6566743D223137302C38393736352220546F703D223137382C393434393622
            2057696474683D22363822204865696768743D22313922205265737472696374
            696F6E733D2232342220416C6C6F7745787072657373696F6E733D2246616C73
            652220466F6E742E436861727365743D22302220466F6E742E436F6C6F723D22
            302220466F6E742E4865696768743D222D31312220466F6E742E4E616D653D22
            417269616C204E6172726F772220466F6E742E5374796C653D22302220467261
            6D652E5479703D2231352220476170583D22332220476170593D223322204841
            6C69676E3D22686143656E7465722220506172656E74466F6E743D2246616C73
            65222056416C69676E3D22766143656E7465722220546578743D22222F3E3C2F
            726F776D656D6F733E3C726F77746F74616C6D656D6F733E3C546672784D656D
            6F5669657720416C6C6F77566563746F724578706F72743D225472756522204C
            6566743D2233382C38393736352220546F703D223139372C3934343936222057
            696474683D2232303022204865696768743D2232392220526573747269637469
            6F6E733D22382220416C6C6F7745787072657373696F6E733D2246616C736522
            20466F6E742E436861727365743D22302220466F6E742E436F6C6F723D223022
            20466F6E742E4865696768743D222D392220466F6E742E4E616D653D22546168
            6F6D612220466F6E742E5374796C653D223122204672616D652E5479703D2231
            352220476170583D22332220476170593D2233222048416C69676E3D22686152
            696768742220506172656E74466F6E743D2246616C7365222056416C69676E3D
            22766143656E7465722220546578743D224E6563657373C3A172696F2070726F
            64757A69722070617261206174656E6465722064656D616E6461203D26233632
            3B222F3E3C546672784D656D6F5669657720416C6C6F77566563746F72457870
            6F72743D225472756522204C6566743D2237362220546F703D22383222205769
            6474683D22383022204865696768743D22323222205265737472696374696F6E
            733D2238222056697369626C653D2246616C73652220416C6C6F774578707265
            7373696F6E733D2246616C73652220466F6E742E436861727365743D22312220
            466F6E742E436F6C6F723D22302220466F6E742E4865696768743D222D313322
            20466F6E742E4E616D653D22417269616C2220466F6E742E5374796C653D2231
            22204672616D652E5479703D2231352220476170583D22332220476170593D22
            33222048416C69676E3D22686143656E7465722220506172656E74466F6E743D
            2246616C7365222056416C69676E3D22766143656E7465722220546578743D22
            546F74616C222F3E3C546672784D656D6F5669657720416C6C6F77566563746F
            724578706F72743D225472756522204C6566743D223136392220546F703D2236
            30222057696474683D22383022204865696768743D2232322220526573747269
            6374696F6E733D2238222056697369626C653D2246616C73652220416C6C6F77
            45787072657373696F6E733D2246616C73652220466F6E742E43686172736574
            3D22312220466F6E742E436F6C6F723D22302220466F6E742E4865696768743D
            222D31332220466F6E742E4E616D653D22417269616C2220466F6E742E537479
            6C653D223122204672616D652E5479703D2231352220476170583D2233222047
            6170593D2233222048416C69676E3D22686143656E7465722220506172656E74
            466F6E743D2246616C7365222056416C69676E3D22766143656E746572222054
            6578743D22546F74616C222F3E3C2F726F77746F74616C6D656D6F733E3C6365
            6C6C66756E6374696F6E733E3C6974656D20312F3E3C2F63656C6C66756E6374
            696F6E733E3C636F6C756D6E736F72743E3C6974656D20322F3E3C2F636F6C75
            6D6E736F72743E3C726F77736F72743E3C6974656D20302F3E3C6974656D2030
            2F3E3C6974656D20302F3E3C2F726F77736F72743E3C2F63726F73733E}
        end
      end
    end
  end
  object DB_PerdasProducao: TFDQuery
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'select'
      'distinct(referencia),'
      'descricao,'
      'cor,'
      'tamanho,'
      'produzir,'
      'produzido,'
      'estoque,'
      'vendido,'
      'estoqueliquido'
      ''
      ''
      'from  VIEW_PCPFASETRANSFERENCIA'
      'where '
      'QTDE_RESTANTE > 0'
      ''
      '--and'
      '--estoqueliquido>0')
    Left = 600
    Top = 128
  end
  object frxRemessaServicos: TfrxReport
    Version = '6.2.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbNoFullScreen]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39917.957612847200000000
    ReportOptions.Name = 'Listagem de Ordem de Produ'#231#227'o'
    ReportOptions.LastChange = 40784.137996898100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 81
    Top = 72
    Datasets = <
      item
        DataSet = FrmPrincipal.frx_dsEmpresa
        DataSetName = 'frx_dsEmpresa'
      end
      item
        DataSet = frxDB_RemessaServicos
        DataSetName = 'RemessaServicos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDB_RemessaServicos
        DataSetName = 'RemessaServicos'
        RowCount = 0
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataField = 'CODIGO'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RemessaServicos."CODIGO"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 91.196970000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataField = 'DATA'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RemessaServicos."DATA"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 449.763828350000000000
          Width = 41.574800710000000000
          Height = 15.118110240000000000
          DataField = 'QTDE_ENVIADA'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[RemessaServicos."QTDE_ENVIADA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 497.007898430000000000
          Width = 41.574800710000000000
          Height = 15.118110240000000000
          DataField = 'QTDE_RETORNADA'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[RemessaServicos."QTDE_RETORNADA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 544.251980710000000000
          Width = 45.354328270000000000
          Height = 15.118110240000000000
          DataField = 'QTDE_RESTANTE'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[RemessaServicos."QTDE_RESTANTE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 146.771800000000000000
          Width = 68.031478980000000000
          Height = 15.118120000000000000
          DataField = 'DATARETORNO'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RemessaServicos."DATARETORNO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165361650000000000
          Top = 0.000041500000000000
          Width = 52.913383390000000000
          Height = 15.118110240000000000
          DataField = 'CONCLUIDO'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          DisplayFormat.FormatStr = '###,##0%'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[RemessaServicos."CONCLUIDO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 657.637795280000000000
          Top = 0.000041500000000000
          Width = 52.913385830000000000
          Height = 15.118110240000000000
          DataField = 'ENCERRADO'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[RemessaServicos."ENCERRADO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 49.913420000000000000
          Width = 37.795300000000000000
          Height = 15.118120000000000000
          DataField = 'ORDEMPRODUCAO'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RemessaServicos."ORDEMPRODUCAO"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DataField = 'VLR_TOTAL'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[RemessaServicos."VLR_TOTAL"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 220.464750000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          DataField = 'FASE_NOME'
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[RemessaServicos."FASE_NOME"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 60.472440940000000000
        ParentFont = False
        Top = 366.614410000000000000
        Width = 718.110700000000000000
        object Memo50: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 181.417440000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          DataField = 'SRV_EMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frx_dsEmpresa."SRV_EMPRESA"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 536.693260000000000000
          Width = 181.417440000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          DataField = 'SRV_SITE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frx_dsEmpresa."SRV_SITE"]')
          ParentFont = False
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 79.370095830000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Top = 62.362204720000000000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'REMESSA:')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 91.196970000000000000
          Top = 62.362204720000000000
          Width = 52.913420000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA ENVIO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 449.763828350000000000
          Top = 62.362204724409400000
          Width = 45.354330710000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'REMESSA:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 497.007898430000000000
          Top = 62.362204720000000000
          Width = 45.354330710000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'RETORNO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 544.251980710000000000
          Top = 62.362204720000000000
          Width = 49.133858270000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'RESTANTE:')
          ParentFont = False
          WordWrap = False
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 554.590910000000000000
          Width = 162.511750000000000000
          Height = 49.133858270000000000
          Fill.BackColor = 15724527
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 566.149603860000000000
          Top = 1.889763780000000000
          Width = 57.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Emiss'#227'o:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 567.149603860000000000
          Top = 16.629921260000000000
          Width = 36.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Hora:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 567.149603860000000000
          Top = 31.748031500000000000
          Width = 50.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 1.889763780000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 16.629921260000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 31.748031500000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 77.913420000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line2: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 52.574830000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object MemoTitulo: TfrxMemoView
          AllowVectorExport = True
          Left = 1.220470000000000000
          Width = 550.464750000000000000
          Height = 49.133858270000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Georgia'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15724527
          Memo.UTF8W = (
            'Terceirizados | Relat'#243'rios de Servi'#231'os:'
            'Remessas de Servi'#231'os')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 146.771800000000000000
          Top = 62.362204720000000000
          Width = 68.031478980000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA RETORNO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165361650000000000
          Top = 62.362204720000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CONCLUS'#195'O:')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 657.637795280000000000
          Top = 62.362204720000000000
          Width = 52.913385826771700000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENCERRADO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 49.913420000000000000
          Top = 62.362204720000000000
          Width = 37.795300000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'O.P:')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 220.464750000000000000
          Top = 62.362204720000000000
          Width = 90.708658980000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FASE DE PRODU'#199#195'O:')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 370.393700787402000000
          Top = 62.362204720000000000
          Width = 71.811023622047200000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VALOR A PAGAR:')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 298.582870000000000000
          Top = 3.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL A PAGAR:')
          ParentFont = False
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Top = 3.779530000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<RemessaServicos."VLR_TOTAL">,MasterData1)]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 158.740260000000000000
        Width = 718.110700000000000000
        Condition = 'RemessaServicos."TERCEIRIZADO"'
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 525.354608980000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'TERCEIRIZADO: [RemessaServicos."TERCEIRIZADO"]-[RemessaServicos.' +
              '"TERCEIRIZADO_NOME"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 370.393940000000000000
          Width = 68.031496060000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<RemessaServicos."VLR_TOTAL">,MasterData1)]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
    end
  end
  object db_RemessaServicos: TFDQuery
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT * FROM VIEW_PCPFASETRANSFERENCIA')
    Left = 80
    Top = 136
  end
  object frxDB_RemessaServicos: TfrxDBDataset
    UserName = 'RemessaServicos'
    CloseDataSource = True
    FieldAliases.Strings = (
      'EMPRESA=EMPRESA'
      'CODIGO=CODIGO'
      'ORDEMPRODUCAO=ORDEMPRODUCAO'
      'DATA=DATA'
      'DATARETORNO=DATARETORNO'
      'TERCEIRIZADO=TERCEIRIZADO'
      'TERCEIRIZADO_NOME=TERCEIRIZADO_NOME'
      'FASE=FASE'
      'FASE_NOME=FASE_NOME'
      'TERCEIRIZADOORIGEM=TERCEIRIZADOORIGEM'
      'TERCEIRIZADOORIGEM_NOME=TERCEIRIZADOORIGEM_NOME'
      'DATARETORNOORIGEM=DATARETORNOORIGEM'
      'FASEORIGEM=FASEORIGEM'
      'FASEORIGEM_NOME=FASEORIGEM_NOME'
      'QTDE_ENVIADA=QTDE_ENVIADA'
      'QTDE_RETORNADA=QTDE_RETORNADA'
      'QTDE_RESTANTE=QTDE_RESTANTE'
      'CONCLUIDO=CONCLUIDO'
      'QTDE_PERDAS=QTDE_PERDAS'
      'QTDE_DEFEITOS=QTDE_DEFEITOS'
      'VLR_UNITARIO=VLR_UNITARIO'
      'VLR_TOTAL=VLR_TOTAL'
      'OBSERVACAO=OBSERVACAO'
      'ENCERRADO=ENCERRADO'
      'GEROUPAGAMENTO=GEROUPAGAMENTO'
      'EMPRESA_1=EMPRESA_1'
      'CODIGO_1=CODIGO_1'
      'ORDEMPRODUCAO_1=ORDEMPRODUCAO_1'
      'DATA_1=DATA_1'
      'TERCEIRIZADO_1=TERCEIRIZADO_1'
      'FASE_1=FASE_1')
    DataSet = db_RemessaServicos
    BCDToCurrency = False
    Left = 80
    Top = 200
  end
  object FRXAgendaProducaoFases: TfrxReport
    Version = '6.2.11'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbNoFullScreen]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 39917.957612847200000000
    ReportOptions.Name = 'Listagem de Ordem de Produ'#231#227'o'
    ReportOptions.LastChange = 40784.568815520800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 465
    Top = 72
    Datasets = <
      item
        DataSet = frxDB_AgendaProducaoFases
        DataSetName = 'AgendaProducaoFases'
      end
      item
        DataSet = FrmPrincipal.frx_dsEmpresa
        DataSetName = 'frx_dsEmpresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 15.118110240000000000
        ParentFont = False
        Top = 196.535560000000000000
        Width = 718.110700000000000000
        DataSet = frxDB_AgendaProducaoFases
        DataSetName = 'AgendaProducaoFases'
        RowCount = 0
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          DataField = 'REMESSA'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoFases."REMESSA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 75.078850000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataField = 'DATA'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoFases."DATA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 598.299212598425000000
          Width = 37.795275590551200000
          Height = 15.118110240000000000
          DataField = 'QTDEREMESSA'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[AgendaProducaoFases."QTDEREMESSA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 637.984251968504000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'QTDERETORNO'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[AgendaProducaoFases."QTDERETORNO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 677.669291338583000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'QTDERESTANTE'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[AgendaProducaoFases."QTDERESTANTE"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 130.212740000000000000
          Width = 68.031478980000000000
          Height = 15.118120000000000000
          DataField = 'DATARETORNO'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoFases."DATARETORNO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 49.913420000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          DataField = 'ORDEMPRODUCAO'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoFases."ORDEMPRODUCAO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 201.567100000000000000
          Width = 124.724490000000000000
          Height = 15.118120000000000000
          DataField = 'FORNECEDOR_NOME'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoFases."FORNECEDOR_NOME"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 500.118430000000000000
          Width = 52.913390710000000000
          Height = 15.118110240000000000
          DataField = 'COR'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoFases."COR"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 555.551181100000000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          DataField = 'TAMANHO'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[AgendaProducaoFases."TAMANHO"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 335.008040000000000000
          Width = 45.354330710000000000
          Height = 15.118110240000000000
          DataField = 'REFERENCIA'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoFases."REFERENCIA"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 383.582677170000000000
          Width = 113.385870710000000000
          Height = 15.118110240000000000
          DataField = 'DESCRICAO'
          DataSet = frxDB_AgendaProducaoFases
          DataSetName = 'AgendaProducaoFases'
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[AgendaProducaoFases."DESCRICAO"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 60.472440940000000000
        ParentFont = False
        Top = 351.496290000000000000
        Width = 718.110700000000000000
        object Memo50: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 181.417440000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          DataField = 'SRV_EMPRESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frx_dsEmpresa."SRV_EMPRESA"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 536.693260000000000000
          Width = 181.417440000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          DataField = 'EMP_SITE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frx_dsEmpresa."EMP_SITE"]')
          ParentFont = False
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Height = 79.370095830000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.889763780000000000
          Top = 62.362204724409400000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'REMESSA:')
          ParentFont = False
          WordWrap = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 75.078850000000000000
          Top = 62.362204724409400000
          Width = 52.913420000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA ENVIO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 598.259842520000000000
          Top = 62.362204724409400000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'REMESSA:')
          ParentFont = False
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 637.944881890000000000
          Top = 62.362204724409400000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'RETORNO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 677.629921260000000000
          Top = 62.362204724409400000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'RESTANTE:')
          ParentFont = False
          WordWrap = False
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 554.590910000000000000
          Width = 162.511750000000000000
          Height = 49.133858270000000000
          Fill.BackColor = 15724527
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 566.149603860000000000
          Top = 1.889763780000000000
          Width = 57.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Emiss'#227'o:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 567.149603860000000000
          Top = 16.629921260000000000
          Width = 36.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Hora:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 567.149603860000000000
          Top = 31.748031500000000000
          Width = 50.000000000000000000
          Height = 12.094488190000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 1.889763780000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 16.629921260000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 632.299215040000000000
          Top = 31.748031500000000000
          Width = 75.590551180000000000
          Height = 12.094488190000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
          WordWrap = False
        end
        object Line1: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 77.913420000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line2: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 52.574830000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object MemoTitulo: TfrxMemoView
          AllowVectorExport = True
          Left = 1.220470000000000000
          Width = 550.464750000000000000
          Height = 49.133858270000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Georgia'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 15724527
          Memo.UTF8W = (
            'Terceirizados | Relat'#243'rios de Servi'#231'os:'
            'Agenda de Produ'#231#227'o - Fases')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 130.212740000000000000
          Top = 62.362204724409400000
          Width = 68.031478980000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA RETORNO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 49.913420000000000000
          Top = 62.362204724409400000
          Width = 22.677180000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'O.P:')
          ParentFont = False
          WordWrap = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 201.567100000000000000
          Top = 62.362204720000000000
          Width = 60.472418980000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TERCEIRIZADO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 500.118430000000000000
          Top = 62.362204724409400000
          Width = 30.236210710000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'COR:')
          ParentFont = False
          WordWrap = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 555.551181100000000000
          Top = 62.362204724409400000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TAMANHO:')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 335.008040000000000000
          Top = 62.362204724409400000
          Width = 45.354330710000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'REFER'#202'NCIA:')
          ParentFont = False
          WordWrap = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 383.582677170000000000
          Top = 62.362204724409400000
          Width = 56.692920710000000000
          Height = 15.118110240000000000
          AutoWidth = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O:')
          ParentFont = False
          WordWrap = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object SysMemo4: TfrxSysMemoView
          AllowVectorExport = True
          Left = 598.299212600000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoFases."QTDEREMESSA">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          AllowVectorExport = True
          Left = 677.669291340000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoFases."QTDERESTANTE">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          AllowVectorExport = True
          Left = 637.984251970000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoFases."QTDERETORNO">,MasterData1)]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 158.740260000000000000
        Width = 718.110700000000000000
        Condition = 'AgendaProducaoFases."FASE"'
        object Memo27: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 366.614348980000000000
          Height = 15.118120000000000000
          AutoWidth = True
          DataSet = frxDB_RemessaServicos
          DataSetName = 'RemessaServicos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            
              'FASE: [AgendaProducaoFases."FASE"]-[AgendaProducaoFases."FASE_NO' +
              'ME"]')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897640240000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Left = 598.299212600000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoFases."QTDEREMESSA">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          AllowVectorExport = True
          Left = 677.669291340000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoFases."QTDERESTANTE">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 637.984251970000000000
          Width = 37.795275590000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '###,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<AgendaProducaoFases."QTDERETORNO">,MasterData1)]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Align = baWidth
          AllowVectorExport = True
          Top = 17.338590000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
    end
  end
  object DB_AgendaProducaoFases: TFDQuery
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT * FROM VIEW_PCPFASETRANSFERENCIA'
      'ORDER BY DATA'
      '--, FASE_NOME, FORNECEDOR_NOME, COR, ORDEM_GRADE')
    Left = 464
    Top = 144
  end
  object frxDB_AgendaProducaoFases: TfrxDBDataset
    UserName = 'AgendaProducaoFases'
    CloseDataSource = False
    FieldAliases.Strings = (
      'EMPRESA=EMPRESA'
      'CODIGO=CODIGO'
      'APROVADO=APROVADO'
      'DATA=DATA'
      'REFERENCIA=REFERENCIA'
      'COR_ID=COR_ID'
      'COR=COR'
      'TAMANHO_ID=TAMANHO_ID'
      'TAMANHO=TAMANHO'
      'ORDEM_GRADE=ORDEM_GRADE'
      'QTDE_TOTAL=QTDE_TOTAL'
      'QTDE_ENVIADA=QTDE_ENVIADA'
      'QTDE_RESTANTE=QTDE_RESTANTE')
    DataSet = DB_AgendaProducaoFases
    BCDToCurrency = False
    Left = 464
    Top = 200
  end
end
