{***********************************************************************************
**  SISTEMA...............: Vida Nova Gest�o de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  C�digo pertencente ao cliente sob prote��o autoral.                           ****  N�o comercializ�vel sem pr�via autoriza��o do mesmo.                          **
***********************************************************************************}

unit SQLServer;

interface

uses
   Forms, Classes, Windows, Controls, Variants, ComCtrls,
   WinTypes, WinProcs, Tabs, ExtCtrls, DBCtrls,
   Dialogs, StdCtrls, Messages, Graphics, shellapi, Sysutils,
   FMTBcd,  WideStrings, DBCommon, System.DateUtils,
   System.StrUtils, System.Types,
   FireDAC.Comp.Client,
   Data.DB,
   Classe.Parametros,
   Global,
   Classe.Global,
   Classe.CEP;



// --------------------------------------------------------------------------
// CEP
// --------------------------------------------------------------------------

Function GetCEPDados(const nCEP: String): TCEP;
Function GetEnderecoDados(aIDEndereco, aIDCliente : Integer): TCEP;
Function DadosExistenteEndereco(aIDCliente : Integer): Boolean;

// --------------------------------------------------------------------------
// outros
// --------------------------------------------------------------------------

Procedure QueryObjCriar(var aQuery);
Procedure QueryObjLiberar(var aQuery);

Procedure prcContasReceberDescontato(ncodigo, ncontabanco,ncontacaixa,ncarteira: Integer; stacao: String);

Procedure pContasReceber(ncodigo, ncliente: Integer; acao: String);

Procedure pContasReceberBaixaParcial(ncliente, nVendedor: Integer;
  nData, nVencimento: TDate; nNotafiscal, nDocumento: String; nNovoValor: Real;
  nPlanoConta: String; nforma_pagto: Integer; wAcao: String);

Procedure pContasPagarBaixaParcial(nfornecedor: integer;
  nData, nVencimento: TDate; nNotafiscal, nDocumento: String; nNovoValor: Real;
  nPlanoConta: String; nforma_pagto: integer; shitorico, wAcao: String);


Procedure pContasReceberLancar(ncliente, nVendedor: integer;
  nData, nVencimento: TDate; nNotafiscal, nDocumento: String; nNovoValor: Real;
  stEspecie, wAcao: String);

Procedure prcComissaoPagarPedidos(ncliente, nVendedor, nPedido: integer; nValor:Currency;wAcao: String);

Function ValidaReferencia(sReferencia: String): Boolean;
Function fncValidaReferenciaGrade(sReferencia: String): Boolean;

Function fncValidaAndamentoReferenciaGrade(lnOrdemProducao:integer;sReferencia: String): Boolean;

Function fncValidaAndamentoReferenciaGradeQualidade(sReferencia: String): Boolean;

Function fncValidaReferenciaQuantidadeGrade(sReferencia: String): Boolean;

Function fncValidaReferenciaQuantidadeGradeQualidade(sReferencia: String): Boolean;

Function fncValidaReferenciaGradeQuantidade(sReferencia: String): Boolean;

Function RetornaReferenciaCodigoID(sReferencia: String): Integer;

Function fncReferenciaNome(sReferencia: String): String;

Function RetornaReferenciaReduzido(sReferencia: String): String;

Function RetornaReferenciaNomeReduzido(sReferencia: String): String;

Function RetornaReferenciaPrecoVenda(sReferencia: String): Real;

Function fncReferenciaPrecoCusto(sReferencia: String): Real;

Function RetornaReferenciaQuantidade(sReferencia: String): Real;

Function GetClienteCampo(nCliente: Integer;slCampo:String): String;

Function Cliente_Endereco(nCliente: Integer;slCampo:String): String;

Function GetUltimoCodProduto(): Integer;

Function GetProdutoCampo(sReferencia,slCampo:String): String;

Function GetNCMCEST(aNCM:String): String;

Function fncProdutoGrade_retCampo(sReferencia,slCampo:String): String;

Function prcOrdemProducao_retCampo(lnOrdemProducao:integer;slCampo:String) : String;

Function prcOrdemProducaoAndamento_retCampo(lnOrdemProducao:integer;slIdentificador,slCampo:String) : String;

Procedure GetParametros;

Function fncUsuario_retCampo(lnUsuario:integer;slCampo:String) : String;

Function prcOrdemProducaoItens_retCampo(lnOrdemProducao:integer;slCampo:String) : String;

Function fncPedidoItens_retCampo(lnPedido:integer;slCampo:String) : String;

Function fncFinReceber_retCampo(lnReceber:integer;slCampo:String) : String;

Function fncFaseReferencia_valor(lnOrdemProucao,lnterceirizado:integer) : Real;

Function fncFaseCadastro_Validar(nFase:Integer): Boolean;

Function fncFase_Validar(nFase:Integer): Boolean;

Function fncFase_Nome(nFase:Integer): String;

Function fncLote_Nome(nLote:Integer): String;

Function ValidarReferenciaProducao(nOrdemProucao:Integer;sReferencia: String): Boolean;

Function fncOrdemProducaoSomar(nOrdemProucao:Integer): Real;

Function ValidarDistribuicaoRemessa(nRemessa:Integer): Boolean;

Function RetornaReferenciaPrecoTabela(nTabela:Integer;sReferencia: String): Real;

Function ValidaReferenciaTabela(nTabela:Integer;sReferencia: String): Boolean;

Function RetornaDistribuicaoOrdemProducao(nRemessa:Integer): Integer;

Function RetornaDistribuicaoTerceirizado(nRemessa:Integer): Integer;

Function ValidarOrdemProducao(nOrdemProucao:Integer): Boolean;

Function fncOrdemProducaoEncerrado(nOrdemProucao:Integer): Boolean;

Function ValidarOrdemProducaoAutorizada(nOrdemProucao:Integer): Boolean;

Function ValidarStatusOrdemProducao(nOrdemProucao:Integer): Boolean;

Procedure ProducaoTransfereFase(lOficina,lnOP,lnFaseTransferencia, lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer;blultimafase:boolean);

Procedure prcFaseAndamentoTransferirEstoque(lOficina,lnOP,lnFaseTransferencia, lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);

Procedure prcFaseAndamentoBaixar(lnFaseTransferencia, lnFaseOrigem,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);

Procedure prcFaseDefeito(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);

Procedure prcFaseDefeitoEstornar(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);

Procedure prcFaseDefeitoAndamento(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);

Procedure prcFasePerda(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);

Procedure prcFasePerdaEstornar(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);

Procedure prcFasePerdaAndamento(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);

Function fncFaseValidarQuantidade(sReferencia:String;lnOP,lnFase,lnCor,lnTamanho,lQuantidade:Integer) : Boolean;

Function fncIdentificadorReferencia(sReferencia: String;IDCor, IDTamanho : Integer): String;

Function fncIdentificadorReferenciaTXT(sReferencia, IDCor, IDTamanho : String): String;

Function GetIdentificador(sReferencia: String; IDCor, IDTamanho : Integer): String;

Function RetornaIdentificadorIDCor(sReferencia: String ): Integer;

Function RetornaIdentificadorIDTamanho(sReferencia: String ): Integer;

Function RetornaIdentificadorReferencia(sReferencia: String ): String;

Function RetornaPedidoCliente(nPedido:Integer): Integer;

Function RetornaPedidoVendedor(nPedido:Integer): Integer;

Function RetornaPedidoFormaPagamento(nPedido:Integer): Integer;

Function RetornaPedidoTransportadora(nPedido:Integer): Integer;

Function RetornaPedidoReferenciaNome(nPedido:Integer;sReferencia: String): String;

Function RetornaPedidoferenciaPrecoVenda(nPedido:Integer;sReferencia: String): Real;


Function ExisteTamanho(sTamanho: String): Boolean;

Function ExisteTamanhoGrade(ncodigo: Integer; sTamanho: String): Boolean;

Function ExisteCor(ncodigo, NCOR: Integer): Boolean;

Function ExisteProcessoMaquina(ncodigo, NPROCESSO: Integer): Boolean;

Function ExisteMateriaPrimaTecido(ncodigo: Integer;
  sREFERENCIA: String): Boolean;

Function ExisteMateriaPrima(ncodigo: Integer; REFERENCIA: String): Boolean;

Function OPExisteProduto(ncodigo: Integer; REFERENCIA: String): Boolean;

Function fncPedidoCompraExisteProduto(nlPedido: Integer; REFERENCIA: String): Boolean;

Function fncPedidoVendaExisteProduto(nlPedido: Integer; lsreferencia: String): Boolean;

Function fncPedidoVendaExisteProdutoGrade(nlPedido: Integer; lsreferencia: String): Boolean;

Function ExisteMaquina(ncodigo { ,NMAQUINA } : Integer): Boolean;


Function CustoExternoChecarGrade(ncodigo, NCUSTO: Integer): Boolean;

Function CustoExternoExiste(ncodigo : Integer): Boolean;

Function CustoExternoRetornaNome(nCodigo: Integer): String;

Function CustoExternoRetornaValor(nCodigo: Integer): Real;

Function fncCustoFornecedorRetornaValor(nCodigo: Integer): Real;

Function ExisteCustoProcesso(ncodigo, NCUSTO: Integer): Boolean;

Function BuscaNomeProcesso(ncodigo: Integer): TVariantResultArray;

Function BuscaMateriaPrima(sREFERENCIA, sTIPOPRODUTO: String)
  : TVariantResultArray;

Function BuscaNomeCor(ncodigo: Integer): String;

Function fncBuscaNomeCorGrade(nCodigoProduto,ngradeid,ncor: Integer;wreferencia:String): String;

Function BuscaNomeTamanho(ncodigo: Integer): String;

Function BuscaIDTamanho(sTamanho: String): Integer;

Function BuscaNomeMaquina(ncodigo: Integer): TVariantResultArray;

Function fncBuscaPlanoContasCliente(ncodigo: Integer): String;

Function BuscaNCMPadrao : String;

Function fncDataBase : TDate;

Function fncParamCFOP_VendaUF(slUF :string): Integer;

Function ChecarCreditoCliente(nCliente:Integer) : Boolean;

Function ChecarCreditoDisponivel(nCliente:Integer) : Real;

Function ChecarCreditoUtilizado(nCliente:Integer) : Real;

Function ChecarCreditoSaldo(nCliente:Integer) : Real;

Function BuscaClienteVendedor(nCliente: Integer): Integer;

Function GetClienteFormaPagto(nCliente: Integer): Integer;

Function BuscaClienteTransportadora(nCliente: Integer): Integer;

Function BuscaClienteCentroCusto(nCliente: Integer): Integer;

function fncCliente_Validar(nCliente: Integer): Boolean;

function fncCliente_cnpj(sCNPJ: String): Boolean;

function fncCliente_ID_CNPJ(sCNPJ: String): Integer;


Function fncClienteBuscaCFOP(nCliente: Integer): Integer;

Function fncBuscaClienteEmail(ncodigo: Integer): String;

Function fncBuscaVendedorRegiao(ncodigo: Integer): Integer;

Function BuscaNomeTransportadora(nTransportadora: Integer): String;

Function ExisteGradeCor(ncodigo: Integer): Boolean;
Function ExisteGradeTamanhos(ncodigo: Integer): Boolean;

Function ValidarReferenciaCorTamanho(sReferencia: String): Boolean;
Function ValidaPedido(nCodigo: Integer): Boolean;
Function fncChecarPedidosProduzir : Boolean;
Function fncChecarPeriodoPedidosProduzir(ldtDataIni, dtDataFim : TDate; lncliente, lnvendedor : Integer  ) : Boolean;


Function ValidaPedidoConferenciaProduto(nPedido: Integer; sIdentificador: String): Boolean;
Function ValidaPedidoVendida(nPedido: Integer; sIdentificador: String): integer;

Function ValidaConferenciaRestante(nPedido: Integer; sReferecia, sCor, sTamanho: String): integer;
Function ValidaPedidoRestante(nPedido: Integer; sIdentificador: String): integer;

Function ValidaPedidoConferido(nPedido: Integer; sIdentificador: String): integer;


Function RetornaConferenciaQuantidade(sReferencia,sCor,sTamanho: String): Integer;

Function ValidaPedidoDisponivel(nPedido: Integer; sIdentificador: String): Boolean;

Function RetornaTaxaDolar : Real;
Function RetornaTaxaEuro : Real;

Function BuscaPlanoContasTipo(sPlanoContas: String): String;
Function BuscaPlanoContasID(sPlanoContas: String): Integer;

Function DistribuirReferenciaValor(nCodigo, nPedido: Integer; REFERENCIA: String): Real;
Procedure MateriaPrimaGradeTamanhos(strReferencia : String; nCodigoGrade: Integer);

Function RetornaGradeReferencia(sReferencia: String): Integer;

Function RetornaIDRegistroDiario(sStatusCaixa: String): Integer;

Function PDV_RetornaValorComparar(sTipoPagto, sFormaPagto : String; DataFechamento : TDate  ): Real;
Function PDV_SomaValorCaixa(nEmpresa, nCodigo : Integer; DataAbertura : TDate  ): Real;
Procedure PDV_SalvaValorFechameto(nValor : real  );


///--------------------------------------------------------------------------
///      CFOP
///--------------------------------------------------------------------------
function fnCFOP_VALIDAR(nCFOP: integer): Boolean;
function fnCFOP_UFVALIDAR(nCFOP: integer;UFEmpresa, UFCliente:String): Boolean;
function fnCFOP_NOME(nCFOP: integer): WideString;
function fnCFOP_DETALHE(nCFOP: integer): WideString;
function fnCFOP_FISCO(nCFOP: integer): WideString;
function fnCFOP_REDUCAOICMS(nCFOP: integer): Real;
function fnCFOP_OPERACAO(nCFOP: integer): String;
function fnCFOP_ICMS_CALCULA(nCFOP: integer): Boolean;
function fnCFOP_IPI_CALCULA(nCFOP: integer): Boolean;
function fnCFOP_ISS_CALCULA(nCFOP: integer): Boolean;

///--------------------------------------------------------------------------
///      TABELA DE IMPOSTOS POR ESTADO
///--------------------------------------------------------------------------
function fnUFImposto_VALIDAR(stUF: String): Boolean;
Function fnUFImposto_ICMS_PJ(stUF: String): Real;
Function fnUFImposto_ICMS_PF(stUF: String): Real;
Function fnUFImposto_IPI(stUF: String): Real;
Function fnUFImposto_ISS(stUF: String): Real;
Function fnUFImposto_IR(stUF: String): Real;


Procedure prcViewFaturas(dbQueryView: TFDQuery;nCliente,nNFe:Integer);

Procedure prcRegistrarUltimaVenda(lnCliente:Integer;lsOrigem:String);

Procedure prcProdutoLancaGrade(nPedido:Integer;sReferencia: String);


// --------------------------------------------------------------------------

Var

   TabelaPK_Validar { primaria } , TabelaFK_Validar { estrangeira } ,
   TabelaDiversa, TabelaReset, TabelaMaxCodigo { para uso diverso } ,
   TblVenda, TblCtaReceber, TblCtaPagar, TblCaixa,  TblPedido,
   TblCompra, TblClientes, FTBLOutrasFuncoes,
   TblValidarFuncoes : TFDQuery;

   xTStrings: TStrings;

   Localizado: Boolean;
   tTabelaNome, tTabelaMestre, tTabelaDependente, tCampoMestre,
     tCampoDependente, tVarTemp: String;
   tID: Integer;

implementation

uses Biblioteca, FPrincipal, App.Constantes;

///--------------------------------------------------------------------------
///      CRIAR E DESTRUIR OBJETOS QUERY
///--------------------------------------------------------------------------

//Procedure QueryObjCriar(var tdbQuery);
//begin
//   if (TFDQuery(tdbQuery) <> nil) then
//      FreeAndNil(TFDQuery(tdbQuery));
//
//   TFDQuery(tdbQuery) := TFDQuery.Create(Application);
//   TFDQuery(tdbQuery).Connection := FrmPrincipal.DBConexao;
//   TFDQuery(tdbQuery).Close;
//
//end;

Procedure QueryObjCriar(var aQuery);
begin
   //TFDQuery(aQuery) := TFDQuery.Create(Application);
   TFDQuery(aQuery) := TFDQuery.Create(Application);
   TFDQuery(aQuery).Connection := FrmPrincipal.DBConexao;
   TFDQuery(aQuery).Close;
end;

//Procedure QueryObjLiberar(var tdbQuery);
//begin
//   if TFDQuery(tdbQuery)=Nil then   // se N�O foi criado, nao presseguir.
//      exit;
//
//   TFDQuery(tdbQuery).Close;
//   FreeAndNil(TFDQuery(tdbQuery));
//end;

Procedure QueryObjLiberar(var aQuery);
begin
   if TFDQuery(aQuery)=Nil then   // se N�O foi criado, nao presseguir.
      exit;

   TFDQuery(aQuery).Close;
   TFDQuery(aQuery).Free;
end;

Procedure prcContasReceberDescontato(ncodigo, ncontabanco,ncontacaixa,ncarteira: Integer; stacao: String);
begin
   stacao :=trim(stacao);
   stacao :=UpperCase(stacao);

   QueryObjCriar(TblCtaReceber);
   TblCtaReceber.SQL.Clear;
   TblCtaReceber.SQL.Add(' update FIN_CTARECEBER  set          ');
   TblCtaReceber.SQL.Add('     DESCONTADO=' + QuotedStr(stacao));
   TblCtaReceber.SQL.Add('    ,CONTA_CREDITO=' + inttostr(ncontabanco) );
   TblCtaReceber.SQL.Add('    ,CONTACAIXA=' + inttostr(ncontacaixa) );
   TblCtaReceber.SQL.Add('    ,CARTEIRA=' + inttostr(ncarteira) );
   TblCtaReceber.SQL.Add('      ');
   TblCtaReceber.SQL.Add(' where     ');
   TblCtaReceber.SQL.Add('    EMPRESA=:NEMPRESA     ');
   TblCtaReceber.SQL.Add(' and     ');
   TblCtaReceber.SQL.Add('    CODIGO=:nCODIGO     ');
   TblCtaReceber.ParamByName('NEMPRESA').AsInteger := FSistema.Empresa;
   TblCtaReceber.ParamByName('nCODIGO').AsInteger  := ncodigo;
   TblCtaReceber.ExecSQL;
   QueryObjLiberar(TblCtaReceber);
end;



///--------------------------------------------------------------------------
///
///--------------------------------------------------------------------------

Procedure pContasReceber(ncodigo, ncliente: Integer; acao: String);
begin

   // Criar uma Query virtual
   QueryObjCriar(TblCtaReceber);

   // --------------- BAIXAR CONTAS A RECEBER --------------------------------------
   if acao = 'BAIXAR' then
   begin

      // -----------------------------------------------

      /// baixar contas a receber
      TblCtaReceber.SQL.Clear;
      TblCtaReceber.SQL.Add(' update FIN_CTARECEBER  set          ');

      TblCtaReceber.SQL.Add('    quitado=' + QuotedStr('S'));

      TblCtaReceber.SQL.Add('    ,VALOR_SALDO = (valor - valor_pago)     ');
      TblCtaReceber.SQL.Add('      ');
      TblCtaReceber.SQL.Add(' where     ');
      TblCtaReceber.SQL.Add('    CODIGO=:nCODIGO     ');
      TblCtaReceber.SQL.Add('    and     ');
      TblCtaReceber.SQL.Add('    CLIENTE=:nCLIENTE;     ');

      TblCtaReceber.ParamByName('nCODIGO').AsInteger := ncodigo;
      TblCtaReceber.ParamByName('nCLIENTE').AsInteger := ncliente;

      TblCtaReceber.ExecSQL;


      // -----------------------------------------------

      // -----------------------------------------------
      {
        /// baixar contas a receber
        TblCtaReceber.SQL.Clear;
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');

        TblCtaReceber.ParamByName('nCODIGO').AsInteger  :=nCODIGO;
        TblCtaReceber.ParamByName('nCLIENTE').AsInteger :=nCLIENTE;
        TblCtaReceber.ExecSQL;

        //-----------------------------------------------

        /// baixar contas a receber
        TblCtaReceber.SQL.Clear;
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');

        TblCtaReceber.ParamByName('nCODIGO').AsInteger  :=nCODIGO;
        TblCtaReceber.ParamByName('nCLIENTE').AsInteger :=nCLIENTE;
        TblCtaReceber.ExecSQL;


        //-----------------------------------------------

        /// baixar contas a receber
        TblCtaReceber.SQL.Clear;
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');
        TblCtaReceber.SQL.Add('      ');

        TblCtaReceber.ParamByName('nCODIGO').AsInteger  :=nCODIGO;
        TblCtaReceber.ParamByName('nCLIENTE').AsInteger :=nCLIENTE;
        TblCtaReceber.ExecSQL;
      }

   end;

   // --------------- ESTORNAR CONTAS A RECEBER --------------------------------------
   if acao = 'ESTORNAR' then
   begin

      //
      /// baixar contas a receber
      TblCtaReceber.SQL.Clear;
      TblCtaReceber.SQL.Add(' update FIN_CTARECEBER  set                     ');
      TblCtaReceber.SQL.Add('    /* Quitado=[S]sim */                     ');
      TblCtaReceber.SQL.Add('    quitado        = ' + QuotedStr('N'));
      TblCtaReceber.SQL.Add('    ,data_pagto     = null,                     ');
      TblCtaReceber.SQL.Add('    valor_pago     = 0,                     ');
      TblCtaReceber.SQL.Add('    VALOR_SALDO = 0                     ');
      TblCtaReceber.SQL.Add('                      ');
      TblCtaReceber.SQL.Add(' where                     ');
      TblCtaReceber.SQL.Add('    CODIGO=:nCODIGO                     ');
      TblCtaReceber.SQL.Add('    and                     ');
      TblCtaReceber.SQL.Add('    CLIENTE=:nCLIENTE;                     ');

      TblCtaReceber.ParamByName('nCODIGO').AsInteger := ncodigo;
      TblCtaReceber.ParamByName('nCLIENTE').AsInteger := ncliente;

      TblCtaReceber.ExecSQL;

   end;

   QueryObjLiberar(TblCtaReceber);

end;

///
/// Criar recebimento parcial
///

Procedure pContasReceberBaixaParcial(ncliente, nVendedor: integer;
  nData, nVencimento: TDate; nNotafiscal, nDocumento: String; nNovoValor: Real;
  nPlanoConta: String; nforma_pagto: integer; wAcao: String);
begin

   // Criar uma Query virtual
   QueryObjCriar(TblCtaReceber);

   wAcao := UpperCase(wAcao);

   if (wAcao = 'D') { deletar } then
   begin

      TblCtaReceber.SQL.Clear;
      TblCtaReceber.SQL.Add(' delete from fin_ctareceber                         ');
      TblCtaReceber.SQL.Add(' where                                              ');
      TblCtaReceber.SQL.Add(' data=:data                                         ');
      TblCtaReceber.SQL.Add(' and                                                ');
      TblCtaReceber.SQL.Add(' cliente=:cliente                                   ');
      TblCtaReceber.SQL.Add(' and                                                ');
      TblCtaReceber.SQL.Add(' vendedor=:vendedor                                 ');
      TblCtaReceber.SQL.Add(' and                                                ');
      TblCtaReceber.SQL.Add(' documento=:documento                               ');

      TblCtaReceber.ParamByName('data').AsDate := nData;
      TblCtaReceber.ParamByName('cliente').AsInteger := ncliente;
      TblCtaReceber.ParamByName('vendedor').AsInteger := nVendedor;
      TblCtaReceber.ParamByName('documento').AsString := nDocumento + '-(P)';

      TblCtaReceber.ExecSQL;

      QueryObjLiberar(TblCtaReceber);

      Exit; // nao deixar prosseguir. A��o de exclus�o foi concluida.

   end;

   // -----------------------------------------------
   // -----------------------------------------------
   /// baixar contas a receber
   TblCtaReceber.SQL.Clear;
   TblCtaReceber.SQL.Add     (' insert into fin_ctareceber                         ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' (                                                  ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' cliente,                                           ');
   TblCtaReceber.SQL.Add     (' vendedor,                                          ');
   TblCtaReceber.SQL.Add     (' data,                                              ');
   TblCtaReceber.SQL.Add     (' vencimento,                                        ');
   TblCtaReceber.SQL.Add     (' notafiscal,                                        ');
   TblCtaReceber.SQL.Add     (' documento,                                         ');
   TblCtaReceber.SQL.Add     (' valor,                                             ');
   TblCtaReceber.SQL.Add     (' PLANO_CONTAS,                                         ');
   TblCtaReceber.SQL.Add     (' forma_pagto,                                       ');
   TblCtaReceber.SQL.Add     (' historico,                                         ');
   TblCtaReceber.SQL.Add     (' complementar                                       ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' )                                                  ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' values                                             ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' (                                                  ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' :cliente,                                          ');
   TblCtaReceber.SQL.Add     (' :vendedor,                                         ');
   TblCtaReceber.SQL.Add     (' :data,                                             ');
   TblCtaReceber.SQL.Add     (' :vencimento,                                       ');
   TblCtaReceber.SQL.Add     (' :notafiscal,                                       ');
   TblCtaReceber.SQL.Add     (' :documento,                                        ');
   TblCtaReceber.SQL.Add     (' :valor,                                            ');
   TblCtaReceber.SQL.Add     (' :PLANO_CONTAS,                                        ');
   TblCtaReceber.SQL.Add     (' :forma_pagto,                                      ');
   TblCtaReceber.SQL.Add     (' :historico,                                        ');
   TblCtaReceber.SQL.Add     (' :complementar                                      ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' )                                                  ');

   TblCtaReceber.ParamByName('cliente').AsInteger := ncliente;
   TblCtaReceber.ParamByName('vendedor').AsInteger := nVendedor;
   TblCtaReceber.ParamByName('data').AsDate := nData;
   TblCtaReceber.ParamByName('vencimento').AsDate := nVencimento;
   TblCtaReceber.ParamByName('notafiscal').AsString := nNotafiscal;
   TblCtaReceber.ParamByName('documento').AsString := nDocumento + '-(P)';
   TblCtaReceber.ParamByName('valor').AsFloat := nNovoValor;
   TblCtaReceber.ParamByName('PLANO_CONTAS').AsString := nPlanoConta;
   TblCtaReceber.ParamByName('forma_pagto').AsInteger := nforma_pagto;
   TblCtaReceber.ParamByName('historico').AsString := '(PARCELA COMPLEMENTAR) ' + nDocumento;
   TblCtaReceber.ParamByName('complementar').AsString := 'S';

   TblCtaReceber.ExecSQL;

   QueryObjLiberar(TblCtaReceber);

end;


Procedure pContasPagarBaixaParcial(nfornecedor: integer;
  nData, nVencimento: TDate; nNotafiscal, nDocumento: String; nNovoValor: Real;
  nPlanoConta: String; nforma_pagto: integer; shitorico, wAcao: String);
begin

   // Criar uma Query virtual
   QueryObjCriar(TblCtaReceber);

   wAcao := UpperCase(wAcao);

   if (wAcao = 'D') { deletar } then
   begin

      TblCtaReceber.SQL.Clear;
      TblCtaReceber.SQL.Add(' delete from fin_ctapagar                           ');
      TblCtaReceber.SQL.Add(' where                                              ');
      TblCtaReceber.SQL.Add(' data=:data                                         ');
      TblCtaReceber.SQL.Add(' and                                                ');
      TblCtaReceber.SQL.Add(' fornecedor=:fornecedor                             ');
      TblCtaReceber.SQL.Add(' and                                                ');
      TblCtaReceber.SQL.Add(' documento=:documento                               ');

      TblCtaReceber.ParamByName('data').AsDate := nData;
      TblCtaReceber.ParamByName('fornecedor').AsInteger := nfornecedor;
      TblCtaReceber.ParamByName('documento').AsString := nDocumento;

      TblCtaReceber.ExecSQL;

      QueryObjLiberar(TblCtaReceber);

      Exit; // nao deixar prosseguir. A��o de exclus�o foi concluida.

   end;

   // -----------------------------------------------
   // -----------------------------------------------
   /// baixar contas a receber
   TblCtaReceber.SQL.Clear;
   TblCtaReceber.SQL.Add     (' insert into fin_ctapagar                           ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' (                                                  ');
   TblCtaReceber.SQL.Add     (' empresa,                                           ');
   TblCtaReceber.SQL.Add     (' fornecedor,                                        ');
   TblCtaReceber.SQL.Add     (' data,                                              ');
   TblCtaReceber.SQL.Add     (' vencimento,                                        ');
   TblCtaReceber.SQL.Add     (' notafiscal,                                        ');
   TblCtaReceber.SQL.Add     (' documento,                                         ');
   TblCtaReceber.SQL.Add     (' valor,                                             ');
   TblCtaReceber.SQL.Add     (' PLANO_CONTAS,                                      ');
   TblCtaReceber.SQL.Add     (' forma_pagto,                                       ');
   TblCtaReceber.SQL.Add     (' historico,                                         ');
   TblCtaReceber.SQL.Add     (' complementar                                       ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' )                                                  ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' values                                             ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' (                                                  ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' :empresa,                                          ');
   TblCtaReceber.SQL.Add     (' :fornecedor,                                       ');
   TblCtaReceber.SQL.Add     (' :data,                                             ');
   TblCtaReceber.SQL.Add     (' :vencimento,                                       ');
   TblCtaReceber.SQL.Add     (' :notafiscal,                                       ');
   TblCtaReceber.SQL.Add     (' :documento,                                        ');
   TblCtaReceber.SQL.Add     (' :valor,                                            ');
   TblCtaReceber.SQL.Add     (' :PLANO_CONTAS,                                     ');
   TblCtaReceber.SQL.Add     (' :forma_pagto,                                      ');
   TblCtaReceber.SQL.Add     (' :historico,                                        ');
   TblCtaReceber.SQL.Add     (' :complementar                                      ');
   TblCtaReceber.SQL.Add     ('                                                    ');
   TblCtaReceber.SQL.Add     (' )                                                  ');

   TblCtaReceber.ParamByName('empresa').AsInteger := FSistema.Empresa;
   TblCtaReceber.ParamByName('fornecedor').AsInteger := nfornecedor;
   TblCtaReceber.ParamByName('data').AsDate := nData;
   TblCtaReceber.ParamByName('vencimento').AsDate := nVencimento;
   TblCtaReceber.ParamByName('notafiscal').AsString := nNotafiscal;
   TblCtaReceber.ParamByName('documento').AsString := nDocumento;
   TblCtaReceber.ParamByName('valor').AsFloat := nNovoValor;
   TblCtaReceber.ParamByName('PLANO_CONTAS').AsString := nPlanoConta;
   TblCtaReceber.ParamByName('forma_pagto').AsInteger := nforma_pagto;
   TblCtaReceber.ParamByName('historico').AsString := shitorico;
   TblCtaReceber.ParamByName('complementar').AsString := 'S';

   TblCtaReceber.ExecSQL;

   QueryObjLiberar(TblCtaReceber);

end;


// -----------------------------------------------------------------------------




Procedure pContasReceberLancar(ncliente, nVendedor: integer;
  nData, nVencimento: TDate; nNotafiscal, nDocumento: String; nNovoValor: Real;
  stEspecie, wAcao: String);
begin

   // Criar uma Query virtual
   QueryObjCriar(TblCtaReceber);

   wAcao := UpperCase(wAcao);

   if (wAcao = 'D') { deletar } then
   begin

      TblCtaReceber.SQL.Clear;
      TblCtaReceber.SQL.Add(' delete from fin_ctareceber                         ');
      TblCtaReceber.SQL.Add(' where                                              ');
      TblCtaReceber.SQL.Add(' data=:data                                         ');
      TblCtaReceber.SQL.Add(' and                                                ');
      TblCtaReceber.SQL.Add(' cliente=:cliente                                   ');
      TblCtaReceber.SQL.Add(' and                                                ');
      TblCtaReceber.SQL.Add(' vendedor=:vendedor                                 ');
      TblCtaReceber.SQL.Add(' and                                                ');
      TblCtaReceber.SQL.Add(' documento=:documento                               ');

      TblCtaReceber.ParamByName('data').AsDate := nData;
      TblCtaReceber.ParamByName('cliente').AsInteger := ncliente;
      TblCtaReceber.ParamByName('vendedor').AsInteger := nVendedor;
      TblCtaReceber.ParamByName('documento').AsString := nDocumento + '-(P)';

      TblCtaReceber.ExecSQL;

   end;

   // -----------------------------------------------
   // -----------------------------------------------
   /// baixar contas a receber
   if (wAcao = 'I') { inserir } then
   begin
     TblCtaReceber.SQL.Clear;
     TblCtaReceber.SQL.Add     (' insert into fin_ctareceber                         ');
     TblCtaReceber.SQL.Add     ('                                                    ');
     TblCtaReceber.SQL.Add     (' (                                                  ');
     TblCtaReceber.SQL.Add     ('                                                    ');
     TblCtaReceber.SQL.Add     (' empresa,                                           ');
     TblCtaReceber.SQL.Add     (' cliente,                                           ');
     TblCtaReceber.SQL.Add     (' vendedor,                                          ');
     TblCtaReceber.SQL.Add     (' data,                                              ');
     TblCtaReceber.SQL.Add     (' vencimento,                                        ');
     TblCtaReceber.SQL.Add     (' notafiscal,                                        ');
     TblCtaReceber.SQL.Add     (' documento,                                         ');
     TblCtaReceber.SQL.Add     (' valor,                                             ');
     TblCtaReceber.SQL.Add     (' especie,                                           ');
     TblCtaReceber.SQL.Add     (' historico,                                         ');
     TblCtaReceber.SQL.Add     (' complementar,                                      ');
     TblCtaReceber.SQL.Add     (' quitado                                            ');
     TblCtaReceber.SQL.Add     ('                                                    ');
     TblCtaReceber.SQL.Add     (' )                                                  ');
     TblCtaReceber.SQL.Add     ('                                                    ');
     TblCtaReceber.SQL.Add     (' values                                             ');
     TblCtaReceber.SQL.Add     ('                                                    ');
     TblCtaReceber.SQL.Add     (' (                                                  ');
     TblCtaReceber.SQL.Add     ('                                                    ');
     TblCtaReceber.SQL.Add     (' :empresa,                                           ');
     TblCtaReceber.SQL.Add     (' :cliente,                                          ');
     TblCtaReceber.SQL.Add     (' :vendedor,                                         ');
     TblCtaReceber.SQL.Add     (' :data,                                             ');
     TblCtaReceber.SQL.Add     (' :vencimento,                                       ');
     TblCtaReceber.SQL.Add     (' :notafiscal,                                       ');
     TblCtaReceber.SQL.Add     (' :documento,                                        ');
     TblCtaReceber.SQL.Add     (' :valor,                                            ');
     TblCtaReceber.SQL.Add     (' :especie,                                         ');
     TblCtaReceber.SQL.Add     (' :historico,                                        ');
     TblCtaReceber.SQL.Add     (' :complementar,                                      ');
     TblCtaReceber.SQL.Add     (' :quitado                                           ');
     TblCtaReceber.SQL.Add     ('                                                    ');
     TblCtaReceber.SQL.Add     (' )                                                  ');

     TblCtaReceber.ParamByName('empresa').AsInteger := FSistema.Empresa;
     TblCtaReceber.ParamByName('cliente').AsInteger := ncliente;
     TblCtaReceber.ParamByName('vendedor').AsInteger := nVendedor;
     TblCtaReceber.ParamByName('data').AsDate := nData;
     TblCtaReceber.ParamByName('vencimento').AsDate := nVencimento;
     TblCtaReceber.ParamByName('notafiscal').AsString := nNotafiscal;
     TblCtaReceber.ParamByName('documento').AsString := nDocumento + '-DN';
     TblCtaReceber.ParamByName('valor').AsFloat := nNovoValor;
     TblCtaReceber.ParamByName('especie').AsString := stEspecie;
     TblCtaReceber.ParamByName('historico').AsString := 'Proveniente de PDV: ' + nDocumento;
     TblCtaReceber.ParamByName('complementar').AsString := 'N';
     TblCtaReceber.ParamByName('quitado').AsString := 'S';
     TblCtaReceber.ExecSQL;

   end;


   QueryObjLiberar(TblCtaReceber);

end;

Procedure prcComissaoPagarPedidos(ncliente, nVendedor, nPedido: integer; nValor:Currency;wAcao: String);
begin

   // Criar uma Query virtual
   QueryObjCriar(TblCtaPagar);
   wAcao      := UpperCase(wAcao);

   nvComissao      := StrToFloatDef(GetClienteCampo(nVendedor,'COMISSAO'),0);
   nVlrComissao    := fncGeraPercentual(nValor, nvComissao);

   // -----------------------------------------------
   // -----------------------------------------------
   /// baixar contas a receber
   if (wAcao = 'INCLUIR') { inserir } then
   begin
     TblCtaPagar.SQL.Clear;
     TblCtaPagar.SQL.Add     ('                                             ');
     TblCtaPagar.SQL.Add     ('   insert into FIN_COMISSOES (               ');
     TblCtaPagar.SQL.Add     ('              EMPRESA,                       ');
     TblCtaPagar.SQL.Add     ('              DATA,                          ');
     TblCtaPagar.SQL.Add     ('              VENCIMENTO,                    ');
     TblCtaPagar.SQL.Add     ('              CLIENTE,                       ');
     TblCtaPagar.SQL.Add     ('              VENDEDOR,                      ');
     TblCtaPagar.SQL.Add     ('              NOTAFISCAL,                    ');
     TblCtaPagar.SQL.Add     ('              CONFERENCIA,                   ');
     TblCtaPagar.SQL.Add     ('              PEDIDO,                        ');
     TblCtaPagar.SQL.Add     ('              PEDIDOPARALELO,                ');
     TblCtaPagar.SQL.Add     ('              DOCUMENTO,                     ');
     TblCtaPagar.SQL.Add     ('              FORMA_PAGTO,                   ');
     TblCtaPagar.SQL.Add     ('              CONTACORRENTE,                 ');
     TblCtaPagar.SQL.Add     ('              CONTACAIXA,                    ');
     TblCtaPagar.SQL.Add     ('              DEPARTAMENTO,                  ');
     TblCtaPagar.SQL.Add     ('              PLANO_CONTAS,                  ');
     TblCtaPagar.SQL.Add     ('              ORIGEM,                        ');
     TblCtaPagar.SQL.Add     ('              NATUREZA,                      ');
     TblCtaPagar.SQL.Add     ('              DC,                            ');
     TblCtaPagar.SQL.Add     ('              VALOR_VENDA,                   ');
     TblCtaPagar.SQL.Add     ('              COMISSAO,                      ');
     TblCtaPagar.SQL.Add     ('              VALOR,                         ');
     TblCtaPagar.SQL.Add     ('              QUITADO,                       ');
     TblCtaPagar.SQL.Add     ('              SELECIONADO,                   ');
     TblCtaPagar.SQL.Add     ('              HISTORICO                      ');
     TblCtaPagar.SQL.Add     ('              )                              ');
     TblCtaPagar.SQL.Add     ('      values (                               ');
     TblCtaPagar.SQL.Add     ('             :NEMPRESA,                      ');
     TblCtaPagar.SQL.Add     ('              current_date,                                                                                                                                             ');
     TblCtaPagar.SQL.Add     ('              current_date + 30,                                                                                                                                            ');
     TblCtaPagar.SQL.Add     ('             :NCLIENTE,                                                                                                                                              ');
     TblCtaPagar.SQL.Add     ('             :NVENDEDOR,                                                                                                                                             ');
     TblCtaPagar.SQL.Add     ('             0,                                                                                                                                                      ');
     TblCtaPagar.SQL.Add     ('             (select                  CONFERENCIA                    from PEDIDOS           where  codigo=:NPEDIDO),                                                 ');
     TblCtaPagar.SQL.Add     ('             :NPEDIDO,                                                                                                                                               ');
     TblCtaPagar.SQL.Add     ('             (select                  DOCUMENTO                       from PEDIDOS           where  codigo=:NPEDIDO),                                                 ');
     TblCtaPagar.SQL.Add     (              QuotedStr('PEDIDO-'+IntToStr(nPedido))+','                                                                                                             );
     TblCtaPagar.SQL.Add     ('             (select                  FORMAPAGTO                     from vendas            where  codigo=:NPEDIDO),                                                 ');
     TblCtaPagar.SQL.Add     ('             (select                  CONTACORRENTE                  from CAD_CLIENTES      where  CODIGO=:NCLIENTE),                                                 ');
     TblCtaPagar.SQL.Add     ('             (SELECT FIN_CTAPAG_COMISSAOCONTAC                 FROM CONFIG_PARAMETROS WHERE EMPRESA=:NEMPRESA),                                               ');
     TblCtaPagar.SQL.Add     ('             (SELECT FIN_CTAPAG_COMISSAOCENTRO                 FROM CONFIG_PARAMETROS WHERE EMPRESA=:NEMPRESA),                                               ');
     TblCtaPagar.SQL.Add     ('             (SELECT FIN_CTAPAG_COMISSAOPLANOC                 FROM CONFIG_PARAMETROS WHERE EMPRESA=:NEMPRESA),                                               ');
     TblCtaPagar.SQL.Add     (              QuotedStr('PEDIDO')+','                                                                                                                                 );
     TblCtaPagar.SQL.Add     (              QuotedStr('VENDA')+','                                                                                                                                      );
     TblCtaPagar.SQL.Add     (              QuotedStr('CREDITO')+','                                                                                                                                      );
     TblCtaPagar.SQL.Add     ('             :NVALOR,                                                                                                                                                ');
     TblCtaPagar.SQL.Add     ('             :NCOMISSAO,                                                                                                                                                ');
     TblCtaPagar.SQL.Add     ('             :NVALORCOMISSAO,                                                                                                                                                ');
     TblCtaPagar.SQL.Add     (              QuotedStr('N')+','                                                                                                                                          );
     TblCtaPagar.SQL.Add     (              QuotedStr('N')+','                                                                                                                                           );
     TblCtaPagar.SQL.Add     (              QuotedStr('COMISS�O PROVENIENTE DO PEDIDO:'+IntToStr(nPedido)   )                                                                                  );
     TblCtaPagar.SQL.Add     ('                                                                                                                                                                    ');
     TblCtaPagar.SQL.Add     ('             )                                                                                                                                                      ');

     TblCtaPagar.ParamByName('NEMPRESA').AsInteger  := FSistema.Empresa;
     TblCtaPagar.ParamByName('NCLIENTE').AsInteger  := ncliente;
     TblCtaPagar.ParamByName('NVENDEDOR').AsInteger := nVendedor;
     TblCtaPagar.ParamByName('NPEDIDO').AsInteger   := nPedido;
     TblCtaPagar.ParamByName('NVALOR').AsCurrency   := nValor;
     TblCtaPagar.ParamByName('NCOMISSAO').AsCurrency        := nvComissao;
     TblCtaPagar.ParamByName('NVALORCOMISSAO').AsCurrency   := nVlrComissao;


     //Aviso(TblCtaPagar.SQL.text);

     TblCtaPagar.ExecSQL;


   end;

   if (wAcao = 'DELETAR') { deletar } then
   begin
      TblCtaPagar.SQL.Clear;
      TblCtaPagar.SQL.Add(' delete from FIN_COMISSOES                   ');
      TblCtaPagar.SQL.Add(' where                                       ');
      TblCtaPagar.SQL.Add(' empresa=:NEMPRESA                           ');
      TblCtaPagar.SQL.Add(' and                                         ');
      TblCtaPagar.SQL.Add(' cliente=:NCLIENTE                           ');
      TblCtaPagar.SQL.Add(' and                                         ');
      TblCtaPagar.SQL.Add(' vendedor=:NVENDEDOR                         ');
      TblCtaPagar.SQL.Add(' and                                         ');
      TblCtaPagar.SQL.Add(' pedido=:NPEDIDO                             ');
      TblCtaPagar.ParamByName('NEMPRESA').AsInteger  := FSistema.Empresa;
      TblCtaPagar.ParamByName('NCLIENTE').AsInteger  := ncliente;
      TblCtaPagar.ParamByName('NVENDEDOR').AsInteger := nVendedor;
      TblCtaPagar.ParamByName('NPEDIDO').AsInteger   := nPedido;
      TblCtaPagar.ExecSQL;

   end;

   QueryObjLiberar(TblCtaPagar);

end;

// -----------------------------------------------------------------------------

Function ExisteTamanho(sTamanho: String): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add
     (' select COUNT(tamanho) AS RETORNO from CAD_TAMANHOS');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     TAMANHO=:TAMANHO     ');
   FTBLOutrasFuncoes.ParamByName('TAMANHO').AsString := sTamanho;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;



Function ExisteTamanhoGrade(ncodigo: Integer; sTamanho: String): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select COUNT(tamanho) AS RETORNO from CAD_GRADELISTA');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('      TAMANHO=:TAMANHO     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.ParamByName('TAMANHO').AsString := sTamanho;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function ExisteProcessoMaquina(ncodigo, NPROCESSO: Integer): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add
     (' select COUNT(PROCESSO) AS RETORNO  from CAD_PROCESSO_MAQUINA_DETALHE');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('      PROCESSO=:NPROCESSO     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.ParamByName('NPROCESSO').AsInteger := NPROCESSO;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ExisteMateriaPrimaTecido(ncodigo: Integer;
  sREFERENCIA: String): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add
     (' select COUNT(REFERENCIA) AS RETORNO   from PCP_MATERIAPRIMA_TECIDOS');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString := sREFERENCIA;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ExisteMateriaPrima(ncodigo: Integer; REFERENCIA: String): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add
     (' select COUNT(REFERENCIA) AS RETORNO   from PCP_MATERIAPRIMA');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString := REFERENCIA;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function OPExisteProduto(ncodigo: Integer; REFERENCIA: String): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  select COUNT(REFERENCIA) AS RETORNO   from  PCP_ORDEMPRODUCAO_ITENS');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString := REFERENCIA;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncPedidoCompraExisteProduto(nlPedido: Integer; REFERENCIA: String): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);

   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  select  COUNT(PRODUTO) AS RETORNO    from  COMPRA_PEDIDOS_ITENS');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     EMPRESA=:NEMPRESA     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     PRODUTO=:REFERENCIA     ');
   FTBLOutrasFuncoes.ParamByName('NEMPRESA').AsInteger  := FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger   := nlPedido;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString := REFERENCIA;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncPedidoVendaExisteProduto(nlPedido: Integer; lsreferencia: String): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  select  COUNT(REFERENCIA) AS RETORNO    from  pedidos_itens');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     EMPRESA=:NEMPRESA     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA     ');
   FTBLOutrasFuncoes.ParamByName('NEMPRESA').AsInteger  := FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger   := nlPedido;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString := lsreferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncValidaReferenciaGradeQuantidade(sReferencia: String): Boolean;
begin
   Result := False;
   sReferencia :=UpperCase( Trim(sReferencia) );
   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT SUM(QUANTIDADE) AS RETORNO FROM CAD_PRODUTOS_GRADES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function fncPedidoVendaExisteProdutoGrade(nlPedido: Integer; lsreferencia: String): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  select  COUNT(REFERENCIA) AS RETORNO    from  PEDIDOS_ITENS_GRADE');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     EMPRESA=:NEMPRESA     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA     ');
   FTBLOutrasFuncoes.ParamByName('NEMPRESA').AsInteger  := FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger   := nlPedido;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString := lsreferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ValidaPedidoConferenciaProduto(nPedido: Integer; sIdentificador: String): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  select  COUNT(IDENTIFICADOR) AS RETORNO    from  VIEW_PEDIDOS_VENDIDOS');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA     ');
//   TblOutrasFuncoes.SQL.Add('  and                         ');
//   TblOutrasFuncoes.SQL.Add('  QUANTIDADE>0           ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nPedido;
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString := sIdentificador;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ValidaPedidoRestante(nPedido: Integer; sIdentificador: String): integer;
begin

   Result := 0;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add
     ('  select QTDEVENDIDA, QTDERESTANTE   from  VIEW_PEDIDO_QTDERESTANTE ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     PEDIDO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:IDENTIFICADOR     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nPedido;
   FTBLOutrasFuncoes.ParamByName('IDENTIFICADOR').AsString := sIdentificador;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('QTDERESTANTE').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ValidaConferenciaRestante(nPedido: Integer; sReferecia, sCor, sTamanho: String): integer;
begin

   Result := 0;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  select *   from  VIEW_PEDIDO_QTDERESTANTE ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  AND                         ');
   FTBLOutrasFuncoes.SQL.Add('  REFERENCIA=:REFERENCIA     ');
   FTBLOutrasFuncoes.SQL.Add('  AND                         ');
   FTBLOutrasFuncoes.SQL.Add('  TAMANHO=:TAMANHO     ');
   FTBLOutrasFuncoes.SQL.Add('  AND                         ');
   FTBLOutrasFuncoes.SQL.Add('  COR=:COR     ');


   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nPedido;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString := sReferecia;
   FTBLOutrasFuncoes.ParamByName('COR').AsString := sCor;
   FTBLOutrasFuncoes.ParamByName('TAMANHO').AsString := sTamanho;
   FTBLOutrasFuncoes.Open;

      Result := FTBLOutrasFuncoes.FieldByName('QTDERESTANTE').AsInteger;
   {
   if TblOutrasFuncoes.FieldByName('QTDERESTANTE').AsInteger>0 then
      Result := TblOutrasFuncoes.FieldByName('QTDERESTANTE').AsInteger
   else
      Result := TblOutrasFuncoes.FieldByName('QTDECONFERIDA').AsInteger;
   }


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ValidaPedidoVendida(nPedido: Integer; sIdentificador: String): integer;
begin

   Result := 0;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  select QTDEVENDIDA, QTDERESTANTE   from  VIEW_PEDIDO_QTDERESTANTE ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nPedido;
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString := sIdentificador;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('QTDEVENDIDA').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ValidaPedidoDisponivel(nPedido: Integer; sIdentificador: String): Boolean;
begin
{
   Result := 0;

   // Criar uma Query virtual
   prcQueryCriar(TblOutrasFuncoes);


   TblOutrasFuncoes.SQL.Clear;
   TblOutrasFuncoes.SQL.Add('  select *  from  VIEW_PEDIDO_QTDERESTANTE ');
   TblOutrasFuncoes.SQL.Add('  where                         ');
   TblOutrasFuncoes.SQL.Add('     PEDIDO=:NCODIGO     ');
   TblOutrasFuncoes.SQL.Add('  and                         ');
   TblOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:IDENTIFICADOR     ');
   TblOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nPedido;
   TblOutrasFuncoes.ParamByName('IDENTIFICADOR').AsString := sIdentificador;
   TblOutrasFuncoes.Open;

   Result := TblOutrasFuncoes.FieldByName('QTDERESTANTE').AsInteger>0;


   prcQueryDeletar(TblOutrasFuncoes);
}

end;


Function ExisteMaquina(ncodigo { ,NMAQUINA } : Integer): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add
     (' select COUNT(ID_MAQUINA) AS RETORNO   from PCP_MAQUINAS ');
   FTBLOutrasFuncoes.SQL.Add('where');
   FTBLOutrasFuncoes.SQL.Add(' ID_MAQUINA=:ID_MAQUINA');
   FTBLOutrasFuncoes.ParamByName('ID_MAQUINA').AsInteger := ncodigo;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function CustoExternoChecarGrade(ncodigo, NCUSTO: Integer): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select COUNT(CODIGOCUSTO) AS RETORNO   from PCP_CUSTOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('      CODIGOCUSTO=:NCUSTO     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.ParamByName('NCUSTO').AsInteger := NCUSTO;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function CustoExternoExiste(ncodigo : Integer): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select COUNT(CODIGO) AS RETORNO   from TPRECOSERVICO ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function CustoExternoRetornaNome(nCodigo: Integer): String;
begin

   Result :='';

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM TPRECOSERVICO ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                 ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger :=  nCodigo;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('NOME').AsString;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function CustoExternoRetornaValor(nCodigo: Integer): Real;
begin

   Result :=0;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM TPRECOSERVICO ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                 ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger :=  nCodigo;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('VLR_UNIT').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncCustoFornecedorRetornaValor(nCodigo: Integer): Real;
begin

   Result :=0;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                 ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger :=  nCodigo;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('VALOR_SERVICOS').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function ExisteCustoProcesso(ncodigo, NCUSTO: Integer): Boolean;
begin

   Result := False;

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select COUNT(ID_PROCESSO) AS RETORNO   from PCP_PROCESSOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('      ID_PROCESSO=:ID_PROCESSO     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.ParamByName('ID_PROCESSO').AsInteger := NCUSTO;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function fncIdentificadorReferencia(sReferencia: String; IDCor, IDTamanho : Integer): String;
begin

   Result :='';
   sReferencia :=UpperCase( Trim(sReferencia) );

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);

   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM  VIEW_CADPRODUTOS_GRADES ');
   FTBLOutrasFuncoes.SQL.Add('  Where                          ');
   FTBLOutrasFuncoes.SQL.Add('  REFERENCIA=:REFERENCIA        ');
   FTBLOutrasFuncoes.SQL.Add('  AND        ');
   FTBLOutrasFuncoes.SQL.Add('  COR_ID=:IDCOR    ');
   FTBLOutrasFuncoes.SQL.Add('  AND        ');
   FTBLOutrasFuncoes.SQL.Add('  TAMANHO_ID=:IDTAMANHO    ');

   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('IDCOR').AsInteger     :=  IDCor;
   FTBLOutrasFuncoes.ParamByName('IDTAMANHO').AsInteger :=  IDTamanho;
   FTBLOutrasFuncoes.Open;

   Result := TRIM(FTBLOutrasFuncoes.FieldByName('IDENTIFICADOR').AsString);


   QueryObjLiberar(FTBLOutrasFuncoes);


end;

Function fncIdentificadorReferenciaTXT(sReferencia, IDCor, IDTamanho : String): String;
begin

   Result :='';
   sReferencia :=UpperCase( Trim(sReferencia) );

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);

   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM  VIEW_CADPRODUTOS_GRADES ');
   FTBLOutrasFuncoes.SQL.Add('  Where                          ');
   FTBLOutrasFuncoes.SQL.Add('  REFERENCIA=:SREFERENCIA        ');
   FTBLOutrasFuncoes.SQL.Add('  AND        ');
   FTBLOutrasFuncoes.SQL.Add('  COR LIKE :SCOR    ');
   FTBLOutrasFuncoes.SQL.Add('  AND        ');
   FTBLOutrasFuncoes.SQL.Add('  TAMANHO=:STAMANHO    ');

   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('SCOR').AsString        :=  copy(IDCor,1,29)+'%';
   FTBLOutrasFuncoes.ParamByName('STAMANHO').AsString    :=  IDTamanho;
   FTBLOutrasFuncoes.Open;

   Result := TRIM(FTBLOutrasFuncoes.FieldByName('IDENTIFICADOR').AsString);


   QueryObjLiberar(FTBLOutrasFuncoes);


end;

Function GetIdentificador(sReferencia: String; IDCor, IDTamanho : Integer): String;
begin
   try
     sReferencia :=UpperCase( Trim(sReferencia) );
     QueryObjCriar(FTBLOutrasFuncoes);
     FTBLOutrasFuncoes.SQL.Clear;
     FTBLOutrasFuncoes.SQL.Add('  SELECT IDENTIFICADOR FROM SP_IDENTIFICADOR(:SREFERENCIA, :IDCOR, :IDTAMANHO ) AS IDENTIFICADOR ');
     //FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString :=  QuotedStr(sReferencia);
     FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString :=  sReferencia;
     FTBLOutrasFuncoes.ParamByName('IDCOR').AsInteger      :=  IDCor;
     FTBLOutrasFuncoes.ParamByName('IDTAMANHO').AsInteger  :=  IDTamanho;
     FTBLOutrasFuncoes.Open;
     Result := TRIM(FTBLOutrasFuncoes.FieldByName('IDENTIFICADOR').AsString);
   finally
     QueryObjLiberar(FTBLOutrasFuncoes);
   end;
end;


Function RetornaIdentificadorIDCor(sReferencia: String ): Integer;
begin

   Result :=0;
   sReferencia :=UpperCase( Trim(sReferencia) );

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM VIEW_GRADEREFERENCIA ');
   FTBLOutrasFuncoes.SQL.Add('  Where                          ');
   FTBLOutrasFuncoes.SQL.Add('  IDENTIFICADOR=:IDENTIFICADOR        ');

   FTBLOutrasFuncoes.ParamByName('IDENTIFICADOR').AsString :=   sReferencia;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('COR_CODIGO').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);


end;


Function RetornaIdentificadorReferencia(sReferencia: String ): String;
begin

   Result :='';
   sReferencia :=UpperCase( Trim(sReferencia) );

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM VIEW_CADPRODUTOS_GRADES ');
   FTBLOutrasFuncoes.SQL.Add('  Where                          ');
   FTBLOutrasFuncoes.SQL.Add('  IDENTIFICADOR=:IDENTIFICADOR        ');

   FTBLOutrasFuncoes.ParamByName('IDENTIFICADOR').AsString :=   sReferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('REFERENCIA').AsString>'' then
      Result := FTBLOutrasFuncoes.FieldByName('REFERENCIA').AsString
   else
      Result := sReferencia;

   QueryObjLiberar(FTBLOutrasFuncoes);


end;

Function RetornaIdentificadorIDTamanho(sReferencia: String ): Integer;
begin

   Result :=0;
   sReferencia :=UpperCase( Trim(sReferencia) );

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM VIEW_GRADEREFERENCIA ');
   FTBLOutrasFuncoes.SQL.Add('  Where                          ');
   FTBLOutrasFuncoes.SQL.Add('  IDENTIFICADOR=:IDENTIFICADOR        ');

   FTBLOutrasFuncoes.ParamByName('IDENTIFICADOR').AsString :=   sReferencia;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('TAMANHO_CODIGO').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);


end;

Function ValidaReferencia(sReferencia: String): Boolean;
begin

   Result := False;

   sReferencia :=UpperCase( Trim(sReferencia) );

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM CAD_PRODUTOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;



   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncValidaReferenciaGrade(sReferencia: String): Boolean;
begin
   Result := False;
   sReferencia :=UpperCase( Trim(sReferencia) );
   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM VIEW_CADPRODUTOS_GRADES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncValidaAndamentoReferenciaGrade(lnOrdemProducao:integer;sReferencia: String): Boolean;
begin
   Result := False;
   sReferencia :=UpperCase( Trim(sReferencia) );
   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM PCP_ORDEMPRODUCAO_ANDAMENTO ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function fncValidaReferenciaQuantidadeGrade(sReferencia: String): Boolean;
begin
   Result := False;
   sReferencia :=UpperCase( Trim(sReferencia) );
   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM CAD_PRODUTOS_GRADES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncValidaReferenciaQuantidadeGradeQualidade(sReferencia: String): Boolean;
begin
   Result := False;
   sReferencia :=UpperCase( Trim(sReferencia) );
   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM CAD_PRODUTOS_GRADESQUALIDADES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function fncValidaAndamentoReferenciaGradeQualidade(sReferencia: String): Boolean;
begin
   Result := False;
   sReferencia :=UpperCase( Trim(sReferencia) );
   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM CAD_PRODUTOS_GRADESQUALIDADES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function RetornaReferenciaCodigoID(sReferencia: String): Integer;
begin
   Result :=0;

   sReferencia :=UpperCase( Trim(sReferencia) );

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_PRODUTOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     EMPRESA=:EMPRESA    ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger   :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('CODIGO').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function fncReferenciaNome(sReferencia: String): String;
begin
   Result :='';

   sReferencia :=UpperCase( Trim(sReferencia) );

   // Criar uma Query virtual
   QueryObjCriar(FTBLOutrasFuncoes);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_PRODUTOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   Result :=TRIM(FTBLOutrasFuncoes.FieldByName('DESCRICAO').AsString);

   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function RetornaReferenciaReduzido(sReferencia: String): String;
Var
  svarReferencia  : String;
begin
   Result         :='';
   sReferencia    :=UpperCase( Trim(sReferencia) );
   svarReferencia :=GetProdutoCampo(strReferencia,'REFERENCIAREDUZIDA');
   Result         :=  IfThen(svarReferencia<>'',svarReferencia,GetProdutoCampo(strReferencia,'REFERENCIA'));
end;

Function RetornaReferenciaNomeReduzido(sReferencia: String): String;
Var
  svarDescricao  : String;
begin
   Result         := '';
   sReferencia    := UpperCase( Trim(sReferencia) );
   svarDescricao  := GetProdutoCampo(strReferencia,'DESCRICAOREDUZIDA');
   Result         := IfThen(svarDescricao<>'',svarDescricao,GetProdutoCampo(strReferencia,'DESCRICAO'));
end;



Function RetornaReferenciaPrecoVenda(sReferencia: String): Real;
begin

   Result :=0;
   sReferencia :=UpperCase( Trim(sReferencia) );
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_PRODUTOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;
   Result :=FTBLOutrasFuncoes.FieldByName('PRC_VENDA').AsFloat;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ValidaReferenciaTabela(nTabela:Integer;sReferencia: String): Boolean;
begin

   Result := False;

   sReferencia :=UpperCase( Trim(sReferencia) );

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM TPRECO_REFERENCIAS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.SQL.Add('  AND                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA    ');

   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger   :=  nTabela;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;



   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function RetornaReferenciaPrecoTabela(nTabela:Integer;sReferencia: String): Real;
begin
   Result :=0;
   sReferencia :=UpperCase( Trim(sReferencia) );
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM TPRECO_REFERENCIAS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.SQL.Add('  AND                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger   :=  nTabela;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;
   Result :=FTBLOutrasFuncoes.FieldByName('PRC_VENDA').AsFloat;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function RetornaTaxaDolar : Real;
begin
   Result :=0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM FIN_COTACAOMOEDA ');
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('DOLAR').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function RetornaTaxaEuro : Real;
begin
   Result :=0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM FIN_COTACAOMOEDA ');
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('EURO').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function fncReferenciaPrecoCusto(sReferencia: String): Real;
begin

   Result :=0;
   sReferencia :=UpperCase( Trim(sReferencia) );
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_PRODUTOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;
   Result :=FTBLOutrasFuncoes.FieldByName('PRC_CUSTO').AsFloat;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function RetornaPedidoReferenciaNome(nPedido:Integer;sReferencia: String): String;
begin
   Result :='';

   sReferencia :=UpperCase( Trim(sReferencia) );

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM PEDIDOS_ITENS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('  REFERENCIA=:REFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger :=  nPedido;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   Result :=TRIM(FTBLOutrasFuncoes.FieldByName('DESCRICAO').AsString);


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function RetornaPedidoferenciaPrecoVenda(nPedido:Integer;sReferencia: String): Real;
begin
   Result :=0;

   sReferencia :=UpperCase( Trim(sReferencia) );

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM PEDIDOS_ITENS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('  REFERENCIA=:REFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger :=  nPedido;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('VLR_UNIT').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function RetornaPedidoCliente(nPedido:Integer): Integer;
begin
   Result :=0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM PEDIDOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger :=  nPedido;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('CLIENTE').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function RetornaPedidoVendedor(nPedido:Integer): Integer;
begin
   Result :=0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM PEDIDOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger :=  nPedido;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('VENDEDOR').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function RetornaPedidoFormaPagamento(nPedido:Integer): Integer;
begin
   Result :=0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM PEDIDOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger :=  nPedido;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('FORMAPAGTO').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function RetornaPedidoTransportadora(nPedido:Integer): Integer;
begin
   Result :=0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM PEDIDOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger :=  nPedido;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('TRANSPORTADORA').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ValidarReferenciaProducao(nOrdemProucao:Integer;sReferencia: String): Boolean;
begin

   Result := False;

   sReferencia :=UpperCase( Trim(sReferencia) );

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM PCP_ORDEMPRODUCAO_ITENS ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('     ORDEMPRODUCAO=:CODIGO             ');
   FTBLOutrasFuncoes.SQL.Add('  AND                           ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA     ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nOrdemProucao;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncOrdemProducaoSomar(nOrdemProucao:Integer): Real;
begin

   Result := 0;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT SUM(QUANTIDADE) AS QUANTIDADE FROM PCP_ORDEMPRODUCAO_ITENS ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('     EMPRESA=:EMPRESA             ');
   FTBLOutrasFuncoes.SQL.Add('  AND                           ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO             ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger   :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nOrdemProucao;
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('QUANTIDADE').AsFloat;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function ValidarOrdemProducao(nOrdemProucao:Integer): Boolean;
begin

   Result := False;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM PCP_ORDEMPRODUCAO ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO             ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nOrdemProucao;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncOrdemProducaoEncerrado(nOrdemProucao:Integer): Boolean;
begin

   Result := False;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM PCP_ORDEMPRODUCAO ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                            ');
   FTBLOutrasFuncoes.SQL.Add('     EMPRESA=:EMPRESA              ');
   FTBLOutrasFuncoes.SQL.Add('  AND                              ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO                ');
    FTBLOutrasFuncoes.SQL.Add('  AND                             ');
   FTBLOutrasFuncoes.SQL.Add('     ENCERRADO IN (''S'',''SIM'')  ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger   :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nOrdemProucao;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function ValidarOrdemProducaoAutorizada(nOrdemProucao:Integer): Boolean;
begin

   Result := False;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM PCP_ORDEMPRODUCAO  ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                            ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO                ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nOrdemProucao;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('AUTORIZADO').AsString='S' then
   begin
      Result := True;
   end;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function ValidarDistribuicaoRemessa(nRemessa:Integer): Boolean;
begin

   Result := False;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM PCP_DISTRIBUIR ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO             ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nRemessa;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function RetornaDistribuicaoOrdemProducao(nRemessa:Integer): Integer;
begin

   Result := 0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM PCP_DISTRIBUIR ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO             ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nRemessa;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('ORDEMPRODUCAO').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function RetornaDistribuicaoTerceirizado(nRemessa:Integer): Integer;
begin

   Result := 0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM PCP_DISTRIBUIR ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO             ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nRemessa;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('FORNECEDOR').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ValidarStatusOrdemProducao(nOrdemProucao:Integer): Boolean;
begin

   Result := False;
   QueryObjCriar(FTBLOutrasFuncoes);

   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM PCP_ORDEMPRODUCAO  ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                            ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO                ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nOrdemProucao;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('ENCERRADO').AsString='S' then
   begin
      Result := True;
   end;

   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Procedure ProducaoTransfereFase(lOficina,lnOP,lnFaseTransferencia, lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer;blultimafase:boolean);
begin

   QueryObjCriar(FTBLOutrasFuncoes);

   if lQuantidade=Null then
      lQuantidade:=0;

   // Atualizar Fase Destino
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET   ');
   FTBLOutrasFuncoes.SQL.Add(' TERCEIRIZADO=:NTERCEIRIZADO,             ');
   FTBLOutrasFuncoes.SQL.Add(' FASETRANSFERENCIA=:NFASETRANSF,   ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIR=QTDE_PRODUZIR+:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' ,QTDE_TRANSFERIDA=QTDE_TRANSFERIDA+:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEDESTINO                   ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger       :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger        :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString     :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEDESTINO').AsInteger   :=  lnFaseDestino;
   FTBLOutrasFuncoes.ParamByName('NTERCEIRIZADO').AsInteger :=  lOficina;
   FTBLOutrasFuncoes.ParamByName('NFASETRANSF').AsInteger   :=  lnFaseTransferencia;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger   :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger       :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger   :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;

   // Atualizar Fase Origem
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');

   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIR=QTDE_PRODUZIR-:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' ,QTDE_TRANSFERIDA=QTDE_TRANSFERIDA-:NQUANTIDADE ');

   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEORIGEM                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEORIGEM').AsInteger   :=  lnFaseOrigem;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;

   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Procedure prcFaseAndamentoTransferirEstoque(lOficina,lnOP,lnFaseTransferencia, lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);
begin

   QueryObjCriar(FTBLOutrasFuncoes);

   if lQuantidade=Null then
      lQuantidade:=0;

   // Atualizar Fase Origem
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIR=QTDE_PRODUZIR-:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEORIGEM                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEORIGEM').AsInteger   :=  lnFaseOrigem;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;

      // Atualizar PCP_ORDEMPRODUCAO_MOVIMENTO
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_MOVIMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIDA=QTDE_PRODUZIDA+:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;

   // Atualizar PCP_ORDEMPRODUCAO_MOVIMENTO
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_MOVIMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_RESTANTE=QTDE_RESTANTE-:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;

   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Procedure prcFaseAndamentoBaixar(lnFaseTransferencia, lnFaseOrigem,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);
begin

   QueryObjCriar(FTBLOutrasFuncoes);

   if lQuantidade=Null then
      lQuantidade:=0;

   // Atualizar Fase Destino
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_FASETRANSFERENCIA_ITENS   SET   ');
   FTBLOutrasFuncoes.SQL.Add(' FASECONCLUIDA=''S''                 ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEORIGEM                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger       :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger        :=  lnFaseTransferencia;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString     :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEORIGEM').AsInteger    :=  lnFaseOrigem;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger       :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger   :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Procedure prcFaseDefeito(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);
begin

   QueryObjCriar(FTBLOutrasFuncoes);

   if lQuantidade=Null then
      lQuantidade:=0;

   // Atualizar Fase Destino
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_DEFEITO=QTDE_DEFEITO+:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEDESTINO                   ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEDESTINO').AsInteger  :=  lnFaseDestino;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;

   // Atualizar Fase Origem
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIR=QTDE_PRODUZIR-:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEORIGEM                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEORIGEM').AsInteger   :=  lnFaseOrigem;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Procedure prcFaseDefeitoEstornar(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);
begin

   QueryObjCriar(FTBLOutrasFuncoes);

   if lQuantidade=Null then
      lQuantidade:=0;

   // Atualizar Fase Destino
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_DEFEITO=QTDE_DEFEITO-:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEDESTINO                   ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEDESTINO').AsInteger  :=  lnFaseDestino;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;

   // Atualizar Fase Origem
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIR=QTDE_PRODUZIR+:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEORIGEM                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEORIGEM').AsInteger   :=  lnFaseOrigem;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;


   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Procedure prcFaseDefeitoAndamento(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);
begin

   QueryObjCriar(FTBLOutrasFuncoes);

   if lQuantidade=Null then
      lQuantidade:=0;

   // Atualizar Fase Destino
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_DEFEITO=:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEDESTINO                   ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEDESTINO').AsInteger  :=  lnFaseDestino;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;


   // Atualizar Fase Origem
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIR=QTDE_PRODUZIR-:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEORIGEM                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEORIGEM').AsInteger   :=  lnFaseOrigem;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Procedure prcFasePerda(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);
begin

   QueryObjCriar(FTBLOutrasFuncoes);

   if lQuantidade=Null then
      lQuantidade:=0;

   // Atualizar Fase Destino
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PERDA=QTDE_PERDA+:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEDESTINO                   ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEDESTINO').AsInteger  :=  lnFaseDestino;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;

   // Atualizar Fase Origem
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIR=QTDE_PRODUZIR-:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEORIGEM                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEORIGEM').AsInteger   :=  lnFaseOrigem;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Procedure prcFasePerdaEstornar(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);
begin

   QueryObjCriar(FTBLOutrasFuncoes);

   if lQuantidade=Null then
      lQuantidade:=0;

   // Atualizar Fase Destino
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PERDA=QTDE_PERDA-:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEDESTINO                   ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEDESTINO').AsInteger  :=  lnFaseDestino;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;

   // Atualizar Fase Origem
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIR=QTDE_PRODUZIR+:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEORIGEM                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEORIGEM').AsInteger   :=  lnFaseOrigem;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Procedure prcFasePerdaAndamento(lnOP,lnFaseOrigem,lnFaseDestino,lnCor,lnTamanho:Integer;sReferencia:String;lQuantidade:Integer);
begin

   QueryObjCriar(FTBLOutrasFuncoes);

   if lQuantidade=Null then
      lQuantidade:=0;

   // Atualizar Fase Destino
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PERDA=:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEDESTINO                   ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEDESTINO').AsInteger  :=  lnFaseDestino;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;


   // Atualizar Fase Origem
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE PCP_ORDEMPRODUCAO_ANDAMENTO SET  ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIR=QTDE_PRODUZIR-:NQUANTIDADE ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASEORIGEM                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASEORIGEM').AsInteger   :=  lnFaseOrigem;
   FTBLOutrasFuncoes.ParamByName('NQUANTIDADE').AsInteger  :=  lQuantidade;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.ExecSQL;
   FTBLOutrasFuncoes.Close;

   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function fncFaseValidarQuantidade(sReferencia:String;lnOP,lnFase,lnCor,lnTamanho,lQuantidade:Integer) : Boolean;
begin

   Result :=False;

   QueryObjCriar(FTBLOutrasFuncoes);

   if lQuantidade=Null then
      lQuantidade:=0;

   // Atualizar Fase Destino
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT QTDE_PRODUZIR   ');
   FTBLOutrasFuncoes.SQL.Add(' FROM PCP_ORDEMPRODUCAO_ANDAMENTO ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                               ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO                      ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' REFERENCIA=:REFERENCIA              ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' FASE=:FASE                          ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID=:NCOR_ID                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID=:NTAMANHO_ID             ');
   FTBLOutrasFuncoes.SQL.Add(' AND                                 ');
   FTBLOutrasFuncoes.SQL.Add(' QTDE_PRODUZIR>0                     ');



   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger      :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger       :=  lnOP;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.ParamByName('FASE').AsInteger         :=  lnFase;
   FTBLOutrasFuncoes.ParamByName('NCOR_ID').AsInteger      :=  lnCor;
   FTBLOutrasFuncoes.ParamByName('NTAMANHO_ID').AsInteger  :=  lnTamanho;
   FTBLOutrasFuncoes.Open;

   // se a quantidade digitada for maior que a disponivel, retornar como "True"
   if lQuantidade>FTBLOutrasFuncoes.FieldByName('QTDE_PRODUZIR').AsInteger then
      Result :=True;

   FTBLOutrasFuncoes.Close;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function RetornaReferenciaQuantidade(sReferencia: String): Real;
begin
   Result :=0;

   sReferencia :=UpperCase( Trim(sReferencia) );

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_PRODUTOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('ESTOQUESALDO').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function GetUltimoCodProduto(): Integer;
begin
   Result :=0;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT FIRST 1 CODIGO FROM CAD_PRODUTOS ORDER BY CODIGO DESC');
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('CODIGO').AsInteger + 1;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function GetProdutoCampo(sReferencia,slCampo:String): String;
begin
   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM CAD_PRODUTOS  ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;
   Result := Trim(FTBLOutrasFuncoes.FieldByName(slCampo).AsString);
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function GetNCMCEST(aNCM:String): String;
begin

   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT CEST FROM CAD_NCM  ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CNSM    ');
   FTBLOutrasFuncoes.ParamByName('CNSM').AsString :=  aNCM;
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName('CEST').AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function fncProdutoGrade_retCampo(sReferencia,slCampo:String): String;
begin

   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM CAD_PRODUTOS_GRADES  ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:IDENTIFICADOR    ');
   FTBLOutrasFuncoes.ParamByName('IDENTIFICADOR').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName(slCampo).AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function prcOrdemProducao_retCampo(lnOrdemProducao:integer;slCampo:String) : String;
begin

   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM PCP_ORDEMPRODUCAO  ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                         ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger  :=  lnOrdemProducao;
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName(slCampo).AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function prcOrdemProducaoAndamento_retCampo(lnOrdemProducao:integer;slIdentificador,slCampo:String) : String;
begin
   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM PCP_ORDEMPRODUCAO_ANDAMENTO  ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                         ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                         ');
   FTBLOutrasFuncoes.SQL.Add(' IDENTIFICADOR=:IDENTIFICADOR    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                         ');
   FTBLOutrasFuncoes.SQL.Add(' COR_ID>0                    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                         ');
   FTBLOutrasFuncoes.SQL.Add(' TAMANHO_ID>0                ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger       :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger        :=  lnOrdemProducao;
   //FTBLOutrasFuncoes.ParamByName('IDENTIFICADOR').AsString  :=  QuotedStr(slIdentificador);
   FTBLOutrasFuncoes.ParamByName('IDENTIFICADOR').AsString  :=  slIdentificador;
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName(slCampo).AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Procedure GetParametros;
begin

   if FParametros=nil then
     FParametros := TParametros.Create;

   QueryObjCriar(FTBLOutrasFuncoes);
   Try
      FTBLOutrasFuncoes.SQL.Clear;
      FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM CONFIG_PARAMETROS  ');
      FTBLOutrasFuncoes.SQL.Add(' WHERE                         ');
      FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA    ');
      FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger :=  FSistema.Empresa;
      FTBLOutrasFuncoes.Open;

      FParametros.Empresa.Codigo                              := FTBLOutrasFuncoes.FieldByName('EMPRESA').AsInteger;
      FParametros.Empresa.DataAtividade                       := FTBLOutrasFuncoes.FieldByName('INF_DATABASE').AsDateTime;
      FParametros.Empresa.Nome                                := FTBLOutrasFuncoes.FieldByName('NOME').AsString;
      FParametros.Empresa.NomeFantasia                        := FTBLOutrasFuncoes.FieldByName('NOMEFANTASIA').AsString;
      FParametros.Empresa.CNPJ                                := FTBLOutrasFuncoes.FieldByName('CNPJ').AsString;
      FParametros.Empresa.IE                                  := FTBLOutrasFuncoes.FieldByName('IE').AsString;
      FParametros.Empresa.IEmunicipal                         := FTBLOutrasFuncoes.FieldByName('IEMUNICIPAL').AsString;
      FParametros.Empresa.Endereco                            := FTBLOutrasFuncoes.FieldByName('ENDERECO').AsString;
      FParametros.Empresa.Numero                              := FTBLOutrasFuncoes.FieldByName('NUMERO').AsString;
      FParametros.Empresa.Bairro                              := FTBLOutrasFuncoes.FieldByName('BAIRRO').AsString;
      FParametros.Empresa.Complemento                         := FTBLOutrasFuncoes.FieldByName('COMPLEMENTO').AsString;
      FParametros.Empresa.Cep                                 := FTBLOutrasFuncoes.FieldByName('CEP').AsString;
      FParametros.Empresa.Fone                                := FTBLOutrasFuncoes.FieldByName('FONE').AsString;
      FParametros.Empresa.Fax                                 := FTBLOutrasFuncoes.FieldByName('FAX').AsString;
      FParametros.Empresa.Email                               := FTBLOutrasFuncoes.FieldByName('EMAIL').AsString;
      FParametros.Empresa.Site                                := FTBLOutrasFuncoes.FieldByName('SITE').AsString;
      FParametros.Empresa.Contato                             := FTBLOutrasFuncoes.FieldByName('CONTATO').AsString;
      FParametros.Empresa.IDCIDADE                            := FTBLOutrasFuncoes.FieldByName('IDCIDADE').AsInteger;
      FParametros.Empresa.IDUF                                := FTBLOutrasFuncoes.FieldByName('IDUF').AsInteger;
      FParametros.Empresa.Cidade                              := FTBLOutrasFuncoes.FieldByName('CIDADE').AsString;
      FParametros.Empresa.UF                                  := FTBLOutrasFuncoes.FieldByName('UF').AsString;
      FParametros.Empresa.CodigoPais                          := FTBLOutrasFuncoes.FieldByName('IDPAIS').AsInteger;
      FParametros.Empresa.NomePais                            := FTBLOutrasFuncoes.FieldByName('NOMEPAIS').AsString;
      FParametros.Empresa.REGIME_TRIB                         := FTBLOutrasFuncoes.FieldByName('REGIME_TRIB').AsInteger;
      FParametros.Empresa.REGIME_TRIBALIQ                     := FTBLOutrasFuncoes.FieldByName('REGIME_TRIBALIQUOT').AsFloat;

      FParametros.Produto.Codificacao                         := FTBLOutrasFuncoes.FieldByName('CODIFICACAO').AsString;
      FParametros.Produto.Separador                           := FTBLOutrasFuncoes.FieldByName('SEPARADOR').AsString;
      FParametros.Produto.Grupo                               := FTBLOutrasFuncoes.FieldByName('GRUPO').AsInteger;
      FParametros.Produto.Subgrupo                            := FTBLOutrasFuncoes.FieldByName('SUBGRUPO').AsInteger;
      FParametros.Produto.Produto                             := FTBLOutrasFuncoes.FieldByName('PRODUTO').AsInteger;
      FParametros.Produto.EstoqueNegativo                     := FTBLOutrasFuncoes.FieldByName('ESTOQUENEGATIVO').AsString;
      FParametros.Produto.SituacaoTributaria                  := FTBLOutrasFuncoes.FieldByName('SIT_TRIB').AsString;
      FParametros.Produto.NCM                                 := FTBLOutrasFuncoes.FieldByName('NCM_PADRAO').AsString;

      FParametros.Producao.QualidadePadrao                    := FTBLOutrasFuncoes.FieldByName('QUALIDADE_PADRAO').AsInteger;
      FParametros.Producao.PRODUCAO_FINALIZAR                  := FTBLOutrasFuncoes.FieldByName('PRODUCAO_FINALIZAR').AsString;

      FParametros.Financeiro.Juros                            := FTBLOutrasFuncoes.FieldByName('FIN_JUROS').AsFloat;
      FParametros.Financeiro.Cartorio                         := FTBLOutrasFuncoes.FieldByName('FIN_CARTORIO').AsFloat;
      FParametros.Financeiro.CobrancaDias                     := FTBLOutrasFuncoes.FieldByName('FIN_COBDIAS').AsInteger;
      FParametros.Financeiro.VendaVistaBaixar                 := FTBLOutrasFuncoes.FieldByName('FIN_VENDAVISTABAIXAR').AsString;
      FParametros.Financeiro.DiasBloqueio                     := FTBLOutrasFuncoes.FieldByName('FIN_DIASBLOQUEAR').AsInteger;
      FParametros.Financeiro.PagarLancarCaixa                 := FTBLOutrasFuncoes.FieldByName('FIN_CTAPAG_LANCCX').AsString;
      FParametros.Financeiro.PagarLancarBanco                 := FTBLOutrasFuncoes.FieldByName('FIN_CTAPAG_LANCBCO').AsString;
      FParametros.Financeiro.PagarComissao                    := FTBLOutrasFuncoes.FieldByName('FIN_CTAPAG_COMISSAO').AsString;
      FParametros.Financeiro.PagarContaCaixa                  := FTBLOutrasFuncoes.FieldByName('FIN_CTAPAG_CONTACX').AsInteger;
      FParametros.Financeiro.PagarPlanoContas                 := FTBLOutrasFuncoes.FieldByName('FIN_CTAPAG_PLANOCTA').AsString;
      FParametros.Financeiro.PagarComissaoVencimento          := FTBLOutrasFuncoes.FieldByName('FIN_CTAPAG_COMVECTO').AsInteger;
      FParametros.Financeiro.PagarComissaoContaCaixa          := FTBLOutrasFuncoes.FieldByName('FIN_CTAPAG_COMCTACX').AsInteger;
      FParametros.Financeiro.PagarComissaoCentroCusto         := FTBLOutrasFuncoes.FieldByName('FIN_CTAPAG_COMCTOCUSTO').AsInteger;
      FParametros.Financeiro.PagarComissaoPlanoconta          := FTBLOutrasFuncoes.FieldByName('FIN_CTAPAG_COMPLANCTA').AsString;
      FParametros.Financeiro.ReceberLancarCaixa               := FTBLOutrasFuncoes.FieldByName('FIN_CTAREC_LANCARCAIXA').AsString;
      FParametros.Financeiro.ReceberLancarBanco               := FTBLOutrasFuncoes.FieldByName('FIN_CTAREC_LANCARBANCO').AsString;
      FParametros.Financeiro.ReceberContaCaixa                := FTBLOutrasFuncoes.FieldByName('FIN_CTAREC_CONTACAIXA').AsInteger;
      FParametros.Financeiro.ReceberPlanoContas               := FTBLOutrasFuncoes.FieldByName('FIN_CTAREC_PLANOCONTAS').AsString;
      FParametros.Financeiro.BalcaoLancarCaixa                := FTBLOutrasFuncoes.FieldByName('FIN_BANCAO_LANCCX').AsString;
      FParametros.Financeiro.SiteCotacao                      := FTBLOutrasFuncoes.FieldByName('SITECOTACAOMOEDA').AsString;

      FParametros.Compra.PlanoContas                          := FTBLOutrasFuncoes.FieldByName('COMPRA_PLNCTA').AsString;
      FParametros.Compra.CFOP                                 := FTBLOutrasFuncoes.FieldByName('COMPRA_CFOP').AsInteger;
      FParametros.Compra.Fornecedor                           := FTBLOutrasFuncoes.FieldByName('COMPRA_IDFORNECEDOR').AsInteger;

      FParametros.Alerta.Estoque                              := FTBLOutrasFuncoes.FieldByName('ALERTA_ESTQ').AsString;
      FParametros.Alerta.Ctareceber                           := FTBLOutrasFuncoes.FieldByName('ALERTA_CTAREC').AsString;
      FParametros.Alerta.CtareceberDias                       := FTBLOutrasFuncoes.FieldByName('ALERTA_CTAREC_DIAS').AsInteger;
      FParametros.Alerta.Ctapagar                             := FTBLOutrasFuncoes.FieldByName('ALERTA_CTAPAG').AsString;
      FParametros.Alerta.CtapagarDias                         := FTBLOutrasFuncoes.FieldByName('ALERTA_CTAPAG_DIAS').AsInteger;
      FParametros.Alerta.Pedidos                              := FTBLOutrasFuncoes.FieldByName('ALERTA_PEDIDOS').AsString;
      FParametros.Alerta.Cobranca                             := FTBLOutrasFuncoes.FieldByName('ALERTA_COBRANCA').AsString;
      FParametros.Alerta.Validade                             := FTBLOutrasFuncoes.FieldByName('ALERTA_VALID').AsString;
      FParametros.Alerta.ValidadeDias                         := FTBLOutrasFuncoes.FieldByName('ALERTA_VALID_DIAS').AsInteger;
      FParametros.Alerta.PedidosCompras                       := FTBLOutrasFuncoes.FieldByName('ALERTA_PEDCOMPRA').AsString;

      FParametros.CFOP.VendaUFLocal                           := FTBLOutrasFuncoes.FieldByName('CFOP_VNDUFLOCAL').AsInteger;
      FParametros.CFOP.VendaUFFora                            := FTBLOutrasFuncoes.FieldByName('CFOP_VNDAUFEXTERNO').AsInteger;
      FParametros.CFOP.DevolucaoUFLocal                       := FTBLOutrasFuncoes.FieldByName('CFOP_DEVUFINTERNO').AsInteger;
      FParametros.CFOP.DevolucaoUFFora                        := FTBLOutrasFuncoes.FieldByName('CFOP_DEVUFEXTERNO').AsInteger;
      FParametros.CFOP.CompraUFLocal                          := FTBLOutrasFuncoes.FieldByName('CFOP_COMPUFINTERNO').AsInteger;
      FParametros.CFOP.CompraUFFora                           := FTBLOutrasFuncoes.FieldByName('CFOP_COMPUFEXTERNO').AsInteger;

      FParametros.NFE.Ambiente                                := FTBLOutrasFuncoes.FieldByName('NFE_AMBIENTE').AsInteger;
      FParametros.NFE.TipoDANFE                               := FTBLOutrasFuncoes.FieldByName('NFE_TIPODANFE').AsString;
      FParametros.NFE.FormaEmissao                            := FTBLOutrasFuncoes.FieldByName('NFE_FORMAEMISSAO').AsString;
      FParametros.NFE.Modelo                                  := FTBLOutrasFuncoes.FieldByName('NFE_MODELO').AsString;
      FParametros.NFE.Serie                                   := FTBLOutrasFuncoes.FieldByName('NFE_SERIE').AsString;
      FParametros.NFE.Sequencia                               := FTBLOutrasFuncoes.FieldByName('NFE_SEQUENCIA').AsInteger;
      FParametros.NFE.Lote                                    := FTBLOutrasFuncoes.FieldByName('NFE_LOTE').AsInteger;
      FParametros.NFE.VersaoNFe                               := FTBLOutrasFuncoes.FieldByName('NFE_VERSAONFE').AsInteger;
      FParametros.NFE.EnviarEmail                             := FTBLOutrasFuncoes.FieldByName('NFE_ENVIAREMAIL').AsString='SIM';

      FParametros.NFE.CertArquivo                             := FTBLOutrasFuncoes.FieldByName('NFE_CERTIFICADO_LOCAL').AsString;
      FParametros.NFE.CertSenha                               := FTBLOutrasFuncoes.FieldByName('NFE_CERTIFICADO_SENHA').AsString;
      FParametros.NFE.CertSerie                               := FTBLOutrasFuncoes.FieldByName('NFE_CERTIFICADO_NUMSERIE').AsString;
      //FParametros.NFE.GeradorDANFE                            := Trim(FTBLOutrasFuncoes.FieldByName('DANFEREPORT').AsString);
      //if FParametros.NFE.GeradorDANFE = '' then
      FParametros.NFE.GeradorDANFE :='FORTESREPORT';

      FParametros.Configuracao.LogoPrincipal                  := FTBLOutrasFuncoes.FieldByName('INF_IMGPRINCIPAL').AsString;
      FParametros.Configuracao.LogoRelatorios                 := FTBLOutrasFuncoes.FieldByName('INF_IMGIMPRIMIR').AsString;

      FParametros.Cliente.Inatividade                         := FTBLOutrasFuncoes.FieldByName('CLI_DIASINATIVAR').AsInteger;
      FParametros.Cliente.Atrasopermitido                     := FTBLOutrasFuncoes.FieldByName('CLI_DIASATRASO').AsInteger;

      FParametros.Venda.Vendedor                              := FTBLOutrasFuncoes.FieldByName('VND_IDVENDPADRAO').AsInteger;
      FParametros.Venda.Cliente                               := FTBLOutrasFuncoes.FieldByName('VND_IDCLIENTEPADRAO').AsInteger;
      FParametros.Venda.IDPagto                               := FTBLOutrasFuncoes.FieldByName('IDFPAGTOPADRAO').AsInteger;
      FParametros.Venda.Imprimefatura                         := FTBLOutrasFuncoes.FieldByName('VND_IMPFATURA').AsString;

      FParametros.Pedido.Entrega                              := FTBLOutrasFuncoes.FieldByName('PED_DIASENTREGA').AsInteger;
      FParametros.Pedido.Baixaestoque                         := FTBLOutrasFuncoes.FieldByName('PED_BAIXAESTOQUE').AsString;
      FParametros.Pedido.Mensagem                             := FTBLOutrasFuncoes.FieldByName('PED_MSG').AsWideString;

      FParametros.Email.POPHost                               := Trim(FTBLOutrasFuncoes.FieldByName('EMAIL_POP3HOST').AsString);
      FParametros.Email.POPPorta                              := FTBLOutrasFuncoes.FieldByName('EMAIL_POP3PORTA').AsInteger;
      FParametros.Email.SMTPHost                              := Trim(FTBLOutrasFuncoes.FieldByName('EMAIL_SMTPHOST').AsString);
      FParametros.Email.SMTPPorta                             := FTBLOutrasFuncoes.FieldByName('EMAIL_SMTPPORTA').AsInteger;
      FParametros.Email.Usuario                               := Trim(FTBLOutrasFuncoes.FieldByName('EMAIL_USUARIO').AsString);
      FParametros.Email.Senha                                 := Trim(FTBLOutrasFuncoes.FieldByName('EMAIL_SENHA').AsString);
      FParametros.Email.SSLTSL                                := FTBLOutrasFuncoes.FieldByName('EMAIL_SSLTSL').AsString='SIM';
      FParametros.Email.Nome                                  := Trim(FTBLOutrasFuncoes.FieldByName('EMAIL_NOME').AsString);
      if FParametros.Email.Nome.IsEmpty then
        FParametros.Email.Nome := FParametros.Email.Usuario;

      FParametros.Frete.Padrao                                := FTBLOutrasFuncoes.FieldByName('FRETEPADRAO').AsInteger;
      FParametros.Terceirizado.DiaVencimento                  := FTBLOutrasFuncoes.FieldByName('TERC_DIAVCTO').AsInteger;
      FParametros.Terceirizado.DiaVencimento                  := FTBLOutrasFuncoes.FieldByName('TERC_DIAVCTO').AsInteger;
      FParametros.Quantificar                                 := Trim(FTBLOutrasFuncoes.FieldByName('QUANTIFICAR').AsString);
      FParametros.VisualizarComprovante                       := FTBLOutrasFuncoes.FieldByName('VISUALIZARCOMPROVANTE').AsBoolean;
      if FParametros.Quantificar='' then
        FParametros.Quantificar := 'NORMAL';


   Finally
      QueryObjLiberar(FTBLOutrasFuncoes);
   End;
end;

Function fncUsuario_retCampo(lnUsuario:integer;slCampo:String) : String;
begin
   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM USUARIO  ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add(' ID=:ID    ');
   FTBLOutrasFuncoes.ParamByName('ID').AsInteger :=  lnUsuario;
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName(slCampo).AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function prcOrdemProducaoItens_retCampo(lnOrdemProducao:integer;slCampo:String) : String;
begin
   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM PCP_ORDEMPRODUCAO_ITENS  ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                         ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger  :=  lnOrdemProducao;
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName(slCampo).AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function fncPedidoItens_retCampo(lnPedido:integer;slCampo:String) : String;
begin
   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM PEDIDOS_ITENS  ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                         ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger  :=  lnPedido;
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName(slCampo).AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;


Function fncFinReceber_retCampo(lnReceber:integer;slCampo:String) : String;
begin
   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM FIN_CTARECEBER  ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                         ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger  :=  lnReceber;
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName(slCampo).AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function fncFaseReferencia_valor(lnOrdemProucao,lnterceirizado:integer) : Real;
begin
   Result :=0;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM PCP_FASETRANSFERENCIA  ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add(' EMPRESA=:EMPRESA    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                         ');
   FTBLOutrasFuncoes.SQL.Add(' ORDEMPRODUCAO=:NORDEMPRODUCAO    ');
   FTBLOutrasFuncoes.SQL.Add(' AND                         ');
   FTBLOutrasFuncoes.SQL.Add(' TERCEIRIZADO=:NTERCEIRIZADO    ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger         :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('NORDEMPRODUCAO').AsInteger  :=  lnOrdemProucao;
   FTBLOutrasFuncoes.ParamByName('NTERCEIRIZADO').AsInteger   :=  lnterceirizado;
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('VLR_UNITARIO').AsFloat;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function fncFaseCadastro_Validar(nFase:Integer): Boolean;
begin
   Result := False;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM CAD_FASES ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO             ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nFase;
   FTBLOutrasFuncoes.Open;
   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;


Function fncFase_Validar(nFase:Integer): Boolean;
begin
   Result := False;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(*) AS RETORNO FROM CAD_FASESGRADE ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO             ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger    :=  nFase;
   FTBLOutrasFuncoes.Open;
   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function fncFase_Nome(nFase:Integer): String;
begin
   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM CAD_FASES  ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger :=  nFase;
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName('NOME').AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncLote_Nome(nLote:Integer): String;
begin

   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM CAD_LOTEPRODUCAO  ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger :=  nLote;
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName('NOME').AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function RetornaConferenciaQuantidade(sReferencia,sCor,sTamanho: String): Integer;
begin
   Result :=0;

   sReferencia :=UpperCase( Trim(sReferencia) );

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM VIEW_PEDIDOCONFERENCIAGRADE ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     COR=:COR    ');
   FTBLOutrasFuncoes.SQL.Add('  AND                         ');
   FTBLOutrasFuncoes.SQL.Add('     TAMANHO=:TAMANHO    ');
   FTBLOutrasFuncoes.SQL.Add('  AND                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA    ');
   FTBLOutrasFuncoes.ParamByName('COR').AsString :=  sCor;
   FTBLOutrasFuncoes.ParamByName('TAMANHO').AsString :=  sTamanho;
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('QUANTIDADE').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ValidaPedidoConferido(nPedido: Integer; sIdentificador: String): integer;
begin

   {
   Result := 0;

   prcQueryCriar(TblOutrasFuncoes);
   TblOutrasFuncoes.SQL.Clear;
   TblOutrasFuncoes.SQL.Add(' SELECT * FROM VIEW_PEDIDOCONFERENCIAGRADE ');
   TblOutrasFuncoes.SQL.Add('  where                         ');
   TblOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   TblOutrasFuncoes.SQL.Add('  and                         ');
   TblOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA     ');
   TblOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nPedido;
   TblOutrasFuncoes.ParamByName('SREFERENCIA').AsString := sIdentificador;
   TblOutrasFuncoes.Open;

   Result := TblOutrasFuncoes.FieldByName('QUANTIDADE').AsInteger;
   prcQueryDeletar(TblOutrasFuncoes);
   }

   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  select *   from  VIEW_PEDIDO_QTDERESTANTE ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     IDENTIFICADOR=:SREFERENCIA     ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nPedido;
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString := sIdentificador;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('QTDECONFERIDA').AsInteger;
   QueryObjLiberar(FTBLOutrasFuncoes);


end;


Function BuscaMateriaPrima(sREFERENCIA, sTIPOPRODUTO: String)
  : TVariantResultArray;
begin

   Setlength(Result, 10);
   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add
     ('  select DESCRICAO, UNIDADE, PRC_CUSTO from CAD_PRODUTOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:SREFERENCIA    ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('      TIPO_PRODUTO=:TIPO_PRODUTO     ');
   FTBLOutrasFuncoes.ParamByName('SREFERENCIA').AsString := sREFERENCIA;
   FTBLOutrasFuncoes.ParamByName('TIPO_PRODUTO').AsString := sTIPOPRODUTO;
   FTBLOutrasFuncoes.Open;

   Result[0] := FTBLOutrasFuncoes.FieldByName('DESCRICAO').AsString;
   Result[1] := FTBLOutrasFuncoes.FieldByName('UNIDADE').AsString;
   Result[2] := FTBLOutrasFuncoes.FieldByName('PRC_CUSTO').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function BuscaNomeCor(ncodigo: Integer): String;
begin
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select NOME from CAD_CORES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('NOME').AsString>'' then
      Result := FTBLOutrasFuncoes.FieldByName('NOME').AsString
   else
      Result := '***';

   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncBuscaNomeCorGrade(nCodigoProduto,ngradeid,ncor: Integer;wreferencia:String): String;
begin
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT DISTINCT COR_CODIGO, COR FROM VIEW_GRADEREFERENCIA ');
   FTBLOutrasFuncoes.SQL.Add('  where                          ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO             ');
   FTBLOutrasFuncoes.SQL.Add('  AND                            ');
   FTBLOutrasFuncoes.SQL.Add('     REFERENCIA=:REFERENCIA      ');
   FTBLOutrasFuncoes.SQL.Add('  AND                            ');
   FTBLOutrasFuncoes.SQL.Add('     GRADE_ID=:GRADE_ID          ');
   FTBLOutrasFuncoes.SQL.Add('  AND                            ');
   FTBLOutrasFuncoes.SQL.Add('     COR_CODIGO=:COR_ID          ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger    := nCodigoProduto;
   FTBLOutrasFuncoes.ParamByName('GRADE_ID').AsInteger   := ngradeid;
   FTBLOutrasFuncoes.ParamByName('COR_ID').AsInteger     := ncor;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString  := wreferencia;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('COR').AsString>'' then
      Result := FTBLOutrasFuncoes.FieldByName('COR').AsString
   else
      Result := '***';

   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function BuscaNomeTamanho(ncodigo: Integer): String;
begin

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select * from CAD_TAMANHOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('TAMANHO').AsString;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function BuscaIDTamanho(sTamanho: String): Integer;
begin

   QueryObjCriar(FTBLOutrasFuncoes);


   sTamanho:=Trim(sTamanho);
   sTamanho:=UpperCase(sTamanho);


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select * from CAD_TAMANHOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     TAMANHO=:TAMANHO    ');
   FTBLOutrasFuncoes.ParamByName('TAMANHO').AsString := sTamanho;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('CODIGO').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function BuscaNomeMaquina(ncodigo: Integer): TVariantResultArray;
begin

   Setlength(Result, 10);
   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add
     ('  select NOME, NRO_AGULHAS, NRO_FIOS from cad_maquinas ');
   FTBLOutrasFuncoes.SQL.Add('  where                    ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.Open;

   Result[0] := FTBLOutrasFuncoes.FieldByName('NOME').AsString;
   Result[1] := FTBLOutrasFuncoes.FieldByName('NRO_AGULHAS').AsInteger;
   Result[2] := FTBLOutrasFuncoes.FieldByName('NRO_FIOS').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function BuscaNomeProcesso(ncodigo: Integer): TVariantResultArray;
begin

   Setlength(Result, 10);
   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add
     ('   select CODIGO, DESCRICAO, TEMPO , CUSTO, INSTRUCOES  from CAD_PROCESSOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                    ');
   FTBLOutrasFuncoes.SQL.Add('      CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.Open;

   Result[0] := FTBLOutrasFuncoes.FieldByName('CODIGO').AsInteger;
   Result[1] := FTBLOutrasFuncoes.FieldByName('DESCRICAO').AsString;
   Result[2] := FTBLOutrasFuncoes.FieldByName('TEMPO').AsFloat;
   Result[4] := FTBLOutrasFuncoes.FieldByName('CUSTO').AsFloat;
   Result[5] := FTBLOutrasFuncoes.FieldByName('INSTRUCOES').AsWideString;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncBuscaPlanoContasCliente(ncodigo: Integer): String;
begin
   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select PLANO_CONTAS from CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('PLANO_CONTAS').AsString;


   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function fncBuscaClienteEmail(ncodigo: Integer): String;
begin
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select EMAIL from CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.Open;
   Result :=UpperCase( FTBLOutrasFuncoes.FieldByName('EMAIL').AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function fncBuscaVendedorRegiao(ncodigo: Integer): Integer;
begin
   Result := 0;

   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select REGIAO from CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('REGIAO').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function BuscaClienteVendedor(nCliente: Integer): Integer;
begin
   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select VENDEDOR from CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nCliente;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('VENDEDOR').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);
end;


Function GetClienteFormaPagto(nCliente: Integer): Integer;
begin
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select IDFORMAPAGTO from CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nCliente;
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('IDFORMAPAGTO').AsInteger;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;


Function BuscaClienteTransportadora(nCliente: Integer): Integer;
begin
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select TRANSPORTADORA from CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nCliente;
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('TRANSPORTADORA').AsInteger;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function BuscaClienteCentroCusto(nCliente: Integer): Integer;
begin

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select CENTROCUSTO from CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nCliente;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('CENTROCUSTO').AsInteger;


   QueryObjLiberar(FTBLOutrasFuncoes);
end;

function fncCliente_Validar(nCliente: Integer): Boolean;
begin

   Result := false;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(CODIGO) AS RETORNO FROM CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger :=  nCliente;
   FTBLOutrasFuncoes.Open;
   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

function fncCliente_cnpj(sCNPJ: String): Boolean;
begin

   Result := false;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(CPF_CNPJ) AS RETORNO FROM CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CPF_CNPJ=:SCNPJ    ');
   FTBLOutrasFuncoes.ParamByName('SCNPJ').AsString :=  sCNPJ;
   FTBLOutrasFuncoes.Open;
   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

function fncCliente_ID_CNPJ(sCNPJ: String): Integer;
var
  mDocumento : String;
begin
   Result := 0;

   mDocumento := '';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT CODIGO, ');
   FTBLOutrasFuncoes.SQL.Add(' replace(replace(replace(cpf_cnpj, ''.'', ''''), ''/'', ''''), ''-'', '''' ) as  cpf_cnpj ');
   FTBLOutrasFuncoes.SQL.Add('  FROM CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CPF_CNPJ=:SCNPJ    ');
   FTBLOutrasFuncoes.ParamByName('SCNPJ').AsString :=  sCNPJ;
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('CODIGO').AsInteger;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function GetClienteCampo(nCliente: Integer;slCampo:String): String;
begin
   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select * from CAD_CLIENTES where CODIGO='+IntToStr(nCliente));
   FTBLOutrasFuncoes.Open;
   Result := Trim(FTBLOutrasFuncoes.FieldByName(slCampo).AsString);
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function Cliente_Endereco(nCliente: Integer;slCampo:String): String;
begin

   Result :='';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select * from CAD_CLIENTES where CODIGO='+IntToStr(nCliente));
   FTBLOutrasFuncoes.Open;
   Result := UpperCase( FTBLOutrasFuncoes.FieldByName(slCampo).AsString );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;


Function fncClienteBuscaCFOP(nCliente: Integer): Integer;
begin
   QueryObjCriar(FTBLOutrasFuncoes);

   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select * from CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nCliente;
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('CFOP').AsInteger;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;



Function BuscaNomeTransportadora(nTransportadora: Integer): String;
begin
   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where     ');
   FTBLOutrasFuncoes.SQL.Add('  TIPO=''TRANSPORTADORA''     ');
   FTBLOutrasFuncoes.SQL.Add('  AND     ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := nTransportadora;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('NOME').AsString;


   QueryObjLiberar(FTBLOutrasFuncoes);
end;


Function BuscaNCMPadrao : String;
begin
   QueryObjCriar(FTBLOutrasFuncoes);

   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select NCM_PADRAO from CONFIG_PARAMETROS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     EMPRESA=:EMPRESA    ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('NCM_PADRAO').AsString;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncDataBase : TDate;
begin

   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT INF_DATABASE FROM CONFIG_PARAMETROS ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('  EMPRESA=:EMPRESA    ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('INF_DATABASE').IsNull then
      Result := Date
   else
      Result := FTBLOutrasFuncoes.FieldByName('INF_DATABASE').AsDateTime;

   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncParamCFOP_VendaUF(slUF :string): Integer;
begin

   Result :=0;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CONFIG_PARAMETROS ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add('  EMPRESA=:EMPRESA    ');
   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;
   FTBLOutrasFuncoes.Open;

   if slUF='INTERNO' then
      Result := StrToIntDef(FTBLOutrasFuncoes.FieldByName('CFOP_VNDUFLOCAL').AsString,0);

   if slUF='EXTERNO' then
      Result := StrToIntDef(FTBLOutrasFuncoes.FieldByName('CFOP_VNDAUFEXTERNO').AsString,0);

   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ChecarCreditoCliente(nCliente:Integer) : Boolean;
begin
   Result := False;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select BLOQUEADO from CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger := nCliente;
   FTBLOutrasFuncoes.Open;
   Result := ((FTBLOutrasFuncoes.FieldByName('BLOQUEADO').AsString='S') or (FTBLOutrasFuncoes.FieldByName('BLOQUEADO').AsString='SIM') );
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function ChecarCreditoDisponivel(nCliente:Integer) : Real;
begin

   Result :=0;

   QueryObjCriar(FTBLOutrasFuncoes);

   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT SUM(VALOR) AS VALOR FROM CAD_CLIENTES_CREDITOS ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE   ');
   FTBLOutrasFuncoes.SQL.Add(' CLIENTE=:CLIENTE    ');
   FTBLOutrasFuncoes.SQL.Add(' AND   ');
   FTBLOutrasFuncoes.SQL.Add(' UTILIZADO='+QuotedStr('N'));
   FTBLOutrasFuncoes.ParamByName('CLIENTE').AsInteger := nCliente;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('VALOR').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ChecarCreditoUtilizado(nCliente:Integer) : Real;
begin

   Result :=0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT SUM(VALOR) AS VALOR FROM CAD_CLIENTES_CREDITOS ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE   ');
   FTBLOutrasFuncoes.SQL.Add(' CLIENTE=:CLIENTE    ');
   FTBLOutrasFuncoes.SQL.Add(' AND   ');
   FTBLOutrasFuncoes.SQL.Add(' UTILIZADO='+QuotedStr('S'));
   FTBLOutrasFuncoes.ParamByName('CLIENTE').AsInteger := nCliente;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('VALOR').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ChecarCreditoSaldo(nCliente:Integer) : Real;
begin

   Result :=0;

   Result :=0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT CREDITO_DISPONIVEL FROM CAD_CLIENTES ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE   ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:CODIGO    ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger := nCliente;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('CREDITO_DISPONIVEL').AsFloat;

   if Result < 0 then
      Result := 0;


   QueryObjLiberar(FTBLOutrasFuncoes);


end;


// --------------------------------------------------------------------------
// CEP

// --------------------------------------------------------------------------

Function GetCEPDados(const nCEP: String): TCEP;
Var
  mCEP   : TCEP;
  mDados : TFDQuery;
begin

  try
    QueryObjCriar(mDados);
    mCEP:=TCEP.Create;
    mCEP.CEP :=Trim(nCEP);

    mDados.SQL.Clear;
    mDados.SQL.Add('  SELECT * FROM CAD_IBGEMUNICIPIO ');
    mDados.SQL.Add('  where                         ');
    mDados.SQL.Add('  CEP=:CEP    ');
    mDados.ParamByName('CEP').AsString := Trim(nCEP);
    mDados.Open;

    mCEP.Tipo        :=TRIM(mDados.FieldByName('TIPO').AsString);
    mCEP.Endereco    :=TRIM(mDados.FieldByName('ENDERECO').AsString);
    mCEP.Bairro      :=TRIM(mDados.FieldByName('BAIRRO').AsString);
    mCEP.IDCidade    :=StrToIntDef(mDados.FieldByName('CIDADE_CODIGO').AsString,0);
    mCEP.Cidade      :=TRIM(mDados.FieldByName('CIDADE').AsString);
    mCEP.IDUF        :=StrToIntDef(mDados.FieldByName('UF_CODIGO').AsString,0);
    mCEP.UF          :=TRIM(mDados.FieldByName('UF').AsString);
  finally
    QueryObjLiberar(mDados);
  end;
  Result :=mCEP;
end;

Function GetEnderecoDados(aIDEndereco, aIDCliente : Integer): TCEP;
Var
  mCEP   : TCEP;
  mDados : TFDQuery;
begin

  try
    QueryObjCriar(mDados);
    mCEP:=TCEP.Create;
    mDados.SQL.Clear;
    mDados.SQL.Add('  SELECT * FROM CAD_CLIENTES ');
    mDados.SQL.Add('  where                         ');
    mDados.SQL.Add('  CODIGO=:IDCLIENTE    ');
    mDados.ParamByName('IDCLIENTE').AsInteger  := aIDCliente;
    mDados.Open;

    mCEP.CEP         :=TRIM(mDados.FieldByName('CEP').AsString);
    mCEP.Endereco    :=TRIM(mDados.FieldByName('ENDERECO').AsString);
    mCEP.Numero      :=TRIM(mDados.FieldByName('NUMERO').AsString);
    mCEP.Complemento :=TRIM(mDados.FieldByName('COMPLEMENTO').AsString);
    mCEP.Bairro      :=TRIM(mDados.FieldByName('BAIRRO').AsString);
    mCEP.IDCidade    :=StrToIntDef(mDados.FieldByName('IDCIDADE').AsString,0);
    mCEP.Cidade      :=TRIM(mDados.FieldByName('CIDADE').AsString);
    mCEP.IDUF        :=StrToIntDef(mDados.FieldByName('CODIGOUF').AsString,0);
    mCEP.UF          :=TRIM(mDados.FieldByName('UF').AsString);
  finally
    QueryObjLiberar(mDados);
  end;
  Result :=mCEP;
end;

Function DadosExistenteEndereco(aIDCliente : Integer): Boolean;
Var
  mDados : TFDQuery;
begin
  Result:=false;

  try
    QueryObjCriar(mDados);
    if mDados=nil then
      exit;

    mDados.SQL.Clear;
    mDados.SQL.Add('  SELECT * FROM CAD_CLIENTES ');
    mDados.SQL.Add('  where                         ');
    mDados.SQL.Add('  CODIGO=:IDCLIENTE    ');
    mDados.ParamByName('IDCLIENTE').AsInteger  := aIDCliente;
    mDados.Open;
    Result :=mDados.RecordCount>0;
  finally
    QueryObjLiberar(mDados);
  end;
end;

Function ExisteCor(ncodigo, NCOR: Integer): Boolean;
begin

   Result := False;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select count(ID_COR) AS RETORNO from PCP_CORES ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:NCODIGO     ');
   FTBLOutrasFuncoes.SQL.Add('  and                         ');
   FTBLOutrasFuncoes.SQL.Add('     ID_COR=:NCOR    ');
   FTBLOutrasFuncoes.ParamByName('NCODIGO').AsInteger := ncodigo;
   FTBLOutrasFuncoes.ParamByName('NCOR').AsInteger := NCOR;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function ExisteGradeCor(ncodigo: Integer): Boolean;
begin
{
   Result := False;

   prcQueryCriar(TblValidarFuncoes);

   TblValidarFuncoes.SQL.Clear;
   TblValidarFuncoes.SQL.Add(' select COUNT(codigo) AS RETORNO from PCP_CORES ');
   TblValidarFuncoes.SQL.Add('  where                         ');
   TblValidarFuncoes.SQL.Add('     CODIGO=:CODIGO     ');
   TblValidarFuncoes.ParamByName('CODIGO').AsInteger := ncodigo;
   TblValidarFuncoes.Open;

   if TblValidarFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;

   prcQueryDeletar(TblValidarFuncoes);
}

end;

Function ExisteGradeTamanhos(ncodigo: Integer): Boolean;
begin

   Result := False;

   QueryObjCriar(TblValidarFuncoes);

   TblValidarFuncoes.SQL.Clear;
   TblValidarFuncoes.SQL.Add(' select COUNT(codigo) AS RETORNO from CAD_GRADELISTA ');
   TblValidarFuncoes.SQL.Add('  where                         ');
   TblValidarFuncoes.SQL.Add('     CODIGO=:CODIGO     ');
   TblValidarFuncoes.ParamByName('CODIGO').AsInteger := ncodigo;
   TblValidarFuncoes.Open;

   if TblValidarFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;

   QueryObjLiberar(TblValidarFuncoes);

end;



Function ValidarReferenciaCorTamanho(sReferencia: String): Boolean;
begin

   Result := False;

   sReferencia :=UpperCase(Trim(sReferencia));

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT GRADE FROM CAD_PRODUTOS  ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                       ');
   FTBLOutrasFuncoes.SQL.Add('  REFERENCIA=:REFERENCIA      ');
   //TblOutrasFuncoes.SQL.Add('  AND                         ');
   //TblOutrasFuncoes.SQL.Add('  TIPO_PRODUTO=''ACA''               ');
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   // validar se existe uma Grade de Tamanho informada no produto
   if ExisteGradeTamanhos( FTBLOutrasFuncoes.FieldByName('GRADE').AsInteger ) Then
      Result := True
   else
      Result := False;

   {
   // validar se existe uma Cor informada no produto
   if ExisteGradeCor( TblOutrasFuncoes.FieldByName('COR').AsInteger ) Then
      Result := True
   else
      Result := False;
   }



   try
      QueryObjLiberar(FTBLOutrasFuncoes);
   Except
   end;

end;

Function ValidaPedido(nCodigo: Integer): Boolean;
begin

   Result := False;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select COUNT(*) AS RETORNO from PEDIDOS');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO     ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger := nCodigo;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncChecarPedidosProduzir : Boolean;
begin

   Result := False;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select COUNT(*) AS RETORNO from PEDIDOS');
   FTBLOutrasFuncoes.SQL.Add(' where                           ');
   FTBLOutrasFuncoes.SQL.Add(' APROVADO IN (''S'',''SIM'')     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                             ');
   FTBLOutrasFuncoes.SQL.Add(' PRODUZINDO IN (''N'',''NAO'')   ');
   FTBLOutrasFuncoes.Open;
   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fncChecarPeriodoPedidosProduzir(ldtDataIni, dtDataFim : TDate; lncliente, lnvendedor : Integer  ) : Boolean;
Var
   lcCliente01,
   lcCliente02,
   lcVendedor01,
   lcVendedor02     : Integer;

begin
   Result := False;

   lcCliente01   :=StrToInt( ifthen(lncliente>0, IntToStr(lncliente),'0') );
   lcCliente02   :=StrToInt( ifthen(lncliente>0, IntToStr(lncliente),'999999999') );

   lcVendedor01   :=StrToInt( ifthen(lnvendedor>0, IntToStr(lnvendedor),'0') );
   lcVendedor02   :=StrToInt( ifthen(lnvendedor>0, IntToStr(lnvendedor),'999999999') );

   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' select COUNT(*) AS RETORNO from PEDIDOS');
   FTBLOutrasFuncoes.SQL.Add(' where                           ');
   FTBLOutrasFuncoes.SQL.Add(' APROVADO IN (''S'',''SIM'')     ');
   FTBLOutrasFuncoes.SQL.Add(' AND                             ');
   FTBLOutrasFuncoes.SQL.Add(' PRODUZINDO IN (''N'',''NAO'')   ');
   FTBLOutrasFuncoes.SQL.Add(' AND                             ');

   if strPeriodoData='EMISSAO' then
   FTBLOutrasFuncoes.SQL.Add(' DATA BETWEEN :DATA1 AND :DATA2  ');

   if strPeriodoData='ENTREGA' then
   FTBLOutrasFuncoes.SQL.Add(' DATA_ENTREGA BETWEEN :DATA1 AND :DATA2  ');

   FTBLOutrasFuncoes.SQL.Add(' AND                             ');
   FTBLOutrasFuncoes.SQL.Add(' CLIENTE BETWEEN :CLIENTE1 AND :CLIENTE2  ');
   FTBLOutrasFuncoes.SQL.Add(' AND                             ');
   FTBLOutrasFuncoes.SQL.Add(' VENDEDOR BETWEEN :VENDEDOR1 AND :VENDEDOR2  ');

   FTBLOutrasFuncoes.ParamByName('DATA1').AsDateTime    :=ldtDataIni ;
   FTBLOutrasFuncoes.ParamByName('DATA2').AsDateTime    :=dtDataFim ;
   FTBLOutrasFuncoes.ParamByName('CLIENTE1').AsInteger  :=lcCliente01 ;
   FTBLOutrasFuncoes.ParamByName('CLIENTE2').AsInteger  :=lcCliente02 ;
   FTBLOutrasFuncoes.ParamByName('VENDEDOR1').AsInteger :=lcVendedor01 ;
   FTBLOutrasFuncoes.ParamByName('VENDEDOR2').AsInteger :=lcVendedor02 ;


   FTBLOutrasFuncoes.Open;
   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
      Result := True;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Function BuscaPlanoContasTipo(sPlanoContas: String): String;
begin
   QueryObjCriar(FTBLOutrasFuncoes);


   sPlanoContas := UpperCase( Trim( sPlanoContas ) );


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM PLANO_CONTAS_DETALHES ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO_PLANO=:PLN_CONTA    ');
   FTBLOutrasFuncoes.ParamByName('PLN_CONTA').AsString := sPlanoContas;
   FTBLOutrasFuncoes.Open;

   Result := UpperCase( Trim( FTBLOutrasFuncoes.FieldByName('TIPO').AsString ) );


   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function BuscaPlanoContasID(sPlanoContas: String): Integer;
begin
   QueryObjCriar(FTBLOutrasFuncoes);


   sPlanoContas := UpperCase( Trim( sPlanoContas ) );


   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT * FROM PLANO_CONTAS_DETALHES ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                         ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO_PLANO=:PLN_CONTA    ');
   FTBLOutrasFuncoes.ParamByName('PLN_CONTA').AsString := sPlanoContas;
   FTBLOutrasFuncoes.Open;

   Result := StrToIntDef((FTBLOutrasFuncoes.FieldByName('CODIGO').AsString),0);


   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Function DistribuirReferenciaValor(nCodigo, nPedido: Integer; REFERENCIA: String): Real;
Begin

   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.Connection := FrmPrincipal.DBConexao;

   // tabela de grades
   FTBLOutrasFuncoes.sql.clear;
   FTBLOutrasFuncoes.sql.Add( ' SELECT * FROM PEDIDOCONFERENCIA_ITENS ');
   FTBLOutrasFuncoes.sql.Add( ' WHERE    ' );
   FTBLOutrasFuncoes.sql.Add( ' CODIGO=:CODIGO   ' );
   FTBLOutrasFuncoes.sql.Add( ' AND    ');
   FTBLOutrasFuncoes.sql.Add( ' PEDIDO=:PEDIDO    ');
   FTBLOutrasFuncoes.sql.Add( ' AND    ');
   FTBLOutrasFuncoes.sql.Add( ' REFERENCIA=:REFERENCIA   ');
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger := nCodigo;
   FTBLOutrasFuncoes.ParamByName('PEDIDO').AsInteger := nPedido;
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString := REFERENCIA;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('VALOR_UNIT').AsFloat;



   QueryObjLiberar(FTBLOutrasFuncoes);

End;


Procedure MateriaPrimaGradeTamanhos(strReferencia : String; nCodigoGrade: Integer);
begin

{
   prcQueryCriar(TblOutrasFuncoes);



   TblOutrasFuncoes.SQL.Clear;
   TblOutrasFuncoes.SQL.Add(' select COUNT(codigo) AS RETORNO from CAD_GRADELISTA ');
   TblOutrasFuncoes.SQL.Add('  where                         ');
   TblOutrasFuncoes.SQL.Add('     CODIGO=:CODIGO     ');
   TblOutrasFuncoes.ParamByName('CODIGO').AsInteger := ncodigo;
   TblOutrasFuncoes.Open;


   prcQueryDeletar(TblOutrasFuncoes);
}

end;

Function RetornaGradeReferencia(sReferencia: String): Integer;
begin

   Result := 0;

   sReferencia :=UpperCase(Trim(sReferencia));

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT GRADE FROM CAD_PRODUTOS  ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                       ');
   FTBLOutrasFuncoes.SQL.Add('  REFERENCIA=:REFERENCIA      ');
   FTBLOutrasFuncoes.ParamByName('REFERENCIA').AsString    :=  sReferencia;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('GRADE').AsInteger;




end;

Function RetornaIDRegistroDiario(sStatusCaixa: String): Integer;
begin

   Result := 0;

   sStatusCaixa :=UpperCase(Trim(sStatusCaixa));

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM FIN_REGISTROSDIARIOS  ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                       ');
   FTBLOutrasFuncoes.SQL.Add('  CAIXAABERTO=:CAIXASTATUS     ');
   FTBLOutrasFuncoes.ParamByName('CAIXASTATUS').AsString    :=  sStatusCaixa;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('CODIGO').AsInteger;




end;

Function PDV_RetornaValorComparar(sTipoPagto, sFormaPagto : String; DataFechamento : TDate  ): Real;
begin

   Result :=0;

   sTipoPagto   :=UpperCase( Trim(sTipoPagto) );
   sFormaPagto  :=UpperCase( Trim(sFormaPagto) );

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' SELECT  DISTINCT  coalesce( CAD_FORMAPAGTO.TIPO_PAGAMENTO,''N/D'') AS TIPO_PAGAMENTO,      ');
   FTBLOutrasFuncoes.SQL.Add(' coalesce( CAD_FORMAPAGTO.NOME,''N/D'') AS NOME,                                            ');
   FTBLOutrasFuncoes.SQL.Add(' coalesce(SUM(VENDAS.TOTAL_NF),0) AS VALOR                                                  ');
   FTBLOutrasFuncoes.SQL.Add(' FROM CAD_FORMAPAGTO                                                                        ');
   FTBLOutrasFuncoes.SQL.Add(' RIGHT JOIN VENDAS                ON VENDAS.FORMAPAGTO=CAD_FORMAPAGTO.CODIGO                ');
   FTBLOutrasFuncoes.SQL.Add(' INNER JOIN FIN_REGISTROSDIARIOS  ON FIN_REGISTROSDIARIOS.CODIGO=VENDAS.REGISTRODIARIO      ');
   FTBLOutrasFuncoes.SQL.Add(' WHERE                                                                                      ');
   FTBLOutrasFuncoes.SQL.Add(' FIN_REGISTROSDIARIOS.CAIXAABERTO=''S''                                                     ');
   FTBLOutrasFuncoes.SQL.Add(' AND VENDAS.EMISSAO BETWEEN FIN_REGISTROSDIARIOS.DATA_ABERTURA AND :DATAFECHAMENTO          ');
   FTBLOutrasFuncoes.SQL.Add(' AND CAD_FORMAPAGTO.TIPO_PAGAMENTO=:TIPO_PAGAMENTO                                          ');
   FTBLOutrasFuncoes.SQL.Add(' AND CAD_FORMAPAGTO.NOME=:NOME                                                              ');
   FTBLOutrasFuncoes.SQL.Add('                                                                                            ');
   FTBLOutrasFuncoes.SQL.Add(' GROUP BY CAD_FORMAPAGTO.TIPO_PAGAMENTO, CAD_FORMAPAGTO.NOME                                ');

   FTBLOutrasFuncoes.ParamByName('TIPO_PAGAMENTO').AsString   :=  sTipoPagto;
   FTBLOutrasFuncoes.ParamByName('NOME').AsString             :=  sFormaPagto;
   FTBLOutrasFuncoes.ParamByName('DATAFECHAMENTO').AsDateTime :=  DataFechamento;

   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('VALOR').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function PDV_SomaValorCaixa(nEmpresa, nCodigo : Integer; DataAbertura : TDate  ): Real;
begin

   Result :=0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT SUM(VALOR) AS VLR_TOTAL FROM FIN_REGISTROSDIARIOSDETALHES   ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                                                              ');
   FTBLOutrasFuncoes.SQL.Add('  EMPRESA=:EMPRESA                                                   ');
   FTBLOutrasFuncoes.SQL.Add('  AND                                                                ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:CODIGO                                                     ');
   FTBLOutrasFuncoes.SQL.Add('  AND                                                                ');
   FTBLOutrasFuncoes.SQL.Add('  DATA=:DATA_ABERTURA                                                ');

   FTBLOutrasFuncoes.ParamByName('EMPRESA').AsInteger         :=  nEmpresa;
   FTBLOutrasFuncoes.ParamByName('CODIGO').AsInteger          :=  nCodigo;
   FTBLOutrasFuncoes.ParamByName('DATA_ABERTURA').AsDateTime   :=  DataAbertura;

   FTBLOutrasFuncoes.Open;

   Result :=FTBLOutrasFuncoes.FieldByName('VLR_TOTAL').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Procedure PDV_SalvaValorFechameto(nValor : real  );
begin


   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  UPDATE FIN_REGISTROSDIARIOS SET VLR_TOTALVENDASCAIXA=:VALOR    ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                                                          ');
   FTBLOutrasFuncoes.SQL.Add('  CAIXAABERTO=''S''                                              ');
   FTBLOutrasFuncoes.ParamByName('VALOR').AsFloat        :=  nValor;
   FTBLOutrasFuncoes.ExecSQL;

   QueryObjLiberar(FTBLOutrasFuncoes);

end;




///--------------------------------------------------------------------------
///      CFOP
///--------------------------------------------------------------------------
function fnCFOP_VALIDAR(nCFOP: integer): Boolean;
begin

   Result := false;
   QueryObjCriar(FTBLOutrasFuncoes);

   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(CODIGO) AS RETORNO FROM CAD_CFOP ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCFOP    ');
   FTBLOutrasFuncoes.ParamByName('NCFOP').AsInteger := nCFOP;
   FTBLOutrasFuncoes.Open;

   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

function fnCFOP_UFVALIDAR(nCFOP: integer;UFEmpresa, UFCliente:String): Boolean;
Var
 slStatusFCOP  : String;
begin

   Result := false;

   QueryObjCriar(FTBLOutrasFuncoes);

   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_CFOP ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCFOP    ');
   FTBLOutrasFuncoes.ParamByName('NCFOP').AsInteger := nCFOP;
   FTBLOutrasFuncoes.Open;

   // SE FOR FORA DO ESTADO, E ESTADOS FOREM DIFERENTES
   slStatusFCOP :=FTBLOutrasFuncoes.FieldByName('DENTRO_ESTADO').AsString;

   if ((slStatusFCOP='N') and  (UFEmpresa<>UFCliente)) or  ((slStatusFCOP='S') and  (UFEmpresa=UFCliente)) then
   begin
      Result := True;
   end;

   QueryObjLiberar(FTBLOutrasFuncoes);

end;


function fnCFOP_DETALHE(nCFOP: integer): WideString;
begin

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_CFOP ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCFOP    ');
   FTBLOutrasFuncoes.ParamByName('NCFOP').AsInteger := nCFOP;
   FTBLOutrasFuncoes.Open;

   Result := UpperCase(FTBLOutrasFuncoes.FieldByName('DETALHE').AsString);


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

function fnCFOP_FISCO(nCFOP: integer): WideString;
begin

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_CFOP ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCFOP    ');
   FTBLOutrasFuncoes.ParamByName('NCFOP').AsInteger := nCFOP;
   FTBLOutrasFuncoes.Open;

   Result := UpperCase(FTBLOutrasFuncoes.FieldByName('FISCO').AsString);


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

function fnCFOP_NOME(nCFOP: integer): WideString;
begin
   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_CFOP ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCFOP    ');
   FTBLOutrasFuncoes.ParamByName('NCFOP').AsInteger := nCFOP;
   FTBLOutrasFuncoes.Open;

   Result := UpperCase(FTBLOutrasFuncoes.FieldByName('DESCRICAO').AsString);


   QueryObjLiberar(FTBLOutrasFuncoes);

end;

function fnCFOP_REDUCAOICMS(nCFOP: integer): Real;
begin

   Result := 0;

   QueryObjCriar(FTBLOutrasFuncoes);



   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_CFOP ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCFOP    ');
   FTBLOutrasFuncoes.ParamByName('NCFOP').AsInteger := nCFOP;
   FTBLOutrasFuncoes.Open;

   Result := FTBLOutrasFuncoes.FieldByName('REDUCAO_ICMS').AsFloat;


   QueryObjLiberar(FTBLOutrasFuncoes);


end;

function fnCFOP_OPERACAO(nCFOP: integer): String;
begin
   Result := '';
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_CFOP ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCFOP    ');
   FTBLOutrasFuncoes.ParamByName('NCFOP').AsInteger := nCFOP;
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('OPERACAO').AsString;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

function fnCFOP_ICMS_CALCULA(nCFOP: integer): Boolean;
begin

   Result := false;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT CALCULA_ICMS FROM CAD_CFOP ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCFOP    ');
   FTBLOutrasFuncoes.ParamByName('NCFOP').AsInteger := nCFOP;
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('CALCULA_ICMS').AsString='S';
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

function fnCFOP_IPI_CALCULA(nCFOP: integer): Boolean;
begin

   Result := false;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT CALCULA_IPI FROM CAD_CFOP ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCFOP    ');
   FTBLOutrasFuncoes.ParamByName('NCFOP').AsInteger := nCFOP;
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('CALCULA_IPI').AsString='S';
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

function fnCFOP_ISS_CALCULA(nCFOP: integer): Boolean;
begin

   Result := false;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT CALCULA_ISS FROM CAD_CFOP ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  CODIGO=:NCFOP    ');
   FTBLOutrasFuncoes.ParamByName('NCFOP').AsInteger := nCFOP;
   FTBLOutrasFuncoes.Open;
   Result := FTBLOutrasFuncoes.FieldByName('CALCULA_ISS').AsString='S';
   QueryObjLiberar(FTBLOutrasFuncoes);

end;


///--------------------------------------------------------------------------
///      TABELA DE IMPOSTOS POR ESTADO
///--------------------------------------------------------------------------

function fnUFImposto_VALIDAR(stUF: String): Boolean;
begin

   Result := false;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT COUNT(SIGLA) AS RETORNO FROM CAD_UF_IMPOSTOS ');
   FTBLOutrasFuncoes.SQL.Add('  where                         ');
   FTBLOutrasFuncoes.SQL.Add('  SIGLA=:SUF    ');
   FTBLOutrasFuncoes.ParamByName('SUF').AsString :=  stUF;
   FTBLOutrasFuncoes.Open;
   if FTBLOutrasFuncoes.FieldByName('RETORNO').AsInteger > 0 then
   begin
      Result := True;
   end;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fnUFImposto_ICMS_PJ(stUF: String): Real;
begin

   Result :=0;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_UF_IMPOSTOS ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                 ');
   FTBLOutrasFuncoes.SQL.Add('     SIGLA=:SUF    ');
   FTBLOutrasFuncoes.ParamByName('SUF').AsString :=  stUF;
   FTBLOutrasFuncoes.Open;
   Result :=FTBLOutrasFuncoes.FieldByName('ICMS').AsFloat;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fnUFImposto_ICMS_PF(stUF: String): Real;
begin

   Result :=0;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_UF_IMPOSTOS ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                 ');
   FTBLOutrasFuncoes.SQL.Add('     SIGLA=:SUF    ');
   FTBLOutrasFuncoes.ParamByName('SUF').AsString :=  stUF;
   FTBLOutrasFuncoes.Open;
   Result :=FTBLOutrasFuncoes.FieldByName('ICMS_PFISICA').AsFloat;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fnUFImposto_IPI(stUF: String): Real;
begin

   Result :=0;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_UF_IMPOSTOS ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                 ');
   FTBLOutrasFuncoes.SQL.Add('     SIGLA=:SUF    ');
   FTBLOutrasFuncoes.ParamByName('SUF').AsString :=  stUF;
   FTBLOutrasFuncoes.Open;
   Result :=FTBLOutrasFuncoes.FieldByName('IPI').AsFloat;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fnUFImposto_ISS(stUF: String): Real;
begin

   Result :=0;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_UF_IMPOSTOS ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                 ');
   FTBLOutrasFuncoes.SQL.Add('     SIGLA=:SUF    ');
   FTBLOutrasFuncoes.ParamByName('SUF').AsString :=  stUF;
   FTBLOutrasFuncoes.Open;
   Result :=FTBLOutrasFuncoes.FieldByName('ISS').AsFloat;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;

Function fnUFImposto_IR(stUF: String): Real;
begin

   Result :=0;
   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add('  SELECT * FROM CAD_UF_IMPOSTOS ');
   FTBLOutrasFuncoes.SQL.Add('  WHERE                 ');
   FTBLOutrasFuncoes.SQL.Add('     SIGLA=:SUF    ');
   FTBLOutrasFuncoes.ParamByName('SUF').AsString :=  stUF;
   FTBLOutrasFuncoes.Open;
   Result :=FTBLOutrasFuncoes.FieldByName('IR').AsFloat;
   QueryObjLiberar(FTBLOutrasFuncoes);

end;


Procedure prcViewFaturas(dbQueryView: TFDQuery;nCliente,nNFe:Integer);
begin

   //prcQueryCriar(dbQueryView);
   dbQueryView.SQL.Clear;
   dbQueryView.SQL.Add(' SELECT * FROM VIEW_FATURAS             ');
   dbQueryView.SQL.Add(' WHERE                                  ');
   dbQueryView.SQL.Add(' CLIENTE=:CLIENTE                       ');
   dbQueryView.SQL.Add(' AND                                    ');
   dbQueryView.SQL.Add(' NRO_NOTA=:NOTAFISCAL                   ');
   dbQueryView.SQL.Add(' AND                                    ');
   dbQueryView.SQL.Add(' GERARCOMPLEMENTO=' + QuotedStr('N')    );
   dbQueryView.SQL.Add(' ORDER BY DATA, VENCIMENTO, DOCUMENTO   ');
   dbQueryView.ParamByName('CLIENTE').AsInteger    :=  nCliente;
   dbQueryView.ParamByName('NOTAFISCAL').AsInteger :=  nNFe;
   dbQueryView.Open;

end;

Procedure prcRegistrarUltimaVenda(lnCliente:Integer;lsOrigem:String);
begin
   lsOrigem:=UpperCase(lsOrigem);

   QueryObjCriar(FTBLOutrasFuncoes);
   FTBLOutrasFuncoes.SQL.Clear;
   FTBLOutrasFuncoes.SQL.Add(' UPDATE CAD_CLIENTES SET ULTIMAVENDA_DATA=                                    ');
   if (lsOrigem='PEDIDO') then
   begin
      FTBLOutrasFuncoes.SQL.Add(' (SELECT  MAX(PEDIDOS.DATA) AS DATA FROM PEDIDOS                        ');
      FTBLOutrasFuncoes.SQL.Add(' WHERE PEDIDOS.EMPRESA=:NEMPRESA AND PEDIDOS.CLIENTE=:NCLIENTE),  ');
      FTBLOutrasFuncoes.SQL.Add(' ULTIMAVENDA_ORIGEM=:SORIGEM                                                  ');
   end;
   if (lsOrigem='NFE') then
   begin
      FTBLOutrasFuncoes.SQL.Add(' (SELECT  MAX(VENDAS.EMISSAO) AS EMISSAO FROM VENDAS                        ');
      FTBLOutrasFuncoes.SQL.Add(' WHERE VENDAS.EMPRESA=:NEMPRESA AND VENDAS.CLIENTE=:NCLIENTE),  ');
      FTBLOutrasFuncoes.SQL.Add(' ULTIMAVENDA_ORIGEM=:SORIGEM                                                  ');
   end;
   FTBLOutrasFuncoes.SQL.Add(' WHERE                                                                        ');
   FTBLOutrasFuncoes.SQL.Add(' CODIGO=:NCLIENTE                                                            ');
   FTBLOutrasFuncoes.SQL.Add('                                                                              ');
   FTBLOutrasFuncoes.ParamByName('NEMPRESA').AsInteger  :=  FSistema.Empresa;
   FTBLOutrasFuncoes.ParamByName('NCLIENTE').AsInteger  :=  lnCliente;
   FTBLOutrasFuncoes.ParamByName('SORIGEM').AsString    :=  lsOrigem;
   FTBLOutrasFuncoes.ExecSQL;
   QueryObjLiberar(FTBLOutrasFuncoes);
end;

Procedure prcProdutoLancaGrade(nPedido:Integer;sReferencia: String);
begin

   sReferencia :=UpperCase( Trim(sReferencia) );
   {
   prcQueryCriar(TblOutrasFuncoes);



   TblOutrasFuncoes.SQL.Clear;
   TblOutrasFuncoes.SQL.Add('  SELECT * FROM PEDIDOS_ITENS ');
   TblOutrasFuncoes.SQL.Add('  where                         ');
   TblOutrasFuncoes.SQL.Add('  CODIGO=:CODIGO    ');
   TblOutrasFuncoes.SQL.Add('  and                         ');
   TblOutrasFuncoes.SQL.Add('  REFERENCIA=:REFERENCIA    ');
   TblOutrasFuncoes.ParamByName('CODIGO').AsInteger :=    nPedido;
   TblOutrasFuncoes.ParamByName('REFERENCIA').AsString :=  sReferencia;
   TblOutrasFuncoes.Open;
   }

end;

//---------------------------------------------------------------------
// Inser��o do sistema
//---------------------------------------------------------------------
Procedure InserirLicenca(aCHAVE : String);
var
  aDBQuery : TFDQuery;
begin
  aDBQuery            := TFDQuery.Create(Application);
  aDBQuery.Connection := FrmPrincipal.DBConexao;
  Try
    //FrmPrincipal.DBConexao.star
    aDBQuery.SQL.Clear;
    aDBQuery.SQL.Add(' INSERT INTO LICENCA ');
    aDBQuery.SQL.Add(' (DATA, HORA, CHAVE, STATUS ) ');
    aDBQuery.SQL.Add(' VALUES ');
    aDBQuery.SQL.Add(' (');
    aDBQuery.SQL.Add('  :VDATA ');
    aDBQuery.SQL.Add(' ,:VHORA ');
    aDBQuery.SQL.Add(' ,:VCHAVE ');
    aDBQuery.SQL.Add(' ,:VSTATUS ');
    aDBQuery.SQL.Add('  )');
    aDBQuery.ParamByName('VDATA').AsDate     := Date;
    aDBQuery.ParamByName('VHORA').AsTime     := Time;
    aDBQuery.ParamByName('VCHAVE').AsString  := aCHAVE;
    aDBQuery.ParamByName('VSTATUS').AsString := 'L'; //L=LIBERADO
    aDBQuery.ExecSQL;
  Finally
    aDBQuery.Close;
    aDBQuery.free;
  End;
end;


end.

