object Form8: TForm8
  Left = 0
  Top = 21
  Anchors = []
  Caption = 'SKLADISTE/Odabir_skladista/Unos_novog_proizvoda/Rasporedjivanje'
  ClientHeight = 511
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    520
    511)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 272
    Top = 104
    Width = 88
    Height = 13
    Anchors = []
    Caption = 'Mesto skladistenja'
    ParentShowHint = False
    ShowHint = True
  end
  object Label2: TLabel
    Left = 68
    Top = 104
    Width = 41
    Height = 13
    Anchors = []
    Caption = 'Proizvod'
    ParentShowHint = False
    ShowHint = True
  end
  object Label3: TLabel
    Left = 0
    Top = 0
    Width = 520
    Height = 33
    Align = alTop
    Alignment = taCenter
    Anchors = []
    Caption = 'RASPOREDJIVANJE PROIZVODA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 382
  end
  object Button2: TButton
    Left = 204
    Top = 431
    Width = 104
    Height = 34
    Anchors = []
    Caption = 'Close'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 19
    Top = 475
    Width = 96
    Height = 25
    Anchors = []
    Caption = 'Nazad'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 72
    Top = 355
    Width = 165
    Height = 57
    Anchors = []
    Caption = 'Pregled po magacinima'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 273
    Top = 355
    Width = 166
    Height = 57
    Anchors = []
    Caption = 'Pregled proizvoda'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button4Click
  end
  object Edit2: TEdit
    Left = 69
    Top = 149
    Width = 142
    Height = 21
    Anchors = []
    NumbersOnly = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    TextHint = 'Kolicina'
  end
  object Edit3: TEdit
    Left = 69
    Top = 176
    Width = 142
    Height = 21
    Anchors = []
    NumbersOnly = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    TextHint = 'Serijski broj'
  end
  object ComboBox3: TComboBox
    Left = 273
    Top = 122
    Width = 166
    Height = 21
    Anchors = []
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    TextHint = 'Magacin'
    OnChange = ComboBox3Change
  end
  object ComboBox4: TComboBox
    Left = 273
    Top = 149
    Width = 166
    Height = 21
    Anchors = []
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Text = 'Prostorija'
    OnChange = ComboBox4Change
  end
  object ComboBox5: TComboBox
    Left = 273
    Top = 176
    Width = 166
    Height = 21
    Anchors = []
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = 'Polica'
    OnChange = ComboBox5Change
  end
  object ComboBox6: TComboBox
    Left = 273
    Top = 203
    Width = 166
    Height = 21
    Anchors = []
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    Text = 'Red'
    OnChange = ComboBox6Change
  end
  object ComboBox7: TComboBox
    Left = 273
    Top = 230
    Width = 166
    Height = 21
    Anchors = []
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    Text = 'Sekcija'
    OnChange = ComboBox7Change
  end
  object ComboBox1: TComboBox
    Left = 69
    Top = 122
    Width = 142
    Height = 21
    Anchors = []
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    TextHint = 'Naziv'
  end
  object Button5: TButton
    Left = 72
    Top = 295
    Width = 367
    Height = 25
    Anchors = []
    Caption = 'Rasporedjivanje'
    Enabled = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = Button5Click
  end
end
