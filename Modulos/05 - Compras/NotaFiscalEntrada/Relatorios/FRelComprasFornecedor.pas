﻿{***********************************************************************************
**  SISTEMA...............: Vida Nova Gestão de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  Código pertencente ao cliente sob proteção autoral.                           ****  Não comercializável sem prévia autorização do mesmo.                          **
***********************************************************************************}

unit FRelComprasFornecedor;

interface

uses
   SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
   Forms, Dialogs,   DB, Qrctrls,
   quickrpt, ExtCtrls, QRPDFFilt,
   QRExport, FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmRelComprasFornecedor = class(TForm)
      QuickRep: TQuickRep;
      EmpresaTitulo: TQRBand;
      QRLabel1: TQRLabel;
      QRLabel3: TQRLabel;
      QRSysData1: TQRSysData;
      QRLabel4: TQRLabel;
      QRSysData2: TQRSysData;
      Cabecalho: TQRBand;
      QRLabel2: TQRLabel;
      QRLabel9: TQRLabel;
      QRLabel5: TQRLabel;
      QRLabel8: TQRLabel;
      QRLabel10: TQRLabel;
      QRLabel12: TQRLabel;
      QRLabel14: TQRLabel;
      Datalhes: TQRBand;
      QRDBText2: TQRDBText;
      QRDBText3: TQRDBText;
      QRDBText4: TQRDBText;
      QRDBText6: TQRDBText;
      QRDBText7: TQRDBText;
      QRDBText9: TQRDBText;
      QRDBText11: TQRDBText;
      QuebraProduto: TQRGroup;
      QRLabel15: TQRLabel;
      QRDBText12: TQRDBText;
      QRDBText13: TQRDBText;
      TotalProduto: TQRBand;
      QRExpr1: TQRExpr;
      QRExpr2: TQRExpr;
      QRExpr3: TQRExpr;
      QRExpr4: TQRExpr;
      QRExpr5: TQRExpr;
      QRShape5: TQRShape;
      SummaryBand1: TQRBand;
      QRExpr6: TQRExpr;
      QRExpr7: TQRExpr;
      QRExpr8: TQRExpr;
      QRExpr9: TQRExpr;
      QRExpr10: TQRExpr;
      QRLabel16: TQRLabel;
      DS_ComprasItens: TDataSource;
      Ado_ComprasItens: TFDQuery;
      QRDBText5: TQRDBText;
      QRLabel6: TQRLabel;
      QRLabel11: TQRLabel;
      QRLabel13: TQRLabel;
      QRLabel17: TQRLabel;
      ADO_PRODUTOS: TFDQuery;
      QRExpr11: TQRExpr;
      QRExpr12: TQRExpr;
      QRLabel7: TQRLabel;
      QRLabel18: TQRLabel;
      QRDBText1: TQRDBText;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelComprasFornecedor: TFrmRelComprasFornecedor;

implementation

uses Global, FRelCompras, Biblioteca;

{$R *.DFM}

procedure TFrmRelComprasFornecedor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Ado_ComprasItens.Close;
   ADO_PRODUTOS.Close;

   Action := caFree;
end;

procedure TFrmRelComprasFornecedor.FormCreate(Sender: TObject);
begin

   Cod_Grupo := FrmRelCompras.EditGrupo.Text;

   CodIni := FrmRelCompras.ModeloIni.Text;
   CodFim := FrmRelCompras.ModeloFim.Text;

   dtDataIni := StrToDate(FrmRelCompras.MskDataIni.Text);
   dtDataFim := StrToDate(FrmRelCompras.MskDataFim.Text);

   sqlMaster := '';
   sqlMaster := sqlMaster +
     ' SELECT A.*, B.CODIGO, B.NOME FROM COMPRAS_ITENS A, CAD_CLIENTES B  ';
   sqlMaster := sqlMaster + ' WHERE  ';
   sqlMaster := sqlMaster + ' B.CODIGO=A.FORNECEDOR ';
   sqlMaster := sqlMaster + ' AND  ';
   sqlMaster := sqlMaster + ' B.TIPO=''FORNECEDOR'' ';
   sqlMaster := sqlMaster + ' AND  ';
   //sqlMaster := sqlMaster + ' (A.DATA>='+QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataIni))+' AND A.DATA<='+QuotedStr(FormatDateTime('mm/dd/yyyy',dtDataFim))+' ) ';
   sqlMaster := sqlMaster + ' (A.DATA>='+QuotedStr(DateToStr(dtDataIni) )+' AND A.DATA<='+QuotedStr(DateToStr(dtDataFim))+' ) ';

   if not FrmRelCompras.chkFornecedor.Checked then
   Begin
      sqlMaster := sqlMaster + ' AND ';
      sqlMaster := sqlMaster + ' A.FORNECEDOR='+strFornecedor;
   End;

   if not FrmRelCompras.chkgrupos.Checked then
   Begin
      sqlMaster := sqlMaster + ' AND ';
      sqlMaster := sqlMaster + ' A.GRUPO='+Cod_Grupo;
   End;

   If (empty(CodIni) = false) or (empty(CodFim) = false) then
   Begin
      sqlMaster := sqlMaster + ' AND ';
      sqlMaster := sqlMaster +
        ' (A.COD_PRODUTO>='+CodIni+' AND  A.COD_PRODUTO<='+CodFim;
   end;

   // sqlMaster  :=sqlMaster + ' ORDER BY A.DATA, B.NOME, A.COD_PRODUTO ';

   Ado_ComprasItens.Close;
   Ado_ComprasItens.SQL.clear;
   Ado_ComprasItens.SQL.Add(sqlMaster);

   Ado_ComprasItens.Open;
   ADO_PRODUTOS.Open;

   QuickRep.Preview;
   Close;

end;

end.
