{***********************************************************************************
**  SISTEMA...............: Vida Nova Gest�o de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **
***********************************************************************************}

program VidaNovaSGN;

uses
  Vcl.Forms,
  Classe.Global in '..\Classes\Classe.Global.pas',
  Clientes in '..\Classes\Clientes.pas',
  App.Constantes in '..\Classes\App.Constantes.pas',
  Classe.EMail in '..\Classes\Classe.EMail.pas',
  FastReport in '..\Classes\FastReport.pas',
  MD5 in '..\Classes\MD5.pas',
  MovProdutos in '..\Classes\MovProdutos.pas',
  SQLServer in '..\Classes\SQLServer.pas',
  FBaseComponentes in '..\DataModule\FBaseComponentes.pas' {dmBaseComponentes: TDataModule},
  FSplash in '..\Forms\Splash\FSplash.pas' {FrmSplash},
  FAvisoSistema in '..\Forms\AvisoSistema\FAvisoSistema.pas' {FrmAvisoSistema},
  FAvisoSistemaErro in '..\Forms\AvisoSistema\FAvisoSistemaErro.pas' {FrmAvisoSistemaErro},
  FErrorForm in '..\Forms\AvisoSistema\FErrorForm.pas' {FrmErrorForm},
  FQuestionar in '..\Forms\AvisoSistema\FQuestionar.pas' {FrmQuestionar},
  FAtivarSistema in '..\Forms\AtivarSistema\FAtivarSistema.pas' {FrmAtivarSistema},
  FDatas in '..\Forms\Frames\FDatas.pas' {FrameDatas: TFrame},
  FrmRelatorios in '..\Forms\Frames\FrmRelatorios.pas' {FrameRelatorios: TFrame},
  FrmRelatoriosBotoes in '..\Forms\Frames\FrmRelatoriosBotoes.pas' {FrameRelatoriosBotoes: TFrame},
  Global in '..\Classes\Global.pas',
  Classe.Parametros in '..\Classes\Classe.Parametros.pas',
  Classe.Sistema in '..\Classes\Classe.Sistema.pas',
  FEmpresaSelecionar in '..\..\Modulos\01 - Arquivo\Empresa\FEmpresaSelecionar.pas' {FrmEmpresaSelecionar},
  FEtiquetaConfigurar in '..\..\Modulos\01 - Arquivo\Etiquetas\FEtiquetaConfigurar.pas' {FrmEtiquetaConfigurar},
  FAcesso in '..\..\Modulos\01 - Arquivo\Login\FAcesso.pas' {FrmAcesso},
  FCotacaoMoeda in '..\..\Modulos\01 - Arquivo\Moeda\FCotacaoMoeda.pas' {FrmCotacaoMoeda},
  FConfigurar in '..\..\Modulos\01 - Arquivo\Parametros\FConfigurar.pas' {FrmConfigurar},
  FServidorSistema in '..\..\Modulos\01 - Arquivo\Rede_Servidor\FServidorSistema.pas' {FrmServidorSistema},
  FServidorComputadoresRede in '..\..\Modulos\01 - Arquivo\Rede_Servidor\FServidorComputadoresRede.pas' {FrmServidorComputadoresRede},
  FEditorTexto in '..\..\Modulos\01 - Arquivo\RichEdit\FEditorTexto.pas' {FrmEditorTexto},
  FAutenticarAcao in '..\..\Modulos\01 - Arquivo\Usuarios\FAutenticarAcao.pas' {FrmAutenticarAcao},
  FRelatorioUsuario in '..\..\Modulos\01 - Arquivo\Usuarios\FRelatorioUsuario.pas' {FrmUsuarioLog},
  FUsuarios in '..\..\Modulos\01 - Arquivo\Usuarios\FUsuarios.pas' {FrmUsuarios},
  FUsuariosOnLine in '..\..\Modulos\01 - Arquivo\Usuarios\FUsuariosOnLine.pas' {FrmUsuariosOnLine},
  FAtividades in '..\..\Modulos\02 - Cadastros\Atividades\FAtividades.pas' {FrmAtividades},
  FCarteiraCobranca in '..\..\Modulos\02 - Cadastros\Carteira.Cobranca\FCarteiraCobranca.pas' {FrmCarteiraCobranca},
  FCEPStatus in '..\..\Modulos\02 - Cadastros\CEP\FCEPStatus.pas' {FrmCEPStatus},
  FCadClientes in '..\..\Modulos\02 - Cadastros\Clientes\FCadClientes.pas' {FrmClientes},
  FClientesComplementos in '..\..\Modulos\02 - Cadastros\Clientes\FClientesComplementos.pas' {FrmClientesComplementos},
  FClientesGradeEdicao in '..\..\Modulos\02 - Cadastros\Clientes\FClientesGradeEdicao.pas' {FrmClientesGradeEdicao},
  FEtiquetaClienteSelecao in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FEtiquetaClienteSelecao.pas' {FrmEtiquetaClienteSelecao},
  FEtiquetaEmpresa in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FEtiquetaEmpresa.pas' {FrmEtiquetaEmpresa},
  FRelCliAlfa in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelCliAlfa.pas' {FrmRelCliAlfa},
  FRelCliAnalitico in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelCliAnalitico.pas' {FrmRelCliAnalit},
  FRelCliBloqueados in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelCliBloqueados.pas' {FrmRelCliBloqueados},
  FRelCliCidades in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelCliCidades.pas' {FrmRelCliCidades},
  FRelClientes in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelClientes.pas' {FrmRelClientes},
  FRelClientesMalaDireta in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelClientesMalaDireta.pas' {FrmRelClientesMalaDireta},
  FRelCliFones in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelCliFones.pas' {FrmRelCliFones},
  FRelCliNumerica in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelCliNumerica.pas' {FrmRelCliNums},
  FRelEstados in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelEstados.pas' {FrmRelEstados},
  FRelEtiquetaCliente in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelEtiquetaCliente.pas' {FrmEtiquetaCliente},
  FRelRepresentantes in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FRelRepresentantes.pas' {FrmRelRepresentantes},
  FSelecionarClientes in '..\..\Modulos\02 - Cadastros\Clientes\Relatorios\FSelecionarClientes.pas' {FrmSelecionarClientes},
  FDepartamentos in '..\..\Modulos\02 - Cadastros\Departamentos\FDepartamentos.pas' {FrmDepartamentos},
  FFormaPagto in '..\..\Modulos\02 - Cadastros\FormaPagto\FFormaPagto.pas' {FrmFormaPagto},
  FFornecedores in '..\..\Modulos\02 - Cadastros\Fornecedor\FFornecedores.pas' {FrmFornecedores},
  FRelFornCidades in '..\..\Modulos\02 - Cadastros\Fornecedor\Relatorios\FRelFornCidades.pas' {FrmRelFornCidades},
  FRelFornEstados in '..\..\Modulos\02 - Cadastros\Fornecedor\Relatorios\FRelFornEstados.pas' {FrmRelFornEstados},
  FRelFornFicha in '..\..\Modulos\02 - Cadastros\Fornecedor\Relatorios\FRelFornFicha.pas' {FrmRelFornFicha},
  FRelFornFones in '..\..\Modulos\02 - Cadastros\Fornecedor\Relatorios\FRelFornFones.pas' {FrmRelFornFones},
  FGeneros in '..\..\Modulos\02 - Cadastros\Generos\FGeneros.pas' {FrmGeneros},
  FMarkup in '..\..\Modulos\02 - Cadastros\Markup\FMarkup.pas' {FrmMarkup},
  FMotivoBaixas in '..\..\Modulos\02 - Cadastros\MotivoBaixas\FMotivoBaixas.pas' {FrmMotivoBaixas},
  FRegioes in '..\..\Modulos\02 - Cadastros\Regioes\FRegioes.pas' {FrmRegioes},
  FTransportadoras in '..\..\Modulos\02 - Cadastros\Transportadora\FTransportadoras.pas' {FrmTransportadoras},
  FColaborador in '..\..\Modulos\02 - Cadastros\Vendedor\FColaborador.pas' {FrmColaborador},
  FHistoricoFuncionario in '..\..\Modulos\02 - Cadastros\Vendedor\Relatorios\FHistoricoFuncionario.pas' {FrmHistoricoFuncionario},
  FRelFuncionarioHistoricos in '..\..\Modulos\02 - Cadastros\Vendedor\Relatorios\FRelFuncionarioHistoricos.pas' {FrmRelFuncionarioHistoricos},
  FRelFuncionarios in '..\..\Modulos\02 - Cadastros\Vendedor\Relatorios\FRelFuncionarios.pas' {FrmRelFuncionarios},
  FCFOP in '..\..\Modulos\03 - Fiscal\CFOP\FCFOP.PAS' {FrmCFOP},
  FRelDemonstrativo in '..\..\Modulos\03 - Fiscal\Demonstrativo\FRelDemonstrativo.pas' {FrmRelDemonstrativo},
  FRelDemonstrativoAnalitico in '..\..\Modulos\03 - Fiscal\Demonstrativo\FRelDemonstrativoAnalitico.pas' {FrmRelDemonstrativoAnalitico},
  FPlanoContas in '..\..\Modulos\03 - Fiscal\Plano_de_Contas\FPlanoContas.pas' {FrmPlanoContas},
  FRelPlanoContas in '..\..\Modulos\03 - Fiscal\Plano_de_Contas\FRelPlanoContas.pas' {FrmRelPlanoContas},
  FRelPlanos in '..\..\Modulos\03 - Fiscal\Plano_de_Contas\FRelPlanos.pas' {FrmRelPlanos},
  FSituacaoTributaria in '..\..\Modulos\03 - Fiscal\Situa��o Tribut�ria\FSituacaoTributaria.pas' {FrmSituacaoTributaria},
  FEtiquetaProdutosConfigurar in '..\..\Modulos\04 - Produtos\Etiquetas\FEtiquetaProdutosConfigurar.pas' {FrmEtiquetaProdutosConfigurar},
  FEtiquetasGerar in '..\..\Modulos\04 - Produtos\Etiquetas\FEtiquetasGerar.pas' {FrmEtiquetasGerar},
  FEtiquetasWindows in '..\..\Modulos\04 - Produtos\Etiquetas\FEtiquetasWindows.pas' {FrmEtiquetasWindows},
  FEtiquetaCriarGrade in '..\..\Modulos\04 - Produtos\Etiquetas\FEtiquetaCriarGrade.pas' {FrmtiquetaCriarGrade},
  FBalcaoProdutos in '..\..\Modulos\04 - Produtos\PesquisaPrecos\FBalcaoProdutos.pas' {FrmBalcaoProdutos},
  FProdutosPesquisaPreco in '..\..\Modulos\04 - Produtos\PesquisaPrecos\FProdutosPesquisaPreco.pas' {FrmProdutosPesquisaPreco},
  FProdutos in '..\..\Modulos\04 - Produtos\Produtos\FProdutos.pas' {FrmProdutos},
  FProdutosCustoFracao in '..\..\Modulos\04 - Produtos\Produtos\FProdutosCustoFracao.pas' {FrmProdutosCustoFracao},
  FProdutosGrade in '..\..\Modulos\04 - Produtos\Produtos\FProdutosGrade.pas' {FrmProdutosGrade},
  FProdutosGradeEditar in '..\..\Modulos\04 - Produtos\Produtos\FProdutosGradeEditar.pas' {FrmProdutosGradeEditar},
  FProdutosQuantidade in '..\..\Modulos\04 - Produtos\Produtos\FProdutosQuantidade.pas' {FrmProdutosQuantidade},
  FProdutosQuantidadeCodigoBarras in '..\..\Modulos\04 - Produtos\Produtos\FProdutosQuantidadeCodigoBarras.pas' {FrmProdutosQuantidadeCodigoBarras},
  FProdutosQuantidadeGrade in '..\..\Modulos\04 - Produtos\Produtos\FProdutosQuantidadeGrade.pas' {FrmProdutosQuantidadeGrade},
  FProdutosQuantidadeGradeEditar in '..\..\Modulos\04 - Produtos\Produtos\FProdutosQuantidadeGradeEditar.pas' {FrmProdutosQuantidadeGradeEditar},
  FReajustePreco in '..\..\Modulos\04 - Produtos\ReajustePreco\FReajustePreco.pas' {FrmReajustePreco},
  F_RelEst_Historico in '..\..\Modulos\04 - Produtos\Relatorios\F_RelEst_Historico.pas' {Frm_RelEst_Historico},
  F_RelEst_ListaPreco in '..\..\Modulos\04 - Produtos\Relatorios\F_RelEst_ListaPreco.pas' {Frm_RelEst_ListaPreco},
  F_RelEst_Minimo in '..\..\Modulos\04 - Produtos\Relatorios\F_RelEst_Minimo.pas' {Frm_RelEst_Minimo},
  F_RelEst_Posicao in '..\..\Modulos\04 - Produtos\Relatorios\F_RelEst_Posicao.pas' {Frm_RelEst_Posicao},
  FRelEstoque in '..\..\Modulos\04 - Produtos\Relatorios\FRelEstoque.pas' {FrmRelEstoque},
  FSubGrupos in '..\..\Modulos\04 - Produtos\Subgrupo\FSubGrupos.pas' {FrmSubGrupos},
  FImprimirTabela in '..\..\Modulos\04 - Produtos\Tabela\FImprimirTabela.pas' {FrmImprimirTabela},
  FTabelaPreco in '..\..\Modulos\04 - Produtos\Tabela\FTabelaPreco.pas' {FrmTabelaPreco},
  FTabelaPrecoGradePrecos in '..\..\Modulos\04 - Produtos\Tabela\FTabelaPrecoGradePrecos.pas' {FrmTabelaPrecoGradePrecos},
  FTabelaPrecoOpcao in '..\..\Modulos\04 - Produtos\Tabela\FTabelaPrecoOpcao.pas' {FrmTabelaPrecoOpcao},
  FTabelaPrecoValor in '..\..\Modulos\04 - Produtos\Tabela\FTabelaPrecoValor.pas' {FrmTabelaPrecoValor},
  FTabelaNCM in '..\..\Modulos\04 - Produtos\TabelaNCM\FTabelaNCM.pas' {FrmTabelaNCM},
  FTipoProduto in '..\..\Modulos\04 - Produtos\TipoProdutos\FTipoProduto.pas' {FrmTipoProduto},
  FDistribuirPagamento in '..\..\Modulos\06 - Terceirizados\Pagamentos\FDistribuirPagamento.pas' {FrmDistribuirPagamento},
  FTerceirizadoLancaFinanceiro in '..\..\Modulos\06 - Terceirizados\Pagamentos\FTerceirizadoLancaFinanceiro.pas' {FrmTerceirizadoLancaFinanceiro},
  FTerceirizadoLancaFinanceiroPagar in '..\..\Modulos\06 - Terceirizados\Pagamentos\FTerceirizadoLancaFinanceiroPagar.pas' {FrmTerceirizadoLancaFinanceiroPagar},
  FPrincipal in '..\Forms\Principal\FPrincipal.pas' {FrmPrincipal},
  FTerceirizadosRelatorios in '..\..\Modulos\06 - Terceirizados\Relatorios\FTerceirizadosRelatorios.pas' {FrmTerceirizadosRelatorios},
  FDistribuirRemessa in '..\..\Modulos\06 - Terceirizados\Remessa\FDistribuirRemessa.pas' {FrmDistribuirRemessa},
  FDistribuirRemessaGrade in '..\..\Modulos\06 - Terceirizados\Remessa\FDistribuirRemessaGrade.pas' {FrmDistribuirRemessaGrade},
  FTabelaPrecoServicos in '..\..\Modulos\06 - Terceirizados\Tabela de Precos\FTabelaPrecoServicos.pas' {FrmTabelaPrecoServicos},
  Biblioteca_pcp in '..\Classes\Biblioteca_pcp.pas',
  FFaseProducao in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducao.pas' {FrmFaseProducao},
  FFaseProducaoDefeito in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoDefeito.pas' {FrmFaseProducaoDefeito},
  FFaseProducaoDefeitoEstornar in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoDefeitoEstornar.pas' {FrmFaseProducaoDefeitoEstornar},
  FFaseProducaoLancaEstoque in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoLancaEstoque.pas' {FrmFaseProducaoLancaEstoque},
  FFaseProducaoLancaEstoqueCodigoBarras in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoLancaEstoqueCodigoBarras.pas' {FrmFaseProducaoLancaEstoqueCodigoBarras},
  FFaseProducaoPerda in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoPerda.pas' {FrmFaseProducaoPerda},
  FFaseProducaoPerdaEstornar in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoPerdaEstornar.pas' {FrmFaseProducaoPerdaEstornar},
  FFaseProducaoRetornoTerceirizados in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoRetornoTerceirizados.pas' {FrmFaseProducaoRetornoTerceirizados},
  FFaseProducaoRetornoTerceirizadosGrade in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoRetornoTerceirizadosGrade.pas' {FrmFaseProducaoRetornoTerceirizadosGrade},
  FFaseProducaoSelecionar in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoSelecionar.pas' {FrmFaseProducaoSelecionar},
  FFaseProducaoTransferirFase in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoTransferirFase.pas' {FrmFaseProducaoTransferirFase},
  FFaseProducaoTransferirFaseGrade in '..\..\Modulos\07 - PCP\Andamento.Producao\FFaseProducaoTransferirFaseGrade.pas' {FrmFaseProducaoTransferirFaseGrade},
  FColecao in '..\..\Modulos\07 - PCP\Colecao\FColecao.pas' {FrmColecao},
  FParamCustos in '..\..\Modulos\07 - PCP\Custos\FParamCustos.pas' {FrmParamCustos},
  FDefeitos in '..\..\Modulos\07 - PCP\Defeitos\FDefeitos.pas' {FrmDefeitos},
  FEtiquetas in '..\..\Modulos\07 - PCP\Etiquetas\FEtiquetas.pas' {FrmEtiquetas},
  FBaseDados in '..\DataModule\FBaseDados.pas' {BaseDados: TDataModule},
  FBaseDados_PCP in '..\DataModule\FBaseDados_PCP.pas' {BaseDados_PCP: TDataModule},
  FFichaTecnica in '..\..\Modulos\07 - PCP\FichaTecnica\FFichaTecnica.pas' {FrmFichaTecnica},
  FFichaTecnicaCores in '..\..\Modulos\07 - PCP\FichaTecnica\FFichaTecnicaCores.pas' {FrmFichaTecnicaCores},
  FFichaTecnicaGradeFoto in '..\..\Modulos\07 - PCP\FichaTecnica\FFichaTecnicaGradeFoto.pas' {FrmFichaTecnicaGradeFoto},
  FFichaTecnicaImprimir in '..\..\Modulos\07 - PCP\FichaTecnica\FFichaTecnicaImprimir.pas' {FrmFichaTecnicaImprimir},
  FGrifes in '..\..\Modulos\07 - PCP\Grifes\FGrifes.pas' {FrmGrifes},
  FLoteProducao in '..\..\Modulos\07 - PCP\Lote.Producao\FLoteProducao.pas' {FrmLoteProducao},
  FMaquinas in '..\..\Modulos\07 - PCP\Maquinas\FMaquinas.pas' {FrmMaquinas},
  FOrdemProducao in '..\..\Modulos\07 - PCP\Ordem.Producao\FOrdemProducao.pas' {FrmOrdemProducao},
  FOrdemProducaoGrade in '..\..\Modulos\07 - PCP\Ordem.Producao\FOrdemProducaoGrade.pas' {FrmOrdemProducaoGrade},
  FOrdemProducaoMateriaPrimaBaixar in '..\..\Modulos\07 - PCP\Ordem.Producao\FOrdemProducaoMateriaPrimaBaixar.pas' {FrmOrdemProducaoMateriaPrimaBaixar},
  FOrdemProducaoPedidos in '..\..\Modulos\07 - PCP\Ordem.Producao\FOrdemProducaoPedidos.pas' {FrmOrdemProducaoPedidos},
  FOrdemProducaoReferencias in '..\..\Modulos\07 - PCP\Ordem.Producao\FOrdemProducaoReferencias.pas' {FrmOrdemProducaoReferencias},
  FProcessos in '..\..\Modulos\07 - PCP\Processos\FProcessos.pas' {FrmProcessos},
  FProcessosGrade in '..\..\Modulos\07 - PCP\Processos\FProcessosGrade.pas' {FrmProcessosGrade},
  FProcessos_Maquinas in '..\..\Modulos\07 - PCP\Processos.Maquinas\FProcessos_Maquinas.pas' {FrmProcessos_Maquinas},
  FProcessos_Operadores in '..\..\Modulos\07 - PCP\Processos.Operadores\FProcessos_Operadores.pas' {FrmProcessos_Operadores},
  FQualidades in '..\..\Modulos\07 - PCP\Qualidades\FQualidades.pas' {FrmQualidades},
  FRelatorioProducao in '..\..\Modulos\07 - PCP\Relatorios\FRelatorioProducao.pas' {FrmRelatorioProducao},
  FTamanhos in '..\..\Modulos\07 - PCP\Tamanhos\FTamanhos.pas' {FrmTamanhos},
  FGradeTamanhos in '..\..\Modulos\07 - PCP\TamanhosGrade\FGradeTamanhos.pas' {FrmGradeTamanhos},
  FVendaCodigoBarra in '..\..\Modulos\08 - Vendas\Codigobarra\FVendaCodigoBarra.pas' {FrmVendaCodigoBarra},
  FFat_RelComissao in '..\..\Modulos\08 - Vendas\Faturamento\FFat_RelComissao.pas' {FrmFat_RelComissao},
  FFat_RelComissaoAnalitico in '..\..\Modulos\08 - Vendas\Faturamento\FFat_RelComissaoAnalitico.pas' {FrmFat_RelComissaoAnalitico},
  FFat_RelCurvaABC_Clientes in '..\..\Modulos\08 - Vendas\Faturamento\FFat_RelCurvaABC_Clientes.pas' {FrmFat_RelCurvaABC_Clientes},
  FFat_RelCurvaABCFormaPagto in '..\..\Modulos\08 - Vendas\Faturamento\FFat_RelCurvaABCFormaPagto.pas' {FrmFat_RelCurvaABCFormaPagto},
  FFat_RelCurvaABCVendedores in '..\..\Modulos\08 - Vendas\Faturamento\FFat_RelCurvaABCVendedores.pas' {FrmFat_RelCurvaABCVendedores},
  FFat_RelNFAnalitico in '..\..\Modulos\08 - Vendas\Faturamento\FFat_RelNFAnalitico.pas' {FrmFat_RelNFAnalitico},
  FFat_RelNFAnaliticoProdutos in '..\..\Modulos\08 - Vendas\Faturamento\FFat_RelNFAnaliticoProdutos.pas' {FrmFat_RelNFAnaliticoProdutos},
  FFat_RelNotaFiscal in '..\..\Modulos\08 - Vendas\Faturamento\FFat_RelNotaFiscal.pas' {FrmFat_RelNotaFiscal},
  FFat_RelRepres in '..\..\Modulos\08 - Vendas\Faturamento\FFat_RelRepres.pas' {FrmFat_RelRepres},
  FFat_RelResumo_CFOP in '..\..\Modulos\08 - Vendas\Faturamento\FFat_RelResumo_CFOP.pas' {FrmFat_RelResumo_CFOP},
  FRelFaturamento in '..\..\Modulos\08 - Vendas\Faturamento\FRelFaturamento.pas' {FrmRelFaturamento},
  FGeraParcelasCupomNaoFiscal in '..\..\Modulos\08 - Vendas\Gerar_parcelas\FGeraParcelasCupomNaoFiscal.pas' {FrmGeraParcelasCupomNaoFiscal},
  FGeraParcelasVenda in '..\..\Modulos\08 - Vendas\NotaFiscal\FGeraParcelasVenda.pas' {FrmGeraParcelasVenda},
  FNotaFiscal in '..\..\Modulos\08 - Vendas\NotaFiscal\FNotaFiscal.pas' {FrmNotaFiscal},
  FNotaFiscalCancelar in '..\..\Modulos\08 - Vendas\NotaFiscal\FNotaFiscalCancelar.pas' {FrmNotaFiscalCancelar},
  FNotaFiscalEmitidas in '..\..\Modulos\08 - Vendas\NotaFiscal\FNotaFiscalEmitidas.pas' {FrmNotaFiscalEmitidas},
  FNotaFiscalSituacaoSEFAZ in '..\..\Modulos\08 - Vendas\NotaFiscal\FNotaFiscalSituacaoSEFAZ.pas' {FrmNotaFiscalSituacaoSEFAZ},
  FStatusNFe in '..\..\Modulos\08 - Vendas\NotaFiscal\FStatusNFe.pas' {FrmStatusNFe},
  FVendaDevolucaoOpcaoFinalizar in '..\..\Modulos\08 - Vendas\NotaFiscal\FVendaDevolucaoOpcaoFinalizar.pas' {FrmVendaDevolucaoOpcaoFinalizar},
  FVisualizarParcelas in '..\..\Modulos\08 - Vendas\NotaFiscal\FVisualizarParcelas.pas' {FrmVisualizarParcelas},
  FPedidoAprovarVenda in '..\..\Modulos\08 - Vendas\PedidoVenda\FPedidoAprovarVenda.pas' {FrmPedidoAprovarVenda},
  FPedidoVenda in '..\..\Modulos\08 - Vendas\PedidoVenda\FPedidoVenda.pas' {FrmPedidoVenda},
  FPedidoVendaCodigoBarra in '..\..\Modulos\08 - Vendas\PedidoVenda\FPedidoVendaCodigoBarra.pas' {FrmPedidoVendaCodigoBarra},
  FPedidoVendaGrade in '..\..\Modulos\08 - Vendas\PedidoVenda\FPedidoVendaGrade.pas' {FrmPedidoVendaGrade},
  FPedidoVendaGradePrecos in '..\..\Modulos\08 - Vendas\PedidoVenda\FPedidoVendaGradePrecos.pas' {FrmPedidoVendaGradePrecos},
  FPedidoVendaParcial in '..\..\Modulos\08 - Vendas\PedidoVenda\FPedidoVendaParcial.pas' {FrmPedidoVendaParcial},
  FOpcaoConferencia in '..\..\Modulos\08 - Vendas\PedidoVenda - Conferencia\FOpcaoConferencia.pas' {FrmOpcaoConferencia},
  FPedidoVendaConferencia in '..\..\Modulos\08 - Vendas\PedidoVenda - Conferencia\FPedidoVendaConferencia.pas' {FrmPedidoVendaConferencia},
  FPedidoVendaConferenciaCodigoBarra in '..\..\Modulos\08 - Vendas\PedidoVenda - Conferencia\FPedidoVendaConferenciaCodigoBarra.pas' {FrmPedidoVendaConferenciaCodigoBarra},
  FPedidoVendaConferenciaGrade in '..\..\Modulos\08 - Vendas\PedidoVenda - Conferencia\FPedidoVendaConferenciaGrade.pas' {FrmPedidoVendaConferenciaGrade},
  FEtiquetacaixa in '..\..\Modulos\08 - Vendas\Romaneio\FEtiquetacaixa.pas' {FrmEtiquetacaixa},
  FRomaneio in '..\..\Modulos\08 - Vendas\Romaneio\FRomaneio.pas' {FrmRomaneio},
  FOpcaoNotaFiscal in '..\..\Modulos\08 - Vendas\TipoVenda\FOpcaoNotaFiscal.pas' {FrmOpcaoNotaFiscal},
  FOpcaoVenda in '..\..\Modulos\08 - Vendas\TipoVenda\FOpcaoVenda.pas' {FrmOpcaoVenda},
  FGeraParcelasVendaExpressa in '..\..\Modulos\08 - Vendas\VendaExpressa\FGeraParcelasVendaExpressa.pas' {FrmGeraParcelasVendaExpressa},
  FVendaCaixa_LocalizarPedido in '..\..\Modulos\08 - Vendas\VendaExpressa\FVendaCaixa_LocalizarPedido.pas' {FrmVendaCaixa_LocalizarPedido},
  FVendaDevolucaoProdutos in '..\..\Modulos\08 - Vendas\VendaExpressa\FVendaDevolucaoProdutos.pas' {FrmVendaDevolucaoProdutos},
  FVendaExpressa in '..\..\Modulos\08 - Vendas\VendaExpressa\FVendaExpressa.pas' {FrmVendaExpressa},
  FVendaExpressaFaturas in '..\..\Modulos\08 - Vendas\VendaExpressa\FVendaExpressaFaturas.pas' {FrmVendaExpressaFaturas},
  FBancos in '..\..\Modulos\09 - Financeiro\Bancos\FBancos.pas' {FrmBancos},
  FBoletoBancario in '..\..\Modulos\09 - Financeiro\Boletos\FBoletoBancario.pas' {FrmBoletoBancario},
  FControleCaixa in '..\..\Modulos\09 - Financeiro\Caixa\FControleCaixa.pas' {FrmControleCaixa},
  FRelCaixaSimplificado in '..\..\Modulos\09 - Financeiro\Caixa\Relatorios\FRelCaixaSimplificado.pas' {FrmRelCaixaSintetico},
  FRelFluxoCaixa in '..\..\Modulos\09 - Financeiro\Caixa\Relatorios\FRelFluxoCaixa.pas' {FrmRelFluxoCaixa},
  FRelMovCaixa in '..\..\Modulos\09 - Financeiro\Caixa\Relatorios\FRelMovCaixa.pas' {FrmRelMovCaixa},
  FRelMovCaixaSaldoDiarioAnalitico in '..\..\Modulos\09 - Financeiro\Caixa\Relatorios\FRelMovCaixaSaldoDiarioAnalitico.pas' {FrmRelMovCaixaSaldoDiarioAnalitico},
  FCad_CartaCobranca in '..\..\Modulos\09 - Financeiro\Cartas\FCad_CartaCobranca.pas' {FrmCartaCadastro},
  FCartaEmitir in '..\..\Modulos\09 - Financeiro\Cartas\FCartaEmitir.pas' {FrmCartaEmitir},
  FCartaEmitirGeral in '..\..\Modulos\09 - Financeiro\Cartas\FCartaEmitirGeral.pas' {FrmCartaEmitirGeral},
  FCartaEmitirImprimir in '..\..\Modulos\09 - Financeiro\Cartas\Relatorios\FCartaEmitirImprimir.pas' {FrmCartaEmitirImprimir},
  FImprimeCarta in '..\..\Modulos\09 - Financeiro\Cartas\Relatorios\FImprimeCarta.pas' {FrmImprimeCarta},
  FImprimeCartaTodas in '..\..\Modulos\09 - Financeiro\Cartas\Relatorios\FImprimeCartaTodas.pas' {FrmImprimeCartaTodas},
  FControleChequesEmitidos in '..\..\Modulos\09 - Financeiro\Cheques\FControleChequesEmitidos.pas' {FrmChequesEmitidos},
  FControleChequesRecebidos in '..\..\Modulos\09 - Financeiro\Cheques\FControleChequesRecebidos.pas' {FrmChequesRecebidos},
  FRelCheques in '..\..\Modulos\09 - Financeiro\Cheques\Relatorios\FRelCheques.pas' {FrmRelCheques},
  FRelChequesLancados in '..\..\Modulos\09 - Financeiro\Cheques\Relatorios\FRelChequesLancados.pas' {FrmRelChequesLancados},
  FCob_Agendar in '..\..\Modulos\09 - Financeiro\Cobran�aAgendar\FCob_Agendar.pas' {FrmCob_Agendar},
  FRelReceb_CobAgendadas in '..\..\Modulos\09 - Financeiro\Cobran�aAgendar\Relatorios\FRelReceb_CobAgendadas.pas' {FrmRelReceb_CobAgendadas},
  FComissoes in '..\..\Modulos\09 - Financeiro\Comissoes\FComissoes.pas' {FrmComissoes},
  FComissoesRelatorios in '..\..\Modulos\09 - Financeiro\Comissoes\Relatorios\FComissoesRelatorios.pas' {FrmComissoesRelatorios},
  FConciliacaoBanco in '..\..\Modulos\09 - Financeiro\ConciliacaoBancaria\FConciliacaoBanco.pas' {FrmConciliacaoBanco},
  FContaCorrente_old in '..\..\Modulos\09 - Financeiro\Conta_Corrente\FContaCorrente_old.pas' {FrmContaCorrente_old},
  FCtaPagar in '..\..\Modulos\09 - Financeiro\Contas.Pagar\FCtaPagar.pas' {FrmCtaPagar},
  FCtaPagarBaixas in '..\..\Modulos\09 - Financeiro\Contas.Pagar\FCtaPagarBaixas.pas' {FrmCtaPagarBaixas},
  FCtaPagarBaixasLotes in '..\..\Modulos\09 - Financeiro\Contas.Pagar\FCtaPagarBaixasLotes.pas' {FrmCtaPagarBaixasLotes},
  FCtaPagarGeraParcelas in '..\..\Modulos\09 - Financeiro\Contas.Pagar\FCtaPagarGeraParcelas.pas' {FrmCtaPagarGeraParcelas},
  FRelCtaPagar in '..\..\Modulos\09 - Financeiro\Contas.Pagar\Relatorios\FRelCtaPagar.pas' {FrmRelCtaPagar},
  FRelPagar_Extrato in '..\..\Modulos\09 - Financeiro\Contas.Pagar\Relatorios\FRelPagar_Extrato.pas' {FrmRelPagar_Extrato},
  FRelPagar_Historico in '..\..\Modulos\09 - Financeiro\Contas.Pagar\Relatorios\FRelPagar_Historico.pas' {FrmRelPagar_Historico},
  FRelPagar_Pagar in '..\..\Modulos\09 - Financeiro\Contas.Pagar\Relatorios\FRelPagar_Pagar.pas' {FrmRelPagar_Pagar},
  FRelPagar_Quitadas in '..\..\Modulos\09 - Financeiro\Contas.Pagar\Relatorios\FRelPagar_Quitadas.pas' {FrmRelPagar_Quitadas},
  FRelPagar_Vencidas in '..\..\Modulos\09 - Financeiro\Contas.Pagar\Relatorios\FRelPagar_Vencidas.pas' {FrmRelPagar_Vencidas},
  FCtaPagarSubstituirChequesInformar in '..\..\Modulos\09 - Financeiro\Contas.Pagar.Substituir.Titulo\FCtaPagarSubstituirChequesInformar.pas' {FrmCtaPagarSubstituirChequesInformar},
  FCtaPagarSubstituirTitulos in '..\..\Modulos\09 - Financeiro\Contas.Pagar.Substituir.Titulo\FCtaPagarSubstituirTitulos.pas' {FrmCtaPagarSubstituirTitulos},
  FCtaReceber in '..\..\Modulos\09 - Financeiro\Contas.Receber\FCtaReceber.pas' {FrmCtaReceber},
  FCtaReceberBaixas in '..\..\Modulos\09 - Financeiro\Contas.Receber\FCtaReceberBaixas.pas' {FrmCtaReceberBaixas},
  FCtaReceberBaixasLotes in '..\..\Modulos\09 - Financeiro\Contas.Receber\FCtaReceberBaixasLotes.pas' {FrmCtaReceberBaixasLotes},
  FCtaReceberBaixasLotesCheques in '..\..\Modulos\09 - Financeiro\Contas.Receber\FCtaReceberBaixasLotesCheques.pas' {FrmCtaReceberBaixasLotesCheques},
  FCtaReceberBaixasLotesSelecionar in '..\..\Modulos\09 - Financeiro\Contas.Receber\FCtaReceberBaixasLotesSelecionar.pas' {FrmCtaReceberBaixasLotesSelecionar},
  FCtaReceberGeraParcelas in '..\..\Modulos\09 - Financeiro\Contas.Receber\FCtaReceberGeraParcelas.pas' {FrmCtaReceberGeraParcelas},
  FRelCtaReceber in '..\..\Modulos\09 - Financeiro\Contas.Receber\Relatorios\FRelCtaReceber.pas' {FrmRelCtaReceber},
  FRelReceb_ContaCorrente in '..\..\Modulos\09 - Financeiro\Contas.Receber\Relatorios\FRelReceb_ContaCorrente.pas' {FrmRelReceb_ContaCorrente},
  FRelReceb_Extrato in '..\..\Modulos\09 - Financeiro\Contas.Receber\Relatorios\FRelReceb_Extrato.pas' {FrmRelReceb_Extrato},
  FRelReceb_ExtratoProdutos in '..\..\Modulos\09 - Financeiro\Contas.Receber\Relatorios\FRelReceb_ExtratoProdutos.pas' {FrmRelReceb_ExtratoProdutos},
  FRelReceb_Historico in '..\..\Modulos\09 - Financeiro\Contas.Receber\Relatorios\FRelReceb_Historico.pas' {FrmRelReceb_Historico},
  FRelReceb_Quitadas in '..\..\Modulos\09 - Financeiro\Contas.Receber\Relatorios\FRelReceb_Quitadas.pas' {FrmRelReceb_Quitadas},
  FRelReceb_QuitadasDataPagto in '..\..\Modulos\09 - Financeiro\Contas.Receber\Relatorios\FRelReceb_QuitadasDataPagto.pas' {FrmRelReceb_QuitadasDataPagto},
  FRelReceb_Receber in '..\..\Modulos\09 - Financeiro\Contas.Receber\Relatorios\FRelReceb_Receber.pas' {FrmRelReceb_Receber},
  FRelReceb_ReceberSintetico in '..\..\Modulos\09 - Financeiro\Contas.Receber\Relatorios\FRelReceb_ReceberSintetico.pas' {FrmRelReceb_ReceberSintetico},
  FRelReceb_Vencidas in '..\..\Modulos\09 - Financeiro\Contas.Receber\Relatorios\FRelReceb_Vencidas.pas' {FrmRelReceb_Vencidas},
  FBordero in '..\..\Modulos\09 - Financeiro\Contas.Receber.Bordero\FBordero.pas' {FrmBordero},
  FControleBancario in '..\..\Modulos\09 - Financeiro\ControleBancario\FControleBancario.pas' {FrmControleBancario},
  FRelFechamentoCaixa in '..\..\Modulos\09 - Financeiro\FechamentoCaixa\Relatorios\FRelFechamentoCaixa.pas' {FrmRelFechamentoCaixa},
  FRelFechamentoCaixaAnalitico in '..\..\Modulos\09 - Financeiro\FechamentoCaixa\Relatorios\FRelFechamentoCaixaAnalitico.pas' {FrmRelFechamentoCaixaAnalitico},
  FRecibo in '..\..\Modulos\09 - Financeiro\Recibo\FRecibo.pas' {FrmRecibo},
  FReciboImprimir in '..\..\Modulos\09 - Financeiro\Recibo\Relatorios\FReciboImprimir.pas' {FrmReciboImprimir},
  FTransferenciaContas in '..\..\Modulos\09 - Financeiro\Transferencia\FTransferenciaContas.pas' {FrmTransferenciaContas},
  FRelEntregas in '..\..\Modulos\10 - Expedi��o\Entrega\Relatorios\FRelEntregas.pas' {FrmRelEntregas},
  FRelEntregas_Geral in '..\..\Modulos\10 - Expedi��o\Entrega\Relatorios\FRelEntregas_Geral.pas' {FrmRelEntregas_Geral},
  FAboutBox in '..\..\Modulos\11 - Ajuda\About\FAboutBox.pas' {FrmAboutBox},
  FAjuda in '..\..\Modulos\11 - Ajuda\Ajuda\FAjuda.pas' {FrmAjuda},
  FAjudaBarraBotoes in '..\..\Modulos\11 - Ajuda\Ajuda\FAjudaBarraBotoes.pas' {FrmAjudaBarraBotoes},
  FCalendario in '..\..\Modulos\11 - Ajuda\Calendario\FCalendario.pas' {FrmCalendario},
  FCompraCodigoBarra in '..\..\Modulos\05 - Compras\CodigoBarras\FCompraCodigoBarra.pas' {FrmCompraCodigoBarra},
  FComprasPagar in '..\..\Modulos\05 - Compras\ComprasPagar\FComprasPagar.pas' {FrmComprasPagar},
  FComprasEtiquetas in '..\..\Modulos\05 - Compras\Etiquetas\FComprasEtiquetas.pas' {FrmComprasEtiquetas},
  FCompras in '..\..\Modulos\05 - Compras\NotaFiscalEntrada\FCompras.pas' {FrmCompras},
  FComprasGradeEditar in '..\..\Modulos\05 - Compras\NotaFiscalEntrada\FComprasGradeEditar.pas' {FrmComprasGradeEditar},
  FOpcaoNotaFiscalCompra in '..\..\Modulos\05 - Compras\NotaFiscalEntrada\FOpcaoNotaFiscalCompra.pas' {FrmOpcaoNotaFiscalCompra},
  FComprasImprimir in '..\..\Modulos\05 - Compras\NotaFiscalEntrada\Relatorios\FComprasImprimir.pas' {FrmComprasImprimir},
  FRelCompras in '..\..\Modulos\05 - Compras\NotaFiscalEntrada\Relatorios\FRelCompras.pas' {FrmRelCompras},
  FRelComprasFornecedor in '..\..\Modulos\05 - Compras\NotaFiscalEntrada\Relatorios\FRelComprasFornecedor.pas' {FrmRelComprasFornecedor},
  FRelComprasProdutos in '..\..\Modulos\05 - Compras\NotaFiscalEntrada\Relatorios\FRelComprasProdutos.pas' {FrmRelComprasProdutos},
  FPedidoCompra in '..\..\Modulos\05 - Compras\PedidoCompra\FPedidoCompra.pas' {FrmPedidoCompra},
  FVeiculos in '..\..\Modulos\02 - Cadastros\Veiculos\FVeiculos.pas' {FrmVeiculos},
  FRelVeiculos in '..\..\Modulos\02 - Cadastros\Veiculos\Relatorios\FRelVeiculos.pas' {FrmRelVeiculos},
  FRelVeiculosHistorico in '..\..\Modulos\02 - Cadastros\Veiculos\Relatorios\FRelVeiculosHistorico.pas' {FrmRelVeiculosHistorico},
  FRelVeiculosLista in '..\..\Modulos\02 - Cadastros\Veiculos\Relatorios\FRelVeiculosLista.pas' {FrmRelVeiculosLista},
  FCores in '..\..\Modulos\07 - PCP\Cores\FCores.pas' {FrmCores},
  FFasesGrade in '..\..\Modulos\07 - PCP\Fases\FFasesGrade.pas' {FrmFasesGrade},
  FFases in '..\..\Modulos\07 - PCP\Fases\FFases.pas' {FrmFases},
  FConta in '..\..\Modulos\09 - Financeiro\Contas\FConta.pas' {FrmConta},
  Classe.Usuarios in '..\Classes\Classe.Usuarios.pas',
  Classe.Criptografia in '..\Classes\Classe.Criptografia.pas',
  Classe.BancoDados in '..\Classes\Classe.BancoDados.pas',
  App.IniFiles in '..\Classes\App.IniFiles.pas',
  Vcl.Themes,
  Vcl.Styles,
  Classe.Beep in '..\Classes\Classe.Beep.pas',
  FTelaPrincipal in '..\Forms\Principal\FTelaPrincipal.pas' {FrmTelaPrincipal},
  App.Enumeradores in '..\Classes\App.Enumeradores.pas',
  FProdutosDetalhados in '..\..\Modulos\04 - Produtos\Produtos\FProdutosDetalhados.pas' {FrmProdutosDetalhados},
  FCrudSimples in '..\TemplateCrud\FCrudSimples.pas' {FrmCrudSimples},
  FGrupos in '..\..\Modulos\04 - Produtos\Grupo\FGrupos.pas' {FrmGrupos},
  App.Funcoes in '..\Classes\App.Funcoes.pas',
  FGrupoCompras in '..\..\Modulos\02 - Cadastros\Grupo de Compras\FGrupoCompras.pas' {FrmGrupoCompras},
  FTipoCliente in '..\..\Modulos\02 - Cadastros\Tipo de Cliente\FTipoCliente.pas' {FrmTipoCliente},
  FEnderecoCliente in '..\..\Modulos\02 - Cadastros\Endere�o de Cliente\FEnderecoCliente.pas' {FrmEnderecoCliente},
  Classe.Cliente in '..\Classes\Classe.Cliente.pas',
  Classe.CEP in '..\Classes\Classe.CEP.pas',
  FPorteClientes in '..\..\Modulos\02 - Cadastros\Porte de Clientes\FPorteClientes.pas' {FrmPorteClientes},
  FAlertasLancamentos in '..\..\Modulos\02 - Cadastros\Alertas Lancamentos\FAlertasLancamentos.pas' {FrmAlertasLancamentos},
  FRelPedidos in '..\..\Modulos\08 - Vendas\PedidoVenda\Relatorios\FRelPedidos.pas' {FrmRelPedidos},
  FLinhasProdutos in '..\..\Modulos\04 - Produtos\Linhas\FLinhasProdutos.pas' {FrmLinhasProdutos},
  FEntidadeGrupo in '..\..\Modulos\02 - Cadastros\Grupo Entidades\FEntidadeGrupo.pas' {FrmEntidadeGrupo},
  FSegmento in '..\..\Modulos\04 - Produtos\Segmento\FSegmento.pas' {FrmSegmento},
  FCidadeIBGE in '..\..\Modulos\02 - Cadastros\Cidades\FCidadeIBGE.pas' {FrmCidadeIBGE},
  CoreTableClass in '..\Classes\CoreTableClass.pas',
  FContaCorrente in '..\..\Modulos\02 - Cadastros\ContaCorrente\FContaCorrente.pas' {FrmContaCorrente},
  FFrameBarra in '..\Forms\Frames\FFrameBarra.pas' {FrmFrameBarra: TFrame},
  FFrameBotoes in '..\Forms\Frames\FFrameBotoes.pas' {FrmFrameBotoes: TFrame},
  FFrameBotoes_II in '..\Forms\Frames\FFrameBotoes_II.pas' {FrmFrameBotoes_II: TFrame},
  FFramePadrao in '..\Forms\Frames\FFramePadrao.pas' {FrmFramePadrao: TFrame},
  FEmpresa in '..\..\Modulos\01 - Arquivo\Empresa\FEmpresa.pas' {FrmEmpresa},
  Classe.Producao in '..\Classes\Classe.Producao.pas',
  FCompra in '..\..\Modulos\05 - Compras\NF-e_Entrada\FCompra.pas' {FrmCompra},
  FCarneImprimir in '..\..\Modulos\09 - Financeiro\Carnes\FCarneImprimir.pas' {FrmCarneImprimir},
  Classe.GetConnect in '..\Classes\Classe.GetConnect.pas',
  Biblioteca in '..\Classes\Biblioteca.pas',
  App.Licenca in '..\Classes\App.Licenca.pas',
  FImpressao in '..\..\Modulos\01 - Arquivo\Impressao\FImpressao.pas' {FrmImpressao},
  FArquivoMorto in '..\..\Modulos\12 - Sifates\ArquivoMorto\FArquivoMorto.pas' {FrmArquivoMorto},
  FClientesSifates in '..\..\Modulos\12 - Sifates\Clientes\FClientesSifates.pas' {FrmClientesSifates},
  FEntregadorDefinir in '..\..\Modulos\08 - Vendas\PedidoVenda\FEntregadorDefinir.pas' {FrmEntregadorDefinir};

{$R *.res}

begin

  Application.Initialize;
  Application.HintHidePause := MaxInt;
  Application.ShowHint      := True;


  FrmSplash := TFrmSplash.Create(Application);
  FrmSplash.Show;
  Application.ProcessMessages;
  Application.Title := 'Vida Nova SGN';

  Application.ProcessMessages;
  Application.Run;


end.
