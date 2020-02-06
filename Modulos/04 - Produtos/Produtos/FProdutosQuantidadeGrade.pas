﻿{***********************************************************************************
**  SISTEMA...............: Vida Nova Gestão de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  Código pertencente ao cliente sob proteção autoral.                           ****  Não comercializável sem prévia autorização do mesmo.                          **
***********************************************************************************}

unit FProdutosQuantidadeGrade;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Grids, StdCtrls, DB, DBGrids,  FireDAC.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmProdutosQuantidadeGrade = class(TForm)
      Panel1: TPanel;
    ds_EstoqueGrade: TDataSource;
    db_EstoqueGrade: TFDQuery;
    DBGrid1: TDBGrid;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCreate(Sender: TObject);
    procedure StringGridOpcoesEditChange(Sender: TObject; ACol, ARow: Integer;
      Value: string);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmProdutosQuantidadeGrade: TFrmProdutosQuantidadeGrade;

implementation

uses Biblioteca_pcp, FProdutosQuantidade, Biblioteca, Global;

{$R *.dfm}

procedure TFrmProdutosQuantidadeGrade.FormCreate(Sender: TObject);
begin

      FSQL := ' SELECT *  FROM PCP_DISTRIBUIR_RGRADE_RETORNO ';

      CrossTab(db_EstoqueGrade,
             FSQL,
             'COR',
             'GRADE (COR/TAMANHO):',
             'TAMANHO',
             'QUANTIDADE',
             ' WHERE TAMANHO<>''''  AND REFERENCIA='+QuotedStr(Trim(strProduto)),
             'ORDEM_GRADE',
             'SUM');
end;

procedure TFrmProdutosQuantidadeGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   Action := Cafree;

end;

procedure TFrmProdutosQuantidadeGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Key = VK_ESCAPE then
      close;

end;

procedure TFrmProdutosQuantidadeGrade.StringGridOpcoesEditChange(
  Sender: TObject; ACol, ARow: Integer; Value: string);
begin
  bAlterouGrade := True;
end;

end.
