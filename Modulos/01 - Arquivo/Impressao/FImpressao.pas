﻿{***********************************************************************************
**  SISTEMA...............: Vida Nova Gestão de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  Código pertencente ao cliente sob proteção autoral.                           ****  Não comercializável sem prévia autorização do mesmo.                          **
***********************************************************************************}

unit FImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Classe.Global,
  FFrameBotoes, FrmRelatoriosBotoes, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, FFrameBarra, frxClass, frxDBSet, frxPreview;

type
   TFrmImpressao = class(TForm)
      FrmFrameBarra1: TFrmFrameBarra;
    pnl_relatorio: TPanel;
      FrameRelatoriosBotoes1: TFrameRelatoriosBotoes;
      Panel2: TPanel;
      FrmFrameBotoes1: TFrmFrameBotoes;
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FrameRelatoriosBotoes1SpbSairClick(Sender: TObject);
    procedure FrameRelatoriosBotoes1SpbImprimirClick(Sender: TObject);
    procedure relatorioPreview(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
   public
      { Public declarations }
      relatorio: TfrxReport;
   end;

var
   FrmImpressao: TFrmImpressao;

implementation

uses
    FPedidoVenda;

{$R *.dfm}

procedure TFrmImpressao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //FreeAndNil(relatorio);
end;

procedure TFrmImpressao.FormCreate(Sender: TObject);
begin
  if relatorio=nil then
    relatorio := TfrxReport.Create(Self);
end;

procedure TFrmImpressao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_Escape then
   begin
      close;
   end
   else if Key = VK_F5 then
   begin
      FrameRelatoriosBotoes1SpbImprimirClick(Sender);
   end;
end;

procedure TFrmImpressao.relatorioPreview(Sender: TObject);
var
  xPreview: TfrxPreviewForm;
begin
      relatorio.PreviewOptions.Modal   := False;
      xPreview := TfrxPreviewForm(relatorio.PreviewForm);
      xPreview.BorderStyle := bsNone;
      xPreview.Parent:=pnl_relatorio;
      xPreview.Left:=0;
      xPreview.Top:=0;
      xPreview.Align:=alClient;
      //xPreview.Width:=pnl_relatorio.ClientWidth;
      //xPreview.Height:=pnl_relatorio.ClientHeight;
end;

procedure TFrmImpressao.FormShow(Sender: TObject);
begin
      relatorio.OnPreview:=relatorioPreview;
      relatorio.ShowReport();
end;

procedure TFrmImpressao.FrameRelatoriosBotoes1SpbImprimirClick(Sender: TObject);
begin
     relatorio.PrepareReport;
     relatorio.PrintOptions.ShowDialog := False;
     relatorio.Print;
end;

procedure TFrmImpressao.FrameRelatoriosBotoes1SpbSairClick(
  Sender: TObject);
begin
  FrameRelatoriosBotoes1.SpbSairClick(Sender);

end;

end.
