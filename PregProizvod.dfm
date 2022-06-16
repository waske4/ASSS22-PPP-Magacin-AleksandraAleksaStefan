object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'SKLADISTE/Odabir_skladista/Pregled_proizvoda_po_karakteristikama'
  ClientHeight = 537
  ClientWidth = 984
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
    984
    537)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 984
    Height = 33
    Align = alTop
    Alignment = taCenter
    Caption = 'Pregled proizvoda po karakteristikama'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 452
  end
  object Button2: TButton
    Left = 461
    Top = 495
    Width = 83
    Height = 34
    Anchors = []
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 8
    Top = 484
    Width = 75
    Height = 25
    Anchors = []
    Caption = 'Nazad'
    TabOrder = 1
    OnClick = Button1Click
  end
  object StringGrid2: TStringGrid
    Left = 8
    Top = 254
    Width = 961
    Height = 153
    Anchors = []
    ColCount = 1
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 136
    Width = 161
    Height = 21
    Anchors = []
    TabOrder = 3
    TextHint = 'Pretraga po nazivu'
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 200
    Top = 136
    Width = 161
    Height = 21
    Anchors = []
    TabOrder = 4
    TextHint = 'Pretraga po dimenzijama'
    OnChange = ComboBox2Change
  end
  object ComboBox3: TComboBox
    Left = 383
    Top = 136
    Width = 161
    Height = 21
    Anchors = []
    TabOrder = 5
    TextHint = 'Pretraga po kategoriji'
    OnChange = ComboBox3Change
  end
  object ComboBox4: TComboBox
    Left = 567
    Top = 136
    Width = 161
    Height = 21
    Anchors = []
    TabOrder = 6
    TextHint = 'Pretraga po materijalu izrade'
    OnChange = ComboBox4Change
  end
  object Button3: TButton
    Left = 776
    Top = 56
    Width = 153
    Height = 42
    Anchors = []
    Caption = 'Pregled po magacinima'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 776
    Top = 126
    Width = 153
    Height = 41
    Anchors = []
    Caption = 'Unos novog proizvoda'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 814
    Top = 430
    Width = 97
    Height = 25
    Caption = 'Izbrisi proizvod'
    Enabled = False
    TabOrder = 9
    OnClick = Button5Click
  end
  object ComboBox5: TComboBox
    Left = 679
    Top = 432
    Width = 107
    Height = 21
    TabOrder = 10
    TextHint = 'Naziv proizvoda'
    OnChange = ComboBox5Change
  end
  object Edit1: TEdit
    Left = 679
    Top = 465
    Width = 107
    Height = 21
    TabOrder = 11
    TextHint = 'Unesi indeks'
    OnChange = Edit1Change
  end
  object Button6: TButton
    Left = 814
    Top = 461
    Width = 97
    Height = 25
    Caption = 'Izbaci materijal'
    Enabled = False
    TabOrder = 12
    OnClick = Button6Click
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = DataModule6.queryPoNazivu
    ScopeMappings = <>
    Left = 560
    Top = 320
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid2
      Columns = <>
    end
  end
end
