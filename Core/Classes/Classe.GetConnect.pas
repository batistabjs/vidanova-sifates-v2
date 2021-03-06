﻿{***********************************************************************************
**  SISTEMA...............: Vida Nova Gestão de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **** ------------------------------------------------------------------------------ ****  Código pertencente ao cliente sob proteção autoral.                           ****  Não comercializável sem prévia autorização do mesmo.                          **
***********************************************************************************}

unit Classe.GetConnect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.IniFiles, FireDAC.Comp.Client,
  App.Constantes,
  Classe.Criptografia;

  procedure GravarINIFB;
  procedure GravarINISQLITE;
  procedure GetConfigFB(aFDConnection: TFDConnection);
  procedure GetConfigSQLITE(aFDConnection: TFDConnection);


const
  _INI_FB      = Concat(_DRIVE,PASTA_SEPARADOR,_SISTEMA_NOME,PASTA_SEPARADOR,PASTA_BINARIO,PASTA_SEPARADOR,CONFIG_INI );
  _INI_SQLITE  = Concat(_DRIVE,PASTA_SEPARADOR,_SISTEMA_NOME,PASTA_SEPARADOR,PASTA_BINARIO,PASTA_SEPARADOR,CONFIG_SQLITE );

implementation

procedure GravarINISQLITE;
var
  FIniConfiguracao : TIniFile;
begin
   try
     FIniConfiguracao := TIniFile.create(_INI_SQLITE);
     FIniConfiguracao.WriteString('SQLITE',  'BancoDados', LowerCase(_DATABASE_NOME_SQLITE)    );
   finally
     FIniConfiguracao.Free;
   end;
end;

procedure GravarINIFB;
var
  FIniConfiguracao : TIniFile;
begin
   try
     FIniConfiguracao := TIniFile.create(_INI_FB);
     FIniConfiguracao.WriteString('PARAMETROS',  'Database', _DATABASE_NOME);
     FIniConfiguracao.WriteString('PARAMETROS',  'Server',   _DATABASE_SERVIDOR);
   finally
     FIniConfiguracao.Free;
   end;
end;

procedure GetConfigFB(aFDConnection: TFDConnection);
var
  mIniFile      : TIniFile;
  mServidor     : String;
  mBancoDados   : String;
  usuario       : String;
  mSenha        : String;
  mPorta        : Integer;
begin
   if (aFDConnection=nil) then
     raise Exception.Create('Objeto aFDConnection não instanciado.');
   try
     if not FileExists(_INI_FB) then
     begin
       GravarINIFB; // Força Criar um novo ".INI"
       sleep(1000); // esperar 1 segundo
     end;
     mIniFile := TIniFile.create(_INI_FB);
     mBancoDados   := Trim(mIniFile.ReadString('PARAMETROS',    'Database',      _DATABASE_NOME));
     mServidor     := Trim(mIniFile.ReadString('PARAMETROS',    'Server',        _DATABASE_SERVIDOR));
     mPorta        := mIniFile.ReadInteger('PARAMETROS',        'porta',         3050);
     usuario       := _DATABASE_USUARIO;
     mSenha        := _DATABASE_SENHA;
     aFDConnection.Params.Values['DriverID']  := _DATABASE_DRIVER;
     aFDConnection.Params.Values['Server']    := mServidor;
     aFDConnection.Params.Values['Database']  := mBancoDados;
     aFDConnection.Params.Values['User_Name'] := usuario;
     aFDConnection.Params.Values['Password']  := mSenha;
     aFDConnection.Params.Values['Port']      := '';
     if mPorta>0 then
       aFDConnection.Params.Values['Port']    := mPorta.ToString;
   finally
     mIniFile.Free;
   end;
end;

procedure GetConfigSQLITE(aFDConnection: TFDConnection);
var
  mIniFile      : TIniFile;
  mBancoDados   : String;
begin
   if (aFDConnection=nil) then
     raise Exception.Create('Objeto não aFDConnection instanciado.');
   try
     if not FileExists(_INI_SQLITE) then
     begin
       GravarINISQLITE; // Força Criar um novo ".INI"
       sleep(1000); // esperar 1 segundo
     end;
     mIniFile := TIniFile.create(_INI_SQLITE);
     mBancoDados   := Trim(mIniFile.ReadString('SQLITE',    'BancoDados',  _DATABASE_NOME_SQLITE));
     aFDConnection.Params.Values['DriverID']  := _DATABASE_DRIVERSQLITE;
     aFDConnection.Params.Values['Database']  := mBancoDados;
   finally
     mIniFile.Free;
   end;
end;

end.
