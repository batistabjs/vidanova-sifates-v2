{***********************************************************************************
**  SISTEMA...............: Vida Nova Gest�o de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **
***********************************************************************************}

unit FAtivarSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Classe.Global,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, FFrameBarra, Vcl.ExtCtrls, App.Licenca, Vcl.Buttons;

type
   TFrmAtivarSistema = class(TForm)
      Panel1: TPanel;
      BtnAtivar: TBitBtn;
      BtnSair: TBitBtn;
      Panel2: TPanel;
      FrmFrameBarra1: TFrmFrameBarra;
      Panel3: TPanel;
      db_AtivacaoLocal: TFDQuery;
      DS_AtivacaoLocal: TDataSource;
    EditChave: TLabeledEdit;
      procedure BtnAtivarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
   private
    procedure MsgChaveInvalida;
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmAtivarSistema: TFrmAtivarSistema;

implementation

uses FPrincipal, Biblioteca, MD5, Global, App.Funcoes, App.Constantes,
  SQLServer;

{$R *.dfm}

procedure TFrmAtivarSistema.BtnAtivarClick(Sender: TObject);
Var
  mChave : String;
  aDBQuery : TFDQuery;
  mData : TDate;
  nDias : Integer;
begin
  ModalResult := mrNone;
  mChave := Trim(EditChave.Text);
  if mChave.IsEmpty then
  begin
    Atencao('Informe uma chave v�lida.');
    EditChave.SetFocus;
    Exit;
  end;

  if VerificarChave(mChave, mData, nDias) = False then
  begin
    MsgChaveInvalida();
    EditChave.SetFocus;
    Exit;
  end;
  InserirLicenca(mChave);
  //---------------------------------------------------------------------
  // Checagem novamente, ultima vez.
  //---------------------------------------------------------------------
  if GetTempoLicenca()>0 then
  begin
    ModalResult := mrOk;
  end
  else
  begin
    MsgChaveInvalida();
    EditChave.SetFocus;
    Exit;
  end;
end;

procedure TFrmAtivarSistema.MsgChaveInvalida;
begin
  Atencao('Chave informada � inv�lida.');
end;

procedure TFrmAtivarSistema.BtnSairClick(Sender: TObject);
begin
  FrmPrincipal.FDiasAtivar := 0;
end;

procedure TFrmAtivarSistema.FormCreate(Sender: TObject);
begin
  FrmPrincipal.FDiasAtivar := 0;
  ModalResult := mrNone;
end;

end.