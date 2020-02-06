{***********************************************************************************
**  SISTEMA...............: Vida Nova Gest�o de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  C�digo pertencente ao cliente sob prote��o autoral.                           ****  N�o comercializ�vel sem pr�via autoriza��o do mesmo.                          **
***********************************************************************************}

unit FDistribuirRemessaGrade;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, ExtCtrls, Grids, StdCtrls;

type
   TFrmDistribuirRemessaGrade = class(TForm)
      Panel1: TPanel;
    StringGridOpcoesRetornar: TStringGrid;
    StringGridOpcoes: TStringGrid;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormCreate(Sender: TObject);
      procedure FormShow(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmDistribuirRemessaGrade: TFrmDistribuirRemessaGrade;

implementation

uses Biblioteca_pcp, Biblioteca, FDistribuirRemessa;

{$R *.dfm}

procedure TFrmDistribuirRemessaGrade.FormCreate(Sender: TObject);
begin

   DistribuirReferencia_Montar_Produzir(FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('REFERENCIA').AsString, StringGridOpcoes);

   DistribuirReferencia_Carregar_Produzir(FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('CODIGO').AsInteger,
                                          FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('ORDEMPRODUCAO').AsInteger,
                                          FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('REFERENCIA').AsString,
                                           StringGridOpcoes);

   DistribuirRetorno_Montar_Produzir(FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('REFERENCIA').AsString, StringGridOpcoesRetornar);

   DistribuirRetorno_Carregar_Produzido(FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('CODIGO').AsInteger,
                                          FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('ORDEMPRODUCAO').AsInteger,
                                          FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('REFERENCIA').AsString,
                                           StringGridOpcoesRetornar);



end;

procedure TFrmDistribuirRemessaGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   if (FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('QTDE_PRODUZIDA').AsInteger < 1) then
   begin

      DistribuirReferencia_Salvar_Produzir(FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('CODIGO').AsInteger,
                                           FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('ORDEMPRODUCAO').AsInteger,
                                           FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('REFERENCIA').AsString,
                                           StringGridOpcoes);

      DistribuirRetorno_Salvar_Produzido(FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('CODIGO').AsInteger,
                                           FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('ORDEMPRODUCAO').AsInteger,
                                           FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('REFERENCIA').AsString,
                                           StringGridOpcoesRetornar);

        FrmDistribuirRemessa.db_DistribuirReferencias.Edit;
        FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('QUANTIDADE').AsFloat :=DistribuirReferencia_Totalizar_Produzir(StringGridOpcoes);
        FrmDistribuirRemessa.db_DistribuirReferencias.Post;

   end;

   Action := Cafree;

end;

procedure TFrmDistribuirRemessaGrade.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   if Key = VK_F3 then
   begin
      if (FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('QTDE_PRODUZIDA').AsInteger > 0) then
      begin
         FormMensagem('N�o � permitido editar. H� produ��o em andamento para este produto.' + #13
        + #10 + 'J� foram produzidos ' + FormatFloat('###,##0',
        FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('QTDE_PRODUZIDA').AsInteger));
        exit;


      end;

//      StringGridOpcoes.Clear;
      DistribuirReferencia_Montar_Produzir(FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName('REFERENCIA').AsString, StringGridOpcoes);
   end;

   if Key = VK_ESCAPE then
      close;

end;

procedure TFrmDistribuirRemessaGrade.FormShow(Sender: TObject);
begin

   //FrmDistribuirRemessaGrade.Width := StringGridOpcoes.Width + 15;

   FrmDistribuirRemessaGrade.Caption := 'Grade de quantidades /  ' +
     'Remessa : ' + FrmDistribuirRemessa.db_DistribuirReferencias.FieldByName
     ('CODIGO').AsString;

   Update;

end;

end.
