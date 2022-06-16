object Form6: TForm6
  Left = 0
  Top = 0
  Anchors = []
  Caption = 'SKLADISTE/Odabir_skladista/Pregled_po_magacinima'
  ClientHeight = 478
  ClientWidth = 1093
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
    1093
    478)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 1093
    Height = 33
    Align = alTop
    Alignment = taCenter
    Anchors = []
    AutoSize = False
    Caption = 'Pregled proizvoda po magacinima'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 400
  end
  object Button2: TButton
    Left = 515
    Top = 425
    Width = 83
    Height = 34
    Anchors = []
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 12
    Top = 435
    Width = 75
    Height = 25
    Anchors = []
    Caption = 'Nazad'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 14
    Top = 151
    Width = 163
    Height = 21
    Anchors = []
    TabOrder = 2
    TextHint = 'Izaberite magacin'
    OnChange = ComboBox1Change
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 220
    Width = 1074
    Height = 137
    Anchors = []
    ColCount = 1
    FixedCols = 0
    RowCount = 2
    TabOrder = 3
    ColWidths = (
      24)
  end
  object ComboBox2: TComboBox
    Left = 197
    Top = 151
    Width = 163
    Height = 21
    Anchors = []
    Enabled = False
    TabOrder = 4
    Text = 'Izaberite prostoriju'
    TextHint = 'Izaberite prostoriju'
    OnChange = ComboBox2Change
  end
  object ComboBox3: TComboBox
    Left = 381
    Top = 151
    Width = 163
    Height = 21
    Anchors = []
    Enabled = False
    TabOrder = 5
    Text = 'Izaberite policu'
    TextHint = 'Izaberite policu'
    OnChange = ComboBox3Change
  end
  object ComboBox4: TComboBox
    Left = 563
    Top = 151
    Width = 163
    Height = 21
    Anchors = []
    Enabled = False
    TabOrder = 6
    Text = 'Izaberite red'
    TextHint = 'Izaberite red'
    OnChange = ComboBox4Change
  end
  object ComboBox5: TComboBox
    Left = 746
    Top = 151
    Width = 163
    Height = 21
    Anchors = []
    Enabled = False
    TabOrder = 7
    Text = 'Izaberite sekciju'
    TextHint = 'Izaberite sekciju'
    OnChange = ComboBox5Change
  end
  object Button3: TButton
    Left = 931
    Top = 72
    Width = 129
    Height = 41
    Anchors = []
    Caption = 'Pregled proizvoda'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 931
    Top = 135
    Width = 129
    Height = 37
    Anchors = []
    Caption = 'Unos novog proizvoda'
    TabOrder = 9
    OnClick = Button4Click
  end
  object ComboBox6: TComboBox
    Left = 764
    Top = 376
    Width = 145
    Height = 21
    TabOrder = 10
    TextHint = 'Naziv proizvoda'
    OnChange = ComboBox6Change
  end
  object Button5: TButton
    Left = 924
    Top = 374
    Width = 103
    Height = 25
    Caption = 'Izbrisi proizvod'
    Enabled = False
    TabOrder = 11
    OnClick = Button5Click
  end
  object Edit1: TEdit
    Left = 764
    Top = 407
    Width = 145
    Height = 21
    TabOrder = 12
    TextHint = 'Unesite indeks'
    OnChange = Edit1Change
  end
  object Button6: TButton
    Left = 924
    Top = 405
    Width = 103
    Height = 25
    Caption = 'Izbaci iz magacina'
    Enabled = False
    TabOrder = 13
    OnClick = Button6Click
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = DataModule6.queryIzMagacina
    ScopeMappings = <>
    Left = 816
    Top = 520
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 300
    Top = 509
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <>
    end
  end
end
