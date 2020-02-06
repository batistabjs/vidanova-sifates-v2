{***********************************************************************************
**  SISTEMA...............: Vida Nova Gest�o de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  C�digo pertencente ao cliente sob prote��o autoral.                           ****  N�o comercializ�vel sem pr�via autoriza��o do mesmo.                          **
***********************************************************************************}
unit FFat_RelNFAnaliticoProdutos;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, quickrpt, Qrctrls, Db,   QRPrntr, QRExport, QRPREV,
   QRPDFFilt, Classe.Global, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
   TFrmFat_RelNFAnaliticoProdutos = class(TForm)
      DB_Vendas: TFDQuery;
      QuickRep1: TQuickRep;
      Cabecalho: TQRBand;
      QRBand2: TQRBand;
      Vlr_Debito: TQRDBText;
      Vlr_Credito: TQRDBText;
      Vlr_SaldoAnterior: TQRDBText;
      QRDBText3: TQRDBText;
      QuebraReport: TQRGroup;
      TotalNotaFiscal: TQRBand;
      QRBand4: TQRBand;
      QRDBText7: TQRDBText;
      QRDBText8: TQRDBText;
      QRDBText9: TQRDBText;
      QRDBText5: TQRDBText;
      QRDBText13: TQRDBText;
      QRDBText11: TQRDBText;
      QRExpr1: TQRExpr;
      QRExpr2: TQRExpr;
      QRExpr4: TQRExpr;
      QRExpr5: TQRExpr;
      QRExpr6: TQRExpr;
      QRLabel14: TQRLabel;
      QRExpr3: TQRExpr;
      QRExpr7: TQRExpr;
      QRExpr8: TQRExpr;
      QRExpr9: TQRExpr;
      QRDBText4: TQRDBText;
      QRDBText1: TQRDBText;
      QRDBText2: TQRDBText;
      QRLabel6: TQRLabel;
      QRLabel13: TQRLabel;
      QRLabel12: TQRLabel;
      QRLabel5: TQRLabel;
      QRLabel3: TQRLabel;
      QRLabel2: TQRLabel;
      QRLabel1: TQRLabel;
      QRLabel11: TQRLabel;
      LblSldAnterior: TQRLabel;
      QRLabel4: TQRLabel;
      QRLabel8: TQRLabel;
      QRLabel15: TQRLabel;
      Band_Cabecalho: TQRBand;
      LblTitulo: TQRLabel;
      QRLabel28: TQRLabel;
      QRLabel29: TQRLabel;
      QRLabel30: TQRLabel;
      QRSysData2: TQRSysData;
      QRSysData1: TQRSysData;
      QRSysData5: TQRSysData;
      LblPeriodo: TQRLabel;
      QRShape1: TQRShape;
      LblVendedor: TQRLabel;
      LblCliente: TQRLabel;
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DB_VendasBeforeOpen(DataSet: TDataSet);
   private
      { Private declarations }
      somag, somaP: real;
   public
      { Public declarations }
   end;

var
   FrmFat_RelNFAnaliticoProdutos: TFrmFat_RelNFAnaliticoProdutos;

implementation

uses Biblioteca, Global, FPrincipal, FRelFaturamento;

{$R *.DFM}

procedure TFrmFat_RelNFAnaliticoProdutos.FormCreate(Sender: TObject);
begin

   case FrmRelFaturamento.RadioNF.ItemIndex of
      0:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 +
           '(TODAS AS NOTAS FISCAIS)   ';
      1:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(NF SA�DAS)   ';
      2:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 + '(NF ENTRADAS) ';
      3:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 +
           '(NF CANCELADAS) ';
      4:
         LblTitulo.Caption := LblTitulo.Caption + #13 + #10 +
           '(SOMENTE CUPOM FISCAL)   ';

   end;

   dtDataIni := StrToDate(FrmRelFaturamento.MskDataIni.Text);
   dtDataFim := StrToDate(FrmRelFaturamento.MskDataFim.Text);
   LblPeriodo.Caption := 'PER�ODO: ' + DateToStr(dtDataIni) + ' - ' +
     DateToStr(dtDataFim);

   if empty(CodIni) then
      CodIni := '0';

   while Length(CodFim) < 30 do
      CodFim := CodFim + 'Z';

   // montar script da tabela Mestre
   sqlMaster := '';
   sqlMaster := sqlMaster + ' SELECT * FROM  VIEW_FATLIQUIDO_PRODUTOS ';
   sqlMaster := sqlMaster + '  WHERE  ';
   sqlMaster := sqlMaster + '  EMPRESA=:EMPRESA  ';
   sqlMaster := sqlMaster + '  AND  ';
   sqlMaster := sqlMaster + ' EMISSAO>=:DATA1 AND EMISSAO<=:DATA2 ';
   sqlMaster := sqlMaster + ' AND ';
   sqlMaster := sqlMaster + ' PRODUTO>=:PRODUTO1 and PRODUTO<=:PRODUTO2 ';
   sqlMaster := sqlMaster + ' AND ';
   sqlMaster := sqlMaster + Tipo_NF;

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin
      sqlMaster := sqlMaster + ' AND ';
      sqlMaster := sqlMaster + ' CLIENTE=:CLIENTE ';
   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin
      sqlMaster := sqlMaster + ' AND ';
      sqlMaster := sqlMaster + ' VENDEDOR=:VENDEDOR ';
   End;

   case FrmRelFaturamento.RadioNF.ItemIndex of
      4:
      Begin
         sqlMaster := sqlMaster + ' AND ';
         sqlMaster := sqlMaster + ' CUPOM='+QuotedStr('S');
      End;

   end;


   sqlMaster := sqlMaster + ' ORDER BY ' + strOrdemDados;

   DB_Vendas.Close;
   DB_Vendas.SQL.clear;
   DB_Vendas.SQL.Add(sqlMaster);
   DB_Vendas.ParamByName('DATA1').AsDateTime := dtDataIni;
   DB_Vendas.ParamByName('DATA2').AsDateTime := dtDataFim;
   DB_Vendas.ParamByName('PRODUTO1').AsString := CodIni; // INTERBASE
   DB_Vendas.ParamByName('PRODUTO2').AsString := CodFim; // INTERBASE

   if not FrmRelFaturamento.chkCliente.Checked then
   Begin

      DB_Vendas.ParamByName('CLIENTE').AsInteger :=
        StrToInt(FrmRelFaturamento.EditCliente.Text);

      LblCliente.Caption := 'CLIENTE: ' +
        FrmRelFaturamento.EditClienteNome.Text;

   End;

   if not FrmRelFaturamento.chkRepres.Checked then
   Begin

      DB_Vendas.ParamByName('VENDEDOR').AsInteger :=
        StrToInt(FrmRelFaturamento.EditVendedor.Text);

      LblVendedor.Caption := 'VENDEDOR: ' +
        FrmRelFaturamento.EditNomeVendedor.Text;

   End;

   DB_Vendas.Open;
   QuickRep1.Preview;

   Close;

end;

procedure TFrmFat_RelNFAnaliticoProdutos.DB_VendasBeforeOpen(DataSet: TDataSet);
begin
   DB_Vendas.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;

end;

procedure TFrmFat_RelNFAnaliticoProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DB_Vendas.Close;

   Action := caFree;

end;

end.
