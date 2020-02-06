﻿{***********************************************************************************
**  SISTEMA...............: Vida Nova Gestão de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **
***********************************************************************************}

unit FProdutosQuantidadeGradeEditar;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Grids, StdCtrls, GradeProduto;

type
   TFrmProdutosQuantidadeGradeEditar = class(TForm)
      Panel1: TPanel;
    GradeProduto1: TGradeProduto;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmProdutosQuantidadeGradeEditar: TFrmProdutosQuantidadeGradeEditar;

implementation

uses FBaseDados_PCP, Biblioteca,
  FOrdemProducaoGrade, Global, FProdutosQuantidade, Classe.Usuarios, SQLServer,
  FPrincipal;

{$R *.dfm}

procedure TFrmProdutosQuantidadeGradeEditar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := Cafree;
end;

procedure TFrmProdutosQuantidadeGradeEditar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Key = VK_F3 then
   begin
      if pergunta('Deseja realmente zerar as quantidades?')=false then
        exit;
      GradeProduto1.Alterado := True;
      GradeProduto1.GradeLimpar;
   end;

   if Key = VK_ESCAPE then
   begin
      if GradeProduto1.Alterado then
      begin
        if pergunta('Deseja salvar as alterações?') then
        begin
          GradeProduto1.GradeGravar;
          FrmProdutosQuantidade.db_referencias.Edit;
          FrmProdutosQuantidade.db_referencias.FieldByName('ESTOQUESALDO').AsFloat :=GradeProduto1.GetTotalQuantidade ;
          FrmProdutosQuantidade.db_referencias.Post;
        end;
      end;
      close;
   end;

end;

procedure TFrmProdutosQuantidadeGradeEditar.FormShow(Sender: TObject);
begin
   if (strProduto>'') and (FrmProdutosQuantidade.db_referencias.FieldByName('TIPO_PRODUTO').AsString='ACA') then
   begin
     GradeProduto1.Visible := True;
     GradeProduto1.IDEmpresa          :=FrmProdutosQuantidade.db_referencias.FieldByName('EMPRESA').AsInteger;
     GradeProduto1.Produto.IDProduto  :=FrmProdutosQuantidade.db_referencias.FieldByName('CODIGO').AsInteger;
     GradeProduto1.Produto.Referencia :=strProduto;
     GradeProduto1.CriarEdits;
   end
end;

end.