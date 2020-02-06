{***********************************************************************************
**  SISTEMA...............: Vida Nova Gest�o de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  C�digo pertencente ao cliente sob prote��o autoral.                           ****  N�o comercializ�vel sem pr�via autoriza��o do mesmo.                          **
***********************************************************************************}

unit FRelFechamentoCaixaAnalitico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, Qrctrls, ExtCtrls,   DB, 
      QRPDFFilt, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRelFechamentoCaixaAnalitico = class(TForm)
    db_demonstrativo: TFDQuery;
    QuickRep: TQuickRep;
    QRBand2: TQRBand;
    Detalhes: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRGroup1: TQRGroup;
    QuebraTotal: TQRBand;
    QRGroup2: TQRGroup;
    QRDBText9: TQRDBText;
    TotalData: TQRBand;
    QRBand5: TQRBand;
    Lbl_QrTotal: TQRLabel;
    LBL_movimentacao: TQRDBText;
    QRExpr3: TQRExpr;
    QRShape2: TQRShape;
    Lbl_SubTotalMovto: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    db_demonstrativoNATUREZA: TStringField;
    db_demonstrativoPLN_CONTA: TStringField;
    db_demonstrativoPLN_CONTA_NOME: TStringField;
    db_demonstrativoPLANO_CODIGO: TIntegerField;
    db_demonstrativoPLANO_NOME: TStringField;
    db_demonstrativoHISTORICO: TStringField;
    db_demonstrativoVALOR: TFloatField;
    Band_Cabecalho: TQRBand;
    LblTitulo: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSysData5: TQRSysData;
    LblPeriodo: TQRLabel;
    QRShape1: TQRShape;
    LblPlanoContas: TQRLabel;
    LblDepartamento: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetalhesBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelFechamentoCaixaAnalitico: TFrmRelFechamentoCaixaAnalitico;

implementation

uses FPrincipal, Global, Biblioteca, FRelFechamentoCaixa;

{$R *.DFM}


procedure TFrmRelFechamentoCaixaAnalitico.FormCreate(Sender: TObject);
begin

    wFloat[0] :=0;  // total
    wFloat[1] :=0;  // credito
    wFloat[2] :=0;  // debito

   LblPeriodo.Caption    :='PER�ODO:  '+
                           FrmRelFechamentoCaixa.MskDataIni.Text + ' A '+
                           FrmRelFechamentoCaixa.MskDataFim.Text;

   if not FrmRelFechamentoCaixa.chkPlanos.checked then
   begin
      if FrmRelFechamentoCaixa.DCodPlano.text>'' then
      begin
         LblPlanoContas.Caption :='PLANO DE CONTAS: '+#13+#10+
         FrmRelFechamentoCaixa.EditNomePlanoContas.Text;
      end
      else
      begin
         FrmRelFechamentoCaixa.DCodPlano.text:='0';
      end;
   end;


   if not FrmRelFechamentoCaixa.chkDepartamento.checked then
   begin
      if FrmRelFechamentoCaixa.EditDepartamentoNome.text>'' then
      begin
         LblDepartamento.Caption :='DEPARTAMENTO: '+
            FrmRelFechamentoCaixa.EditDepartamentoNome.Text;
      end
      else
      begin
         FrmRelFechamentoCaixa.EditDepartamento.text:='0';
      end;
   end;

   ///
   /// se for todos os departamentos
   ///


   sqlMaster :=  ' ';
   sqlMaster := sqlMaster+' select  ';
   sqlMaster := sqlMaster+'     NATUREZA ,  ';
   sqlMaster := sqlMaster+'     PLN_CONTA ,  ';
   sqlMaster := sqlMaster+'     PLN_CONTA_NOME ,  ';
   sqlMaster := sqlMaster+'     PLANO_CODIGO ,  ';
   sqlMaster := sqlMaster+'     PLANO_NOME ,  ';
   sqlMaster := sqlMaster+'     HISTORICO ,  ';

   if not FrmRelFechamentoCaixa.chkDepartamento.checked then
   begin
      sqlMaster := sqlMaster+'     DEPARTAMENTO ,  ';
   end;

   sqlMaster := sqlMaster+'     VALOR  ';

   if FrmRelFechamentoCaixa.chkDepartamento.checked then
   begin
      sqlMaster := sqlMaster+' from SP_DEMONSTRATIVO (:DATA1, :DATA2 )  ';
   end;

   if not FrmRelFechamentoCaixa.chkDepartamento.checked then
   begin
      sqlMaster := sqlMaster+' from SP_DEMONSTRATIVO_DEPARTAMENTO (:DATA1, :DATA2, :NDEPARTAMENTO )  ';
   end;

   sqlMaster := sqlMaster+' WHERE  ';
   sqlMaster := sqlMaster+' VALOR<>0  ';

   if not FrmRelFechamentoCaixa.chkPlanos.checked then
   Begin
      sqlMaster := sqlMaster+' AND PLANO_CODIGO=:PLANO_CODIGO ';
      sqlMaster := sqlMaster+'   ';
   End;
   
   {
   if not FrmRelFechamentoCaixa.chkDepartamento.checked then
   Begin
      sqlMaster := sqlMaster+' AND DEPARTAMENTO=:DEPARTAMENTO ';
      sqlMaster := sqlMaster+'   ';
   End;
   }

   // somente as quitadas
   if FrmRelFechamentoCaixa.RadioStatus.ItemIndex=1 then
   Begin
      sqlMaster := sqlMaster+' AND QUITADO= '+QuotedStr('S');
   End;
   
   // somente as pendentes
   if FrmRelFechamentoCaixa.RadioStatus.ItemIndex=2 then
   Begin
      sqlMaster := sqlMaster+' AND QUITADO= '+QuotedStr('N');
   End;
   
   // somente as receitas (contas a receber)
   if FrmRelFechamentoCaixa.RadioMovimentacao.ItemIndex=1 then
   Begin
      sqlMaster := sqlMaster+' AND NATUREZA= '+QuotedStr('RECEITA');
   End;
   
   // somente as despesas (contas a pagar)
   if FrmRelFechamentoCaixa.RadioMovimentacao.ItemIndex=2 then
   Begin
      sqlMaster := sqlMaster+' AND NATUREZA= '+QuotedStr('DESPESA');
   End;
   
   {
   sqlMaster := sqlMaster+' GROUP BY  ';
   sqlMaster := sqlMaster+'     NATUREZA ,  ';
   sqlMaster := sqlMaster+'     PLN_CONTA ,  ';
   sqlMaster := sqlMaster+'     PLN_CONTA_NOME ,  ';
   sqlMaster := sqlMaster+'     PLANO_CODIGO ,  ';
   sqlMaster := sqlMaster+'     PLANO_NOME ,  ';
   sqlMaster := sqlMaster+'     HISTORICO ,  ';

   if not FrmRelFechamentoCaixa.chkDepartamento.checked then
   Begin
      sqlMaster := sqlMaster+'     DEPARTAMENTO ,  ';
   End;

   sqlMaster := sqlMaster+'     SALDO_FINAL  ';
   }

   sqlMaster := sqlMaster+'   ';
   sqlMaster := sqlMaster+' order by  ';
   sqlMaster := sqlMaster+'     NATUREZA DESC, PLANO_NOME, PLN_CONTA_NOME  ';
   
   db_demonstrativo.Close;
   db_demonstrativo.SQL.Clear;
   db_demonstrativo.SQL.Add(sqlMaster);
   db_demonstrativo.ParamByName('DATA1').AsDateTime := StrToDate(FrmRelFechamentoCaixa.MskDataIni.text);
   db_demonstrativo.ParamByName('DATA2').AsDateTime := StrToDate(FrmRelFechamentoCaixa.MskDataFim.text);
   
   if not FrmRelFechamentoCaixa.chkPlanos.checked then
   Begin
      db_demonstrativo.ParamByName('PLANO_CODIGO').AsInteger :=StrToInt(FrmRelFechamentoCaixa.DCodPlano.text);
   End;

   if not FrmRelFechamentoCaixa.chkDepartamento.checked then
   Begin
      db_demonstrativo.ParamByName('NDEPARTAMENTO').AsInteger :=StrToInt(FrmRelFechamentoCaixa.EditDepartamento.text);
   End;

   db_demonstrativo.Open;

   QuickRep.Preview;
   Close;

end;


procedure TFrmRelFechamentoCaixaAnalitico.DetalhesBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

   If db_demonstrativo.FieldByName('NATUREZA').AsString='RECEITA' then
   begin
      wFloat[1] :=wFloat[1] + db_demonstrativo.FieldByName('VALOR').AsFloat;
   end;

   If db_demonstrativo.FieldByName('NATUREZA').AsString='DESPESA' then
   begin
      wFloat[2] :=wFloat[2] + db_demonstrativo.FieldByName('VALOR').AsFloat;
   end;

   // Cr�dito - Debito
   wFloat[0] :=0;
   wFloat[0] :=wFloat[1] - wFloat[2];

   if wFloat[0]>0 then
   begin
      Lbl_QrTotal.Color      :=clBlue;
      Lbl_QrTotal.Font.Color :=clWhite;
      Lbl_QrTotal.Caption    :='   LUCRO:   '+FormatFloat('###,##0.00',wFloat[0])+'   ';
   end;

   if wFloat[0]<0 then
   begin
      Lbl_QrTotal.Color      :=clRed;
      Lbl_QrTotal.Font.Color :=clWhite;
      Lbl_QrTotal.Caption :='   PREJU�ZO:   '+FormatFloat('###,##0.00',wFloat[0])+'   ';
   end;

   if wFloat[0]=0 then
   begin
      Lbl_QrTotal.Caption :='Receitas e Despesas est�o iguais:   '+FormatFloat('###,##0.00',wFloat[0]);
   end;

end;

procedure TFrmRelFechamentoCaixaAnalitico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   db_demonstrativo.Close;

   action := caFree;
end;


procedure TFrmRelFechamentoCaixaAnalitico.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
    wFloat[0] :=0;  // total
    wFloat[1] :=0;  // credito
    wFloat[2] :=0;  // debito
    Lbl_QrTotal.Caption :='0,00';

end;

procedure TFrmRelFechamentoCaixaAnalitico.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin

   if db_demonstrativo.FieldByName('NATUREZA').AsString='RECEITA' then
   begin
      LBL_movimentacao.caption   :='   RECEITAS   ';
      Lbl_SubTotalMovto.caption  :='   TOTAL DE RECEITAS: ';
   end;

   if db_demonstrativo.FieldByName('NATUREZA').AsString='DESPESA' then
   begin
      LBL_movimentacao.caption   :='   DESPESAS   ';
      Lbl_SubTotalMovto.caption  :='   TOTAL DE DESPESAS: ';
   end;

end;

end.
