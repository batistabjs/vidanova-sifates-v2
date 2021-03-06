{***********************************************************************************
**  SISTEMA...............: Vida Nova Gest�o de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  C�digo pertencente ao cliente sob prote��o autoral.                           ****  N�o comercializ�vel sem pr�via autoriza��o do mesmo.                          **
***********************************************************************************}

unit FRelEntregas;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, StdCtrls, Mask,  FrmRelatorios, ISFEdit,
  ISFEditbtn, ISFdbEditbtn, IDBEdit, uEstSearchDialogZeos, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
   TFrmRelEntregas = class(TForm)
      Panel1: TPanel;
      RadioG: TRadioGroup;
      GroupBox2: TGroupBox;
      Label3: TLabel;
      Label4: TLabel;
      MskDataIni: TMaskEdit;
      MskDataFim: TMaskEdit;
      chkCliente: TCheckBox;
      BoxRepresentante: TGroupBox;
      Label5: TLabel;
      DCodRepres: TEdit;
      chkRepres: TCheckBox;
      Panel2: TPanel;
      BtnSair: TBitBtn;
      Btn_Imprimir: TBitBtn;
      RdPedidos: TRadioGroup;
    FrameRelatorios1: TFrameRelatorios;
    EditEntregador: TIDBEditDialog;
    EditClienteNome: TEdit;
    db_Entregas: TFDQuery;
    fsr_entregas: TfrxReport;
    fsd_entregas: TfrxDBDataset;
      procedure Btn_SairClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure MskDataIniExit(Sender: TObject);
      procedure MskDataFimExit(Sender: TObject);
      procedure Btn_ImprimirClick(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnSairClick(Sender: TObject);
      procedure chkRepresClick(Sender: TObject);
      procedure chkClienteClick(Sender: TObject);
      procedure EditMarcaKeyPress(Sender: TObject; var Key: Char);
      procedure DCodClienteKeyPress(Sender: TObject; var Key: Char);
      procedure DCodRepresKeyPress(Sender: TObject; var Key: Char);
      procedure RadioGClick(Sender: TObject);

   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmRelEntregas: TFrmRelEntregas;

implementation

uses Biblioteca, Global, FPrincipal, FRelEntregas_Geral, FImpressao;

{$R *.DFM}

procedure TFrmRelEntregas.Btn_SairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmRelEntregas.FormCreate(Sender: TObject);
var dia, mes, ano : Word;
begin
   CodIni := '';
   CodFim := '';
   Achar[0] := '';
   DecodeDate(now, ano, mes, dia);
   dtDataIni := StartOfaMonth(ano,mes-1);
   dtDataFim :=  EndOfaMonth(ano,mes-1);
   MskDataIni.Text := dateToStr( dtDataIni );
   MskDataFim.Text := dateToStr( dtDataFim );
end;

Procedure TFrmRelEntregas.MskDataIniExit(Sender: TObject);
Begin

   MskDataIni.Text := fncDataValidar(MskDataIni.Text);

End;

procedure TFrmRelEntregas.MskDataFimExit(Sender: TObject);
begin
   MskDataFim.Text := fncDataValidar(MskDataFim.Text);
end;

procedure TFrmRelEntregas.Btn_ImprimirClick(Sender: TObject);
begin
  try
     if FrmImpressao=nil then
            FrmImpressao := TFrmImpressao.Create(Self);

     // relat�rio de Pedidos - Abertos
     If RadioG.ItemIndex = 0 then
     Begin
        //FrmRelEntregas_Geral := TFrmRelEntregas_Geral.create(self);

        db_Entregas.Close;
        db_Entregas.sql.Clear;
        db_Entregas.sql.add('SELECT  A.*, B.CODIGO, B.NOME ');
        db_Entregas.sql.add('FROM PEDIDOS A,  CAD_CLIENTES B ');
        db_Entregas.sql.add('where ');
        db_Entregas.sql.add('a.transportadora=B.CODIGO and B.CODIGO=:ENTREGADOR' );
        db_Entregas.ParamByName('ENTREGADOR').AsInteger := StrToIntDef(EditEntregador.text,0);
        db_Entregas.Open;

        FrmImpressao.relatorio:=fsr_entregas;//.ShowReport;
     End;
     FrmImpressao.ShowModal();
  finally
    //prcStatusMessage('','',False);
    FreeAndNil(FrmImpressao);
  end;
End;

procedure TFrmRelEntregas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    SelectNext(Screen.ActiveControl, True, True);
  end
  else if Key = VK_ESCAPE then
  begin
    Close;
  end;
end;

procedure TFrmRelEntregas.BtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmRelEntregas.chkRepresClick(Sender: TObject);
begin

   if chkRepres.Checked = true then
   Begin
      DCodRepres.Enabled := False;
   End
   Else
   Begin
      DCodRepres.Enabled := true;
      DCodRepres.SelectAll;
      DCodRepres.SetFocus;
   End;

end;

procedure TFrmRelEntregas.chkClienteClick(Sender: TObject);
begin
   if chkCliente.Checked = true then
   Begin
      EditEntregador.Enabled := False;
   End
   Else
   Begin
      EditEntregador.Enabled := true;
      EditEntregador.SetFocus;
   End;
end;

procedure TFrmRelEntregas.EditMarcaKeyPress(Sender: TObject; var Key: Char);
begin

   If Not(Key in ['0' .. '9', #8, #13, #46, #37, #38, #39, #40]) Then
   Begin
      Key := #0;
      BeepCritica;
      Erro('Esse campo � somente numerico' + #13 + #10 +
        'Tecle F8 para pesquisar as marcas cadastradas');
   End;
end;

procedure TFrmRelEntregas.DCodClienteKeyPress(Sender: TObject; var Key: Char);
begin
   If Not(Key in ['0' .. '9', #8, #13, #46, #37, #38, #39, #40]) Then
   Begin
      Key := #0;
      BeepCritica;
      Erro('Esse campo � somente numerico' + #13 + #10 +
        'Tecle F8 para pesquisar os clientes');
   End;
end;

procedure TFrmRelEntregas.DCodRepresKeyPress(Sender: TObject; var Key: Char);
begin
   If Not(Key in ['0' .. '9', #8, #13, #46, #37, #38, #39, #40]) Then
   Begin
      Key := #0;
      BeepCritica;
      Erro('Esse campo � somente numerico' + #13 + #10 +
        'Tecle F8 para pesquisar os representantes');
   End;

end;

procedure TFrmRelEntregas.RadioGClick(Sender: TObject);
begin

   If RadioG.ItemIndex = 0 then
   begin
      TRadioGroup(RdPedidos.Controls[3]).Enabled := true;
   end;

   If (RadioG.ItemIndex = 1) then
   Begin
      TRadioGroup(RdPedidos.Controls[3]).Enabled := False;
   End;

   If (RadioG.ItemIndex = 2) then
   Begin
      TRadioGroup(RdPedidos.Controls[3]).Enabled := False;
   End;

end;

end.
