object Form9: TForm9
  Left = 0
  Top = 0
  Anchors = []
  Caption = 'SKLADISTE/Odabir_skladista/Unos_novog_proizvoda'
  ClientHeight = 466
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    535
    466)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 535
    Height = 33
    Align = alTop
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Unos proizvoda i postavljanje materijala'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 474
  end
  object Button2: TButton
    Left = 218
    Top = 352
    Width = 97
    Height = 34
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Close'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = Button2Click
    ExplicitWidth = 100
  end
  object Button1: TButton
    Left = 8
    Top = 425
    Width = 89
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Nazad'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Button1Click
    ExplicitWidth = 92
  end
  object Button3: TButton
    Left = 47
    Top = 277
    Width = 129
    Height = 57
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Pregled po magacinima'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button3Click
    ExplicitWidth = 132
  end
  object Button4: TButton
    Left = 201
    Top = 277
    Width = 132
    Height = 57
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Pregled proizvoda'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button4Click
    ExplicitWidth = 135
  end
  object Edit1: TEdit
    Left = 100
    Top = 79
    Width = 118
    Height = 21
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    TextHint = 'Naziv'
    ExplicitWidth = 121
  end
  object Edit2: TEdit
    Left = 100
    Top = 106
    Width = 118
    Height = 21
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    TextHint = 'Dimenzija'
    ExplicitWidth = 121
  end
  object ComboBox1: TComboBox
    Left = 100
    Top = 133
    Width = 118
    Height = 21
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 6
    TextHint = 'Kategorija'
    ExplicitWidth = 121
  end
  object ComboBox2: TComboBox
    Left = 311
    Top = 106
    Width = 134
    Height = 21
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 7
    TextHint = 'Materijal'
    ExplicitWidth = 137
  end
  object Button5: TButton
    Left = 100
    Top = 167
    Width = 118
    Height = 27
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Unos proizvoda'
    TabOrder = 8
    OnClick = Button5Click
    ExplicitWidth = 121
  end
  object Button6: TButton
    Left = 352
    Top = 277
    Width = 134
    Height = 57
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Rasporedjivanje'
    TabOrder = 9
    OnClick = Button6Click
    ExplicitWidth = 137
  end
  object ComboBox3: TComboBox
    Left = 311
    Top = 79
    Width = 134
    Height = 21
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 10
    TextHint = 'Proizvod'
    ExplicitWidth = 137
  end
  object Button7: TButton
    Left = 311
    Top = 167
    Width = 134
    Height = 27
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Dodaj materijal proizvodu'
    TabOrder = 11
    OnClick = Button7Click
    ExplicitWidth = 137
  end
end
