﻿{***********************************************************************************
**  SISTEMA...............: Vida Nova Gestão de Vendas 2019                       **
**  PARA EMPRESAS.........: Micro e Pequena Empresa                               **
**  LINGUAGEM/DB..........: Delphi 10.3 Rio / Firebird 2.5                        **
** ------------------------------------------------------------------------------ **
**                                                                                **
**  AUTOR/PROGRAMADOR.....: Bruno Batista                                         **
**  E-MAIL................: batista.bjs@gmail.com                                 **
***********************************************************************************}

unit App.Funcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,   FireDAC.Comp.Client,
  System.StrUtils, Vcl.Grids, Vcl.DBGrids, System.Generics.Collections, Data.DB,
  Vcl.DBCtrls, System.Math, System.JSON, pcnConversaoNFe, pcnConversao, pcnNFe,
  ACBrValidador, ACBrUtil, ACBrDFeSSL, System.DateUtils, ACBrNFe, ACBrMail;

  procedure ObjetosHabilitar(const aObjetos : TArray<TWinControl>;aCondicao : Boolean);
  procedure EnviarEmailNF(aVenda : Integer; ACBrNFe1: TACBrNFe; aManual : Boolean=False);
  Procedure SetCertificadoDigital(aACBrNFe: TACBrNFe; const aTipoSSL: String);

implementation

uses SQLServer, Biblioteca, Classe.Global, App.Constantes;

Procedure ObjetosHabilitar(const aObjetos : TArray<TWinControl>;aCondicao : Boolean);
var
  I: Integer;
begin
  for I := Low(aObjetos) to High(aObjetos) do
    aObjetos[i].Enabled :=aCondicao;
end;

procedure EnviarEmailNF(aVenda : Integer; ACBrNFe1: TACBrNFe; aManual : Boolean=False);
var
 mDQuery       : TFDQuery;
 CC            : TStrings;
 mMSG          : TStrings;
 mEmailPara    : string;
 mAssunto      : string;
 mArquivoXML   : String;
 mNotaFiscal   : String;
begin
  if (FParametros.NFE.EnviarEmail = False) and (aManual=False) then
     exit;   // se não for pra enviar email automaticamente, cancelar envio.
  if Trim(ACBrNFe1.MAIL.Host) = '' then
     exit;  // se não tiver servidor de saida, cancelar envio.

  QueryObjCriar(mDQuery);
  try
    mDQuery.Close;
    mDQuery.SQL.Clear;
    mDQuery.SQL.Add('SELECT * FROM VENDAS');
    mDQuery.SQL.Add('WHERE');
    mDQuery.SQL.Add('CODIGO='+aVenda.ToString);
    mDQuery.SQL.Add('');
    mDQuery.Open;
    mEmailPara  := GetClienteCampo(mDQuery.FieldByName('CLIENTE').AsInteger,'email');
    if mEmailPara.IsEmpty then
    begin
      Informar('Cliente não tem email cadastrado. '+sLineBreak+sLineBreak+'Não foi possivel enviar XML da NF-e por email.');
      exit; // se não tiver email, cancelar envio
    end;
    mNotaFiscal := ZeroEsquerda(mDQuery.FieldByName('NOTAFISCAL').AsString,6);
    mEmailPara  := GetClienteCampo(mDQuery.FieldByName('CLIENTE').AsInteger,'email');
    mAssunto    := 'Nota Fiscal: '+mNotaFiscal;

    mArquivoXML := Trim(mDQuery.FieldByName('NFE_ARQUIVO').AsString);
    if not FileExists(mArquivoXML) then
    begin
      Informar('Arquivo XML não foi gerado para enviar por e-mail.');
      exit;
    end;
    CC    := TstringList.Create;
    mMSG  := TstringList.Create;
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.NotasFiscais.LoadFromFile(mArquivoXML);
    mMSG.Text    := mAssunto;
    try
       prcStatusMessage('Enviando Nota Fiscal por email',
                        'Aguarde.... enviando XML da NF: "'+mNotaFiscal+ '" para o email: "'+mEmailPara+'"',
                        True);
       ACBrNFe1.NotasFiscais.Items[0].EnviarEmail( mEmailPara,
                                                    mAssunto,
                                                    mMSG,
                                                    True,  // Enviar PDF junto
                                                    CC,    // Lista com emails que serÃ£o enviado cÃ³pias - TStrings
                                                    nil); // Lista de anexos - TStrings
    finally
      prcStatusMessage('','',False);
      CC.Free;
      mMSG.Free;
    end;



  finally
    QueryObjLiberar(mDQuery);
  end;

end;

Procedure SetCertificadoDigital(aACBrNFe: TACBrNFe; const aTipoSSL: String);
begin
  //----------------------------------------------------------------------
  // Protocolo SSL
  //----------------------------------------------------------------------
  aACBrNFe.Configuracoes.Geral.SSLLib              := libNone;
  aACBrNFe.Configuracoes.Geral.SSLCryptLib         := cryNone;
  aACBrNFe.Configuracoes.Geral.SSLHttpLib          := httpNone;
  aACBrNFe.Configuracoes.Geral.SSLXmlSignLib       := xsNone;
  if aTipoSSL='OPENSSL' then
  begin
    aACBrNFe.Configuracoes.Geral.SSLLib              := libOpenSSL;    // TSSLLib = (libNone, libOpenSSL, libCapicom, libCapicomDelphiSoap, libWinCrypt, libCustom);
    aACBrNFe.Configuracoes.Geral.SSLCryptLib         := cryOpenSSL;    // TSSLCryptLib = (cryNone, cryOpenSSL, cryCapicom, cryWinCrypt);
    aACBrNFe.Configuracoes.Geral.SSLHttpLib          := httpOpenSSL;   // TSSLHttpLib = (httpNone, httpWinINet, httpWinHttp, httpOpenSSL, httpIndy);
    aACBrNFe.Configuracoes.Geral.SSLXmlSignLib       := xsXmlSec;      // TSSLXmlSignLib = (xsNone, xsXmlSec, xsMsXml, xsMsXmlCapicom, xsLibXml2);
  end
  else if aTipoSSL='CAPICOM' then
  begin
    aACBrNFe.Configuracoes.Geral.SSLLib              := libCapicom;    // TSSLLib = (libNone, libOpenSSL, libCapicom, libCapicomDelphiSoap, libWinCrypt, libCustom);
    aACBrNFe.Configuracoes.Geral.SSLCryptLib         := cryCapicom;    // TSSLCryptLib = (cryNone, cryOpenSSL, cryCapicom, cryWinCrypt);
    aACBrNFe.Configuracoes.Geral.SSLHttpLib          := httpWinINet;   // TSSLHttpLib = (httpNone, httpWinINet, httpWinHttp, httpOpenSSL, httpIndy);
    aACBrNFe.Configuracoes.Geral.SSLXmlSignLib       := xsMsXmlCapicom;      // TSSLXmlSignLib = (xsNone, xsXmlSec, xsMsXml, xsMsXmlCapicom, xsLibXml2);
  end
  else if (aTipoSSL='WINCRYPT') or (aTipoSSL='') then
  begin
    aACBrNFe.Configuracoes.Geral.SSLLib              := libWinCrypt;    // TSSLLib = (libNone, libOpenSSL, libCapicom, libCapicomDelphiSoap, libWinCrypt, libCustom);
    aACBrNFe.Configuracoes.Geral.SSLCryptLib         := cryWinCrypt;    // TSSLCryptLib = (cryNone, cryOpenSSL, cryCapicom, cryWinCrypt);
    aACBrNFe.Configuracoes.Geral.SSLHttpLib          := httpWinHttp;   // TSSLHttpLib = (httpNone, httpWinINet, httpWinHttp, httpOpenSSL, httpIndy);
    aACBrNFe.Configuracoes.Geral.SSLXmlSignLib       := xsMsXml;      // TSSLXmlSignLib = (xsNone, xsXmlSec, xsMsXml, xsMsXmlCapicom, xsLibXml2);
  end;
end;

end.