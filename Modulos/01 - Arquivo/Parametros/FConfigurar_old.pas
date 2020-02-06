{--------------------------------------------------------------------------------+
|  SISTEMA...............: IndPCP (E TAMBEM AUTOR DO VESTISPCP - DESCONTINUADO)  |
|  PORTE DE EMPRESA......: Destinado para Micro Empresas                         |
|  SEGMENTO..............: Com�rcio em geral e industrias (vestu�rio)            |  
|  LINGUAGEM/DB..........: Delphi 10.3 Rio   / Firebird 2.5                      | 
|--------------------------------------------------------------------------------|
|                                                                                |
|  AUTOR/PROGRAMADOR.....: Adriano Zanini (2019)                                 |
|  E-MAIL................: fontes@altaica.com.br                                 ||--------------------------------------------------------------------------------||  Voc� n�o pode comercializar o codigo-fonte. Nem mesmo parcialmente!           ||  Comercialize somente o sistema compilado (com o nome/interface que desejar).  |
+--------------------------------------------------------------------------------}

unit FConfigurar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtDlgs, FFrameBarra,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxDBEdit, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, ISFEdit, ISFEditbtn, ISFdbEditbtn, IDBEdit,
  uEstSearchDialogZeos, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls,
  Winapi.ShellApi,
  Classe.Global, ACBrBase, ACBrMail,
  ACBrPosPrinter,
  System.TypInfo, ACBrDFe, ACBrNFe;

type
   TFrmConfigurar = class(TForm)
      Panel4: TPanel;
      BtnCancelar: TBitBtn;
      BtnSalvar: TBitBtn;
      Panel2: TPanel;
      OpenPictureDialog1: TOpenPictureDialog;
      PgParametros: TPageControl;
      Tab_DadosEmpresa: TTabSheet;
      GroupBox1: TGroupBox;
      GroupBox7: TGroupBox;
      Label5: TLabel;
      Label8: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      Label11: TLabel;
      Label12: TLabel;
      Label19: TLabel;
      Label1: TLabel;
      Label33: TLabel;
      Label34: TLabel;
      Label48: TLabel;
      Label25: TLabel;
      EditRUA: TDBEdit;
      EditBAIRRO: TDBEdit;
      EditCEP: TDBEdit;
      EditCIDADE: TDBEdit;
      EditUF: TDBEdit;
      EditNUM_FONE: TDBEdit;
      EditULT_VISITA: TDBEdit;
      DBEdit1: TDBEdit;
      DBEdit21: TDBEdit;
      DBEdit22: TDBEdit;
      DBEdit27: TDBEdit;
      DBEdit12: TDBEdit;
      Tab_Financeiro: TTabSheet;
      GroupBox18: TGroupBox;
      Label28: TLabel;
      Label29: TLabel;
      Label30: TLabel;
      Label31: TLabel;
      Label32: TLabel;
      Label36: TLabel;
      Label37: TLabel;
      Label41: TLabel;
      DBEdit13: TDBEdit;
      DBEdit14: TDBEdit;
      DBEdit15: TDBEdit;
      DBEdit16: TDBEdit;
      DBEdit19: TDBEdit;
      Label4: TLabel;
      Label14: TLabel;
      DBEdit3: TDBEdit;
      Tab_Configurar: TTabSheet;
      GroupBox3: TGroupBox;
      db_Parametros: TFDQuery;
      DS_Parametros: TDataSource;
      DBCheckBox11: TDBCheckBox;
      DBEdit20: TDBEdit;
      Label44: TLabel;
      DBEdit23: TDBEdit;
      Label45: TLabel;
      Panel1: TPanel;
      IMGLogomarca: TImage;
      BtnLogoRelatorios: TSpeedButton;
      BtnLogomarca: TSpeedButton;
      Panel3: TPanel;
      IMGLogoRelatorios: TImage;
    tabvenda: TTabSheet;
      GroupBox6: TGroupBox;
      GroupBox2: TGroupBox;
      DBMemo1: TDBMemo;
      GroupBox5: TGroupBox;
      Label21: TLabel;
      Label22: TLabel;
      Label23: TLabel;
      GrpPreV: TGroupBox;
      GrpPreview: TLabel;
      DBRadioGroup9: TDBRadioGroup;
      FrmFrameBarra1: TFrmFrameBarra;
      DBRadioGroup1: TDBRadioGroup;
      GroupBox8: TGroupBox;
      Label17: TLabel;
      DBEdit2: TDBEdit;
      Label3: TLabel;
      Tab_Producao: TTabSheet;
      GroupBox12: TGroupBox;
      Label24: TLabel;
      DBLookupComboBox3: TDBLookupComboBox;
      DBComboBox1: TDBComboBox;
      Label27: TLabel;
      Label6: TLabel;
      DBEdit4: TDBEdit;
    TabNFe: TTabSheet;
      OpenDialog1: TOpenDialog;
      GroupBox14: TGroupBox;
      DBEdit39: TDBEdit;
      Label63: TLabel;
      DBEdit40: TDBEdit;
      Label64: TLabel;
    EditNCM: TDBEdit;
    Label65: TLabel;
    GroupBox15: TGroupBox;
    Label67: TLabel;
    DBEdit41: TDBEdit;
    GroupBox16: TGroupBox;
    GroupBox17: TGroupBox;
    DBEdit5: TDBEdit;
    EditNOME: TDBEdit;
    Label2: TLabel;
    Label15: TLabel;
    db_Estados: TFDQuery;
    ds_Estados: TDataSource;
    editComissaoNomeContaCaixa: TEdit;
    editComissaoNomeCentroCusto: TEdit;
    DCodPlano: TIDBEditDialog;
    EditNomePlanoContas: TEdit;
    EstSearchDialogZeos1: TIDBEditDialog;
    IDBEditDialog1: TIDBEditDialog;
    GroupBox20: TGroupBox;
    DBCheckBox8: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    IDBEditDialog3: TIDBEditDialog;
    Edit1: TEdit;
    Edit2: TEdit;
    IDBEditDialog4: TIDBEditDialog;
    GroupBox19: TGroupBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    IDBEditDialog2: TIDBEditDialog;
    ContaProcurar: TIDBEditDialog;
    EditNomeContaCaixa: TEdit;
    EditNomePlanoContasReceber: TEdit;
    GroupBox21: TGroupBox;
    Edit4: TEdit;
    DbEditCFOP: TIDBEditDialog;
    IDBEditDialog5: TIDBEditDialog;
    Edit3: TEdit;
    DBEdit33: TDBEdit;
    Label16: TLabel;
    grpCFOP: TGroupBox;
    IDBEditDialog6: TIDBEditDialog;
    Edit5: TEdit;
    IDBEditDialog7: TIDBEditDialog;
    Edit6: TEdit;
    Panel5: TPanel;
    DBRadioGroup12: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup11: TDBRadioGroup;
    DBRadioGroup15: TDBRadioGroup;
    Edit7: TEdit;
    IDBEditDialog8: TIDBEditDialog;
    DBRadioGroup16: TDBRadioGroup;
    tabVendedor: TTabSheet;
    GroupBox23: TGroupBox;
    DBRadioGroup13: TDBRadioGroup;
    GroupBox24: TGroupBox;
    EditCliente: TIDBEditDialog;
    EditNomeCliente: TEdit;
    EditVendedor1: TEdit;
    EditCodevendedor: TIDBEditDialog;
    GroupBox25: TGroupBox;
    Label70: TLabel;
    DBEdit42: TDBEdit;
    Label69: TLabel;
    Edit8: TEdit;
    IDBEditDialog9: TIDBEditDialog;
    Edit9: TEdit;
    IDBEditDialog10: TIDBEditDialog;
    Edit10: TEdit;
    IDBEditDialog11: TIDBEditDialog;
    Tab_Operacionais: TTabSheet;
    GroupBox10: TGroupBox;
    cxDBSpinEdit1: TcxDBSpinEdit;
    cxDBSpinEdit2: TcxDBSpinEdit;
    cxDBSpinEdit3: TcxDBSpinEdit;
    Label40: TLabel;
    DBEdit6: TDBEdit;
    DBRadioGroup20: TDBRadioGroup;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    EditPagamento: TIDBEditDialog;
    EditNomeFormaPagto: TEdit;
    DBRadioGroup21: TDBRadioGroup;
    OpenCertificado: TOpenDialog;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label26: TLabel;
    Label35: TLabel;
    Label39: TLabel;
    Label49: TLabel;
    Label47: TLabel;
    DBEdit11: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit24: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    DBEdit26: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit28: TDBEdit;
    Label50: TLabel;
    Panel6: TPanel;
    DBRadioGroup14: TDBRadioGroup;
    EditAliquota: TDBEdit;
    Label38: TLabel;
    Panel7: TPanel;
    Label7: TLabel;
    Label18: TLabel;
    Label58: TLabel;
    Label62: TLabel;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    TabSheet3: TTabSheet;
    GroupBox9: TGroupBox;
    IDBEditDialog12: TIDBEditDialog;
    Edit11: TEdit;
    GroupBox11: TGroupBox;
    Panel9: TPanel;
    Label54: TLabel;
    Label55: TLabel;
    DBEdit32: TDBEdit;
    DBEdit34: TDBEdit;
    Label51: TLabel;
    DBEdit30: TDBEdit;
    Label52: TLabel;
    cbxModelo: TDBComboBox;
    GroupBox22: TGroupBox;
    Label53: TLabel;
    Label56: TLabel;
    DBEdit29: TDBEdit;
    DBEdit31: TDBEdit;
    Panel8: TPanel;
    grpCertificado: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label46: TLabel;
    DBEdit8: TDBEdit;
    btnCarregarCertficado: TButton;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Button1: TButton;
    rgbTipoSSL: TDBRadioGroup;
    ACBrNFe1: TACBrNFe;
    DBCheckBox9: TDBCheckBox;
    DBRadioGroup3: TDBRadioGroup;
      procedure ButtonGroup1Items3Click(Sender: TObject);
      procedure ButtonGroup1Items1Click(Sender: TObject);
      procedure ButtonGroup1Items0Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure EditJornSTKeyPress(Sender: TObject; var Key: Char);
      procedure Btn_SalvarClick(Sender: TObject);
      procedure BtnCancelarClick(Sender: TObject);
      procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure BtnLogomarcaClick(Sender: TObject);
      procedure BtnLogoRelatoriosClick(Sender: TObject);
      procedure IMGLogomarcaDblClick(Sender: TObject);
      procedure IMGLogoRelatoriosDblClick(Sender: TObject);
      procedure db_Parametros_cdsBeforePost(DataSet: TDataSet);
      procedure FormShow(Sender: TObject);
      procedure DBComboBox1ContextPopup(Sender: TObject; MousePos: TPoint;
        var Handled: Boolean);
      procedure db_ParametrosNewRecord(DataSet: TDataSet);
      procedure db_ParametrosAfterScroll(DataSet: TDataSet);
      procedure db_ParametrosPostError(DataSet: TDataSet; E: EDatabaseError;
        var Action: TDataAction);
    procedure db_ParametrosAfterPost(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure cxDBSpinEdit1Click(Sender: TObject);
    procedure btnCarregarCertficadoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

   private
      { Private declarations }
      FTipoDANFE : String;
      Procedure MontarMascara;
   public
      { Public declarations }
   end;

var
   FrmConfigurar: TFrmConfigurar;

implementation

uses Biblioteca, FBaseDados, Global,
   Clientes, FPrincipal, MovProdutos,
   Biblioteca_pcp, FBaseDados_PCP, SQLServer,
  FControleCaixa, FControleBancario, App.Funcoes;

{$R *.DFM}

procedure TFrmConfigurar.FormCreate(Sender: TObject);
begin
  PgParametros.ActivePageIndex := 0;
  BtnLogomarca.Caption := 'Definir Logotipo' + #13 + #10 +'Papel de parede do Sistema';
  BtnLogoRelatorios.Caption := 'Logotipo NF-e' + #13 + #10 +'(Nota Fiscal Eletr�nica)';
end;

procedure TFrmConfigurar.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   db_Estados.Close;
   db_Parametros.close;
   BaseDados.db_Parametros.close;
   BaseDados.db_Parametros.open;

end;

procedure TFrmConfigurar.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

   If (db_Estados.state in [dsedit, dsinsert]) then
   Begin
      db_Estados.Post;
   End;

end;

procedure TFrmConfigurar.db_ParametrosNewRecord(DataSet: TDataSet);
begin

   db_Parametros.FieldByName('ESTOQUENEGATIVO').AsString := 'S';
   db_Parametros.FieldByName('PED_BAIXAESTOQUE').AsString := 'N';
   db_Parametros.FieldByName('IDPAIS').AsInteger := 1058;
   db_Parametros.FieldByName('NOMEPAIS').AsString := 'BRASIL';

end;

procedure TFrmConfigurar.db_ParametrosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   raise Exception.Create(E.Message);

end;

procedure TFrmConfigurar.EditJornSTKeyPress(Sender: TObject; var Key: Char);
begin
   If Not(Key in ['0' .. '9', #8, #13, #46, #37, #38, #39, #40]) Then
      Key := #0;
End;

procedure TFrmConfigurar.Btn_SalvarClick(Sender: TObject);
Begin
   If (db_Parametros.state in [dsEdit, dsInsert]) then
   Begin
      db_Parametros.Post;
      db_Parametros.ParamByName('EMPRESA').AsInteger:=db_Parametros.FieldByName('EMPRESA').AsInteger;
      GetParametros; // Atualizar os dados da classe "TParametros";
   End;

   FrmPrincipal.db_empresa.close;
   FrmPrincipal.db_empresa.Open;
   SetParametrosAtualizaDados;
   BaseDados.SetCertificados();

   if FTipoDANFE <> db_Parametros.FieldByName('DANFEREPORT').AsString then
   begin
     AvisoSistema('O Sistema ser� fechado.' +
                  sLineBreak+
                  sLineBreak+
                  'Execute-o novamente, para carregar as configura��es adequadas.');
    TerminarAplicacao();
   end;
   Close;
End;

procedure TFrmConfigurar.Button1Click(Sender: TObject);
var
  mSerie : String;
  mTipoSSL : String;
begin
  mTipoSSL := db_Parametros.FieldByName('SSL_TIPO').AsString;
  if mTipoSSL='OPENSSL' then
  begin
    Informar('[Tipo de SSL] Para ler n�mero de s�rie de certificado digital, utilize WinCrypt ou Capicom.');
    exit;
  end;

  SetCertificadoDigital(ACBrNFe1,mTipoSSL);
  mSerie := ACBrNFe1.SSL.SelecionarCertificado;

  if mSerie.IsEmpty then
    exit;
  if not(db_Parametros.state in [dsEdit, dsInsert]) then
    db_Parametros.Edit;
  db_Parametros.FieldByName('NFE_CERTIFICADO_NUMSERIE').AsString :=  mSerie;
end;

procedure TFrmConfigurar.ButtonGroup1Items0Click(Sender: TObject);
begin
   PgParametros.ActivePage := Tab_DadosEmpresa;
end;

procedure TFrmConfigurar.ButtonGroup1Items1Click(Sender: TObject);
begin
   PgParametros.ActivePage := Tab_Configurar;

end;

procedure TFrmConfigurar.ButtonGroup1Items3Click(Sender: TObject);
begin
   PgParametros.ActivePage := Tab_Financeiro;
end;

procedure TFrmConfigurar.cxDBSpinEdit1Click(Sender: TObject);
begin
   MontarMascara;
end;

procedure TFrmConfigurar.BtnCancelarClick(Sender: TObject);
begin
  db_Parametros.Cancel;
  close;
end;

procedure TFrmConfigurar.DBComboBox1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
   MontarMascara;
end;

procedure TFrmConfigurar.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
   If Not(Key in ['0' .. '9', #8, #13, #46, #37, #38, #39, #40]) Then
      Key := #0;

end;

procedure TFrmConfigurar.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=VK_HOME  then
   begin
     If pergunta('Acessar site do IBGE para Consulta de Munic�pio?')=false Then
        exit;
     strURL := 'http://www.ibge.gov.br/home/geociencias/areaterritorial/area.shtm';
     ShellExecute(0, nil, pchar(strURL), nil, nil, SW_SHOW);
   end;
end;

procedure TFrmConfigurar.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
   Key := AnsiUpperCase(Key)[1];
end;

procedure TFrmConfigurar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If Key = VK_ESCAPE then
      BtnCancelarClick(Sender);
end;

procedure TFrmConfigurar.FormShow(Sender: TObject);
begin
  db_Parametros.Close;
  db_Parametros.ParamByName('EMPRESA').Clear;
  db_Parametros.ParamByName('EMPRESA').AsInteger := FSistema.Empresa;
  db_Parametros.Open;
  db_Estados.Open;
  FTipoDANFE := db_Parametros.FieldByName('DANFEREPORT').AsString;
  MontarMascara;

end;

procedure TFrmConfigurar.IMGLogomarcaDblClick(Sender: TObject);
begin

   If not(db_Parametros.state in [dsEdit, dsInsert]) then
      db_Parametros.Edit;

   db_Parametros.FieldByName('INF_IMGPRINCIPAL').AsString := '';

   If (db_Parametros.state in [dsEdit, dsInsert]) then
   Begin
      db_Parametros.Post;
   End;

   IMGLogomarca.Picture.LoadFromFile
     (db_Parametros.FieldByName('INF_IMGPRINCIPAL').AsString);

end;

procedure TFrmConfigurar.IMGLogoRelatoriosDblClick(Sender: TObject);
begin

   If not(db_Parametros.state in [dsEdit, dsInsert]) then
      db_Parametros.Edit;

   db_Parametros.FieldByName('INF_IMGIMPRIMIR').AsString := '';
   IMGLogoRelatorios.Picture.LoadFromFile
     (db_Parametros.FieldByName('INF_IMGIMPRIMIR').AsString);

   If (db_Parametros.state in [dsEdit, dsInsert]) then
   Begin
      db_Parametros.Post;
   End;

end;

procedure TFrmConfigurar.MontarMascara;
begin

   If (db_Parametros.state in [dsEdit, dsInsert]) then
   Begin
      db_Parametros.Post;
   End;
   db_Parametros.Refresh;

   GrpPreview.Caption := MontarCodigoProduto('X', 'X', 'X');

   Update;

end;

procedure TFrmConfigurar.btnCarregarCertficadoClick(Sender: TObject);
begin
  if not OpenCertificado.Execute then
    exit;
  if not(db_Parametros.state in [dsEdit, dsInsert]) then
    db_Parametros.Edit;
  db_Parametros.FieldByName('NFE_CERTIFICADO_LOCAL').AsString :=  OpenCertificado.FileName;
end;

procedure TFrmConfigurar.BtnLogomarcaClick(Sender: TObject);
begin

   If OpenPictureDialog1.Execute then
   begin

      If not(db_Parametros.state in [dsEdit]) then
         db_Parametros.Edit;

      db_Parametros.FieldByName('INF_IMGPRINCIPAL').AsString :=
        OpenPictureDialog1.FileName;

      If (db_Parametros.state in [dsEdit, dsInsert]) then
      Begin
         db_Parametros.Post;
      End;

      db_Parametros.close;
      db_Parametros.open;

   End;

end;

procedure TFrmConfigurar.BtnLogoRelatoriosClick(Sender: TObject);
begin

   If OpenPictureDialog1.Execute then
   begin
      If not(db_Parametros.state in [dsEdit]) then
         db_Parametros.Edit;

      db_Parametros.FieldByName('INF_IMGIMPRIMIR').AsString :=
        OpenPictureDialog1.FileName;

      If (db_Parametros.state in [dsEdit, dsInsert]) then
      Begin
         db_Parametros.Post;
      End;

      db_Parametros.close;
      db_Parametros.open;

   end;

end;

procedure TFrmConfigurar.db_ParametrosAfterPost(DataSet: TDataSet);
begin
  db_Parametros.ParamByName('EMPRESA').AsInteger:=db_Parametros.FieldByName('EMPRESA').AsInteger;
end;

procedure TFrmConfigurar.db_ParametrosAfterScroll(DataSet: TDataSet);
begin

//   SpnDigitosGrupo.Value := db_Parametros.FieldByName('GRUPO').AsInteger;
//   SpnDigitosSubGrupo.Value := db_Parametros.FieldByName('SUBGRUPO').AsInteger;
//   SpnDigitosProduto.Value := db_Parametros.FieldByName('PRODUTO').AsInteger;

   GrpPreview.Caption := MontarCodigoProduto('X', 'X', 'X');

   if FileExists(db_Parametros.FieldByName('INF_IMGPRINCIPAL').AsString) then
     IMGLogomarca.Picture.LoadFromFile(db_Parametros.FieldByName('INF_IMGPRINCIPAL').AsString);

   if FileExists(db_Parametros.FieldByName('INF_IMGIMPRIMIR').AsString) then
     IMGLogoRelatorios.Picture.LoadFromFile(db_Parametros.FieldByName('INF_IMGIMPRIMIR').AsString);

end;

procedure TFrmConfigurar.db_Parametros_cdsBeforePost(DataSet: TDataSet);
begin

   db_Parametros.FieldByName('EMPRESA').AsInteger := FSistema.Empresa;

   if (db_Parametros.FieldByName('ESTOQUENEGATIVO').AsString = 'N') or
     (db_Parametros.FieldByName('ESTOQUENEGATIVO').IsNull) Then
   begin
      BeepCritica;
      FormMensagem('Voc� est� permitindo venda sem estoque. Cuidado!' + #13 +
        #10 + #13 + #10 + 'Verifique na guia "Estoque"');
   end;

end;

end.
