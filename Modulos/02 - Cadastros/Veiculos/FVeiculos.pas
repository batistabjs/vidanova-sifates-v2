﻿{***********************************************************************************
**  SISTEMA...............: Vida Nova Gestão de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  Código pertencente ao cliente sob proteção autoral.                           ****  Não comercializável sem prévia autorização do mesmo.                          **
***********************************************************************************}

Unit FVeiculos;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, ExtCtrls, StdCtrls, Menus, Mask, DBCtrls, DB, 
   ISFEdit, ISFEditbtn,
   ISFdbEditbtn, IDBEdit, uEstSearchDialogZeos, FFrameBotoes, frxClass,
   frxDBSet,
   FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet;

type
   TFrmVeiculos = class(TForm)
      GroupBox1: TGroupBox;
      Label5: TLabel;
      ds_Veiculos: TDataSource;
      db_Veiculos: TFDQuery;
      Label3: TLabel;
      DBEdit1: TDBEdit;
      Label6: TLabel;
      DBEdit5: TDBEdit;
      Label7: TLabel;
      DBEdit6: TDBEdit;
      DBEdit7: TDBEdit;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      DBEdit9: TDBEdit;
      Label11: TLabel;
      Label12: TLabel;
      Label13: TLabel;
      DBEdit10: TDBEdit;
      DBEdit11: TDBEdit;
      Label14: TLabel;
      DBEdit12: TDBEdit;
      DBEdit13: TDBEdit;
      Label15: TLabel;
      DBEdit14: TDBEdit;
      Label16: TLabel;
      DBEdit15: TDBEdit;
      Label17: TLabel;
      DBEdit16: TDBEdit;
      Label18: TLabel;
      Label19: TLabel;
      DBEdit17: TDBEdit;
      Label20: TLabel;
      Label21: TLabel;
      db_VeiculosCODIGO: TIntegerField;
      db_VeiculosDATA: TSQLTimeStampField;
      db_VeiculosNOME: TStringField;
      db_VeiculosMODELO: TStringField;
      db_VeiculosPLACA: TStringField;
      db_VeiculosCOR: TStringField;
      db_VeiculosCHASSI: TStringField;
      db_VeiculosNRO_MOTOR: TStringField;
      db_VeiculosTIPO: TStringField;
      db_VeiculosCOMBUSTIVEL: TStringField;
      db_VeiculosANO_FAB1: TIntegerField;
      db_VeiculosANO_FAB2: TIntegerField;
      db_VeiculosRENAVAN: TStringField;
      db_VeiculosVCTO_EXTINTOR: TSQLTimeStampField;
      db_VeiculosVCTO_SEGURO: TSQLTimeStampField;
      db_VeiculosVCTO_IPVA: TSQLTimeStampField;
      db_VeiculosESPECIE: TStringField;
      db_VeiculosFIPE: TStringField;
      Label22: TLabel;
      GroupBox2: TGroupBox;
      DBMemo1: TDBMemo;
      db_VeiculosOBSERVACAO: TStringField;
      IDBEditDialog1: TIDBEditDialog;
      EditNomeCliente: TEdit;
      EditCliente: TIDBEditDialog;
      Edit1: TEdit;
      FrmFrameBotoes1: TFrmFrameBotoes;
      DBComboBox3: TDBComboBox;
      DBComboBox2: TDBComboBox;
      DBComboBox1: TDBComboBox;
      DBEdit8: TDBEdit;
      DBEdit18: TDBEdit;
      DBEdit2: TDBEdit;
      Label1: TLabel;
      DBEdit3: TDBEdit;
      Label2: TLabel;
      DBEdit4: TDBEdit;
      Label4: TLabel;
      DBEdit19: TDBEdit;
      Label23: TLabel;
      db_VeiculosPLACA_CIDADE: TStringField;
      db_VeiculosPLACA_UF: TStringField;
      db_VeiculosFOTO_PATH: TStringField;
      DBEdit20: TDBEdit;
      Label24: TLabel;
      DBEdit21: TDBEdit;
      Label25: TLabel;
      DBEdit22: TDBEdit;
      Label26: TLabel;
      frxDBDataset1: TfrxDBDataset;
      frxReport1: TfrxReport;
      db_VeiculosCLIENTE: TIntegerField;
      db_VeiculosFABRICANTE: TIntegerField;
      db_VeiculosKM: TIntegerField;
      db_VeiculosCILINDRO: TIntegerField;
      db_VeiculosCILINDRADAS: TIntegerField;
      db_VeiculosNRO_REDUTOR: TIntegerField;
      db_VeiculosNRO_CILINDROGNV: TIntegerField;
      db_VeiculosEIXOS: TIntegerField;
      db_VeiculosPNEUS: TIntegerField;
      DBEdit23: TDBEdit;
      Label27: TLabel;
      db_VeiculosFROTA: TStringField;
      procedure FormCreate(Sender: TObject);
      procedure Btn_SairClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbEditarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
      procedure FrmFrameBotoes1SpbSairClick(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmVeiculos: TFrmVeiculos;

implementation

uses FPrincipal, SQLServer, Biblioteca, Global, Classe.Usuarios;

{$R *.DFM}

procedure TFrmVeiculos.FormCreate(Sender: TObject);
begin

   FrmFrameBotoes1.DataSource := ds_Veiculos;
   db_Veiculos.open;

end;

procedure TFrmVeiculos.Btn_SairClick(Sender: TObject);
begin
   close;
end;

procedure TFrmVeiculos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   db_Veiculos.close;

   Action := Cafree;
end;

procedure TFrmVeiculos.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
   Key := AnsiUpperCase(Key)[1];

end;

procedure TFrmVeiculos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

   If Key = VK_ESCAPE Then
      close;

end;

procedure TFrmVeiculos.FrmFrameBotoes1SpbAdicionarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbAdicionarClick(Sender);
   EditCliente.SetFocus;

end;

procedure TFrmVeiculos.FrmFrameBotoes1SpbCancelarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbCancelarClick(Sender);

end;

procedure TFrmVeiculos.FrmFrameBotoes1SpbEditarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbEditarClick(Sender);

end;

procedure TFrmVeiculos.FrmFrameBotoes1SpbExcluirClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbExcluirClick(Sender);

end;

procedure TFrmVeiculos.FrmFrameBotoes1SpbSairClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbSairClick(Sender);

end;

procedure TFrmVeiculos.FrmFrameBotoes1SpbSalvarClick(Sender: TObject);
begin
   FrmFrameBotoes1.SpbSalvarClick(Sender);

end;

end.
