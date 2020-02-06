object BaseDados_PCP: TBaseDados_PCP
  OldCreateOrder = True
  Height = 841
  Width = 941
  object ds_cores: TDataSource
    DataSet = db_cores
    Left = 336
    Top = 352
  end
  object ds_colecao: TDataSource
    DataSet = db_colecao
    Left = 832
    Top = 352
  end
  object ds_FaixaEtaria: TDataSource
    AutoEdit = False
    DataSet = db_FaixaEtaria
    Left = 40
    Top = 216
  end
  object DS_grifes: TDataSource
    DataSet = db_grifes
    Left = 432
    Top = 352
  end
  object ds_paramcustos: TDataSource
    AutoEdit = False
    DataSet = db_paramcustos
    Left = 144
    Top = 216
  end
  object ds_maquinas: TDataSource
    DataSet = db_maquinas
    Left = 440
    Top = 224
  end
  object ds_VincMaquinas: TDataSource
    AutoEdit = False
    DataSet = db_VincMaquinas
    Left = 704
    Top = 224
  end
  object ds_Defeitos: TDataSource
    DataSet = db_Defeitos
    Left = 760
    Top = 352
  end
  object ds_qualidades: TDataSource
    DataSet = db_qualidades
    Left = 40
    Top = 352
  end
  object ds_etiquetas: TDataSource
    DataSet = db_etiquetas
    Left = 144
    Top = 352
  end
  object ds_etiquetasDetalhes: TDataSource
    DataSet = db_etiquetasDetalhes
    Left = 240
    Top = 352
  end
  object ds_VincMaquinasDetalhes: TDataSource
    DataSet = db_VincMaquinasDetalhes
    Left = 808
    Top = 224
  end
  object ds_referencias: TDataSource
    DataSet = db_referencias
    Left = 40
    Top = 40
  end
  object ds_MateriaPrima: TDataSource
    DataSet = db_MateriaPrima
    Left = 400
    Top = 48
  end
  object ds_Cores_Modelos: TDataSource
    DataSet = db_Cores_Modelos
    Left = 496
    Top = 48
  end
  object ds_pcp_processos: TDataSource
    DataSet = db_pcp_processos
    Left = 576
    Top = 48
  end
  object ds_pcp_Custos: TDataSource
    DataSet = db_pcp_Custos
    Left = 648
    Top = 48
  end
  object ds_pcp_Medidas: TDataSource
    DataSet = db_pcp_Medidas
    Left = 808
    Top = 48
  end
  object ds_VincHumano: TDataSource
    AutoEdit = False
    DataSet = db_VincHumano
    Left = 520
    Top = 224
  end
  object ds_VincHumanoDetalhes: TDataSource
    DataSet = db_VincHumanoDetalhes
    Left = 592
    Top = 224
  end
  object ds_Cad_processos: TDataSource
    DataSet = db_Cad_processos
    Left = 536
    Top = 360
  end
  object ds_Cad_Tamanhos: TDataSource
    DataSet = DB_Cad_Tamanhos
    Left = 40
    Top = 472
  end
  object ds_Grade: TDataSource
    DataSet = db_Grade
    Left = 144
    Top = 480
  end
  object ds_GradeLista: TDataSource
    DataSet = db_GradeLista
    Left = 240
    Top = 480
  end
  object ds_pcp_Maquinas: TDataSource
    DataSet = db_pcp_Maquinas
    Left = 720
    Top = 48
  end
  object db_referencias: TFDQuery
    BeforeOpen = db_referenciasBeforeOpen
    BeforePost = db_referenciasBeforePost
    AfterPost = db_referenciasAfterPost
    OnNewRecord = db_referenciasNewRecord
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_PRODUTOS'
      'WHERE'
      'EMPRESA=:EMPRESA'
      'AND'
      'CODIGO=:CODIGO'
      'AND'
      'TIPO_PRODUTO='#39'ACA'#39)
    Left = 40
    Top = 8
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object db_referenciasEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object db_referenciasCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object db_referenciasREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Required = True
      OnChange = db_referenciasREFERENCIAChange
      Size = 30
    end
    object db_referenciasGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object db_referenciasSUBGRUPO: TIntegerField
      FieldName = 'SUBGRUPO'
    end
    object db_referenciasTIPO_PRODUTO: TStringField
      FieldName = 'TIPO_PRODUTO'
      Required = True
      Size = 30
    end
    object db_referenciasDATA: TSQLTimeStampField
      FieldName = 'DATA'
      EditMask = '99/99/9999'
    end
    object db_referenciasDT_ULTIMA_COMPRA: TSQLTimeStampField
      FieldName = 'DT_ULTIMA_COMPRA'
      EditMask = '99/99/9999'
    end
    object db_referenciasDT_ULTIMA_VENDA: TSQLTimeStampField
      FieldName = 'DT_ULTIMA_VENDA'
      EditMask = '99/99/9999'
    end
    object db_referenciasDT_VALIDADE: TSQLTimeStampField
      FieldName = 'DT_VALIDADE'
      EditMask = '99/99/9999'
    end
    object db_referenciasFASE: TIntegerField
      FieldName = 'FASE'
      OnChange = db_referenciasFASEChange
    end
    object db_referenciasGRIFE: TIntegerField
      FieldName = 'GRIFE'
    end
    object db_referenciasCOLECAO: TIntegerField
      FieldName = 'COLECAO'
    end
    object db_referenciasFAIXA_ETARIA: TIntegerField
      FieldName = 'FAIXA_ETARIA'
    end
    object db_referenciasESTILISTA: TIntegerField
      FieldName = 'ESTILISTA'
    end
    object db_referenciasETIQUETA: TIntegerField
      FieldName = 'ETIQUETA'
    end
    object db_referenciasGRADE: TIntegerField
      FieldName = 'GRADE'
    end
    object db_referenciasEMBALAGEM: TIntegerField
      FieldName = 'EMBALAGEM'
    end
    object db_referenciasCOMPOSICAO: TIntegerField
      FieldName = 'COMPOSICAO'
    end
    object db_referenciasGENERO: TIntegerField
      FieldName = 'GENERO'
    end
    object db_referenciasNCM: TStringField
      FieldName = 'NCM'
      Size = 30
    end
    object db_referenciasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 200
    end
    object db_referenciasDESCRICAOREDUZIDA: TStringField
      FieldName = 'DESCRICAOREDUZIDA'
      Size = 200
    end
    object db_referenciasCLASSIFICAO_FISCAL: TStringField
      FieldName = 'CLASSIFICAO_FISCAL'
      Size = 30
    end
    object db_referenciasSITUACAO_TRIBUTARIA: TStringField
      FieldName = 'SITUACAO_TRIBUTARIA'
      Size = 30
    end
    object db_referenciasGERAR_CODBARRA: TStringField
      FieldName = 'GERAR_CODBARRA'
      Size = 10
    end
    object db_referenciasCOMPOSICAO_DESCRICAO: TStringField
      FieldName = 'COMPOSICAO_DESCRICAO'
      Size = 200
    end
    object db_referenciasCODIGO_BARRA: TStringField
      FieldName = 'CODIGO_BARRA'
      Size = 30
    end
    object db_referenciasCODIGO_FABRICANTE: TStringField
      FieldName = 'CODIGO_FABRICANTE'
      Size = 30
    end
    object db_referenciasUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 30
    end
    object db_referenciasPESO: TFloatField
      FieldName = 'PESO'
      DisplayFormat = '###,##0'
    end
    object db_referenciasPESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
      DisplayFormat = '###,##0'
    end
    object db_referenciasPESO_M2: TFloatField
      FieldName = 'PESO_M2'
      DisplayFormat = '###,##0'
    end
    object db_referenciasQTDE_TECIDOS: TFloatField
      FieldName = 'QTDE_TECIDOS'
      DisplayFormat = '###,##0'
    end
    object db_referenciasQTDE_OPCOES: TFloatField
      FieldName = 'QTDE_OPCOES'
      DisplayFormat = '###,##0'
    end
    object db_referenciasPRAZOENTREGA: TIntegerField
      FieldName = 'PRAZOENTREGA'
      DisplayFormat = '###,##0'
    end
    object db_referenciasLOTE: TStringField
      FieldName = 'LOTE'
      Size = 30
    end
    object db_referenciasNUM_SERIE: TStringField
      FieldName = 'NUM_SERIE'
      Size = 30
    end
    object db_referenciasCOMISSAO_VAREJO: TFloatField
      FieldName = 'COMISSAO_VAREJO'
    end
    object db_referenciasCOMISSAO_ATACADO: TFloatField
      FieldName = 'COMISSAO_ATACADO'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasCOMISSAO_REPRESENTANTE: TFloatField
      FieldName = 'COMISSAO_REPRESENTANTE'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasREGISTROINPI: TStringField
      FieldName = 'REGISTROINPI'
      Size = 30
    end
    object db_referenciasVOLUME: TFloatField
      FieldName = 'VOLUME'
    end
    object db_referenciasPROMOCAO: TStringField
      FieldName = 'PROMOCAO'
      Size = 10
    end
    object db_referenciasMARCA: TStringField
      FieldName = 'MARCA'
      Size = 200
    end
    object db_referenciasLOCALIZACAO: TStringField
      FieldName = 'LOCALIZACAO'
      Size = 200
    end
    object db_referenciasATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 10
    end
    object db_referenciasTOTAL_RESERVA: TFloatField
      FieldName = 'TOTAL_RESERVA'
      DisplayFormat = '###,##0.00'
    end
    object db_referenciasTOTAL_ORDEMPRODUCAO: TFloatField
      FieldName = 'TOTAL_ORDEMPRODUCAO'
      DisplayFormat = '###,##0.00'
    end
    object db_referenciasTOTAL_QTDEMATPRIMA: TFloatField
      FieldName = 'TOTAL_QTDEMATPRIMA'
      DisplayFormat = '###,##0.000'
    end
    object db_referenciasTOTAL_VLRMATPRIMA: TFloatField
      FieldName = 'TOTAL_VLRMATPRIMA'
      DisplayFormat = '###,##0.000'
    end
    object db_referenciasTOTAL_PROCESSO_TEMPO: TFloatField
      FieldName = 'TOTAL_PROCESSO_TEMPO'
      DisplayFormat = '0#:0#'
    end
    object db_referenciasTOTAL_PROCESSO_CUSTOS: TFloatField
      FieldName = 'TOTAL_PROCESSO_CUSTOS'
      DisplayFormat = '###,##0.000'
    end
    object db_referenciasTOTAL_CUSTOS_PERCENTUAL: TFloatField
      FieldName = 'TOTAL_CUSTOS_PERCENTUAL'
      DisplayFormat = '###,##0.000'
    end
    object db_referenciasTOTAL_CUSTOS_VALOR: TFloatField
      FieldName = 'TOTAL_CUSTOS_VALOR'
      DisplayFormat = '###,##0.000'
    end
    object db_referenciasSALDO_IMPLANTACAO: TFloatField
      FieldName = 'SALDO_IMPLANTACAO'
      DisplayFormat = '###,##0.00'
    end
    object db_referenciasESTOQUEMINIMO: TFloatField
      FieldName = 'ESTOQUEMINIMO'
      DisplayFormat = '###,##0.00'
    end
    object db_referenciasESTOQUEMAXIMO: TFloatField
      FieldName = 'ESTOQUEMAXIMO'
      DisplayFormat = '###,##0.00'
    end
    object db_referenciasESTOQUESALDO: TFloatField
      FieldName = 'ESTOQUESALDO'
      DisplayFormat = '###,##0.00'
    end
    object db_referenciasMG_LUCRO: TFloatField
      FieldName = 'MG_LUCRO'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasIPI: TFloatField
      FieldName = 'IPI'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasICMS: TFloatField
      FieldName = 'ICMS'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasPIS: TFloatField
      FieldName = 'PIS'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasCOFINS: TFloatField
      FieldName = 'COFINS'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasPUBLICIDADE: TFloatField
      FieldName = 'PUBLICIDADE'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasINADIMPLENCIA: TFloatField
      FieldName = 'INADIMPLENCIA'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasADMINISTRATIVO: TFloatField
      FieldName = 'ADMINISTRATIVO'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasIMPORTACAO: TFloatField
      FieldName = 'IMPORTACAO'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasPERC_FRETE: TFloatField
      FieldName = 'PERC_FRETE'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasFINANCEIRO: TFloatField
      FieldName = 'FINANCEIRO'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasIMPOSTOS_OUTROS: TFloatField
      FieldName = 'IMPOSTOS_OUTROS'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasMARKUP: TFloatField
      FieldName = 'MARKUP'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasIR: TFloatField
      FieldName = 'IR'
      DisplayFormat = '###,##0.00%'
    end
    object db_referenciasPRC_CUSTOBRUTO: TFloatField
      FieldName = 'PRC_CUSTOBRUTO'
      DisplayFormat = '###,##0.000'
    end
    object db_referenciasPRC_CUSTO: TFloatField
      FieldName = 'PRC_CUSTO'
      DisplayFormat = '###,##0.000'
    end
    object db_referenciasPRC_VENDA: TFloatField
      FieldName = 'PRC_VENDA'
      DisplayFormat = '###,##0.00'
    end
    object db_referenciasLUCRO_LIQUIDO: TFloatField
      FieldName = 'LUCRO_LIQUIDO'
      DisplayFormat = '###,##0.00'
    end
    object db_referenciasDETALHES: TStringField
      FieldName = 'DETALHES'
      Size = 5000
    end
    object db_referenciasPRODUCAO_TEMPO: TFloatField
      FieldName = 'PRODUCAO_TEMPO'
      DisplayFormat = '0#:0#'
    end
    object db_referenciasPRODUCAO_CUSTOS: TFloatField
      FieldName = 'PRODUCAO_CUSTOS'
      DisplayFormat = '###,##0.000'
    end
    object db_referenciasCOR: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object db_referenciasTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 30
    end
    object db_referenciasFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
    end
    object db_referenciasOZ: TFloatField
      FieldName = 'OZ'
    end
    object db_referenciasPRC_CUSTOPRODUCAO: TFloatField
      FieldName = 'PRC_CUSTOPRODUCAO'
    end
    object db_referenciasREFERENCIAREDUZIDA: TStringField
      FieldName = 'REFERENCIAREDUZIDA'
      Size = 30
    end
    object db_referenciasMARKUPID: TIntegerField
      FieldName = 'MARKUPID'
    end
    object db_referenciasHORAS: TTimeField
      FieldName = 'HORAS'
    end
    object db_referenciasINSTRUCOES: TStringField
      FieldName = 'INSTRUCOES'
      Origin = 'INSTRUCOES'
      Size = 5000
    end
  end
  object db_MateriaPrima: TFDQuery
    BeforePost = db_MateriaPrimaBeforePost
    AfterPost = db_MateriaPrimaAfterPost
    OnCalcFields = db_MateriaPrimaCalcFields
    MasterSource = ds_referencias
    MasterFields = 'EMPRESA;CODIGO'
    DetailFields = 'EMPRESA;CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT  *  FROM  PCP_MATERIAPRIMA'
      'WHERE'
      'EMPRESA=:EMPRESA'
      'AND'
      'CODIGO=:CODIGO')
    Left = 400
    Top = 16
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object db_MateriaPrimaEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object db_MateriaPrimaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object db_MateriaPrimaREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      OnChange = db_MateriaPrimaREFERENCIAChange
      Size = 30
    end
    object db_MateriaPrimaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object db_MateriaPrimaUND: TStringField
      FieldName = 'UND'
      Size = 30
    end
    object db_MateriaPrimaQTDE: TFloatField
      FieldName = 'QTDE'
      OnChange = db_MateriaPrimaQTDEChange
      EditFormat = '#'
    end
    object db_MateriaPrimaVLR_UNIT: TFloatField
      FieldName = 'VLR_UNIT'
      DisplayFormat = '###,##0.00'
    end
    object db_MateriaPrimaVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '###,##0.00'
    end
    object db_MateriaPrimaCOMPOSICAO: TIntegerField
      FieldName = 'COMPOSICAO'
    end
    object db_MateriaPrimaCOMPOSICAO_DESCRICAO: TStringField
      FieldName = 'COMPOSICAO_DESCRICAO'
      Size = 200
    end
    object db_MateriaPrimaDIMENSIONAMENTO: TStringField
      FieldName = 'DIMENSIONAMENTO'
      Size = 200
    end
    object db_MateriaPrimaCOR: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object db_MateriaPrimaTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 30
    end
  end
  object db_Cores_Modelos: TFDQuery
    BeforePost = db_Cores_ModelosBeforePost
    MasterSource = ds_referencias
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT  *  FROM  PCP_CORES'
      'WHERE'
      'CODIGO=:CODIGO')
    Left = 496
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object db_Cores_ModelosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object db_Cores_ModelosID_COR: TIntegerField
      FieldName = 'ID_COR'
      OnChange = db_Cores_ModelosID_CORChange
    end
    object db_Cores_ModelosNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_Cores_ModelosCOR: TStringField
      FieldName = 'COR'
      Size = 30
    end
  end
  object db_pcp_processos: TFDQuery
    BeforePost = db_pcp_processosBeforePost
    MasterSource = ds_referencias
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT  *  FROM  PCP_PROCESSOS'
      'WHERE'
      'CODIGO=:CODIGO')
    Left = 576
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object db_pcp_processosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object db_pcp_processosID_PROCESSO: TIntegerField
      FieldName = 'ID_PROCESSO'
      Required = True
      OnChange = db_pcp_processosID_PROCESSOChange
    end
    object db_pcp_processosNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_pcp_processosTEMPO: TFloatField
      FieldName = 'TEMPO'
      Origin = 'TEMPO'
      DisplayFormat = '0#:0#'
    end
    object db_pcp_processosCUSTOS: TFloatField
      FieldName = 'CUSTOS'
      Origin = 'CUSTOS'
      DisplayFormat = '###,##0.00'
    end
    object db_pcp_processosINSTRUCOES: TStringField
      FieldName = 'INSTRUCOES'
      Origin = 'INSTRUCOES'
      Size = 5000
    end
  end
  object db_pcp_Custos: TFDQuery
    BeforePost = db_pcp_CustosBeforePost
    AfterPost = db_pcp_CustosAfterPost
    MasterSource = ds_referencias
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT  *  FROM  PCP_CUSTOS'
      'WHERE'
      'CODIGO=:CODIGO')
    Left = 648
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object db_pcp_CustosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object db_pcp_CustosCODIGOCUSTO: TIntegerField
      FieldName = 'CODIGOCUSTO'
      OnChange = db_pcp_CustosCODIGOCUSTOChange
    end
    object db_pcp_CustosNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_pcp_CustosVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '###,##0.000'
      EditFormat = '###,##0.000'
    end
  end
  object db_pcp_Medidas: TFDQuery
    BeforePost = db_pcp_MedidasBeforePost
    AfterPost = db_pcp_MedidasAfterPost
    MasterSource = ds_referencias
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT  *  FROM  PCP_MEDIDAS'
      'WHERE'
      ''
      'CODIGO=:CODIGO')
    Left = 808
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object db_pcp_MedidasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object db_pcp_MedidasIDNOME: TIntegerField
      FieldName = 'IDNOME'
    end
    object db_pcp_MedidasNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_pcp_MedidasIDMOLDE: TStringField
      FieldName = 'IDMOLDE'
      Size = 30
    end
    object db_pcp_MedidasMEDIDA: TFloatField
      FieldName = 'MEDIDA'
      DisplayFormat = '###,##0.00'
    end
  end
  object db_FaixaEtaria: TFDQuery
    BeforePost = db_FaixaEtariaBeforePost
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_FAIXAETARIA')
    Left = 40
    Top = 184
  end
  object db_paramcustos: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_PARAMCUSTOS')
    Left = 144
    Top = 192
  end
  object db_pcp_Maquinas: TFDQuery
    BeforePost = db_pcp_MaquinasBeforePost
    MasterSource = ds_referencias
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * FROM PCP_MAQUINAS'
      'WHERE'
      ''
      'CODIGO=:CODIGO')
    Left = 720
    Top = 16
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object db_pcp_MaquinasCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object db_pcp_MaquinasID_MAQUINA: TIntegerField
      FieldName = 'ID_MAQUINA'
      OnChange = db_pcp_MaquinasID_MAQUINAChange
    end
    object db_pcp_MaquinasNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_pcp_MaquinasAGULHAS: TIntegerField
      FieldName = 'AGULHAS'
    end
    object db_pcp_MaquinasFIOS: TIntegerField
      FieldName = 'FIOS'
    end
  end
  object db_VincHumano: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_PROCESSO_OPERADOR')
    Left = 520
    Top = 192
    object db_VincHumanoCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      Required = True
    end
    object db_VincHumanoFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
    end
  end
  object db_VincHumanoDetalhes: TFDQuery
    BeforePost = db_VincHumanoDetalhesBeforePost
    MasterSource = ds_VincHumano
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * FROM CAD_PROCESSO_OPERADOR_DETALHE'
      'WHERE'
      ''
      'CODIGO=:CODIGO')
    Left = 592
    Top = 192
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object db_VincHumanoDetalhesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object db_VincHumanoDetalhesMAQUINA: TIntegerField
      FieldName = 'MAQUINA'
      Required = True
      OnChange = db_VincHumanoDetalhesMAQUINAChange
    end
    object db_VincHumanoDetalhesNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_VincHumanoDetalhesNomeMaquina: TStringField
      FieldKind = fkLookup
      FieldName = 'NomeMaquina'
      LookupDataSet = db_maquinas
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'NOME'
      KeyFields = 'MAQUINA'
      Size = 200
      Lookup = True
    end
  end
  object db_VincMaquinas: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM  CAD_PROCESSO_MAQUINA')
    Left = 704
    Top = 192
    object db_VincMaquinasCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      ReadOnly = True
      Required = True
    end
    object db_VincMaquinasMAQUINA: TIntegerField
      FieldName = 'MAQUINA'
      Required = True
    end
  end
  object db_VincMaquinasDetalhes: TFDQuery
    BeforePost = db_VincMaquinasDetalhesBeforePost
    MasterSource = ds_VincMaquinas
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * FROM  CAD_PROCESSO_MAQUINA_DETALHE'
      'WHERE'
      'CODIGO=:CODIGO')
    Left = 808
    Top = 192
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object db_VincMaquinasDetalhesCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object db_VincMaquinasDetalhesMAQUINA: TIntegerField
      FieldName = 'MAQUINA'
      Required = True
    end
    object db_VincMaquinasDetalhesPROCESSO: TIntegerField
      FieldName = 'PROCESSO'
      Required = True
      OnChange = db_VincMaquinasDetalhesPROCESSOChange
    end
    object db_VincMaquinasDetalhesNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_VincMaquinasDetalhesTEMPO: TFloatField
      FieldName = 'TEMPO'
      DisplayFormat = '0#:0#'
    end
  end
  object db_qualidades: TFDQuery
    OnNewRecord = db_qualidadesNewRecord
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_QUALIDADES')
    Left = 40
    Top = 320
  end
  object db_etiquetas: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_ETIQUETAS')
    Left = 144
    Top = 320
  end
  object db_etiquetasDetalhes: TFDQuery
    BeforePost = db_etiquetasDetalhesBeforePost
    MasterSource = ds_etiquetas
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * FROM CAD_ETIQUETASDET'
      'WHERE'
      ''
      'CODIGO=:CODIGO')
    Left = 240
    Top = 320
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftAutoInc
        ParamType = ptInput
        Size = 4
        Value = 1
      end>
  end
  object db_etiquetasSum: TFDQuery
    MasterSource = ds_etiquetas
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT CODIGO, SUM(PERCENTUAL) as PERCENTUAL from CAD_ETIQUETASD' +
        'ET'
      'WHERE'
      ''
      'CODIGO=:CODIGO'
      'GROUP BY CODIGO')
    Left = 240
    Top = 392
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftAutoInc
        ParamType = ptInput
        Size = 4
        Value = 1
      end>
  end
  object db_cores: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_CORES')
    Left = 336
    Top = 320
  end
  object db_grifes: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_GRIFES')
    Left = 432
    Top = 320
  end
  object db_Cad_processos: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_PROCESSOS')
    Left = 536
    Top = 328
    object db_Cad_processosCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object db_Cad_processosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 200
    end
    object db_Cad_processosCUSTO: TFloatField
      FieldName = 'CUSTO'
      DisplayFormat = '###,##0.000'
    end
    object db_Cad_processosINSTRUCOES: TStringField
      FieldName = 'INSTRUCOES'
      Size = 5000
    end
    object db_Cad_processosTEMPO: TFloatField
      FieldName = 'TEMPO'
      Origin = 'TEMPO'
      DisplayFormat = '0#:0#'
    end
  end
  object DB_Cad_Tamanhos: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_TAMANHOS')
    Left = 40
    Top = 440
    object DB_Cad_TamanhosCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object DB_Cad_TamanhosTAMANHO: TStringField
      FieldName = 'TAMANHO'
      OnChange = DB_Cad_TamanhosTAMANHOChange
      Size = 30
    end
    object DB_Cad_TamanhosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object DB_Cad_TamanhosSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
  end
  object db_Grade: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_GRADE')
    Left = 144
    Top = 440
    object db_GradeCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object db_GradeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object db_GradeSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
  end
  object db_GradeLista: TFDQuery
    BeforePost = db_GradeListaBeforePost
    MasterSource = ds_Grade
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * FROM CAD_GRADELISTA'
      'WHERE'
      'CODIGO=:CODIGO')
    Left = 240
    Top = 448
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = 1
      end>
    object db_GradeListaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object db_GradeListaID_TAMANHO: TIntegerField
      FieldName = 'ID_TAMANHO'
    end
    object db_GradeListaORDEM: TStringField
      FieldName = 'ORDEM'
      Size = 30
    end
    object db_GradeListaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object db_GradeListaTAMANHO: TStringField
      FieldName = 'TAMANHO'
      OnChange = db_GradeListaTAMANHOChange
      Size = 30
    end
    object db_GradeListaNometamanho: TStringField
      FieldKind = fkLookup
      FieldName = 'Nometamanho'
      LookupDataSet = DB_Cad_Tamanhos
      LookupKeyFields = 'TAMANHO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'TAMANHO'
      Size = 100
      Lookup = True
    end
  end
  object db_GradeListaMax: TFDQuery
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT MAX(ORDEM) AS ORDEM FROM CAD_GRADELISTA'
      'WHERE'
      ''
      'CODIGO=:CODIGO')
    Left = 240
    Top = 545
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object db_GradeListaMaxORDEM: TStringField
      FieldName = 'ORDEM'
      ReadOnly = True
      Size = 30
    end
  end
  object db_Defeitos: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_DEFEITOS')
    Left = 760
    Top = 320
  end
  object db_OrdemProducao: TFDQuery
    BeforeOpen = db_OrdemProducaoBeforeOpen
    BeforePost = db_OrdemProducaoBeforePost
    OnNewRecord = db_OrdemProducaoNewRecord
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM PCP_ORDEMPRODUCAO'
      'WHERE'
      'EMPRESA=:EMPRESA'
      'AND'
      'CODIGO=:CODIGO'
      'ORDER BY EMPRESA DESC, DATA DESC, CODIGO DESC')
    Left = 520
    Top = 448
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object db_OrdemProducaoEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Required = True
    end
    object db_OrdemProducaoCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      ReadOnly = True
      Required = True
    end
    object db_OrdemProducaoLOTE: TIntegerField
      FieldName = 'LOTE'
      OnChange = db_OrdemProducaoLOTEChange
    end
    object db_OrdemProducaoLOTENOME: TStringField
      FieldName = 'LOTENOME'
      Size = 200
    end
    object db_OrdemProducaoAPROVADO: TStringField
      FieldName = 'APROVADO'
      Required = True
      Size = 10
    end
    object db_OrdemProducaoDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
      EditMask = '99/99/9999'
    end
    object db_OrdemProducaoDATAPREVISAO: TSQLTimeStampField
      FieldName = 'DATAPREVISAO'
    end
    object db_OrdemProducaoDATAFECHAMENTO: TSQLTimeStampField
      FieldName = 'DATAFECHAMENTO'
      EditMask = '99/99/9999'
    end
    object db_OrdemProducaoENCERRADO: TStringField
      FieldName = 'ENCERRADO'
      Size = 10
    end
    object db_OrdemProducaoNATUREZA: TStringField
      FieldName = 'NATUREZA'
      Size = 30
    end
    object db_OrdemProducaoQTDE_TOTAL: TIntegerField
      FieldName = 'QTDE_TOTAL'
      DisplayFormat = '###,##0'
    end
    object db_OrdemProducaoQTDE_PRODUZIDA: TIntegerField
      FieldName = 'QTDE_PRODUZIDA'
      DisplayFormat = '###,##0'
    end
    object db_OrdemProducaoQTDE_RESTANTE: TIntegerField
      FieldName = 'QTDE_RESTANTE'
      DisplayFormat = '###,##0'
    end
    object db_OrdemProducaoQTDE_PERDAS: TIntegerField
      FieldName = 'QTDE_PERDAS'
      DisplayFormat = '###,##0'
    end
    object db_OrdemProducaoQTDE_DEFEITOS: TIntegerField
      FieldName = 'QTDE_DEFEITOS'
      DisplayFormat = '###,##0'
    end
    object db_OrdemProducaoPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = '###,##0%'
    end
    object db_OrdemProducaoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 5000
    end
    object db_OrdemProducaoTEMPO_PRODUCAO: TFloatField
      FieldName = 'TEMPO_PRODUCAO'
      Origin = 'TEMPO_PRODUCAO'
      DisplayFormat = '000#:0#'
    end
  end
  object ds_OrdemProducao: TDataSource
    DataSet = db_OrdemProducao
    Left = 520
    Top = 480
  end
  object db_OrdemProducaoItens: TFDQuery
    BeforePost = db_OrdemProducaoItensBeforePost
    MasterSource = ds_OrdemProducao
    MasterFields = 'EMPRESA;CODIGO'
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT * FROM PCP_ORDEMPRODUCAO_ITENS'
      'WHERE'
      'EMPRESA=:EMPRESA'
      'AND'
      'CODIGO=:CODIGO')
    Left = 632
    Top = 448
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object db_OrdemProducaoItensEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Required = True
    end
    object db_OrdemProducaoItensCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object db_OrdemProducaoItensAPROVADO: TStringField
      FieldName = 'APROVADO'
      Required = True
      Size = 10
    end
    object db_OrdemProducaoItensDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
      EditMask = '99/99/9999'
    end
    object db_OrdemProducaoItensREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Required = True
      OnChange = db_OrdemProducaoItensREFERENCIAChange
      Size = 30
    end
    object db_OrdemProducaoItensDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object db_OrdemProducaoItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,##0'
    end
    object db_OrdemProducaoItensQTDEPRODUZIDA: TIntegerField
      FieldName = 'QTDEPRODUZIDA'
      DisplayFormat = '###,##0'
    end
    object db_OrdemProducaoItensTEMPOPRODUCAO: TFloatField
      FieldName = 'TEMPOPRODUCAO'
    end
  end
  object ds_OrdemProducaoItens: TDataSource
    DataSet = db_OrdemProducaoItens
    Left = 632
    Top = 480
  end
  object db_MateriaPrimaTecidos: TFDQuery
    BeforePost = db_MateriaPrimaTecidosBeforePost
    AfterPost = db_MateriaPrimaTecidosAfterPost
    OnCalcFields = db_MateriaPrimaTecidosCalcFields
    MasterSource = ds_referencias
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT  *  FROM  PCP_MATERIAPRIMA_TECIDOS'
      'WHERE'
      ''
      'CODIGO=:CODIGO'
      '')
    Left = 200
    Top = 8
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object db_MateriaPrimaTecidosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object db_MateriaPrimaTecidosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object db_MateriaPrimaTecidosREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      OnChange = db_MateriaPrimaTecidosREFERENCIAChange
      Size = 30
    end
    object db_MateriaPrimaTecidosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object db_MateriaPrimaTecidosUND: TStringField
      FieldName = 'UND'
      Size = 30
    end
    object db_MateriaPrimaTecidosQTDE_METROS: TFloatField
      FieldName = 'QTDE_METROS'
      OnChange = db_MateriaPrimaTecidosQTDE_METROSChange
    end
    object db_MateriaPrimaTecidosVLR_UNIT: TFloatField
      FieldName = 'VLR_UNIT'
      DisplayFormat = '###,##0.00'
    end
    object db_MateriaPrimaTecidosVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
      DisplayFormat = '###,##0.00'
    end
    object db_MateriaPrimaTecidosCOMPOSICAO: TIntegerField
      FieldName = 'COMPOSICAO'
    end
    object db_MateriaPrimaTecidosCOMPOSICAO_DESCRICAO: TStringField
      FieldName = 'COMPOSICAO_DESCRICAO'
      Size = 200
    end
    object db_MateriaPrimaTecidosDIMENSIONAMENTO: TStringField
      FieldName = 'DIMENSIONAMENTO'
      Size = 200
    end
    object db_MateriaPrimaTecidosCOR: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object db_MateriaPrimaTecidosTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 30
    end
  end
  object ds_MateriaPrimaTecidos: TDataSource
    DataSet = db_MateriaPrimaTecidos
    Left = 200
    Top = 40
  end
  object db_maquinas: TFDQuery
    OnNewRecord = db_maquinasNewRecord
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_MAQUINAS')
    Left = 440
    Top = 192
    object db_maquinasCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object db_maquinasNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_maquinasN_SERIE: TStringField
      FieldName = 'N_SERIE'
      Size = 200
    end
    object db_maquinasNRO_AGULHAS: TIntegerField
      FieldName = 'NRO_AGULHAS'
    end
    object db_maquinasNRO_FIOS: TIntegerField
      FieldName = 'NRO_FIOS'
    end
    object db_maquinasOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 5000
    end
    object db_maquinasSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
  end
  object ds_pcp_MedidasPosLavagem: TDataSource
    DataSet = db_pcp_MedidasPosLavagem
    Left = 808
    Top = 136
  end
  object db_pcp_MedidasPosLavagem: TFDQuery
    BeforePost = db_pcp_MedidasPosLavagemBeforePost
    AfterPost = db_pcp_MedidasPosLavagemAfterPost
    MasterSource = ds_referencias
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT  *  FROM  PCP_MEDIDAS_APOS_LAVAR'
      'WHERE'
      ''
      'CODIGO=:CODIGO')
    Left = 808
    Top = 104
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object db_pcp_MedidasPosLavagemCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object db_pcp_MedidasPosLavagemIDNOME: TIntegerField
      FieldName = 'IDNOME'
    end
    object db_pcp_MedidasPosLavagemNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_pcp_MedidasPosLavagemIDMOLDE: TStringField
      FieldName = 'IDMOLDE'
      Size = 30
    end
    object db_pcp_MedidasPosLavagemMEDIDA: TFloatField
      FieldName = 'MEDIDA'
      DisplayFormat = '###,##0.00'
    end
  end
  object ds_referencia_Fotos: TDataSource
    DataSet = db_referencia_Fotos
    Left = 104
    Top = 40
  end
  object db_referencia_Fotos: TFDQuery
    BeforePost = db_referencia_FotosBeforePost
    MasterSource = ds_referencias
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT  *  FROM   CAD_PRODUTOS_FOTOS'
      'WHERE'
      'CODIGO=:CODIGO')
    Left = 104
    Top = 8
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
  end
  object ACBrExtenso1: TACBrExtenso
    StrMoeda = ' '
    StrMoedas = ' '
    StrCentavo = ' '
    StrCentavos = ' '
    ZeroAEsquerda = False
    Left = 48
    Top = 112
  end
  object db_fases: TFDQuery
    OnNewRecord = db_fasesNewRecord
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_FASES')
    Left = 232
    Top = 192
  end
  object ds_fases: TDataSource
    AutoEdit = False
    DataSet = db_fases
    Left = 232
    Top = 216
  end
  object db_Cad_processosdGrade: TFDQuery
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_PROCESSOSGRADE')
    Left = 616
    Top = 328
    object db_Cad_processosdGradeCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      ReadOnly = True
    end
    object db_Cad_processosdGradeNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_Cad_processosdGradeCUSTO_TOTAL: TFloatField
      FieldName = 'CUSTO_TOTAL'
    end
    object db_Cad_processosdGradeTEMPO_TOTAL: TFloatField
      FieldName = 'TEMPO_TOTAL'
      DisplayFormat = '0#:0#'
    end
  end
  object db_Cad_processosdLista: TFDQuery
    BeforePost = db_Cad_processosdListaBeforePost
    AfterPost = db_Cad_processosdListaAfterPost
    MasterSource = ds_Cad_processosdGrade
    MasterFields = 'CODIGO'
    DetailFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT * FROM  CAD_PROCESSOSLISTA'
      'WHERE'
      'CODIGO=:CODIGO')
    Left = 688
    Top = 328
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end>
    object db_Cad_processosdListaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object db_Cad_processosdListaPROCESSO: TIntegerField
      FieldName = 'PROCESSO'
      Required = True
      OnChange = db_Cad_processosdListaPROCESSOChange
    end
    object db_Cad_processosdListaNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_Cad_processosdListaCUSTO: TFloatField
      FieldName = 'CUSTO'
      DisplayFormat = '###,##0.000'
    end
    object db_Cad_processosdListaTEMPO: TFloatField
      FieldName = 'TEMPO'
      DisplayFormat = '0#:0#'
    end
  end
  object ds_Cad_processosdGrade: TDataSource
    DataSet = db_Cad_processosdGrade
    Left = 616
    Top = 360
  end
  object ds_Cad_processosdLista: TDataSource
    DataSet = db_Cad_processosdLista
    Left = 688
    Top = 360
  end
  object db_Cad_processosdListaSum: TFDQuery
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT'
      'SUM(TEMPO) AS TEMPO,'
      'SUM(CUSTO) AS CUSTO'
      'FROM  CAD_PROCESSOSLISTA'
      'WHERE'
      'CODIGO=:CODIGO')
    Left = 760
    Top = 408
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object ds_MateriaPrimaGrade: TDataSource
    DataSet = db_MateriaPrimaGrade
    Left = 400
    Top = 128
  end
  object db_MateriaPrimaGrade: TFDQuery
    BeforePost = db_MateriaPrimaGradeBeforePost
    AfterPost = db_MateriaPrimaGradeAfterPost
    MasterSource = ds_MateriaPrima
    MasterFields = 'EMPRESA;CODIGO;REFERENCIA'
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT  *  FROM  PCP_MATERIAPRIMA_GRADE'
      'WHERE'
      'EMPRESA=:EMPRESA'
      'AND'
      'CODIGO=:CODIGO'
      'AND'
      'REFERENCIA=:REFERENCIA')
    Left = 400
    Top = 96
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        ParamType = ptInput
      end>
    object db_MateriaPrimaGradeEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Required = True
    end
    object db_MateriaPrimaGradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object db_MateriaPrimaGradeREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Required = True
      Size = 30
    end
    object db_MateriaPrimaGradeCOR_ID: TIntegerField
      FieldName = 'COR_ID'
    end
    object db_MateriaPrimaGradeCOR: TStringField
      FieldName = 'COR'
      Size = 30
    end
    object db_MateriaPrimaGradeTAMANHO_ID: TIntegerField
      FieldName = 'TAMANHO_ID'
    end
    object db_MateriaPrimaGradeTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 30
    end
    object db_MateriaPrimaGradeORDEM_GRADE: TStringField
      FieldName = 'ORDEM_GRADE'
      Size = 30
    end
    object db_MateriaPrimaGradeTAMANHOPADRAO: TStringField
      FieldName = 'TAMANHOPADRAO'
      OnChange = db_MateriaPrimaGradeTAMANHOPADRAOChange
      Size = 30
    end
    object db_MateriaPrimaGradeQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object db_MateriaPrimaGradePADRAOCORID: TIntegerField
      FieldName = 'PADRAOCORID'
    end
    object db_MateriaPrimaGradePADRAOCORNOME: TStringField
      FieldName = 'PADRAOCORNOME'
      Size = 200
    end
  end
  object db_MateriaPrimaTamanhos: TFDQuery
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT '
      
        'DISTINCT  COR_CODIGO, COR, TAMANHO_CODIGO, TAMANHO, TAMANHO_ORDE' +
        'M  '
      ''
      'FROM VIEW_GRADEREFERENCIA'
      'WHERE'
      'CODIGO=:CODIGO'
      'AND'
      'REFERENCIA=:REFERENCIA'
      'ORDER BY COR, TAMANHO_ORDEM')
    Left = 496
    Top = 104
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object db_FasesGrade: TFDQuery
    OnNewRecord = db_FasesGradeNewRecord
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT * FROM CAD_FASESGRADE')
    Left = 288
    Top = 192
    object db_FasesGradeCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      ReadOnly = True
      Required = True
    end
    object db_FasesGradeNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 200
    end
    object db_FasesGradeIMPRIMEOP: TStringField
      FieldName = 'IMPRIMEOP'
      Size = 10
    end
  end
  object ds_FasesGrade: TDataSource
    AutoEdit = False
    DataSet = db_FasesGrade
    Left = 288
    Top = 216
  end
  object db_FasesGradeLista: TFDQuery
    BeforePost = db_FasesGradeListaBeforePost
    OnNewRecord = db_FasesGradeListaNewRecord
    MasterSource = ds_FasesGrade
    MasterFields = 'CODIGO'
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT * FROM CAD_FASESGRADE_LISTA'
      'WHERE'
      'CODIGO=:CODIGO'
      'ORDER BY ORDEM')
    Left = 360
    Top = 192
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object db_FasesGradeListaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object db_FasesGradeListaFASE: TIntegerField
      FieldName = 'FASE'
      Required = True
      OnChange = db_FasesGradeListaFASEChange
    end
    object db_FasesGradeListaORDEM: TStringField
      FieldName = 'ORDEM'
      Size = 30
    end
    object db_FasesGradeListaNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_FasesGradeListaIMPRIMEOP: TStringField
      FieldName = 'IMPRIMEOP'
      Size = 10
    end
  end
  object ds_FasesGradeLista: TDataSource
    DataSet = db_FasesGradeLista
    Left = 360
    Top = 216
  end
  object ds_LoteProducao: TDataSource
    DataSet = db_LoteProducao
    Left = 760
    Top = 520
  end
  object db_LoteProducao: TFDQuery
    OnNewRecord = db_LoteProducaoNewRecord
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_LOTEPRODUCAO')
    Left = 760
    Top = 488
    object db_LoteProducaoCODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CODIGO'
      ReadOnly = True
      Required = True
    end
    object db_LoteProducaoNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object db_LoteProducaoSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
  end
  object ds_MateriaPrimaTecidosGrade: TDataSource
    DataSet = db_MateriaPrimaTecidosGrade
    Left = 200
    Top = 120
  end
  object db_MateriaPrimaTecidosGrade: TFDQuery
    BeforePost = db_MateriaPrimaTecidosGradeBeforePost
    AfterPost = db_MateriaPrimaTecidosGradeAfterPost
    MasterSource = ds_MateriaPrimaTecidos
    MasterFields = 'EMPRESA;CODIGO;REFERENCIA'
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      'SELECT  *  FROM  PCP_MATERIAPRIMA_TECIDOSGRADE'
      'WHERE'
      'EMPRESA=:EMPRESA'
      'AND'
      'CODIGO=:CODIGO'
      'AND'
      'REFERENCIA=:REFERENCIA'
      'ORDER BY REFERENCIA_COR_NOME')
    Left = 200
    Top = 88
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        ParamType = ptInput
      end>
    object db_MateriaPrimaTecidosGradeEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object db_MateriaPrimaTecidosGradeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object db_MateriaPrimaTecidosGradeREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Required = True
      Size = 30
    end
    object db_MateriaPrimaTecidosGradeREFERENCIA_COR_ID: TIntegerField
      FieldName = 'REFERENCIA_COR_ID'
    end
    object db_MateriaPrimaTecidosGradeREFERENCIA_COR_NOME: TStringField
      FieldName = 'REFERENCIA_COR_NOME'
      Size = 30
    end
    object db_MateriaPrimaTecidosGradeCOR_ID: TIntegerField
      FieldName = 'COR_ID'
      OnChange = db_MateriaPrimaTecidosGradeCOR_IDChange
    end
    object db_MateriaPrimaTecidosGradeCOR_NOME: TStringField
      FieldName = 'COR_NOME'
      Size = 30
    end
    object db_MateriaPrimaTecidosGradeQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object db_MateriaPrimaTecidosGradeREFERENCIA_TAMANHO_ID: TIntegerField
      FieldName = 'REFERENCIA_TAMANHO_ID'
    end
    object db_MateriaPrimaTecidosGradeREFERENCIA_TAMANHO: TStringField
      FieldName = 'REFERENCIA_TAMANHO'
      Size = 200
    end
    object db_MateriaPrimaTecidosGradeTAMANHO_ID: TIntegerField
      FieldName = 'TAMANHO_ID'
    end
    object db_MateriaPrimaTecidosGradeTAMANHO: TStringField
      FieldName = 'TAMANHO'
      Size = 200
    end
    object db_MateriaPrimaTecidosGradeORDEM_GRADE: TStringField
      FieldName = 'ORDEM_GRADE'
      Size = 30
    end
  end
  object db_MateriaPrimaTamanhosTecidos: TFDQuery
    Connection = FrmPrincipal.DBConexao
    SQL.Strings = (
      
        'SELECT DISTINCT  COR_CODIGO, COR, TAMANHO_CODIGO, TAMANHO, TAMAN' +
        'HO_ORDEM  FROM VIEW_GRADEREFERENCIA'
      'WHERE'
      'CODIGO=:CODIGO'
      'AND'
      'REFERENCIA=:REFERENCIA'
      'ORDER BY COR_CODIGO, COR, TAMANHO_ORDEM')
    Left = 240
    Top = 8
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object db_MateriaPrimaTecidosGradeSomar: TFDQuery
    MasterSource = ds_MateriaPrimaTecidos
    MasterFields = 'EMPRESA;CODIGO;REFERENCIA'
    Connection = FrmPrincipal.DBConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT  SUM(QUANTIDADE) AS QUANTIDADE FROM  PCP_MATERIAPRIMA_TEC' +
        'IDOSGRADE'
      'WHERE'
      'EMPRESA=:EMPRESA'
      'AND'
      'CODIGO=:CODIGO'
      'AND'
      'REFERENCIA=:REFERENCIA')
    Left = 160
    Top = 8
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Size = 4
        Value = Null
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 31
        Value = Null
      end>
  end
  object db_colecao: TFDQuery
    OnNewRecord = db_colecaoNewRecord
    Connection = FrmPrincipal.DBConexao
    UpdateOptions.AutoIncFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM CAD_COLECAO')
    Left = 832
    Top = 320
    object db_colecaoCODIGO: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object db_colecaoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object db_colecaoDTCRIACAO: TSQLTimeStampField
      FieldName = 'DTCRIACAO'
      Origin = 'DTCRIACAO'
      EditMask = '99/99/9999'
    end
    object db_colecaoDTLANCAMENTO: TSQLTimeStampField
      FieldName = 'DTLANCAMENTO'
      Origin = 'DTLANCAMENTO'
      EditMask = '99/99/9999'
    end
    object db_colecaoDTCICLOINICIAL: TSQLTimeStampField
      FieldName = 'DTCICLOINICIAL'
      Origin = 'DTCICLOINICIAL'
      EditMask = '99/99/9999'
    end
    object db_colecaoDTCICLOFINAL: TSQLTimeStampField
      FieldName = 'DTCICLOFINAL'
      Origin = 'DTCICLOFINAL'
      EditMask = '99/99/9999'
    end
    object db_colecaoMETA_QTDE: TIntegerField
      FieldName = 'META_QTDE'
      Origin = 'META_QTDE'
      DisplayFormat = '###,##0'
    end
    object db_colecaoMETA_VENDER: TFloatField
      FieldName = 'META_VENDER'
      Origin = 'META_VENDER'
      DisplayFormat = '###,##0.00'
    end
    object db_colecaoVIABILIDADEMINIMA: TFloatField
      FieldName = 'VIABILIDADEMINIMA'
      Origin = 'VIABILIDADEMINIMA'
    end
    object db_colecaoTEMACOLECAO: TStringField
      FieldName = 'TEMACOLECAO'
      Origin = 'TEMACOLECAO'
      Size = 200
    end
    object db_colecaoMODELISTA: TStringField
      FieldName = 'MODELISTA'
      Origin = 'MODELISTA'
      Size = 200
    end
    object db_colecaoCENARIO: TStringField
      FieldName = 'CENARIO'
      Origin = 'CENARIO'
      Size = 200
    end
    object db_colecaoFOTOGRAFO: TStringField
      FieldName = 'FOTOGRAFO'
      Origin = 'FOTOGRAFO'
      Size = 200
    end
    object db_colecaoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 10
    end
    object db_colecaoQTDEMODELOS: TIntegerField
      FieldName = 'QTDEMODELOS'
      Origin = 'QTDEMODELOS'
    end
    object db_colecaoLIBERAR_GERENTEPRODUCAO: TStringField
      FieldName = 'LIBERAR_GERENTEPRODUCAO'
      Origin = 'LIBERAR_GERENTEPRODUCAO'
      Size = 10
    end
    object db_colecaoLIBERAR_GERENTECOMERCIAL: TStringField
      FieldName = 'LIBERAR_GERENTECOMERCIAL'
      Origin = 'LIBERAR_GERENTECOMERCIAL'
      Size = 10
    end
    object db_colecaoLIBERAR_GERENTEADMINISTRATIVO: TStringField
      FieldName = 'LIBERAR_GERENTEADMINISTRATIVO'
      Origin = 'LIBERAR_GERENTEADMINISTRATIVO'
      Size = 10
    end
    object db_colecaoESTILISTA: TStringField
      FieldName = 'ESTILISTA'
      Origin = 'ESTILISTA'
      Size = 200
    end
  end
end
