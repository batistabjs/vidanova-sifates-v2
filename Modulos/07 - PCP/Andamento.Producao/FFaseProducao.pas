{--------------------------------------------------------------------------------+
|  SISTEMA...............: IndPCP (E TAMBEM AUTOR DO VESTISPCP - DESCONTINUADO)  |
|  PORTE DE EMPRESA......: Destinado para Micro Empresas                         |
|  SEGMENTO..............: Com�rcio em geral e industrias (vestu�rio)            |  
|  LINGUAGEM/DB..........: Delphi 10.3 Rio   / Firebird 2.5                      | 
|--------------------------------------------------------------------------------|
|                                                                                |
|  AUTOR/PROGRAMADOR.....: Adriano Zanini (2019)                                 |
|  E-MAIL................: fontes@altaica.com.br                                 ||--------------------------------------------------------------------------------||  Voc� n�o pode comercializar o codigo-fonte. Nem mesmo parcialmente!           ||  Comercialize somente o sistema compilado (com o nome/interface que desejar).  |
+--------------------------------------------------------------------------------}

unit FFaseProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.DBCGrids, ISFEdit, ISFEditbtn, ISFdbEditbtn,
  IDBEdit, uEstSearchDialogZeos, Vcl.ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.Buttons, FFrameBarra,
  Classe.Global;

type
  TFrmFaseProducao = class(TForm)
    FrmFrameBarra1: TFrmFrameBarra;
    Panel1: TPanel;
    Panel2: TPanel;
    btnDefeitos: TBitBtn;
    BitBtn2: TBitBtn;
    AdvGroupBox1: TGroupBox;
    BoxFornecedor: TGroupBox;
    EditDescricao: TEdit;
    dbProcurarReferencia: TIDBEditDialog;
    btnPerdas: TBitBtn;
    GroupBox5: TGroupBox;
    GroupBox4: TGroupBox;
    LocalizaOrdemProducao: TIDBEditDialog;
    ctrlgridFases: TDBCtrlGrid;
    gbxFaseAtual: TGroupBox;
    db_FasesGradeLista: TFDQuery;
    ds_FasesGradeLista: TDataSource;
    db_OrdemProducaoFases: TFDQuery;
    ds_OrdemProducaoFases: TDataSource;
    db_FasesDestino: TFDQuery;
    ds_FasesDestino: TDataSource;
    db_ReferenciasFaseGrade: TFDQuery;
    ds_ReferenciasFaseGrade: TDataSource;
    db_ReferenciasFaseGradeREFERENCIA: TStringField;
    db_ReferenciasFaseGradeCOR_ID: TIntegerField;
    db_ReferenciasFaseGradeCOR: TStringField;
    db_ReferenciasFaseGradeTAMANHO_ID: TIntegerField;
    db_ReferenciasFaseGradeTAMANHO: TStringField;
    db_ReferenciasFaseGradeORDEM_GRADE: TStringField;
    db_ReferenciasFaseGradeTAMANHO_1: TStringField;
    db_ReferenciasFaseGradeQTDE_PRODUZIR: TIntegerField;
    db_ReferenciasFaseGradeQTDE_TRANSFERIDA: TIntegerField;
    db_ReferenciasFaseGradeQTDE_PENDENTE: TIntegerField;
    db_ReferenciasFaseGradeQTDE_DEFEITO: TIntegerField;
    db_ReferenciasFaseGradeQTDE_PERDA: TIntegerField;
    btnRetoronServicos: TButton;
    db_ReferenciasFaseGradeTERCEIRIZADO: TIntegerField;
    db_ReferenciasFaseGradeFASETRANSFERENCIA: TIntegerField;
    btnEstornarDefeitos: TBitBtn;
    btnEstornarPerdas: TBitBtn;
    btnEncerrar: TBitBtn;
    BtnRemessas: TBitBtn;
    SP_OrdemPRODUCAO_FINALIZAR: TFDStoredProc;
    db_OrdemProducaoFasesCODIGO: TIntegerField;
    db_OrdemProducaoFasesFASE: TIntegerField;
    db_OrdemProducaoFasesREFERENCIA: TStringField;
    db_OrdemProducaoFasesDESCRICAO: TStringField;
    BitBtn4: TBitBtn;
    pnGridDetalhes: TPanel;
    DBText2: TDBText;
    DBText1: TDBText;
    db_AndamentoReferencias: TFDQuery;
    db_AndamentoReferenciasEMPRESA: TIntegerField;
    db_AndamentoReferenciasCODIGO: TIntegerField;
    db_AndamentoReferenciasORDEMPRODUCAO: TIntegerField;
    db_AndamentoReferenciasDATA: TSQLTimeStampField;
    db_AndamentoReferenciasDATARETORNO: TSQLTimeStampField;
    db_AndamentoReferenciasTERCEIRIZADO: TIntegerField;
    db_AndamentoReferenciasFASE: TIntegerField;
    db_AndamentoReferenciasREFERENCIA: TStringField;
    db_AndamentoReferenciasCOR_ID: TIntegerField;
    db_AndamentoReferenciasCOR: TStringField;
    db_AndamentoReferenciasTAMANHO_ID: TIntegerField;
    db_AndamentoReferenciasTAMANHO: TStringField;
    db_AndamentoReferenciasORDEM_GRADE: TStringField;
    db_AndamentoReferenciasQTDE_ENVIADA: TIntegerField;
    db_AndamentoReferenciasQTDE_RETORNADA: TIntegerField;
    db_AndamentoReferenciasQTDE_PERDAS: TIntegerField;
    db_AndamentoReferenciasQTDE_DEFEITOS: TIntegerField;
    db_AndamentoReferenciasVLR_UNIT: TFloatField;
    db_AndamentoReferenciasFASECONCLUIDA: TStringField;
    db_OrdemProducaoProduzido: TFDQuery;
    db_OrdemProducaoProduzidoEMPRESA: TIntegerField;
    db_OrdemProducaoProduzidoCODIGO: TIntegerField;
    db_OrdemProducaoProduzidoAPROVADO: TStringField;
    db_OrdemProducaoProduzidoDATA: TSQLTimeStampField;
    db_OrdemProducaoProduzidoDATAATUALIZACAO: TSQLTimeStampField;
    db_OrdemProducaoProduzidoREFERENCIA: TStringField;
    db_OrdemProducaoProduzidoIDENTIFICADOR: TStringField;
    db_OrdemProducaoProduzidoCOR_ID: TIntegerField;
    db_OrdemProducaoProduzidoCOR: TStringField;
    db_OrdemProducaoProduzidoTAMANHO_ID: TIntegerField;
    db_OrdemProducaoProduzidoTAMANHO: TStringField;
    db_OrdemProducaoProduzidoORDEM_GRADE: TStringField;
    db_OrdemProducaoProduzidoCELULA_COL: TIntegerField;
    db_OrdemProducaoProduzidoCOLUNA_ROW: TIntegerField;
    db_OrdemProducaoProduzidoQUANTIDADE: TFloatField;
    db_OrdemProducaoProduzidoQUALIDADE: TIntegerField;
    db_OrdemProducaoProduzidoBAIXADO: TStringField;
    db_OrdemProducaoProduzidoUSUARIO: TStringField;
    SP_ReferenciaLancaGrade: TFDStoredProc;
    QryMovimentacaoProdutos: TFDQuery;
    db_AndamentoReferenciasIDENTIFICADOR: TStringField;
    db_AndamentoReferenciasGEROUPAGAMENTO: TStringField;
    db_AndamentoReferenciasENCERRADO: TStringField;
    cxGrid: TcxGrid;
    cxGridProdFase: TcxGridDBTableView;
    cxGridNivel: TcxGridLevel;
    cxGridProdFaseReferencia: TcxGridDBColumn;
    cxGridProdFaseDescricao: TcxGridDBColumn;
    GroupBox1: TGroupBox;
    Panel4: TPanel;
    EditQuantidade: TLabeledEdit;
    cxGrid1: TcxGrid;
    cxGridCorTam: TcxGridDBTableView;
    cxGridCorTamCor: TcxGridDBColumn;
    cxGridCorTamTamanho: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridCorTamProduzir: TcxGridDBColumn;
    cxGridCorTamDefeito: TcxGridDBColumn;
    cxGridCorTamPerda: TcxGridDBColumn;
    Panel3: TPanel;
    btnTransferir: TBitBtn;
    cxGrid2: TcxGrid;
    cxGridFase: TcxGridDBTableView;
    cxGridFaseOrdem: TcxGridDBColumn;
    cxGridFaseNomeFase: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    procedure db_FasesGradeListaAfterScroll(DataSet: TDataSet);
    procedure LocalizaOrdemProducaoChange(Sender: TObject);
    procedure dbProcurarReferenciaChange(Sender: TObject);
    procedure dbProcurarReferenciaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTransferirClick(Sender: TObject);
    procedure btnEncerrarClick(Sender: TObject);
    procedure btnDefeitosClick(Sender: TObject);
    procedure btnPerdasClick(Sender: TObject);
    procedure btnRetoronServicosClick(Sender: TObject);
    procedure btnEstornarDefeitosClick(Sender: TObject);
    procedure btnEstornarPerdasClick(Sender: TObject);
    procedure BtnRemessasClick(Sender: TObject);
    procedure db_FasesGradeListaAfterClose(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cxGridCorTamCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    procedure fncOrdemProducaoFases;
    procedure fncRecarregarDadosGrade;
    procedure prcMontarPesquisaBotaoReferencia;
    procedure prcOrdemPRODUCAO_FINALIZAR;
    procedure prcChecarQuantidadeDisponivel;
    procedure prcSomarQuantidade;

    { Private declarations }
  public
    { Public declarations }
    procedure prcReabrirTabela;
  end;

var
  FrmFaseProducao: TFrmFaseProducao;
  nFaseOrigem  : Integer;
  nFaseDestino : Integer;
  strlFaseAtual, strlFaseSeguinte, lsOrdem : String;
  lnChecarQuantidades : Integer;


implementation

uses FPrincipal, Biblioteca, Global, SQLServer, FFaseProducaoTransferirFase,
  FFaseProducaoSelecionar, FFaseProducaoDefeito, FFaseProducaoPerda,
  FFaseProducaoRetornoTerceirizados,
  FFaseProducaoDefeitoEstornar, FFaseProducaoPerdaEstornar, FDistribuirRemessa,
  FFaseProducaoLancaEstoque, App.Constantes;

{$R *.dfm}



procedure TFrmFaseProducao.btnEstornarDefeitosClick(Sender: TObject);
Var
  mIDCor, mIDTamanho : Integer;
begin
   mIDCor     := 0;
   mIDTamanho := 0;

   mIDCor     :=db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger;
   mIDTamanho :=db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger;

   if (db_ReferenciasFaseGrade.FieldByName('QTDE_DEFEITO').AsInteger<=0) then
   begin
      aviso('N�o h� defeito para ser estornado.');
      exit;
   end;

   nOrdemProducao      := StrToIntDef( LocalizaOrdemProducao.Text,0);
   strReferencia       := UpperCase(Trim(dbProcurarReferencia.Text));
   nFaseOrigem         := StrToIntDef( db_FasesGradeLista.FieldByName('FASE').AsString,0);
   nFaseDestino        := StrToIntDef( db_FasesDestino.FieldByName('FASE').AsString,0);


   FrmFaseProducaoDefeitoEstornar :=TFrmFaseProducaoDefeitoEstornar.Create(Self);
   FrmFaseProducaoDefeitoEstornar.Showmodal;

   if nQuantidadeDigitada>0 then
   begin
      prcFaseDefeitoEstornar(nOrdemProducao,
                          nFaseOrigem,
                          nFaseOrigem,
                          db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger,
                          db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger,
                          strReferencia,
                          nQuantidadeDigitada
                         );
   end;

   prcReabrirTabela;

end;

procedure TFrmFaseProducao.BitBtn2Click(Sender: TObject);
begin
   close;
end;

procedure TFrmFaseProducao.btnEstornarPerdasClick(Sender: TObject);
Var
  mIDCor, mIDTamanho : Integer;
begin
   mIDCor     := 0;
   mIDTamanho := 0;

   mIDCor     :=db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger;
   mIDTamanho :=db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger;


   if (db_ReferenciasFaseGrade.FieldByName('QTDE_PERDA').AsInteger<=0) then
   begin
      aviso('N�o h� perda para ser estornada.');
      exit;
   end;

   nOrdemProducao      := StrToIntDef( LocalizaOrdemProducao.Text,0);
   strReferencia       := UpperCase(Trim(dbProcurarReferencia.Text));
   nFaseOrigem         := StrToIntDef( db_FasesGradeLista.FieldByName('FASE').AsString,0);
   nFaseDestino        := StrToIntDef( db_FasesDestino.FieldByName('FASE').AsString,0);


   FrmFaseProducaoPerdaEstornar :=TFrmFaseProducaoPerdaEstornar.Create(Self);
   FrmFaseProducaoPerdaEstornar.Showmodal;

   if nQuantidadeDigitada>0 then
   begin
      prcFasePerdaEstornar(nOrdemProducao,
                          nFaseOrigem,
                          nFaseOrigem,
                          db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger,
                          db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger,
                          strReferencia,
                          nQuantidadeDigitada
                         );
   end;

   prcReabrirTabela;

end;

procedure TFrmFaseProducao.btnEncerrarClick(Sender: TObject);
begin
   if StrToIntDef(EditQuantidade.text,0)=0 then
      exit;

   strReferencia   := UpperCase(Trim(dbProcurarReferencia.Text));
   if (strReferencia='') and (db_OrdemProducaoFases.Active) then
   begin
      aviso('Informe a Refer�ncia');
      db_FasesDestino.close;
      exit;
   end;

   if fncOrdemProducaoEncerrado(nOrdemProducao)=True then
   begin
      Informar('Ordem de Produ��o ja foi finalizada');
      exit;
   end;

   if pergunta('Esse procedimento ir� lan�ar no estoque de produtos acabados.'+
               sLineBreak+
               sLineBreak+
               'Tem certeza que deseja finalizar a Lote de Produ��o?'
               )=false then
     exit;

   prcOrdemPRODUCAO_FINALIZAR;

   prcReabrirTabela;

end;

procedure TFrmFaseProducao.BtnRemessasClick(Sender: TObject);
begin
   FrmDistribuirRemessa:=TFrmDistribuirRemessa.Create(self);
   FrmDistribuirRemessa.Show;
end;

procedure TFrmFaseProducao.btnDefeitosClick(Sender: TObject);
Var
  mIDCor, mIDTamanho : Integer;
begin
   mIDCor     := 0;
   mIDTamanho := 0;

   mIDCor     :=db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger;
   mIDTamanho :=db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger;

   if (db_ReferenciasFaseGrade.FieldByName('QTDE_PRODUZIR').AsInteger<=0) then
   begin
      Informar('N�o h� quantidade disponivel para informar defeito');
      exit;
   end;

   nOrdemProducao      := StrToIntDef( LocalizaOrdemProducao.Text,0);
   strReferencia       := UpperCase(Trim(dbProcurarReferencia.Text));
   nFaseOrigem         := StrToIntDef( db_FasesGradeLista.FieldByName('FASE').AsString,0);
   nFaseDestino        := StrToIntDef( db_FasesDestino.FieldByName('FASE').AsString,0);


   FrmFaseProducaoDefeito :=TFrmFaseProducaoDefeito.Create(Self);
   FrmFaseProducaoDefeito.Showmodal;

   if nQuantidadeDigitada>0 then
   begin
      prcFaseDefeito(nOrdemProducao,
                          nFaseOrigem,
                          nFaseOrigem,
                          db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger,
                          db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger,
                          strReferencia,
                          nQuantidadeDigitada
                         );
   end;

   prcReabrirTabela;

end;

procedure TFrmFaseProducao.btnPerdasClick(Sender: TObject);
Var
  mIDCor, mIDTamanho : Integer;
begin
   mIDCor     := 0;
   mIDTamanho := 0;

   mIDCor     :=db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger;
   mIDTamanho :=db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger;

   if (db_ReferenciasFaseGrade.FieldByName('QTDE_PRODUZIR').AsInteger<=0) then
   begin
      Informar('N�o h� quantidade disponivel para informar perda');
      exit;
   end;

   nOrdemProducao      := StrToIntDef( LocalizaOrdemProducao.Text,0);
   strReferencia       := UpperCase(Trim(dbProcurarReferencia.Text));
   nFaseOrigem         := StrToIntDef( db_FasesGradeLista.FieldByName('FASE').AsString,0);
   nFaseDestino        := StrToIntDef( db_FasesDestino.FieldByName('FASE').AsString,0);


   FrmFaseProducaoPerda :=TFrmFaseProducaoPerda.Create(Self);
   FrmFaseProducaoPerda.Showmodal;

   if nQuantidadeDigitada>0 then
   begin
      prcFasePerda(nOrdemProducao,
                          nFaseOrigem,
                          nFaseOrigem,
                          db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger,
                          db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger,
                          strReferencia,
                          nQuantidadeDigitada
                         );
   end;

   prcReabrirTabela;

end;

procedure TFrmFaseProducao.btnTransferirClick(Sender: TObject);
Var
  mIDCor, mIDTamanho : Integer;
begin
   mIDCor     := 0;
   mIDTamanho := 0;

   mIDCor     :=db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger;
   mIDTamanho :=db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger;

   if (strReferencia='') then
   begin
      Aviso('� necess�rio informar a Refer�cia');
      exit;
   end;

   if (nOrdemProducao=0) then
   begin
      Aviso('� necess�rio informar Ordem de Produ��o');
      exit;
   end;

   prcChecarQuantidadeDisponivel;

   if (lnChecarQuantidades<=0) then
   begin
      db_ReferenciasFaseGrade.First;
      db_ReferenciasFaseGrade.Locate('COR_ID;TAMANHO_ID', VarArrayOf([mIDCor, mIDTamanho]),[]);
      aviso('N�o h� quantidade para Andamento de Fase');
      exit;
   end;


   db_ReferenciasFaseGrade.First;
   db_ReferenciasFaseGrade.Locate('COR_ID;TAMANHO_ID', VarArrayOf([mIDCor, mIDTamanho]),[]);
   if (db_FasesGradeLista.active=false) or (db_FasesDestino.active=false) then
      exit;

   if (db_OrdemProducaoFases.active=false) or (db_OrdemProducaoFases.IsEmpty) then
      exit;

   strReferencia   := UpperCase(Trim(dbProcurarReferencia.Text));

   if (strReferencia='') and (db_OrdemProducaoFases.Active) then
   begin
      aviso('Informe a Refer�ncia');
      db_FasesDestino.close;
      exit;
   end;

   nOrdemProducao      := StrToIntDef( LocalizaOrdemProducao.Text,0);
   strReferencia       := UpperCase(Trim(dbProcurarReferencia.Text));
   nFaseOrigem         := StrToIntDef( db_FasesGradeLista.FieldByName('FASE').AsString,0);
   nFaseDestino        := StrToIntDef( db_FasesDestino.FieldByName('FASE').AsString,0);
   nTerceirizadoOrigem := db_ReferenciasFaseGrade.FieldByName('TERCEIRIZADO').AsInteger;
   inFaseTransferencia := db_ReferenciasFaseGrade.FieldByName('FASETRANSFERENCIA').AsInteger;


   // significa que esta em alguma empresa terceirizada, e que necessita
   // fazer o retorno, para gerar contas a pagar;
   if (nTerceirizadoOrigem>0) and (blAlterado=false) then
   begin

      aviso('Esse servi�o foi enviado para Terceirizado.'+
            sLineBreak+
            'Fa�a o Retorno de Servi�os. Somente assim conseguir� transferir de fase.'
           );

      exit;
   end;

   if  (strlFaseAtual=strlFaseSeguinte) Then
   begin
      // mesmo sendo a ultima fase, checar se a OP ja foi finalizada
      if fncOrdemProducaoEncerrado(nOrdemProducao)=True then
      begin
         Informar('Ordem de Produ��o ja foi finalizada');
         exit;
      end;
      If pergunta('Ultima fase... deseja encerrar e enviar produ��o para o estoque de produtos acabados?')=false then
        exit;
      prcOrdemPRODUCAO_FINALIZAR;
      exit;
   end;

   if (nFaseOrigem=nFaseDestino) and (db_FasesGradeLista.Eof=false) then
   begin
      Erro('Voc� n�o pode tentar mudar para a mesma fase.');
      exit;
   end;

   FrmFaseProducaoTransferirFase := TFrmFaseProducaoTransferirFase.Create(self);
   FrmFaseProducaoTransferirFase.ShowModal;
   nRemessa   :=0;
   blAlterado :=False;

   prcReabrirTabela;
   db_ReferenciasFaseGrade.First;
   db_ReferenciasFaseGrade.Locate('COR_ID;TAMANHO_ID', VarArrayOf([mIDCor, mIDTamanho]),[]);


end;

procedure TFrmFaseProducao.cxGridCorTamCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin

//   if (Column.Field.FieldName = 'QTDE_PERDA') then  // saldo_atual deve ser trocado para o nome do campo que vc deseja alterar no seu dbgrid.
//   begin
//      if db_ReferenciasFaseGrade.FieldByName('QTDE_PERDA').AsFloat > 0 then
//      begin
//         dbGridQuantidades.Canvas.Brush.Color:= clRed;    //"pinta" a celula inteira
//         dbGridQuantidades.Canvas.Font.Color:= clAqua;      //"Pinta" a letra
//         dbGridQuantidades.Canvas.FillRect(Rect);
//         dbGridQuantidades.DefaultDrawColumnCell(Rect, DataCol, Column, State);
//      end;
//   end;
//
//   if (Column.Field.FieldName = 'QTDE_DEFEITO') then  // saldo_atual deve ser trocado para o nome do campo que vc deseja alterar no seu dbgrid.
//   begin
//      if db_ReferenciasFaseGrade.FieldByName('QTDE_DEFEITO').AsFloat > 0 then
//      begin
//         dbGridQuantidades.Canvas.Brush.Color:= $000080FF;    //"pinta" a celula inteira
//         dbGridQuantidades.Canvas.Font.Color:= clAqua;      //"Pinta" a letra
//         dbGridQuantidades.Canvas.FillRect(Rect);
//         dbGridQuantidades.DefaultDrawColumnCell(Rect, DataCol, Column, State);
//      end;
//   end;
//
//   color :=clWhite;

end;

procedure TFrmFaseProducao.btnRetoronServicosClick(Sender: TObject);
Var
  mIDCor, mIDTamanho : Integer;
begin
   mIDCor     := 0;
   mIDTamanho := 0;

   mIDCor     :=db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger;
   mIDTamanho :=db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger;

   prcChecarQuantidadeDisponivel;
   if (lnChecarQuantidades<=0) then
   begin
      db_ReferenciasFaseGrade.First;
      db_ReferenciasFaseGrade.Locate('COR_ID;TAMANHO_ID', VarArrayOf([mIDCor, mIDTamanho]),[]);
      aviso('N�o h� quantidade para Andamento de Fase');
      exit;
   end;

   db_ReferenciasFaseGrade.First;
   db_ReferenciasFaseGrade.Locate('COR_ID;TAMANHO_ID', VarArrayOf([mIDCor, mIDTamanho]),[]);

   if (db_FasesGradeLista.active=false) or (db_FasesDestino.active=false) then
      exit;

   if (db_OrdemProducaoFases.active=false) or (db_OrdemProducaoFases.IsEmpty) then
      exit;

   strReferencia   := UpperCase(Trim(dbProcurarReferencia.Text));

   if (strReferencia='') and (db_OrdemProducaoFases.Active) then
   begin
      aviso('Informe a Refer�ncia');
      db_FasesDestino.close;
      exit;
   end;

   nOrdemProducao      := StrToIntDef( LocalizaOrdemProducao.Text,0);
   strReferencia       := UpperCase(Trim(dbProcurarReferencia.Text));
   nFaseOrigem         := StrToIntDef( db_FasesGradeLista.FieldByName('FASE').AsString,0);
   nFaseDestino        := StrToIntDef( db_FasesDestino.FieldByName('FASE').AsString,0);
   nTerceirizadoOrigem := db_ReferenciasFaseGrade.FieldByName('TERCEIRIZADO').AsInteger;
   inFaseTransferencia := db_ReferenciasFaseGrade.FieldByName('FASETRANSFERENCIA').AsInteger;
   nValorDigitado      := fncFaseReferencia_valor(nOrdemProducao,nTerceirizadoOrigem);

   if (strReferencia='') then
   begin
      Aviso('� necess�rio informar a Refer�cia');
      exit;
   end;

   if (nOrdemProducao=0) then
   begin
      Aviso('� necess�rio informar Ordem de Produ��o');
      exit;
   end;

   // significa que esta em alguma empresa terceirizada, e que necessita
   // fazer o retorno, para gerar contas a pagar;
   if nTerceirizadoOrigem<=0 then
   begin
      aviso('N�o h� Terceirizado informado na fase anterior.' );

      exit;
   end;

   FrmFaseProducaoRetornoTerceirizados := TFrmFaseProducaoRetornoTerceirizados.Create(self);
   FrmFaseProducaoRetornoTerceirizados.Showmodal;

   if blAlterado=false then
      exit;

   btnTransferirClick(Sender);


end;

procedure TFrmFaseProducao.dbProcurarReferenciaChange(Sender: TObject);
begin
   fncOrdemProducaoFases;
   fncRecarregarDadosGrade;
   db_FasesDestino.Next;
   ctrlgridFases.SetFocus;
end;

procedure TFrmFaseProducao.dbProcurarReferenciaEnter(Sender: TObject);
begin
   prcMontarPesquisaBotaoReferencia;
end;

procedure TFrmFaseProducao.db_FasesGradeListaAfterClose(DataSet: TDataSet);
begin
   prcSomarQuantidade;
end;

procedure TFrmFaseProducao.db_FasesGradeListaAfterScroll(DataSet: TDataSet);
begin
   fncRecarregarDadosGrade;
   strlFaseAtual     := db_FasesGradeLista.FieldByName('ORDEM').AsString;
   if not db_FasesDestino.Active then
      db_FasesDestino.open;
   db_FasesDestino.Locate('FASE',db_FasesGradeLista.FieldByName('FASE').AsInteger,[]);
   db_FasesDestino.Next;

end;

procedure TFrmFaseProducao.fncOrdemProducaoFases;
begin
   nOrdemProducao  := StrToIntDef( LocalizaOrdemProducao.Text,0);
   strReferencia   := UpperCase(Trim(dbProcurarReferencia.Text));

   if nOrdemProducao=0 then
   begin
      aviso('Informe a Ordem de Produ��o');
      exit;
   end;


   db_FasesGradeLista.close;
   db_FasesGradeLista.ParamByName('CODIGO').AsInteger    := StrToIntDef(GetProdutoCampo(strReferencia,'FASE'),0);
   db_FasesGradeLista.Open;

   db_FasesDestino.close;
   db_FasesDestino.ParamByName('CODIGO').AsInteger    := StrToIntDef(GetProdutoCampo(strReferencia,'FASE'),0);
   db_FasesDestino.Open;


end;

procedure TFrmFaseProducao.fncRecarregarDadosGrade;
begin
   nOrdemProducao  := StrToIntDef( LocalizaOrdemProducao.Text,0);
   strReferencia   := UpperCase(Trim(dbProcurarReferencia.Text));

   if (strReferencia='') and (db_OrdemProducaoFases.Active) then
   begin
      aviso('Informe a Refer�ncia');
      db_FasesDestino.close;
      exit;
   end;

   db_OrdemProducaoFases.close;
   db_OrdemProducaoFases.ParamByName('EMPRESA').AsInteger        := FSistema.Empresa;
   db_OrdemProducaoFases.ParamByName('CODIGO').AsInteger         := nOrdemProducao;
   db_OrdemProducaoFases.ParamByName('FASE').AsInteger           := db_FasesGradeLista.FieldByName('FASE').AsInteger;
   db_OrdemProducaoFases.ParamByName('REFERENCIA').AsString      := strReferencia;
   db_OrdemProducaoFases.Open;

   db_ReferenciasFaseGrade.close;
   db_ReferenciasFaseGrade.ParamByName('EMPRESA').AsInteger        := FSistema.Empresa;
   db_ReferenciasFaseGrade.ParamByName('CODIGO').AsInteger         := nOrdemProducao;
   db_ReferenciasFaseGrade.ParamByName('FASE').AsInteger           := db_FasesGradeLista.FieldByName('FASE').AsInteger;
   db_ReferenciasFaseGrade.ParamByName('REFERENCIA').AsString      := strReferencia;
   db_ReferenciasFaseGrade.Open;

   prcSomarQuantidade;


   db_FasesDestino.Open;
   db_FasesDestino.Last;
   strlFaseSeguinte  := db_FasesDestino.FieldByName('ORDEM').AsString;
   db_FasesDestino.First;


end;



procedure TFrmFaseProducao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   db_FasesGradeLista.Close;
   db_OrdemProducaoFases.Close;
   db_FasesDestino.Close;

   FreeAndNil(FrmFaseProducao);

end;

procedure TFrmFaseProducao.FormCreate(Sender: TObject);
begin

   btnTransferir.Visible         :=(fncUsuario_retCampo(nUsuario,'PRODUCAOFASEMOVIMENTAR')='S');
   btnRetoronServicos.Enabled    :=(fncUsuario_retCampo(nUsuario,'PRODUCAOFASEMOVIMENTAR')='S');
   btnDefeitos.Enabled           :=(fncUsuario_retCampo(nUsuario,'PRODUCAOFASEMOVIMENTAR')='S');
   btnEstornarDefeitos.Enabled   :=(fncUsuario_retCampo(nUsuario,'PRODUCAOFASEMOVIMENTAR')='S');
   btnPerdas.Enabled             :=(fncUsuario_retCampo(nUsuario,'PRODUCAOFASEMOVIMENTAR')='S');
   btnEstornarPerdas.Enabled     :=(fncUsuario_retCampo(nUsuario,'PRODUCAOFASEMOVIMENTAR')='S');
   BtnRemessas.Enabled           :=(fncUsuario_retCampo(nUsuario,'PRODUCAOFASEMOVIMENTAR')='S');
   ctrlgridFases.Color           :=_COR_HIGHLIGHTBACKGROUND;
   ctrlgridFases.SelectedColor   :=_COR_HIGHLIGHT;

end;

procedure TFrmFaseProducao.FormShow(Sender: TObject);
begin
   LocalizaOrdemProducao.SetFocus;
end;

procedure TFrmFaseProducao.LocalizaOrdemProducaoChange(Sender: TObject);
begin
   prcMontarPesquisaBotaoReferencia;
   dbProcurarReferencia.SetFocus;

end;


procedure TFrmFaseProducao.prcMontarPesquisaBotaoReferencia;
begin

   nOrdemProducao  := StrToIntDef( LocalizaOrdemProducao.Text,0);

   dbProcurarReferencia.SearchQuery.Clear;
   dbProcurarReferencia.SearchQuery.Add('SELECT');
   dbProcurarReferencia.SearchQuery.Add('DISTINCT REFERENCIA, DESCRICAO');
   dbProcurarReferencia.SearchQuery.Add('FROM PCP_ORDEMPRODUCAO_ITENS');
   dbProcurarReferencia.SearchQuery.Add('INNER JOIN PCP_ORDEMPRODUCAO ON PCP_ORDEMPRODUCAO.EMPRESA=PCP_ORDEMPRODUCAO_ITENS.EMPRESA');
   dbProcurarReferencia.SearchQuery.Add('AND');
   dbProcurarReferencia.SearchQuery.Add('PCP_ORDEMPRODUCAO.CODIGO=PCP_ORDEMPRODUCAO_ITENS.CODIGO');
   dbProcurarReferencia.SearchQuery.Add('AND');
   dbProcurarReferencia.SearchQuery.Add('PCP_ORDEMPRODUCAO.ENCERRADO IN (''N'',''NAO'')');
   dbProcurarReferencia.SearchQuery.Add('WHERE');
   dbProcurarReferencia.SearchQuery.Add('PCP_ORDEMPRODUCAO.EMPRESA='+QuotedStr(IntToStr(FSistema.Empresa)) );
   dbProcurarReferencia.SearchQuery.Add('AND');
   dbProcurarReferencia.SearchQuery.Add('PCP_ORDEMPRODUCAO.CODIGO='+QuotedStr(IntToStr(nOrdemProducao)) );
   dbProcurarReferencia.SearchQuery.Add('AND');
   dbProcurarReferencia.SearchQuery.Add('%WHERE%');
   dbProcurarReferencia.SearchQuery.Add('ORDER BY REFERENCIA');
   dbProcurarReferencia.SearchQuery.Add('');


end;

procedure TFrmFaseProducao.prcOrdemPRODUCAO_FINALIZAR;
Var
 mQTDE, mQTDEMais, mOP, mQtdTotal : Integer;
 MReferencia, mIdentificador, mOrdemGrade : String;
 mIDCor, mIDTam, mIDFase : Integer;
 mProcessoOK : Boolean;
begin

   if (fncUsuario_retCampo(nUsuario,'PRODUCAOATUALIZARESTOQUE')='N') Then
   begin
      AvisoSistemaErro('Voc� n�o possui permiss�o para movimentar produtos para o Estoque');
      Abort;
   end;
   mQTDE          := 0;
   mIdentificador := '';
   mIDCor         := 0;
   mIDTam         := 0;
   mOP            := 0;
   mOP            := StrToIntDef( LocalizaOrdemProducao.Text,0);
   mOrdemGrade    := '';
   mProcessoOK    := False;
   mQtdTotal      := 0;

   try
     prcStatusMessage('Finalizando fase de produ��o','Atualizando estoque fisico...');

     if (FParametros.Producao.PRODUCAO_FINALIZAR='') or
        (FParametros.Producao.PRODUCAO_FINALIZAR='AUTOMATICO')  then
     begin
        try
          db_OrdemProducaoProduzido.Close;
          db_OrdemProducaoProduzido.ParamByName('NEMPRESA').AsInteger           := FSistema.Empresa;
          db_OrdemProducaoProduzido.ParamByName('NORDEMPRODUCAO').AsInteger     := nOrdemProducao;
          db_OrdemProducaoProduzido.Open;

          QryMovimentacaoProdutos.Close;
          QryMovimentacaoProdutos.ParamByName('NEMPRESA').AsInteger           := FSistema.Empresa;
          QryMovimentacaoProdutos.Open;

          db_AndamentoReferencias.Close;
          db_AndamentoReferencias.ParamByName('NEMPRESA').AsInteger           := FSistema.Empresa;
          db_AndamentoReferencias.ParamByName('NORDEMPRODUCAO').AsInteger     := nOrdemProducao;
          db_AndamentoReferencias.Open;

          while not db_AndamentoReferencias.eof do
          begin
            mQTDEMais      := 0;
            mQTDE          := db_AndamentoReferencias.FieldByName('QTDE_ENVIADA').AsInteger;
            MReferencia    := db_AndamentoReferencias.FieldByName('REFERENCIA').AsString;
            mIDCor         := db_AndamentoReferencias.FieldByName('COR_ID').AsInteger;
            mIDTam         := db_AndamentoReferencias.FieldByName('TAMANHO_ID').AsInteger;
            mIDFase        := db_AndamentoReferencias.FieldByName('FASE').AsInteger;
            mIdentificador := GetIdentificador(MReferencia, mIDCor, mIDTam); // Retornar IDENTIFICADOR
            mOrdemGrade    := prcOrdemProducaoAndamento_retCampo(nOrdemProducao,mIdentificador,'ORDEM_GRADE');

            db_OrdemProducaoProduzido.Refresh;
            db_OrdemProducaoProduzido.first;
            // ---------------------------------------------------------------------------------------------------
            // -------------- SE N�O LOCALIZAR, DEVE SER INSERIDO NA TABELA: "PCP_ORDEMPRODUCAO_PRODUZIDOS"-------
            // ---------------------------------------------------------------------------------------------------
            //if not db_OrdemProducaoProduzido.Locate('IDENTIFICADOR',mIdentificador,[]) Then
            if not db_OrdemProducaoProduzido.Locate('CODIGO;IDENTIFICADOR', VarArrayOf([mOP, mIdentificador]),[]) then
            begin
               db_OrdemProducaoProduzido.Append;
               db_OrdemProducaoProduzido.FieldByName('EMPRESA').AsInteger           :=  FSistema.Empresa;
               db_OrdemProducaoProduzido.FieldByName('CODIGO').AsInteger            :=  mOP;
               db_OrdemProducaoProduzido.FieldByName('APROVADO').AsString           :=  prcOrdemProducao_retCampo(nOrdemProducao,'APROVADO');
               db_OrdemProducaoProduzido.FieldByName('DATA').AsDateTime             :=  StrToDate(prcOrdemProducao_retCampo(nOrdemProducao,'DATA'));
               db_OrdemProducaoProduzido.FieldByName('DATAATUALIZACAO').AsDateTime  :=  Now;
               db_OrdemProducaoProduzido.FieldByName('USUARIO').AsString            :=  FUsuario.Nome;
               db_OrdemProducaoProduzido.FieldByName('QUALIDADE').AsInteger         :=  FParametros.Producao.QualidadePadrao;
               db_OrdemProducaoProduzido.FieldByName('REFERENCIA').AsString         := MReferencia;
               db_OrdemProducaoProduzido.FieldByName('IDENTIFICADOR').AsString      := mIdentificador;
               db_OrdemProducaoProduzido.FieldByName('COR_ID').AsInteger            := mIDCor;
               db_OrdemProducaoProduzido.FieldByName('TAMANHO_ID').AsInteger        := mIDTam;
               db_OrdemProducaoProduzido.FieldByName('ORDEM_GRADE').AsString        := mOrdemGrade;
               db_OrdemProducaoProduzido.FieldByName('QUANTIDADE').AsInteger        := mQTDE;
               db_OrdemProducaoProduzido.FieldByName('BAIXADO').AsString :='S';
               db_OrdemProducaoProduzido.Post;
               db_OrdemProducaoProduzido.Refresh;
               mQtdTotal   := mQtdTotal + mQTDE;
               mProcessoOK := True;
            end;

            // -------------------------------------------------------------------
            // -------------- SE N�O LOCALIZAR, DEVE SER INSERIDO NA TABELA-------
            // -------------------------------------------------------------------
            QryMovimentacaoProdutos.First;
            if not QryMovimentacaoProdutos.Locate('IDENTIFICADOR',mIdentificador,[]) Then
            begin
               QryMovimentacaoProdutos.Append;
               QryMovimentacaoProdutos.FieldByName('EMPRESA').AsInteger           := FSistema.Empresa;
               QryMovimentacaoProdutos.FieldByName('APROVADO').AsString           :=  prcOrdemProducao_retCampo(nOrdemProducao,'APROVADO');
               QryMovimentacaoProdutos.FieldByName('DATAMOVIMENTO').AsVariant     := Now; ;
               QryMovimentacaoProdutos.FieldByName('REFERENCIA').AsString         := MReferencia;
               QryMovimentacaoProdutos.FieldByName('IDENTIFICADOR').AsString      := mIdentificador;
               QryMovimentacaoProdutos.FieldByName('FASEATUAL').AsVariant         := mIDFase ;
               QryMovimentacaoProdutos.FieldByName('QUALIDADEATUAL').AsInteger    := FParametros.Producao.QualidadePadrao;
               QryMovimentacaoProdutos.FieldByName('COR_ID').AsInteger            := mIDCor;
               QryMovimentacaoProdutos.FieldByName('TAMANHO_ID').AsInteger        := mIDTam;
               QryMovimentacaoProdutos.FieldByName('ORDEM_GRADE').AsString        := mOrdemGrade;
               QryMovimentacaoProdutos.FieldByName('QTDE_VENDIDO').AsVariant      :=0;
               QryMovimentacaoProdutos.FieldByName('QTDE_DEMANDA').AsVariant      :=0;
               QryMovimentacaoProdutos.FieldByName('QTDE_PRODUZIR').AsVariant     :=0;
               QryMovimentacaoProdutos.FieldByName('QTDE_PRODUZIDO').AsVariant    :=mQTDE;
               QryMovimentacaoProdutos.FieldByName('QTDE_PRODUZINDO').AsVariant   :=0;
               QryMovimentacaoProdutos.FieldByName('QTDE_FISICO').AsVariant       :=0;
               QryMovimentacaoProdutos.FieldByName('QTDE_ESTOQUE').AsVariant      :=0;
               QryMovimentacaoProdutos.FieldByName('QTDE_PERDAS').AsVariant       :=0;
               QryMovimentacaoProdutos.FieldByName('QTDE_DEFEITOS').AsVariant     :=0;
               QryMovimentacaoProdutos.Post;
               QryMovimentacaoProdutos.Refresh;
            end;

            // -------------------------------------------------------------------
            //
            // -------------------------------------------------------------------
            db_AndamentoReferencias.Next;
          end;

        finally
          db_AndamentoReferencias.Close;
          db_OrdemProducaoProduzido.Close;
          QryMovimentacaoProdutos.Close;
        end;

        if mProcessoOK then
        begin
          SP_OrdemPRODUCAO_FINALIZAR.ParamByName('NEMPRESA').AsInteger           := FSistema.Empresa;
          SP_OrdemPRODUCAO_FINALIZAR.ParamByName('NORDEMPRODUCAO').AsInteger     := mOP;
          SP_OrdemPRODUCAO_FINALIZAR.ParamByName('SREFERENCIA').AsString         := strReferencia;
          SP_OrdemPRODUCAO_FINALIZAR.ParamByName('SFASE').AsInteger              := nFaseDestino;
          SP_OrdemPRODUCAO_FINALIZAR.ParamByName('SVIA').AsString                := 'AUTOMATICO';
          SP_OrdemPRODUCAO_FINALIZAR.ExecProc;
          SP_OrdemPRODUCAO_FINALIZAR.close;
        end;
     end;
   finally
     prcStatusMessage('','',false);
   end;


   if (FParametros.Producao.PRODUCAO_FINALIZAR='CODIGOBARRAS') then
   begin
      FrmFaseProducaoLancaEstoque := TFrmFaseProducaoLancaEstoque.Create(self);
      FrmFaseProducaoLancaEstoque.ShowModal;
   end;

   if mProcessoOK then
     Aviso('Estoque atualizado. Total: '+mQtdTotal.ToString+sLineBreak+
           'Finaliza��o Concluida.')
   else
     Aviso('Erro ao tentar finalizar movimenta��o de fases.');

   prcReabrirTabela;

end;


procedure TFrmFaseProducao.prcChecarQuantidadeDisponivel;
begin
   lnChecarQuantidades :=0;

   db_ReferenciasFaseGrade.First;
   while not db_ReferenciasFaseGrade.Eof do
   begin
      lnChecarQuantidades := lnChecarQuantidades + db_ReferenciasFaseGrade.FieldByName('QTDE_PRODUZIR').AsInteger;
      FrmFaseProducao.db_ReferenciasFaseGrade.next;
      Application.ProcessMessages;
   end;
   db_ReferenciasFaseGrade.Refresh;
end;

procedure TFrmFaseProducao.prcReabrirTabela;
Var
  mIDCor, mIDTamanho : Integer;
begin
   mIDCor     := 0;
   mIDTamanho := 0;

   mIDCor     :=db_ReferenciasFaseGrade.FieldByName('COR_ID').AsInteger;
   mIDTamanho :=db_ReferenciasFaseGrade.FieldByName('TAMANHO_ID').AsInteger;

   lsOrdem := db_FasesGradeLista.FieldByName('ORDEM').AsString;

   db_OrdemProducaoFases.Close;
   db_FasesGradeLista.Close;
   db_ReferenciasFaseGrade.Close;
   db_FasesDestino.Close;

   db_OrdemProducaoFases.Open;
   db_FasesGradeLista.Open;
   db_ReferenciasFaseGrade.Open;
   db_FasesDestino.open;

   db_FasesGradeLista.Locate('ORDEM',lsOrdem,[]);
   db_FasesDestino.Locate('ORDEM',lsOrdem,[]);
   db_FasesDestino.Next;

   db_ReferenciasFaseGrade.First;
   db_ReferenciasFaseGrade.Locate('COR_ID;TAMANHO_ID', VarArrayOf([mIDCor, mIDTamanho]),[]);

end;


procedure TFrmFaseProducao.prcSomarQuantidade;
Var
 nqtde : integer;
begin
   nqtde         :=0;

   db_ReferenciasFaseGrade.close;
   db_ReferenciasFaseGrade.open;
   while not db_ReferenciasFaseGrade.eof do
   begin
      nqtde := nqtde + db_ReferenciasFaseGrade.FieldByName('QTDE_PRODUZIR').AsInteger;
      db_ReferenciasFaseGrade.Next;
   end;
   db_ReferenciasFaseGrade.first;

   EditQuantidade.text := FormatFloat('###,##0', nqtde);

end;

end.
