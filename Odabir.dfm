object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'SKLADISTE/Odabir_skladista'
  ClientHeight = 446
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    614
    446)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 614
    Height = 33
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = 'ODABIR OPCIJA ZA RAD U SKLADISTU'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 239
  end
  object Button1: TButton
    Left = 611
    Top = 182
    Width = 145
    Height = 57
    Anchors = []
    Caption = 'Skladiste materijala'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 611
    Top = 122
    Width = 145
    Height = 57
    Anchors = []
    Caption = 'Skladiste proizvoda'
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 262
    Top = 367
    Width = 75
    Height = 25
    Anchors = []
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 192
    Top = 87
    Width = 214
    Height = 38
    Anchors = []
    Caption = 'Pregled po magacinima'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 192
    Top = 139
    Width = 214
    Height = 40
    Anchors = []
    Caption = 'Pregled proizvoda'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 192
    Top = 198
    Width = 214
    Height = 38
    Anchors = []
    Caption = 'Unos novog proizvoda'
    TabOrder = 5
    OnClick = Button6Click
  end
end
