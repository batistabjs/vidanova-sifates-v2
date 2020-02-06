{***********************************************************************************
**  SISTEMA...............: Vida Nova Gest�o de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  C�digo pertencente ao cliente sob prote��o autoral.                           ****  N�o comercializ�vel sem pr�via autoriza��o do mesmo.                          **
***********************************************************************************}
unit FPedidoVendaGrade;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Grids, StdCtrls, DB,  FireDAC.Comp.Client, DBGrids, GradeProduto;

type
   TFrmPedidoVendaGrade = class(TForm)
      Panel1: TPanel;
    pnPedido: TGroupBox;
    pnEstoque: TGroupBox;
    GradePedidoVendas: TGradeProduto;
    GradeEstoque: TGradeProduto;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure StringGridOpcoesKeyPress(Sender: TObject; var Key: Char);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private
    //procedure CrossTab(dbDados:TFDQuery; stScriptSQL, stCampoLinhas, stTituloLinha, stCampoColunas , stCampoSomar, stWhere:String; stOperador:String='Sum');
      { Private declarations }
   public
      { Public declarations }
      FIDEmpresa     : Integer;
      FIDPedido      : Integer;
      FIDPedidoItens : Integer;
      FProduto       : String;
   end;

var
   FrmPedidoVendaGrade: TFrmPedidoVendaGrade;

implementation

uses FPedidoVenda, Biblioteca_pcp, Biblioteca, FPrincipal, Classe.Global, Global,
  FProdutosQuantidade, SQLServer, CoreTableClass;

{$R *.dfm}

procedure TFrmPedidoVendaGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  mQtde : Integer;
  mSQL  : WideString;
begin
  if GradePedidoVendas.Alterado then
  begin
    if pergunta('A grade foi alterada, deseja salvar?') then
    begin
      try
        prcStatusMessage('Pedido de Venda','Gravando grade do pedido...');
        GradePedidoVendas.GradeGravar;
      finally
        prcStatusMessage('','',False);
      end;
    end;
  end;

   mQtde :=0;
   mQtde :=GradePedidoVendas.GetTotalQuantidade;

   mSQL :=format(' update pedidos_itens set QTDE=%d where EMPRESA=%d AND CODIGO=%d AND REFERENCIA=%s',
                 [mQtde, FIDEmpresa, FIDPedido, QuotedStr(FProduto)]);

   FConexao.ExecSQL(mSQL);
   Action := Cafree;

end;

procedure TFrmPedidoVendaGrade.FormCreate(Sender: TObject);
begin
  FIDEmpresa     :=0;
  FIDPedido      :=0;
  FIDPedidoItens :=0;
  FProduto       :='';
end;

procedure TFrmPedidoVendaGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Key = VK_F3 then
   begin
     GradePedidoVendas.GradeLimpar;
   end;

   if Key = VK_ESCAPE then
      close;

end;

procedure TFrmPedidoVendaGrade.FormShow(Sender: TObject);
var
  mAreaTotal : Integer;
begin
   mAreaTotal := 0;
   FrmPedidoVendaGrade.Caption := 'Grade de quantidades /  ' + 'Pedido n�mero: ' + FrmPedidoVenda.db_Pedido.FieldByName('CODIGO').AsString;
   //--------------------------------------------------------
   // ajusta area de grade
   //--------------------------------------------------------
   mAreaTotal :=(pnEstoque.Height + pnPedido.Height);
   if mAreaTotal>0 then
     mAreaTotal := mAreaTotal div  2;
   pnPedido.Height :=mAreaTotal;
   Invalidate;

   //--------------------------------------------------------
   //
   //--------------------------------------------------------
   GradePedidoVendas.IDEmpresa          :=FIDEmpresa;
   GradePedidoVendas.IDPedido           :=FIDPedido;
   GradePedidoVendas.IDPedidoItens      :=FIDPedidoItens;
   GradePedidoVendas.Produto.Referencia :=FProduto;
   GradeEstoque.Produto.Referencia      :=FProduto;

   //--------------------------------------------------------
   // criar grades
   //--------------------------------------------------------
   GradePedidoVendas.CriarEdits;
   GradeEstoque.CriarEdits;




end;

procedure TFrmPedidoVendaGrade.StringGridOpcoesKeyPress(Sender: TObject;
  var Key: Char);
begin
   {
     If Not (key in ['0'..'9',#8,#13,#46,#37,#38,#39,#40] ) Then
     key:=#0;
   }
end;



end.
