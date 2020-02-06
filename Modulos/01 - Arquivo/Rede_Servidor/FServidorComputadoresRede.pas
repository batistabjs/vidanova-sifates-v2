﻿{***********************************************************************************
**  SISTEMA...............: Vida Nova Gestão de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  Código pertencente ao cliente sob proteção autoral.                           ****  Não comercializável sem prévia autorização do mesmo.                          **
***********************************************************************************}

unit FServidorComputadoresRede;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, ExtCtrls, Buttons, jpeg;

type
   PNetResourceArray = ^TNetResourceArray;
   TNetResourceArray = array [0 .. 100] of TNetResource;

   TFrmServidorComputadoresRede = class(TForm)
      Panel1: TPanel;
      Panel2: TPanel;
      ListBox1: TListBox;
      BtnLocalizar: TButton;
      BtnCapturar: TBitBtn;
      BtnClose: TBitBtn;
      Panel3: TPanel;

      procedure BtnLocalizarClick(Sender: TObject);

      function CreateNetResourceList(ResourceType: DWord;
        NetResource: PNetResource; out Entries: DWord;
        out List: PNetResourceArray): Boolean;

      procedure ScanNetworkResources(ResourceType, DisplayType: DWord;
        List: TStrings);
      procedure BtnCapturarClick(Sender: TObject);
      procedure BtnCloseClick(Sender: TObject);

   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmServidorComputadoresRede: TFrmServidorComputadoresRede;

implementation

uses Biblioteca, FServidorSistema;

{$R *.dfm}

procedure TFrmServidorComputadoresRede.BtnCloseClick(Sender: TObject);
begin
   close;
end;

procedure TFrmServidorComputadoresRede.BtnCapturarClick(Sender: TObject);
begin
   FrmServidorSistema.EditServidor.Text :=Trim(ListBox1.Items[ListBox1.ItemIndex]);
   close;
end;

procedure TFrmServidorComputadoresRede.BtnLocalizarClick(Sender: TObject);
begin
   ListBox1.Clear;
   ScanNetworkResources(RESOURCETYPE_DISK, RESOURCEDISPLAYTYPE_SERVER, ListBox1.Items);

   ListBox1.Items.Text := LowerCase(ListBox1.Items.Text);
   ListBox1.Items.Text := DeletaCaract(ListBox1.Items.Text, '\');

   if ListBox1.Items.Count > 0 then
   begin
      BtnCapturar.Enabled := True;
   end
   else
   begin
      BtnCapturar.Enabled := False;
   end;

end;

// -----------

procedure TFrmServidorComputadoresRede.ScanNetworkResources(ResourceType,
  DisplayType: DWord; List: TStrings);
   procedure ScanLevel(NetResource: PNetResource);
   var
      Entries: DWord;
      NetResourceList: PNetResourceArray;
      i: Integer;
   begin
      if CreateNetResourceList(ResourceType, NetResource, Entries,
        NetResourceList) then
         try
            for i := 0 to Integer(Entries) - 1 do
            begin
               if (DisplayType = RESOURCEDISPLAYTYPE_GENERIC) or
                 (NetResourceList[i].dwDisplayType = DisplayType) then
               begin
                  List.AddObject(NetResourceList[i].lpRemoteName, Pointer(NetResourceList[i].dwDisplayType));
               end;

               if (NetResourceList[i].dwUsage and RESOURCEUSAGE_CONTAINER) <> 0 then
                  ScanLevel(@NetResourceList[i]);
              Application.ProcessMessages;
            end;
         finally
            FreeMem(NetResourceList);
         end;
   end;

begin
   ScanLevel(Nil);
   Application.ProcessMessages;
end;


// -----------

function TFrmServidorComputadoresRede.CreateNetResourceList(ResourceType: DWord;
  NetResource: PNetResource; out Entries: DWord;
  out List: PNetResourceArray): Boolean;
var
   EnumHandle: THandle;
   BufSize: DWord;
   Res: DWord;
begin
   Result := False;
   List := Nil;
   Entries := 0;
   if WNetOpenEnum(RESOURCE_GLOBALNET, ResourceType, 0, NetResource, EnumHandle)
     = NO_ERROR then
   begin
      try
         BufSize := $4000; // 16 kByte
         GetMem(List, BufSize);
         try
            repeat
               Entries := DWord(-1);
               FillChar(List^, BufSize, 0);
               Res := WNetEnumResource(EnumHandle, Entries, List, BufSize);
               if Res = ERROR_MORE_DATA then
               begin
                  ReAllocMem(List, BufSize);
               end;
            until Res <> ERROR_MORE_DATA;
            Result := Res = NO_ERROR;
            if not Result then
            begin
               FreeMem(List);
               List := Nil;
               Entries := 0;
            end;
         except
            FreeMem(List);
            raise;
         end;
      finally
         WNetCloseEnum(EnumHandle);
      end;
   end;
end;

end.
