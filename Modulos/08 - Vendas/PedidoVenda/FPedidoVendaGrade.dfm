object FrmPedidoVendaGrade: TFrmPedidoVendaGrade
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pedido: '
  ClientHeight = 521
  ClientWidth = 563
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 494
    Width = 563
    Height = 27
    Align = alBottom
    Caption = 'ESC - Gravar e Sair / F3 - Limpar tudo'
    TabOrder = 1
  end
  object pnPedido: TGroupBox
    Left = 0
    Top = 0
    Width = 563
    Height = 247
    Align = alTop
    Caption = 'Pedido de Venda'
    TabOrder = 0
    object GradePedidoVendas: TGradeProduto
      Left = 2
      Top = 15
      Width = 559
      Height = 230
      Produto.IDProduto = 0
      Connection = FrmPrincipal.DBConexao
      TabelaGrades = 'VIEW_GRADEREFERENCIA'
      TabelaUsar = tbPedido
      IDOP = 0
      IDConferencia = 0
      IDPedido = 0
      IDPedidoItens = 0
      IDEmpresa = 0
      AjustarLarguraForm = True
      AjustarAlturaForm = False
      TabOrder = 0
      Color = clWindow
      Align = alClient
      BorderStyle = bsSingle
    end
  end
  object pnEstoque: TGroupBox
    Left = 0
    Top = 247
    Width = 563
    Height = 247
    Align = alClient
    Caption = 'Em estoque'
    Enabled = False
    TabOrder = 2
    object GradeEstoque: TGradeProduto
      Left = 2
      Top = 15
      Width = 559
      Height = 230
      Produto.IDProduto = 0
      Connection = FrmPrincipal.DBConexao
      TabelaGrades = 'VIEW_GRADEREFERENCIA'
      TabelaUsar = tbProduto
      IDOP = 0
      IDConferencia = 0
      IDPedido = 0
      IDPedidoItens = 0
      IDEmpresa = 0
      AjustarLarguraForm = True
      AjustarAlturaForm = False
      TabOrder = 0
      Color = clWindow
      Align = alClient
      Enabled = False
      BorderStyle = bsSingle
    end
  end
end
