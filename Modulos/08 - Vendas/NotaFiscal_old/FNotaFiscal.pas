{--------------------------------------------------------------------------------+
|  SISTEMA...............: IndPCP (E TAMBEM AUTOR DO VESTISPCP - DESCONTINUADO)  |
|  PORTE DE EMPRESA......: Destinado para Micro Empresas                         |
|  SEGMENTO..............: Com�rcio em geral e industrias (vestu�rio)            | 
|  LINGUAGEM/DB..........: Delphi 10.3 Rio   / Firebird 2.5                      | 
|--------------------------------------------------------------------------------|
|                                                                                |
|  AUTOR/PROGRAMADOR.....: Adriano Zanini (2019)                                 |
|  E-MAIL................: fontes@altaica.com.br                                 |
|--------------------------------------------------------------------------------|
|  Voc� n�o pode comercializar o codigo-fonte. Nem mesmo parcialmente!           |
|  Comercialize somente o sistema compilado (com o nome/interface que desejar).  |
+--------------------------------------------------------------------------------}
unit FNotaFiscal;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, FFrameBarra, FFrameBotoes, ISFEdit, ISFEditbtn, ISFdbEditbtn,
   IDBEdit, uEstSearchDialogZeos, DB, DBCtrls, StdCtrls, Mask, ExtCtrls, Grids,
   DBGrids, Buttons, ACBrNFeDANFEClass,
   ACBrNFe, pcnConversao, 
   Classe.Global, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ACBrNFeDANFEFRDM, ACBrNFeDANFEFR, ACBrBase, ACBrDFe, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit, cxContainer,
  cxGroupBox, cxButtonEdit, System.StrUtils;

type
   TFrmNotaFiscal = class(TForm)
      FrmFrameBarra1: TFrmFrameBarra;
      FrmFrameBotoes1: TFrmFrameBotoes;
      Panel1: TPanel;
      ScrollBoxNF: TScrollBox;
    gbxProduto: TcxGroupBox;
      BoxCalculo: TGroupBox;
      Label21: TLabel;
      Label17: TLabel;
      Label16: TLabel;
      Label15: TLabel;
      Label20: TLabel;
      Label19: TLabel;
      Label18: TLabel;
      Label13: TLabel;
      Label29: TLabel;
      Label39: TLabel;
      EFrete: TDBEdit;
      ebase: TDBEdit;
      DbEditICMSSubst: TDBEdit;
      eseguro: TDBEdit;
      eoutras: TDBEdit;
      eprod: TDBEdit;
      enota: TDBEdit;
      DBEdit3: TDBEdit;
      DBEdit4: TDBEdit;
      DBEdit5: TDBEdit;
      BoxTransportadora: TGroupBox;
      Label30: TLabel;
      Label31: TLabel;
      Label32: TLabel;
      Label33: TLabel;
      Label34: TLabel;
      Label35: TLabel;
      Eqtde: TDBEdit;
      Eliquido: TDBEdit;
      Eespecie: TDBEdit;
      Emarca: TDBEdit;
      Enumero: TDBEdit;
      Ebruto: TDBEdit;
      DBRadioGroup1: TDBRadioGroup;
      BoxObs_Fisco: TGroupBox;
      DBMemo_Fisco: TDBMemo;
      DBMemo_OBS: TDBMemo;
      GroupBox2: TGroupBox;
      EditNomeCliente: TEdit;
      EditNomeVendedor: TEdit;
      EditCliente: TIDBEditDialog;
      EstSearchDialogZeos2: TIDBEditDialog;
      EditNomeFormaPagto: TEdit;
      EditPagamento: TIDBEditDialog;
      GroupBox1: TGroupBox;
      EditCFOP: TIDBEditDialog;
      NomeCFOP: TEdit;
    db_PedidosConferencia: TFDQuery;
    db_PedidosConferenciaItens: TFDQuery;
    dbProcurarProduto: TIDBEditDialog;
    dbProcurarNFe: TIDBEditDialog;
    EditNomeTrasportadora: TEdit;
    EditTransportadora: TIDBEditDialog;
    DBEdit14: TDBEdit;
    Label11: TLabel;
    dbEditPesquisarNCM: TIDBEditDialog;
    QryPedidoVenda: TFDQuery;
    QryPedidoVendaItens: TFDQuery;
    QryFaturas: TFDQuery;
    Label4: TLabel;
    DBEdit6: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    cxGrid1: TcxGrid;
    cxGridProduto: TcxGridDBTableView;
    cxGridColProduto: TcxGridDBColumn;
    cxGridColDescricao: TcxGridDBColumn;
    cxGridColNCM: TcxGridDBColumn;
    cxGridColCEST: TcxGridDBColumn;
    cxGridColCFOP: TcxGridDBColumn;
    cxGridColUND: TcxGridDBColumn;
    cxGridColQTD: TcxGridDBColumn;
    cxGridColVlUnit: TcxGridDBColumn;
    cxGridColVlDesconto: TcxGridDBColumn;
    cxGridColVlrTotal: TcxGridDBColumn;
    cxGridColICMS: TcxGridDBColumn;
    cxGridColIPI: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    PedidoProcurar: TIDBEditDialog;
    ConferenciaProcurar: TIDBEditDialog;
    gpTotais: TGroupBox;
    Panel4: TPanel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Panel2: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure FrmFrameBotoes1SpbSairClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbEditarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrmFrameBotoes1SpbImprimirClick(Sender: TObject);
    procedure GroupBox2Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
    procedure FrmFrameBotoes1SpbExtraClick(Sender: TObject);
    procedure cxGrid1Enter(Sender: TObject);
    procedure cxGrid1Exit(Sender: TObject);
    procedure cxGridColProdutoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGridProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridColQTDPropertiesEditValueChanged(Sender: TObject);
    procedure cxGridColVlUnitPropertiesEditValueChanged(Sender: TObject);

   private
      { Private declarations }
    mLogRegistro : String;
    FContigencia : Boolean;
    procedure ImportarPedido(nlPedido: Integer);
    procedure ExecutarProcedures;
    procedure FinalizarNotaFiscal;
    procedure prcProcurarProduto;
    procedure Validar;
    procedure DanfeGerar;
    procedure GerarFaturas;
    procedure SetDadosProduto;
   public
      { Public declarations }
      procedure FecharTabelas;
      procedure AbrirTabelas;
   end;

var
   FrmNotaFiscal : TFrmNotaFiscal;
   nValorInteiro,
   nValorParcial,
   nValorDesconto,
   nTotalNFReal,
   nValorRealPedido   : Real;
   bGerarParcelaExterna   : Boolean;



implementation

uses FPrincipal, SQLServer, Biblioteca, Global,  FBaseDados,
  FOpcaoVenda, FGeraParcelasVenda, Classe.Usuarios, App.Constantes, App.Funcoes;

{$R *.dfm}


procedure TFrmNotaFiscal.prcProcurarProduto;
begin
   dbProcurarProduto.SearchQuery.Clear;
   dbProcurarProduto.SearchQuery.Add('SELECT *  FROM VIEW_REFERENCIAS');
   dbProcurarProduto.SearchQuery.Add('WHERE');
   dbProcurarProduto.SearchQuery.Add('EMPRESA='+IntToStr(FSistema.Empresa));
   dbProcurarProduto.SearchQuery.Add('AND');
   dbProcurarProduto.SearchQuery.Add('%WHERE%');
   dbProcurarProduto.SearchQuery.Add('');

   if dbProcurarProduto.Execute then
   begin
      If not(BaseDados.qryVendaItem.state in [dsEdit]) then
         BaseDados.qryVendaItem.Edit;
      BaseDados.qryVendaItem.FieldByName('PRODUTO').AsString := dbProcurarProduto.ResultFieldAsString('REFERENCIA');
   end;
   SetDadosProduto();
end;

procedure TFrmNotaFiscal.FormCreate(Sender: TObject);
begin

   Top := 10;
   Left := 10;
   ScrollBoxNF.VertScrollBar.Position := 0;
   FrmPrincipal.actVendasEmitirNFE.Enabled := False;
   FrmFrameBotoes1.DataSource := BaseDados.dsVenda;

   dbProcurarNFe.SearchQuery.Text := ' SELECT * FROM VIEW_NOTAFISCAL '+
                                            ' WHERE'+
                                            ' EMPRESA='+FSistema.Empresa.ToString+
                                            ' AND   '+
                                            ' %WHERE%   '+
                                            ' ORDER BY EMISSAO DESC, NOTAFISCAL DESC' ;


   PedidoProcurar.SearchQuery.Text := ' SELECT * FROM VIEW_PEDIDOSVENDAS '+
                                            ' WHERE'+
                                            ' EMPRESA='+FSistema.Empresa.ToString+
                                            ' AND   '+
                                            ' %WHERE%   '+
                                            ' ORDER BY DATA DESC';

   {

SELECT *  FROM VIEW_PEDIDOCONFERENCIA
WHERE
FATURADO IN ('N','NAO')
AND
QTDE_TOTAL>0
AND
%WHERE%

   }
   ConferenciaProcurar.SearchQuery.Text := ' SELECT * FROM VIEW_PEDIDOCONFERENCIA '+
                                            ' WHERE'+
                                            ' FATURADO IN ('+QuotedStr('N')+','+ QuotedStr('NAO') +' )'+
                                            ' AND   '+
                                            ' QTDE_TOTAL>0  '+
                                            ' AND   '+
                                            ' %WHERE%   '+
                                            ' ORDER BY DATA DESC';

   BaseDados.qryVendaItem.Close;
   BaseDados.qryVenda.Close;
   BaseDados.qryVenda.ParamByName('CODIGO').Clear;
   BaseDados.qryVenda.Open;
   BaseDados.qryVendaItem.Open;


end;

procedure TFrmNotaFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   IF Key = VK_PRIOR THEN
   Begin
      ScrollBoxNF.VertScrollBar.Position :=
        ScrollBoxNF.VertScrollBar.Position - 20;
   End;

   IF Key = VK_NEXT THEN
   Begin
      ScrollBoxNF.VertScrollBar.Position :=
        ScrollBoxNF.VertScrollBar.Position + 20;
   End;

   IF Key = VK_F7 Then
   Begin
      GerarFaturas();
   End;

end;

procedure TFrmNotaFiscal.FormShow(Sender: TObject);
begin
   case FParametros.NFE.VersaoNFe of
      310 : FrmFrameBarra1.LblBarraTitulo.Caption := 'NF-e 3.10'; // obsoleto
      400 : FrmFrameBarra1.LblBarraTitulo.Caption := 'NF-e 4.00';
   end;
   BaseDados.SetGerarDANFE();
end;

procedure TFrmNotaFiscal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FrmPrincipal.actVendasEmitirNFE.Enabled := True;

   FreeAndNil(FrmNotaFiscal);
end;

procedure TFrmNotaFiscal.FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
var
  mPedido : integer;
begin
   BaseDados.qryVendaItem.Close;

   BaseDados.qryVenda.Close;
   BaseDados.qryVenda.ParamByName('CODIGO').Clear;
   BaseDados.qryVenda.Open;

   BaseDados.qryVendaItem.Open;
   OpcaoNumeroFiscal := 'NFE';

   FrmOpcaoVenda := TFrmOpcaoVenda.create(self);
   FrmOpcaoVenda.Showmodal;

   // Venda Normal
   If OpcaoVenda = 'N' then
   Begin
      AbrirTabelas;

      nTotalNFReal :=0;
      FrmFrameBotoes1.SpbAdicionarClick(Sender);

      EditCFOP.SetFocus;
   End;

   wTexto[0] := 'S';
   // Venda Baseado em Pedidos
   If OpcaoVenda = 'P' then
   Begin
     if (FParametros.Quantificar='GRADE') then
     begin
       if not ConferenciaProcurar.Execute then
          exit;
       if ConferenciaProcurar.ResultFieldAsInteger('CODIGO') = 0 then
           exit;
       mPedido := ConferenciaProcurar.ResultFieldAsInteger('CODIGO');
       if AvisoQuestao('IMPORTAR PEDIDO ',
        'PEDIDO......: ' + ConferenciaProcurar.ResultFieldAsString('CODIGO')+  #13 + #10 +
        'DATA........: ' + ConferenciaProcurar.ResultFieldAsString('DATA') + #13 + #10 +
        'CLIENTE.....: ' + ConferenciaProcurar.ResultFieldAsString('CLIENTE_NOME') + #13 + #10 +
        'VALOR TOTAL.: ' + FormatFloat('###,##0.00',ConferenciaProcurar.ResultFieldAsFloat('VLR_TOTAL')) ) = False then
        exit;
     end;

     if (FParametros.Quantificar='NORMAL') then
     begin
       if not PedidoProcurar.Execute then
         exit;
       if PedidoProcurar.ResultFieldAsInteger('CODIGO') = 0 then
         exit;
      mPedido := PedidoProcurar.ResultFieldAsInteger('CODIGO');
      if AvisoQuestao('IMPORTAR PEDIDO ',
        'PEDIDO......: ' + PedidoProcurar.ResultFieldAsString('CODIGO')+  #13 + #10 +
        'DATA........: ' + PedidoProcurar.ResultFieldAsString('DATA') + #13 + #10 +
        'CLIENTE.....: ' + PedidoProcurar.ResultFieldAsString('CLIENTE_NOME') + #13 + #10 +
        'VALOR TOTAL.: ' + FormatFloat('###,##0.00',PedidoProcurar.ResultFieldAsFloat('VLR_TOTAL')) ) = False then
        exit;
     end;

      nTotalNFReal :=0;
      ImportarPedido(  mPedido  );
      EditCFOP.SetFocus;

   End;

   If OpcaoVenda = 'D' then
   Begin
      if dbProcurarNFe.Execute then
      begin
        FecharTabelas;
        BaseDados.qryVenda.ParamByName('CODIGO').AsInteger := dbProcurarNFe.ResultFieldAsInteger('CODIGO');
        AbrirTabelas;


         if AvisoQuestao('DEVOLU��O DE PRODUTOS ',
           'Venda.......: ' + IntToStr(iAchar[0]) + #13 + #10 +
           'Data........: ' + Achar[1] + #13 + #10 +
           'Cliente.....: ' + Achar[2] + #13 + #10 +
           'Valor.......: ' + Achar[3]) = False then
            exit;
      End;
      if iAchar[0] = 0 then
      Begin
         AvisoSistema('Voc� n�o selecionou venda');
         exit;
      End;
      FecharTabelas;
      BaseDados.qryVenda.ParamByName('CODIGO').Asinteger :=iAchar[0];
      AbrirTabelas;
   End;

   // Opcaoes canceladas
   If OpcaoVenda = 'S' then
   Begin
      FrmFrameBotoes1.SpbCancelarClick(Sender);
      Abort;
   End;

end;

procedure TFrmNotaFiscal.ImportarPedido(nlPedido: Integer);
Var
  iconta: Integer;
begin

   AbrirTabelas;

   //---------------------------------------------------------------
   //  CONFERENCIA
   //---------------------------------------------------------------
   if (FParametros.Quantificar='GRADE') then
   begin
     db_PedidosConferencia.Close;
     db_PedidosConferencia.ParamByName('CODIGO').AsInteger := nlPedido;
     db_PedidosConferencia.Open;

     db_PedidosConferenciaItens.Close;
     db_PedidosConferenciaItens.ParamByName('CODIGO').AsInteger := nlPedido;
     db_PedidosConferenciaItens.Open;

     inCliente :=db_PedidosConferencia.FieldByName('CLIENTE').AsInteger;
     if ChecarCreditoCliente(inCliente) Then
     begin
        AvisoSistema('Venda n�o autorizada!'+#13+#10+
                     'O cliente que voc� selecionou est� com cr�dito bloqueado');
        BaseDados.qryVenda.Cancel;
        BaseDados.qryVendaItem.Cancel;
        Abort;
     end;

     FrmFrameBotoes1.SpbAdicionarClick(self);

     BaseDados.qryVenda.FieldByName('PEDIDO').AsInteger :=  db_PedidosConferencia.FieldByName('PEDIDO').AsInteger;
     BaseDados.qryVenda.FieldByName('CONFERENCIA').AsInteger :=  db_PedidosConferencia.FieldByName('CODIGO').AsInteger;
     BaseDados.qryVenda.FieldByName('CLIENTE').AsInteger :=  db_PedidosConferencia.FieldByName('CLIENTE').AsInteger;
     BaseDados.qryVenda.FieldByName('VENDEDOR').AsInteger :=  db_PedidosConferencia.FieldByName('VENDEDOR').AsInteger;
     BaseDados.qryVenda.FieldByName('FORMAPAGTO').AsInteger :=  db_PedidosConferencia.FieldByName('FORMA_PAGTO').AsInteger;
     BaseDados.qryVenda.FieldByName('TRANSPORTADORA').AsInteger :=  db_PedidosConferencia.FieldByName('TRANSPORTADORA').AsInteger;


     BaseDados.qryVenda.FieldByName('FRETE_QUANTIDADE').AsInteger := db_PedidosConferencia.FieldByName('FRETE_VOLUMES').AsInteger;
     BaseDados.qryVenda.FieldByName('FRETE_ESPECIE').AsString := db_PedidosConferencia.FieldByName('FRETE_ESPECIE').AsString;
     BaseDados.qryVenda.FieldByName('FRETE_MARCA').AsString := db_PedidosConferencia.FieldByName('FRETE_MARCA').AsString;
     BaseDados.qryVenda.FieldByName('OBS1').AsString := db_PedidosConferencia.FieldByName('OBSERVACAO').AsString;
     //BaseDados.qryVenda.FieldByName('DESCONTO').AsFloat := db_PedidosConferencia.FieldByName('DESCONTO').AsFloat;


     nTotalNFReal    :=db_PedidosConferencia.FieldByName('VLR_TOTAL').AsFloat;

     if BaseDados.qryVenda.FieldByName('OBS1').AsString='' then
        BaseDados.qryVenda.FieldByName('OBS1').AsString :='.';

     If (BaseDados.qryVenda.state in [dsEdit, dsInsert]) then
     Begin
        BaseDados.qryVenda.Post;
     End;
     iAchar[0] := BaseDados.qryVenda.FieldByName('CODIGO').AsInteger;

     BaseDados.qryVenda.Close;
     BaseDados.qryVendaItem.Close;
     BaseDados.qryVenda.ParamByName('CODIGO').AsInteger := iAchar[0];

     BaseDados.qryVenda.Open;
     BaseDados.qryVendaItem.Open;

     While not db_PedidosConferenciaItens.eof do
     begin

        nValorInteiro  :=0;
        nValorParcial  :=0;
        nValorDesconto :=0;
        strReferencia  :=db_PedidosConferenciaItens.FieldByName('REFERENCIA').AsString;

        BaseDados.qryVendaItem.Append;
        BaseDados.qryVendaItem.FieldByName('PRODUTO').AsString   := db_PedidosConferenciaItens.FieldByName('REFERENCIA').AsString;
        BaseDados.qryVendaItem.FieldByName('DESCRICAO').AsString := db_PedidosConferenciaItens.FieldByName('DESCRICAO').AsString;
        BaseDados.qryVendaItem.FieldByName('NCM').AsString       := GetProdutoCampo(strReferencia,'NCM');

        If db_PedidosConferencia.FieldByName('ENTREGAPARCIAL').AsString='S' Then
        begin
           if GetProdutoCampo(db_PedidosConferenciaItens.FieldByName('REFERENCIA').AsString,'REFERENCIAREDUZIDA')>'' then
              BaseDados.qryVendaItem.FieldByName('PRODUTO').AsString :=           GetProdutoCampo(db_PedidosConferenciaItens.FieldByName('REFERENCIA').AsString,'REFERENCIAREDUZIDA');

           if GetProdutoCampo(db_PedidosConferenciaItens.FieldByName('REFERENCIA').AsString,'DESCRICAOREDUZIDA')>'' then
              BaseDados.qryVendaItem.FieldByName('DESCRICAO').AsString :=         GetProdutoCampo(db_PedidosConferenciaItens.FieldByName('REFERENCIA').AsString,'DESCRICAOREDUZIDA');
        end;

        BaseDados.qryVendaItem.FieldByName('QUANTIDADE').AsFloat :=         db_PedidosConferenciaItens.FieldByName('QUANTIDADE').AsFloat;
        nValorInteiro                                              :=         db_PedidosConferenciaItens.FieldByName('VALOR_UNIT').AsFloat;

        If db_PedidosConferencia.FieldByName('ENTREGAPARCIAL').AsString='S' Then
        begin
           nValorParcial := fncGeraPercentual(nValorInteiro, db_PedidosConferencia.FieldByName('VALORPARCIAL').AsFloat);
           BaseDados.qryVendaItem.FieldByName('VLR_UNIT').AsFloat :=        nValorParcial;
        end
        else
        begin
           BaseDados.qryVendaItem.FieldByName('VLR_UNIT').AsFloat :=        nValorInteiro;
        end;

        inCFOP        :=0;
        inCliente     :=BaseDados.qryVenda.FieldByName('CLIENTE') .AsInteger;
        strReferencia :=db_PedidosConferenciaItens.FieldByName('REFERENCIA').AsString;
        inCFOP        :=BaseDados.qryVenda.FieldByName('CFOP') .AsInteger;

//        // SE O ESTADO DO CLIENTE FOR O MESMO DA EMPRESA EMISSORA DA NFE,
//        // INFORMAR O CFOP INTERNO (DENTRO DO ESTADO)
//        if (FParametros.Empresa.UF=GetClienteCampo(inCliente,'UF')) and ( StrToIntDef( fncProduto_retCampo(strReferencia,'CFOPDENTROESTADO'),0 ) >0 ) Then
//             BaseDados.qryVendaItem.FieldByName('NCFOP').AsInteger := StrToIntDef( fncProduto_retCampo(strReferencia,'CFOPDENTROESTADO'),inCFOP );
//
//        // SE O ESTADO DO CLIENTE FOR DIFERENTE DA EMPRESA EMISSORA DA NFE,
//        // INFORMAR O CFOP EXTERNO (FORA DO ESTADO)
//        if (FParametros.Empresa.UF<>GetClienteCampo(inCliente,'UF'))  and ( StrToIntDef( fncProduto_retCampo(strReferencia,'CFOPFORAESTADO'),0 ) >0 ) Then
//             BaseDados.qryVendaItem.FieldByName('NCFOP').AsInteger := StrToIntDef( fncProduto_retCampo(strReferencia,'CFOPFORAESTADO'),inCFOP );

        BaseDados.qryVendaItem.Post;

        inc(iconta);

        db_PedidosConferenciaItens.next;
        Update;
     end;




   end;

   //---------------------------------------------------------------
   //  PEDIDO
   //---------------------------------------------------------------
   if (FParametros.Quantificar='NORMAL') then
   begin
     QryPedidoVenda.Close;
     QryPedidoVenda.ParamByName('CODIGO').AsInteger := nlPedido;
     QryPedidoVenda.Open;

     QryPedidoVendaItens.Close;
     QryPedidoVendaItens.ParamByName('CODIGO').AsInteger := nlPedido;
     QryPedidoVendaItens.Open;

     inCliente :=QryPedidoVenda.FieldByName('CLIENTE').AsInteger;
     if ChecarCreditoCliente(inCliente) Then
     begin
        AvisoSistema('Venda n�o autorizada!'+#13+#10+
                     'O cliente que voc� selecionou est� com cr�dito bloqueado');
        BaseDados.qryVenda.Cancel;
        BaseDados.qryVendaItem.Cancel;
        Abort;
     end;

     FrmFrameBotoes1.SpbAdicionarClick(self);

     BaseDados.qryVenda.FieldByName('PEDIDO').AsInteger :=  QryPedidoVenda.FieldByName('CODIGO').AsInteger;
     BaseDados.qryVenda.FieldByName('CONFERENCIA').AsInteger :=  0;
     BaseDados.qryVenda.FieldByName('CLIENTE').AsInteger :=  QryPedidoVenda.FieldByName('CLIENTE').AsInteger;

     if BaseDados.qryVenda.FieldByName('CFOP').AsInteger<=0 then
     begin
        BaseDados.qryVenda.FieldByName('CFOP').AsInteger := 5101;
     end;

     BaseDados.qryVenda.FieldByName('VENDEDOR').AsInteger :=  QryPedidoVenda.FieldByName('VENDEDOR').AsInteger;
     BaseDados.qryVenda.FieldByName('FORMAPAGTO').AsInteger :=  QryPedidoVenda.FieldByName('FORMA_PAGTO').AsInteger;
     BaseDados.qryVenda.FieldByName('TRANSPORTADORA').AsInteger :=  QryPedidoVenda.FieldByName('TRANSPORTADORA').AsInteger;

     BaseDados.qryVenda.FieldByName('FRETE_QUANTIDADE').AsInteger := 0; //QryPedidoVenda.FieldByName('FRETE_VOLUMES').AsInteger;
     BaseDados.qryVenda.FieldByName('FRETE_ESPECIE').AsString := ''; //QryPedidoVenda.FieldByName('FRETE_ESPECIE').AsString;
     BaseDados.qryVenda.FieldByName('FRETE_MARCA').AsString := ''; //QryPedidoVenda.FieldByName('FRETE_MARCA').AsString;
     BaseDados.qryVenda.FieldByName('OBS1').AsString := ''; //QryPedidoVenda.FieldByName('OBSERVACAO').AsString;
     //BaseDados.qryVenda.FieldByName('DESCONTO').AsFloat := QryPedidoVenda.FieldByName('DESCONTO').AsFloat;

     nTotalNFReal    :=QryPedidoVenda.FieldByName('VLR_TOTAL').AsFloat;

     if BaseDados.qryVenda.FieldByName('OBS1').AsString='' then
        BaseDados.qryVenda.FieldByName('OBS1').AsString :='.';

     If (BaseDados.qryVenda.state in [dsEdit, dsInsert]) then
     Begin
        BaseDados.qryVenda.Post;
     End;
     iAchar[0] := BaseDados.qryVenda.FieldByName('CODIGO').AsInteger;

     BaseDados.qryVenda.Close;
     BaseDados.qryVendaItem.Close;
     BaseDados.qryVenda.ParamByName('CODIGO').AsInteger := iAchar[0];

     BaseDados.qryVenda.Open;
     BaseDados.qryVendaItem.Open;

     While not QryPedidoVendaItens.eof do
     begin

        nValorInteiro  :=0;
        nValorParcial  :=0;
        nValorDesconto :=0;
        strReferencia  :=QryPedidoVendaItens.FieldByName('REFERENCIA').AsString;

        BaseDados.qryVendaItem.Append;
        BaseDados.qryVendaItem.FieldByName('PRODUTO').AsString   := QryPedidoVendaItens.FieldByName('REFERENCIA').AsString;
        BaseDados.qryVendaItem.FieldByName('DESCRICAO').AsString := QryPedidoVendaItens.FieldByName('DESCRICAO').AsString;
        BaseDados.qryVendaItem.FieldByName('NCM').AsString       := GetProdutoCampo(strReferencia,'NCM');

//        If QryPedidoVenda.FieldByName('ENTREGAPARCIAL').AsString='S' Then
//        begin
//           if fncProduto_retCampo(QryPedidoVendaItens.FieldByName('REFERENCIA').AsString,'REFERENCIAREDUZIDA')>'' then
//              BaseDados.qryVendaItem.FieldByName('PRODUTO').AsString :=           fncProduto_retCampo(QryPedidoVendaItens.FieldByName('REFERENCIA').AsString,'REFERENCIAREDUZIDA');
//
//           if fncProduto_retCampo(QryPedidoVendaItens.FieldByName('REFERENCIA').AsString,'DESCRICAOREDUZIDA')>'' then
//              BaseDados.qryVendaItem.FieldByName('DESCRICAO').AsString :=         fncProduto_retCampo(QryPedidoVendaItens.FieldByName('REFERENCIA').AsString,'DESCRICAOREDUZIDA');
//        end;

        BaseDados.qryVendaItem.FieldByName('QUANTIDADE').AsFloat :=         QryPedidoVendaItens.FieldByName('QUANTIDADE').AsFloat;
        nValorInteiro                                              :=         QryPedidoVendaItens.FieldByName('VALOR_UNIT').AsFloat;
//
//        If QryPedidoVenda.FieldByName('ENTREGAPARCIAL').AsString='S' Then
//        begin
//           nValorParcial := fncGeraPercentual(nValorInteiro, QryPedidoVenda.FieldByName('VALORPARCIAL').AsFloat);
//           BaseDados.qryVendaItem.FieldByName('VLR_UNIT').AsFloat :=        nValorParcial;
//        end
//        else
//        begin
//           BaseDados.qryVendaItem.FieldByName('VLR_UNIT').AsFloat :=        nValorInteiro;
//        end;
        BaseDados.qryVendaItem.FieldByName('VLR_UNIT').AsFloat :=        nValorInteiro;

        inCFOP        :=0;
        inCliente     :=BaseDados.qryVenda.FieldByName('CLIENTE') .AsInteger;
        strReferencia :=QryPedidoVendaItens.FieldByName('REFERENCIA').AsString;
        inCFOP        :=BaseDados.qryVenda.FieldByName('CFOP') .AsInteger;

//        // SE O ESTADO DO CLIENTE FOR O MESMO DA EMPRESA EMISSORA DA NFE,
//        // INFORMAR O CFOP INTERNO (DENTRO DO ESTADO)
//        if (FParametros.Empresa.UF=GetClienteCampo(inCliente,'UF')) and ( StrToIntDef( fncProduto_retCampo(strReferencia,'CFOPDENTROESTADO'),0 ) >0 ) Then
//             BaseDados.qryVendaItem.FieldByName('NCFOP').AsInteger := StrToIntDef( fncProduto_retCampo(strReferencia,'CFOPDENTROESTADO'),inCFOP );
//
//        // SE O ESTADO DO CLIENTE FOR DIFERENTE DA EMPRESA EMISSORA DA NFE,
//        // INFORMAR O CFOP EXTERNO (FORA DO ESTADO)
//        if (FParametros.Empresa.UF<>GetClienteCampo(inCliente,'UF'))  and ( StrToIntDef( fncProduto_retCampo(strReferencia,'CFOPFORAESTADO'),0 ) >0 ) Then
//             BaseDados.qryVendaItem.FieldByName('NCFOP').AsInteger := StrToIntDef( fncProduto_retCampo(strReferencia,'CFOPFORAESTADO'),inCFOP );


        BaseDados.qryVendaItem.Post;

        inc(iconta);

        QryPedidoVendaItens.next;
        Update;
     end;


   end;

   ExecutarProcedures;
   BaseDados.db_Parametros.Refresh;

   BaseDados.qryVenda.Edit;

   {***********************************************************************
    ** De acordo com o Minist�rio da Fazenda - 2012:                    ***
    **    1 � Simples Nacional                                          ***
    **    2 � Simples Nacional excesso de sublimite da receita bruta    ***
    **    3 � Regime Normal                                             ***
    ***********************************************************************
    **  se a empresa FOR optante do simples, pegar aliquota do SIMPLES   **
    ***********************************************************************}
   if BaseDados.db_Parametros.FieldByName('REGIME_TRIB').AsInteger=1 Then
   begin
      BaseDados.qryVenda.FieldByName('OBS1').AsString := UpperCase( fnCFOP_DETALHE(BaseDados.qryVenda.FieldByName('CFOP').AsInteger) );
      BaseDados.qryVenda.FieldByName('OBS1').AsString := UpperCase( SubstituirCampoTexto(BaseDados.qryVenda.FieldByName('OBS1').AsString,'%VSIMPLES%', FormatFloat('###,##0.00',BaseDados.qryVenda.FieldByName('SIMPLESNACIONAL_VALOR').AsFloat) ) );
   end;

end;

procedure TFrmNotaFiscal.FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
begin

   FrmFrameBotoes1.SpbSalvarClick(Sender);

   if (BaseDados.qryVendaItem.state in [dsEdit, dsInsert]) then
      BaseDados.qryVendaItem.Post;


   ExecutarProcedures;

   BaseDados.qryVenda.Refresh;

end;

procedure TFrmNotaFiscal.GroupBox2Exit(Sender: TObject);
begin
  Validar;
end;

procedure TFrmNotaFiscal.FrmFrameBotoes1SpbEditarClick(Sender: TObject);
begin
   // -------------------------------------------------------------------------
   // ------        perguntar                                             -----
   // -------------------------------------------------------------------------
   if not FProgramador then
     If BaseDados.qryVenda.FieldByName('STATUS').AsString = 'S' then
     Begin
        Informar('Venda j� foi concluida. N�o � permitido alterar.');
        exit;
     end;

   FrmFrameBotoes1.SpbEditarClick(Sender);
   BaseDados.qryVendaItem.Edit;

end;

procedure TFrmNotaFiscal.FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbCancelarClick(Sender);
   BaseDados.qryVendaItem.Cancel;

end;

procedure TFrmNotaFiscal.FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
begin

   if BaseDados.qryVenda.IsEmpty then
     exit;

   if not FProgramador then
     If BaseDados.qryVenda.FieldByName('STATUS').AsString = 'C' then
     Begin
        Informar('Venda j� foi Cancelada. ');
        exit;
     end;

   if not FProgramador then
     if (BaseDados.qryVenda.FieldByName('NOTAFISCAL').AsInteger > 0) and
        (BaseDados.qryVenda.FieldByName('STATUS').AsString = 'S')    then
     Begin
        AvisoSistemaErro('Venda j� foi faturada. N�o � permitido excluir.'+
                         sLineBreak+
                         sLineBreak+
                         'Voc� poder� somente cancelar a NF-e.' );
        exit;
     End;

   if not FProgramador then
     If (BaseDados.qryVenda.FieldByName('NFE_TRANSMITIDO').AsString = 'SIM') then
     begin
        AvisoSistema('Esta Nota Fiscal Eletr�nica j� foi enviada para a SEFAZ. ' +
                     sLineBreak+
                     sLineBreak+
                     'N�o � permitido excluir. Somente "Cancelar".');
        Exit;
     end;


   // -------------------------------------------------------------------------
   // ------                                                              -----
   // -------------------------------------------------------------------------
   if pergunta('Tem certeza que deseja excluir este registro?')=false then
      exit;

   BaseDados.SPNFE_PROCESSAR.ParamByName('NEMPRESA').AsInteger   := FSistema.Empresa;
   BaseDados.SPNFE_PROCESSAR.ParamByName('NVENDA').AsInteger     := BaseDados.qryVenda.FieldByName('CODIGO').AsInteger;
   BaseDados.SPNFE_PROCESSAR.ParamByName('ACAO').AsString        := 'EXCLUIR';
   BaseDados.SPNFE_PROCESSAR.ExecProc;

   // -------------------------------------------------------------------------
   // ------                                                              -----
   // -------------------------------------------------------------------------
   FecharTabelas;
   AbrirTabelas;

end;

procedure TFrmNotaFiscal.FrmFrameBotoes1SpbExtraClick(Sender: TObject);
begin
  GerarFaturas();
end;

procedure TFrmNotaFiscal.cxGrid1Enter(Sender: TObject);
begin
   FrmFrameBotoes1.SpbSalvarClick(Sender);
   if BaseDados.qryVenda.FieldByName('CLIENTE').AsInteger<1 then
   begin
     Aviso('Informe o codigo do Cliente');
     EditCliente.SetFocus;
     abort;
   end;
   if BaseDados.QryVendaItem.IsEmpty then
   begin
     BaseDados.QryVendaItem.Append;

   end;
end;

procedure TFrmNotaFiscal.cxGrid1Exit(Sender: TObject);
begin
   inVenda := BaseDados.qryVenda.FieldByName('CODIGO').AsInteger;
   BaseDados.SP_NFE_CALCULA.ParamByName('NEMPRESA').AsInteger   := FSistema.Empresa;
   BaseDados.SP_NFE_CALCULA.ParamByName('NCODIGO').AsInteger     := inVenda;
   BaseDados.SP_NFE_CALCULA.ParamByName('ACAO').AsString        := 'SAIDA';
   BaseDados.SP_NFE_CALCULA.ExecProc;
   BaseDados.qryVenda.Refresh;
end;

procedure TFrmNotaFiscal.cxGridColProdutoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  prcProcurarProduto;
end;

procedure TFrmNotaFiscal.cxGridColQTDPropertiesEditValueChanged(
  Sender: TObject);
begin
//  BaseDados.Calcular_VendaItens();
end;

procedure TFrmNotaFiscal.cxGridColVlUnitPropertiesEditValueChanged(
  Sender: TObject);
begin
//  BaseDados.Calcular_VendaItens();
end;

procedure TFrmNotaFiscal.SetDadosProduto;
var
  mIDProduto : Integer;
  mUND       : String;
begin
   mIDProduto := 0;
   inCliente :=  BaseDados.QryVenda.FieldByName('CLIENTE').AsInteger;

   if (BaseDados.QryVendaItem.FieldByName('PRODUTO').AsString = '') or
     (BaseDados.QryVendaItem.FieldByName('PRODUTO').AsString = '0') then
      Exit;

   strReferencia :=BaseDados.QryVendaItem.FieldByName('PRODUTO').AsString;
   mIDProduto := StrToIntDef(GetProdutoCampo(strReferencia,'CODIGO'),0);
   if mIDProduto>0 then
     BaseDados.QryVendaItem.FieldByName('IDPRODUTO').AsInteger   := mIDProduto;
   BaseDados.QryVendaItem.FieldByName('DESCRICAO').AsString := GetProdutoCampo(BaseDados.QryVendaItem.FieldByName('PRODUTO').AsString,'DESCRICAO');
   BaseDados.QryVendaItem.FieldByName('QUANTIDADE').AsInteger    := 1;
   if GetProdutoCampo(strReferencia,'NCM')>'' then
   begin
      BaseDados.QryVendaItem.FieldByName('NCM').AsString        := GetProdutoCampo(strReferencia,'NCM');
      BaseDados.QryVendaItem.FieldByName('CEST').AsString       := GetNCMCEST(BaseDados.QryVendaItem.FieldByName('NCM').AsString);
   end;

   mUND := GetProdutoCampo(strReferencia,'UNIDADE');
   BaseDados.QryVendaItem.FieldByName('CLASSIFICACAO_FISCAL').AsString   := GetProdutoCampo(strReferencia,'CLASSIFICAO_FISCAL');
   BaseDados.QryVendaItem.FieldByName('SITUACAO_TRIBUTARIA').AsString    := GetProdutoCampo(strReferencia,'SITUACAO_TRIBUTARIA');
   BaseDados.QryVendaItem.FieldByName('UND').AsString                    := ifthen(mUND='','PC',mUND);
   BaseDados.QryVendaItem.FieldByName('VLR_UNIT').AsFloat                := (StrToFloatDef( GetProdutoCampo(strReferencia,'PRC_VENDA'),0));

   // SE O ESTADO DO CLIENTE FOR O MESMO DA EMPRESA EMISSORA DA NFE,
   // INFORMAR O CFOP INTERNO (DENTRO DO ESTADO)
   if (BaseDados.db_Parametros.FieldByName('UF').AsString=GetClienteCampo(inCliente,'UF')) and ( StrToIntDef( GetProdutoCampo(strReferencia,'CFOPDENTROESTADO'),0 ) >0 ) Then
        BaseDados.QryVendaItem.FieldByName('NCFOP').AsInteger := StrToIntDef( GetProdutoCampo(strReferencia,'CFOPDENTROESTADO'),inCFOP );

   // SE O ESTADO DO CLIENTE FOR DIFERENTE DA EMPRESA EMISSORA DA NFE,
   // INFORMAR O CFOP EXTERNO (FORA DO ESTADO)
   if (BaseDados.db_Parametros.FieldByName('UF').AsString<>GetClienteCampo(inCliente,'UF'))  and ( StrToIntDef( GetProdutoCampo(strReferencia,'CFOPFORAESTADO'),0 ) >0 ) Then
        BaseDados.QryVendaItem.FieldByName('NCFOP').AsInteger := StrToIntDef( GetProdutoCampo(strReferencia,'CFOPFORAESTADO'),inCFOP );

   if BaseDados.QryVendaItem.FieldByName('NCFOP').AsInteger=0 then
     BaseDados.QryVendaItem.FieldByName('NCFOP').AsInteger := BaseDados.QryVenda.FieldByName('CFOP') .AsInteger;

   BaseDados.QryVendaItem.FieldByName('NCM').AsString                  :=  GetProdutoCampo(strReferencia,'NCM');
   BaseDados.QryVendaItem.FieldByName('SITUACAO_TRIBUTARIA').AsString  :=  GetProdutoCampo(strReferencia,'SITUACAO_TRIBUTARIA');

   {***********************************************************************
    ** De acordo com o Minist�rio da Fazenda - 2012:                    ***
    **    1 � Simples Nacional                                          ***
    **    2 � Simples Nacional excesso de sublimite da receita bruta    ***
    **    3 � Regime Normal                                             ***
    ***********************************************************************
    **  se a empresa FOR optante do simples, pegar aliquota do SIMPLES   **
    ***********************************************************************}

   // Se n�o houver ST (Situa�ao tributaria), n�o calcula ICMS
   case BaseDados.db_Parametros.FieldByName('REGIME_TRIB').AsInteger of
      0,
     -1,
      1,
      2: BaseDados.QryVendaItem.FieldByName('ICMS').AsFloat := 0;
      3: Begin
            BaseDados.QryVendaItem.FieldByName('ICMS').AsFloat := BaseDados.RetornaImposto('ICMS');
            BaseDados.QryVendaItem.FieldByName('IPI').AsFloat  := BaseDados.RetornaImposto('IPI');
         End;

   end;
end;


procedure TFrmNotaFiscal.cxGridProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F8 Then
   begin
     prcProcurarProduto;
   end;
end;

procedure TFrmNotaFiscal.DanfeGerar;
begin
   if BaseDados.qryVenda.IsEmpty then
   begin
      avisosistema('Selecione uma NFe para enviar a SEFAZ.');
      exit;
   end;


   If (BaseDados.qryVenda.state in [dsEdit, dsInsert]) then
      BaseDados.qryVenda.Post;

   inVenda := 0;
   inVenda := BaseDados.qryVenda.FieldByName('CODIGO').AsInteger;

   FinalizarNotaFiscal;
   BaseDados.GerarNumeroNotaFiscal(inVenda);
   FrmFrameBotoes1.SpbSalvar.Click;
   // -------------------------------------------------------------------------
   // transferencia de comoandos
   // VALIDAR
   // -------------------------------------------------------------------------

   IF (BaseDados.qryVenda.IsEmpty) or (BaseDados.qryVenda.RecordCount<1) Then
      FrmFrameBotoes1.SpbProcurar.Click;

   IF (BaseDados.qryVenda.IsEmpty) or (BaseDados.qryVenda.RecordCount<1) Then
   begin
     Informar('Primeiro localize a NF (bot�o procurar) para depois Validar');
     exit;
   end;

   if BaseDados.qryVenda.FieldByName('FORMAPAGTO').AsInteger>0 then
   begin
     try
       prcViewFaturas(QryFaturas,
                      BaseDados.qryVenda.FieldByName('CLIENTE').AsInteger,
                      BaseDados.qryVenda.FieldByName('NOTAFISCAL').AsInteger);

       if QryFaturas.RecordCount<1 then
       begin
         Informar('Por favor, gere as parcelas do faturamento (F7 - Faturas).');
         exit;
       end;

     finally
       QryFaturas.Close;
     end;
   end;

   if not FGerarDANFE then
   begin
     AvisoSistemaErro(_ERRODANFE);
   end;

   FecharTabelas;
   BaseDados.qryVenda.ParamByName('CODIGO').AsInteger :=inVenda;
   AbrirTabelas;

   //-----------------------------------------------------------------------------
   //
   //-----------------------------------------------------------------------------
   try
     prcStatusMessage('Enviando NF-e: '+ZeroEsquerda(BaseDados.qryVenda.FieldByName('NOTAFISCAL').AsString,6),
                      'Aguarde... transmitindo NF-e',
                      True);

     BaseDados.GerarNFe(BaseDados.qryVenda.FieldByName('NOTAFISCAL').AsInteger);

     if not FContigencia then
     begin
       BaseDados.ACBrNFe1.Enviar(BaseDados.GerarLote);
       Sleep(500);
     end;
     BaseDados.ACBrNFe1.NotasFiscais.GravarXML();

     try
       BaseDados.qryVenda.Edit;
       BaseDados.qryVenda.FieldByName('NFE_CERTIFICADO').AsString        := BaseDados.ACBrNFe1.Configuracoes.Certificados.NumeroSerie;
       BaseDados.qryVenda.FieldByName('NFE_ARQUIVO').AsString            := BaseDados.ACBrNFe1.NotasFiscais.Items[0].NomeArq;
       BaseDados.qryVenda.FieldByName('NFE_ARQUIVO').AsString            := BaseDados.ACBrNFe1.NotasFiscais.Items[0].NomeArq;
       BaseDados.qryVenda.FieldByName('NFE_RECIBO').AsString             := BaseDados.ACBrNFe1.WebServices.Retorno.Recibo;
       BaseDados.qryVenda.FieldByName('NFE_CHAVEACESSO').AsString        := BaseDados.ACBrNFe1.WebServices.Retorno.ChaveNFe;
       BaseDados.qryVenda.FieldByName('NFE_PROTOCOLOUSO').AsString       := BaseDados.ACBrNFe1.WebServices.Retorno.Protocolo;
       BaseDados.qryVenda.FieldByName('NFE_SITUACAOCODIGO').AsInteger    := BaseDados.ACBrNFe1.WebServices.Retorno.cStat;
       BaseDados.qryVenda.FieldByName('NFE_SITUACAOSEFAZ').AsString      := BaseDados.ACBrNFe1.WebServices.Retorno.xMotivo;
       BaseDados.qryVenda.FieldByName('NFE_ARQUIVO').AsString            := BaseDados.ACBrNFe1.NotasFiscais.Items[0].NomeArq;
       BaseDados.qryVenda.FieldByName('NFE_VALIDADO').AsString           := 'SIM';
       BaseDados.qryVenda.FieldByName('NFE_ASSINADO').AsString           := 'SIM';
       if BaseDados.ACBrNFe1.NotasFiscais.Items[0].Confirmada then
         BaseDados.qryVenda.FieldByName('NFE_TRANSMITIDO').AsString      := 'SIM'
       else
         BaseDados.qryVenda.FieldByName('NFE_TRANSMITIDO').AsString      := 'CONTINGENCIA';
       BaseDados.qryVenda.Post;
     finally
       BaseDados.qryVenda.Refresh;
     end;

     mLogRegistro := 'Transmitiu para o servidor da SEFAZ a Nota Fiscal Eletr�nica '+BaseDados.qryVenda.FieldByName('NOTAFISCAL').AsString;
     FUsuario.LogUsuario('Processamento de Nota Fiscal Eletr�nica',mLogRegistro);

     EnviarEmailNF(BaseDados.qryVenda.FieldByName('CODIGO').AsInteger,BaseDados.ACBrNFe1);
   finally
     prcStatusMessage('','',False);
   end;

end;

procedure TFrmNotaFiscal.FrmFrameBotoes1SpbImprimirClick(Sender: TObject);
begin
  DanfeGerar();
end;

procedure TFrmNotaFiscal.FrmFrameBotoes1SpbProcurarClick(Sender: TObject);
begin
   dbProcurarNFe.SearchQuery.Clear;
   dbProcurarNFe.SearchQuery.Add('SELECT * FROM VIEW_NOTAFISCAL');
   dbProcurarNFe.SearchQuery.Add('WHERE');
   dbProcurarNFe.SearchQuery.Add('EMPRESA='+IntToStr(FSistema.Empresa));
   dbProcurarNFe.SearchQuery.Add('AND');
   dbProcurarNFe.SearchQuery.Add('%WHERE%');
   dbProcurarNFe.SearchQuery.Add('ORDER BY EMISSAO DESC');
   dbProcurarNFe.SearchQuery.Add('');

   if dbProcurarNFe.Execute then
   begin
      FecharTabelas;
      BaseDados.qryVenda.ParamByName('CODIGO').AsInteger := dbProcurarNFe.ResultFieldAsInteger('CODIGO');
      AbrirTabelas;
   end;
end;

procedure TFrmNotaFiscal.FrmFrameBotoes1SpbSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmNotaFiscal.AbrirTabelas;
begin
   BaseDados.qryVenda.Open;
   BaseDados.qryVendaItem.Open;
end;

procedure TFrmNotaFiscal.Validar;
begin
  //dbGrid_Produtos.Enabled := ((EditCFOP.Text<>'') and (EditCliente.Text<>'') );

  if (EditCFOP.Text='') then
  begin
     aviso('Informe o campo CFOP');
     EditCFOP.SetFocus;
     exit;
  end;

  if (EditCliente.Text='') then
  begin
     aviso('Informe o campo Cliente');
     EditCliente.SetFocus;
     exit;
  end;
end;

procedure TFrmNotaFiscal.GerarFaturas;
Var
   nVenda: Integer;
begin
   nValorInteiro  :=0;
   nValorParcial  :=0;

   FinalizarNotaFiscal;
   FrmFrameBotoes1.SpbSalvar.Click;
   nVenda := BaseDados.qryVenda.FieldByName('CODIGO').AsInteger;

   nTotalNFReal      := BaseDados.qryVenda.FieldByName('TOTAL_NF').asFloat;
   if nTotalNFReal<=0 then
   begin
     Mensagem('N�o h� valor suficiente para gerar Faturas');
     exit;
   end;

   bGerarParcelaExterna := False;
   FrmGeraParcelasVenda := TFrmGeraParcelasVenda.create(self);
   FrmGeraParcelasVenda.Showmodal;

   nValorInteiro  :=0;
   nValorParcial  :=0;

end;


procedure TFrmNotaFiscal.FecharTabelas;
begin
   BaseDados.qryVenda.Close;
   BaseDados.qryVendaItem.Close;
end;

procedure TFrmNotaFiscal.ExecutarProcedures;
begin


   inVenda := BaseDados.qryVenda.FieldByName('CODIGO').AsInteger;

   BaseDados.qryVenda.Close;
   BaseDados.qryVenda.ParamByName('CODIGO').AsInteger := inVenda;
   BaseDados.qryVenda.Open;

   inVenda := BaseDados.qryVenda.FieldByName('CODIGO').AsInteger;
   BaseDados.SP_NFE_CALCULA.ParamByName('NEMPRESA').AsInteger   := FSistema.Empresa;
   BaseDados.SP_NFE_CALCULA.ParamByName('NCODIGO').AsInteger     := inVenda;
   BaseDados.SP_NFE_CALCULA.ParamByName('ACAO').AsString        := 'SAIDA';
   BaseDados.SP_NFE_CALCULA.ExecProc;


end;

procedure TFrmNotaFiscal.FinalizarNotaFiscal;
begin

   // se nao houver numero de nota fiscal, ent�o gere.
   inVenda := BaseDados.qryVenda.FieldByName('CODIGO').AsInteger;

   If BaseDados.qryVenda.FieldByName('STATUS').AsString='S' then
      exit;
   if pergunta('Finalizar Nota Fiscal e baixar estoque?')=false then
   begin
      avisosistema('Voc� cancelou a opera��o. Para processeguir � necess�rio finalizar a nota fiscal.');
      abort;
   end;

   BaseDados.GerarNumeroNotaFiscal(inVenda);

   BaseDados.qryVenda.Close;
   BaseDados.qryVenda.ParamByName('CODIGO').AsInteger := inVenda;
   BaseDados.qryVenda.Open;


   BaseDados.SPNFE_PROCESSAR.ParamByName('NEMPRESA').AsInteger   := FSistema.Empresa;
   BaseDados.SPNFE_PROCESSAR.ParamByName('NVENDA').AsInteger     := BaseDados.qryVenda.FieldByName('CODIGO').AsInteger;
   BaseDados.SPNFE_PROCESSAR.ParamByName('ACAO').AsString        := 'FECHAR';
   BaseDados.SPNFE_PROCESSAR.ExecProc;


   BaseDados.qryVenda.Close;
   BaseDados.qryVenda.ParamByName('CODIGO').AsInteger := inVenda;
   BaseDados.qryVenda.Open;

end;

end.
