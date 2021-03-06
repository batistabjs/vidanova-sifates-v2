{***********************************************************************************
**  SISTEMA...............: Vida Nova Gest�o de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  C�digo pertencente ao cliente sob prote��o autoral.                           ****  N�o comercializ�vel sem pr�via autoriza��o do mesmo.                          **
***********************************************************************************}
unit FPedidoAprovarVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCurrencyEdit, cxCheckBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Vcl.Menus, FireDAC.Comp.DataSet, Vcl.ComCtrls, Vcl.ExtCtrls, FFrameBarra,
  Vcl.StdCtrls, ISFEdit, ISFEditbtn, ISFdbEditbtn, IDBEdit,
  uEstSearchDialogZeos, Vcl.Buttons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Classe.Global, dxDateRanges, Vcl.Mask, DateUtils;

type
   TFrmPedidoAprovarVenda = class(TForm)
      AdvGroupBox1: TGroupBox;
      AdvGroupBox3: TGroupBox;
      AdvGroupBox2: TGroupBox;
      db_Pedido: TFDQuery;
      db_PedidoItens: TFDQuery;
      ds_Pedido: TDataSource;
      ds_PedidoItens: TDataSource;
      POP_Produto: TPopupMenu;
      ProcurarProduto1: TMenuItem;
    Panel1: TPanel;
    Btnaprovar: TBitBtn;
    Btndesaprovar: TBitBtn;
    Btnsair: TBitBtn;
    BtnProcurar: TBitBtn;
    dbeditPedidoProcurar: TIDBEditDialog;
    SP_Aprovar: TFDStoredProc;
    FrmFrameBarra1: TFrmFrameBarra;
    GroupBox1: TGroupBox;
    EditPedido: TLabeledEdit;
    rdgFiltroPedidos: TRadioGroup;
    SP_MovimentoAtualizar: TFDStoredProc;
    ProgressBar1: TProgressBar;
    PopupMenu1: TPopupMenu;
    Desaprovartudo1: TMenuItem;
    AprovarTudo1: TMenuItem;
    db_ChecarAtrasos: TFDQuery;
    cxGridPedidos: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridPedidosColumn1: TcxGridDBColumn;
    cxGridPedidosColumn2: TcxGridDBColumn;
    cxGridPedidosColumn3: TcxGridDBColumn;
    cxGridPedidosColumn4: TcxGridDBColumn;
    cxGridPedidosColumn5: TcxGridDBColumn;
    cxGridPedidosColumn6: TcxGridDBColumn;
    cxGridPedidosColumn7: TcxGridDBColumn;
    cxGridPedidosColumn9: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGridPedidosItens: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridPedidosItensColumn1: TcxGridDBColumn;
    cxGridPedidosItensColumn2: TcxGridDBColumn;
    cxGridPedidosItensColumn3: TcxGridDBColumn;
    cxGridPedidosItensColumn4: TcxGridDBColumn;
    cxGridPedidosItensColumn5: TcxGridDBColumn;
    cxGridPedidosColumn8: TcxGridDBColumn;
    cxGridPedidosColumn10: TcxGridDBColumn;
    cxGridPedidosColumn11: TcxGridDBColumn;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    MskDataIni: TMaskEdit;
    MskDataFim: TMaskEdit;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure db_PedidoAfterScroll(DataSet: TDataSet);
    procedure dbGrid_ProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BtnsairClick(Sender: TObject);
    procedure BtnaprovarClick(Sender: TObject);
    procedure BtnProcurarClick(Sender: TObject);
    procedure BtndesaprovarClick(Sender: TObject);
    procedure EditPedidoChange(Sender: TObject);
    procedure rdgFiltroPedidosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Desaprovartudo1Click(Sender: TObject);
    procedure AprovarTudo1Click(Sender: TObject);
    procedure db_ChecarAtrasosBeforeOpen(DataSet: TDataSet);
    procedure EditPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridPedidosCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxGridPedidosItensCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    private

       blChecarZerados : Boolean;
       procedure prcFiltrarPedidos;
      { Private declarations }


   public
      { Public declarations }
      Num_pedido : integer;

   end;

var
   FrmPedidoAprovarVenda: TFrmPedidoAprovarVenda;

implementation

uses FPrincipal, SQLServer, Biblioteca, Global,
    Classe.Usuarios, FEntregadorDefinir;

{$R *.dfm}

procedure TFrmPedidoAprovarVenda.FormCreate(Sender: TObject);
var dia, mes, ano : Word;
begin
   CodIni := '';
   CodFim := '';
   Achar[0] := '';

   DecodeDate(now, ano, mes, dia);
   dtDataIni := StartOfaMonth(ano,mes-1);
   dtDataFim :=  EndOfaMonth(ano,mes);
   MskDataIni.Text := dateToStr( dtDataIni );
   MskDataFim.Text := dateToStr( dtDataFim );

   FUsuario.LogUsuario('pedido de venda | aprovar','Acessou modulo Aprova��o de Pedido de Venda' );

   //db_Pedido.Open;
   //db_PedidoItens.Open;

   Btnaprovar.Enabled    :=(fncUsuario_retCampo(nUsuario,'PEDIDOVENDAAPROVAR')='S');
   Btndesaprovar.Enabled :=(fncUsuario_retCampo(nUsuario,'PEDIDOVENDAAPROVAR')='S');

end;

procedure TFrmPedidoAprovarVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    BtnsairClick(Sender);
  end
  else if Key = VK_F3 then
  begin
    BtnProcurarClick(Sender);
  end;
end;

procedure TFrmPedidoAprovarVenda.AprovarTudo1Click(Sender: TObject);
begin
   ProgressBar1.Max :=db_Pedido.RecordCount;
   ProgressBar1.Position := 0;
   db_Pedido.first;

   db_Pedido.close;
   db_Pedido.open;
   while not db_Pedido.Eof do
   begin
      nPedidoVenda := 0;
      nPedidoVenda := db_Pedido.FieldByName('CODIGO').AsInteger;

      // Enviar comando para aprovar pedido
      SP_Aprovar.ParamByName('NEMPRESA').AsInteger :=  FSistema.Empresa;
      SP_Aprovar.ParamByName('NPEDIDO').AsInteger  :=  nPedidoVenda;
      SP_Aprovar.ParamByName('ACAO').AsString      :=  'APROVAR';
      SP_Aprovar.ExecProc;
      SP_Aprovar.close;

      // Enviar comando para atualizar movimenta��o de produtos
      SP_MovimentoAtualizar.ExecProc;
      SP_MovimentoAtualizar.close;

      ProgressBar1.Position := ProgressBar1.Position + 1;
      Application.ProcessMessages;
      db_Pedido.Next;
   end;

   db_Pedido.Refresh;
   Aviso('concluido');
   ProgressBar1.Position := 0;

end;


procedure TFrmPedidoAprovarVenda.BtnaprovarClick(Sender: TObject);
begin
   nPedidoVenda   := 0;
   nPedidoVenda   := db_Pedido.FieldByName('CODIGO').AsInteger;
   inCliente      := db_Pedido.FieldByName('CLIENTE').AsInteger;
   inVendedor     := db_Pedido.FieldByName('VENDEDOR').AsInteger;
   nValorDigitado := db_Pedido.FieldByName('VLR_TOTAL').AsFloat;

   nvComissao      := StrToFloatDef(GetClienteCampo(inVendedor,'COMISSAO'),0);
   nVlrComissao    := fncGeraPercentual(nValorDigitado, nvComissao);

   if db_Pedido.IsEmpty then
   begin
      AvisoSistemaErro('Selecione um Pedido');
      EditPedido.SetFocus;
      exit;
   end;

   if (db_Pedido.FieldByName('APROVADO').AsString = 'S') or
     (db_Pedido.FieldByName('APROVADO').AsString = 'SIM') then
   Begin
      AvisoSistemaErro('Pedido j� aprovado!');
      EditPedido.SetFocus;
      abort;
   End;

   if ChecarCreditoCliente(db_Pedido.FieldByName('CLIENTE').AsInteger) Then
   begin
      AvisoSistemaErro('Aprova��o n�o autorizada!'+#13+#10+
                   'O cliente referente ao pedido que esta tentando aprovar '+
                   'est� com cr�dito bloqueado.');
      EditPedido.SetFocus;
      Abort;
   end;

   blChecarZerados :=False;
   While not db_PedidoItens.Eof do
   Begin
      if db_PedidoItens.FieldByName('QTDE').AsFloat <= 0 Then
         blChecarZerados := True;

      db_PedidoItens.Next;
   End;
   db_PedidoItens.First;

   if blChecarZerados=True then
   begin
      AvisoSistemaErro('Existe(m) produto(s) com quantidade(s) zerada(s) na grade.');
      EditPedido.SetFocus;
      Abort;
   end;
   // blChecarZerados

   blChecarZerados :=False;
   While not db_PedidoItens.Eof do
   Begin
      if db_PedidoItens.FieldByName('VLR_UNIT').AsFloat <= 0 Then
         blChecarZerados := True;

      db_PedidoItens.Next;
   End;
   db_PedidoItens.First;

   if blChecarZerados=True then
   begin
      AvisoSistemaErro('Existe(m) produto(s) com valor zerado.');
      EditPedido.SetFocus;
      Abort;
   end;

   db_ChecarAtrasos.open;
   try
      if db_ChecarAtrasos.RecordCount>0 then
      begin
         BeepAlerta;
         if   AvisoQuestao('Cliente est� com pagamento em atraso',
                          'H� pendencias de pagamento deste cliente...'+
                           sLineBreak+
                           sLineBreak+
                          'Deseja continuar aprova��o?')=false then
         EditPedido.SetFocus;
         Abort;
      end;
   finally
      db_ChecarAtrasos.close;
   end;


   // Enviar comando para aprovar pedido
   SP_Aprovar.ParamByName('NEMPRESA').AsInteger :=  FSistema.Empresa;
   SP_Aprovar.ParamByName('NPEDIDO').AsInteger  :=  nPedidoVenda;
   SP_Aprovar.ParamByName('ACAO').AsString      :=  'APROVAR';
   SP_Aprovar.ExecProc;
   SP_Aprovar.close;

   prcRegistrarUltimaVenda(db_Pedido.FieldByName('CLIENTE').AsInteger,'PEDIDO');


   // Enviar comando para atualizar movimenta��o de produtos
   SP_MovimentoAtualizar.ExecProc;
   SP_MovimentoAtualizar.close;

   FUsuario.LogUsuario('pedido de venda | aprovar','Aprovou Pedido de Venda' + #13 + #10 +
              AcaoUserName[0]
              );


   db_Pedido.Refresh;
   Num_pedido := StrToIntDef(EditPedido.Text,0);

   AvisoSistema('Pedido aprovado com sucesso!');

   try
    if FrmEntregadorDefinir=nil then
          FrmEntregadorDefinir := TFrmEntregadorDefinir.Create(Self);

    FrmEntregadorDefinir.ShowModal();
   finally
    //prcStatusMessage('','',False);
    FreeAndNil(FrmEntregadorDefinir);
   end;

   nvComissao      := 0;
   nVlrComissao    := 0;
   EditPedido.Text:='';
   EditPedido.SetFocus;
end;

procedure TFrmPedidoAprovarVenda.BtndesaprovarClick(Sender: TObject);
begin

   nPedidoVenda   := 0;
   nPedidoVenda   := db_Pedido.FieldByName('CODIGO').AsInteger;
   inCliente      := db_Pedido.FieldByName('CLIENTE').AsInteger;
   inVendedor     := db_Pedido.FieldByName('VENDEDOR').AsInteger;
   nValorDigitado := db_Pedido.FieldByName('VLR_TOTAL').AsFloat;

   nvComissao      := StrToFloatDef(GetClienteCampo(inVendedor,'COMISSAO'),0);
   nVlrComissao    := fncGeraPercentual(nValorDigitado, nvComissao);

   blChecarZerados :=False;

   if db_Pedido.IsEmpty then
   begin
      AvisoSistemaErro('Selecione um Pedido');
      exit;
   end;

   // desaprovar
   if (db_Pedido.FieldByName('APROVADO').AsString = 'N') or
     (db_Pedido.FieldByName('APROVADO').AsString = 'NAO') then
   Begin
      AvisoSistemaErro('Pedido j� foi desaprovado (reaberto).' +
        db_Pedido.FieldByName('RESPONSAVEL').AsString);
      abort;
   End;

   if (db_Pedido.FieldByName('PRODUZINDO').AsString = 'S') or
     (db_Pedido.FieldByName('PRODUZINDO').AsString = 'SIM') then
   Begin
      AvisoSistemaErro('Pedido j� foi enviado para Produ��o e n�o pode ser desaprovado (reaberto). ');
      abort;
   End;

   if (db_Pedido.FieldByName('STATUS').AsString = 'S') or
     (db_Pedido.FieldByName('STATUS').AsString = 'SIM') then
   Begin
      AvisoSistemaErro('Pedido j� foi faturado e n�o pode ser desaprovado (reaberto). ');
      abort;
   End;

   if (db_Pedido.FieldByName('STATUS').AsString = 'C') or
     (db_Pedido.FieldByName('STATUS').AsString = 'CANCELADO') then
   Begin
      AvisoSistemaErro('Pedido foi cancelado e pode ser desaprovado (reaberto). ');
      abort;
   End;


   // Enviar comando para aprovar pedido
   SP_Aprovar.ParamByName('NEMPRESA').AsInteger :=  FSistema.Empresa;
   SP_Aprovar.ParamByName('NPEDIDO').AsInteger  :=  nPedidoVenda;
   SP_Aprovar.ParamByName('ACAO').AsString      :=  'DESAPROVAR';
   SP_Aprovar.ExecProc;
   SP_Aprovar.close;

   // Enviar comando para atualizar movimenta��o de produtos
   SP_MovimentoAtualizar.ExecProc;
   SP_MovimentoAtualizar.close;

   FUsuario.LogUsuario('pedido de venda | desaprovar','Desaprovou (reabriu) Pedido de Venda' + #13 + #10 +
              AcaoUserName[0]
              );


   db_Pedido.Refresh;
   aviso('Pedido desaprovado (reaberto) com sucesso.');

end;

procedure TFrmPedidoAprovarVenda.BtnProcurarClick(Sender: TObject);
begin

   // procurar
   if dbeditPedidoProcurar.Execute then
   begin
      if not db_Pedido.active then
         db_Pedido.Open;
      db_Pedido.Locate('CODIGO', dbeditPedidoProcurar.ResultFieldAsInteger('CODIGO'), []);
      EditPedido.Text := dbeditPedidoProcurar.ResultFieldAsString('CODIGO');
      EditPedido.SetFocus;
   end;
end;

procedure TFrmPedidoAprovarVenda.BtnsairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmPedidoAprovarVenda.cxGridPedidosCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Focused then
      ACanvas.Brush.Color := clSkyBlue;
end;

procedure TFrmPedidoAprovarVenda.cxGridPedidosItensCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if AViewInfo.GridRecord.Focused then
      ACanvas.Brush.Color := clSkyBlue;
end;

procedure TFrmPedidoAprovarVenda.dbGrid_ProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

//   if KEY=VK_F2 then
//   begin
//      strProduto :=db_PedidoItens.FieldByName('PRODUTO').AsString;
//      FrmProdutosQuantidadeGrade := TFrmProdutosQuantidadeGrade.Create(self);
//      FrmProdutosQuantidadeGrade.ShowModal;
//      strProduto :='';
//   end;

end;

procedure TFrmPedidoAprovarVenda.db_PedidoAfterScroll(DataSet: TDataSet);
begin

//   AcaoUserName[0] :='';
//
//   AcaoUserName[0] :=
//   'C�DIGO.....: ' + db_Pedido.FieldByName('CODIGO').AsString  +    #13 + #10 +
//   'CLIENTE....: ' + db_Pedido.FieldByName('CLIENTE').AsString+'-'+db_Pedido.FieldByName('CLIENTE_NOME').AsString +    #13 + #10 +
//   'QUANTIDADE.: ' + FormatFloat('###,##0',  db_Pedido.FieldByName('QTDE_TOTAL').AsFloat) + #13 + #10 +
//   'VALOR......: ' + FormatFloat('###,##0.00',  db_Pedido.FieldByName('VLR_TOTAL').AsFloat);


end;

procedure TFrmPedidoAprovarVenda.Desaprovartudo1Click(Sender: TObject);
begin
   ProgressBar1.Max :=db_Pedido.RecordCount;
   ProgressBar1.Position := 0;
   db_Pedido.first;

   db_Pedido.close;
   db_Pedido.open;
   while not db_Pedido.Eof do
   begin
      nPedidoVenda := 0;
      nPedidoVenda := db_Pedido.FieldByName('CODIGO').AsInteger;

      // Enviar comando para aprovar pedido
      SP_Aprovar.ParamByName('NEMPRESA').AsInteger :=  FSistema.Empresa;
      SP_Aprovar.ParamByName('NPEDIDO').AsInteger  :=  nPedidoVenda;
      SP_Aprovar.ParamByName('ACAO').AsString      :=  'DESAPROVAR';
      SP_Aprovar.ExecProc;
      SP_Aprovar.close;

      // Enviar comando para atualizar movimenta��o de produtos
      SP_MovimentoAtualizar.ExecProc;
      SP_MovimentoAtualizar.close;


      ProgressBar1.Position := ProgressBar1.Position + 1;
      Application.ProcessMessages;
      db_Pedido.Next;
   end;

   db_Pedido.Refresh;
   Aviso('concluido');
   ProgressBar1.Position := 0;


end;

procedure TFrmPedidoAprovarVenda.EditPedidoChange(Sender: TObject);
begin
   //db_Pedido.Locate('CODIGO', StrToIntDef(EditPedido.Text,0), []);
end;

procedure TFrmPedidoAprovarVenda.EditPedidoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    BtnaprovarClick(Sender);
  end
  else if Key = VK_ESCAPE then
  begin
    BtnsairClick(Sender);
  end;

end;

procedure TFrmPedidoAprovarVenda.FormActivate(Sender: TObject);
begin
   db_Pedido.Refresh;
   db_PedidoItens.Refresh;
   rdgFiltroPedidosClick(Sender);

end;

procedure TFrmPedidoAprovarVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   FUsuario.LogUsuario('pedido de venda | aprovar','saiu do modulo Aprova��o de Pedido de Venda' );
   //
   FreeAndNil(FrmPedidoAprovarVenda);

end;

procedure TFrmPedidoAprovarVenda.FormShow(Sender: TObject);
begin
   rdgFiltroPedidosClick(Sender);
end;

procedure TFrmPedidoAprovarVenda.rdgFiltroPedidosClick(Sender: TObject);
begin
   prcFiltrarPedidos;
   EditPedido.SetFocus;
end;

procedure TFrmPedidoAprovarVenda.db_ChecarAtrasosBeforeOpen(DataSet: TDataSet);
begin
   db_ChecarAtrasos.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;
   db_ChecarAtrasos.ParamByName('CLIENTE').AsInteger := db_Pedido.FieldByName('CLIENTE').AsInteger;
end;

procedure TFrmPedidoAprovarVenda.prcFiltrarPedidos;
begin
  db_PedidoItens.Close;
  db_Pedido.Close;

  db_Pedido.SQL.Clear;
  db_Pedido.SQL.Add('SELECT * FROM VIEW_PEDIDOSVENDAS  ');

  db_Pedido.SQL.Add(' WHERE ');
  db_Pedido.sql.add('DATA>=:DATA1 AND DATA<=:DATA2 ');

  db_Pedido.ParamByName('DATA1').AsDateTime := dtDataIni;
  db_Pedido.ParamByName('DATA2').AsDateTime := dtDataFim;

  if rdgFiltroPedidos.ItemIndex=0 then
  begin
     db_Pedido.SQL.Add(' AND ');
     db_Pedido.SQL.Add('APROVADO IN (''N'',''NAO'')         ');
  end;

  if rdgFiltroPedidos.ItemIndex=1 then
  begin
  db_Pedido.SQL.Add(' AND ');
     db_Pedido.SQL.Add('APROVADO IN (''S'',''SIM'')         ');
  end;

  if rdgFiltroPedidos.ItemIndex=2 then
  begin
  db_Pedido.SQL.Add(' AND ');
     db_Pedido.SQL.Add('STATUS IN (''S'',''SIM'')         ');
  end;

  db_Pedido.SQL.Add('ORDER BY CODIGO DESC ');

  db_Pedido.open;
  db_PedidoItens.open;

end;

end.



