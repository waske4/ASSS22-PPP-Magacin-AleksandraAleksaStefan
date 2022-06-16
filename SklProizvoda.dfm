object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'SKLADISTE/Odabir skladista/Skladiste proizvoda'
  ClientHeight = 569
  ClientWidth = 954
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    954
    569)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 640
    Top = 200
    Width = 289
    Height = 24
    Anchors = []
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = 'Posle svakog novog unosa u bazu, potrebno je istu osveziti.'
    ParentBiDiMode = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 688
    Top = 230
    Width = 197
    Height = 13
    Anchors = []
    Caption = 'Poslednje dugme u navigacionom panelu.'
  end
  object Label1: TLabel
    Left = 71
    Top = 152
    Width = 27
    Height = 13
    Anchors = []
    Caption = 'Visina'
  end
  object Label4: TLabel
    Left = 60
    Top = 187
    Width = 38
    Height = 13
    Anchors = []
    Caption = 'Debljina'
  end
  object Label5: TLabel
    Left = 72
    Top = 230
    Width = 26
    Height = 13
    Anchors = []
    Caption = 'Sirina'
  end
  object Label6: TLabel
    Left = 251
    Top = 152
    Width = 55
    Height = 13
    Anchors = []
    Caption = 'Serijski broj'
  end
  object Label7: TLabel
    Left = 240
    Top = 187
    Width = 66
    Height = 13
    Anchors = []
    Caption = 'Kolicina brava'
  end
  object Label8: TLabel
    Left = 80
    Top = 112
    Width = 18
    Height = 13
    Anchors = []
    Caption = 'Ime'
  end
  object Label9: TLabel
    Left = 233
    Top = 112
    Width = 73
    Height = 13
    Anchors = []
    Caption = 'Materijal izrade'
  end
  object Label10: TLabel
    Left = 292
    Top = 230
    Width = 14
    Height = 13
    Anchors = []
    Caption = 'Tip'
  end
  object Label11: TLabel
    Left = 8
    Top = 8
    Width = 287
    Height = 33
    Anchors = []
    Caption = 'SKLADISTE PROIZVODA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 480
    Top = 512
    Width = 75
    Height = 25
    Anchors = []
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 40
    Top = 512
    Width = 75
    Height = 25
    Anchors = []
    Caption = '<Nazad'
    TabOrder = 1
    OnClick = Button2Click
  end
  object StringGrid1: TStringGrid
    Tag = 9
    AlignWithMargins = True
    Left = 64
    Top = 336
    Width = 825
    Height = 145
    Anchors = []
    ColCount = 9
    FixedCols = 0
    RowCount = 4
    TabOrder = 2
    ColWidths = (
      65
      154
      64
      64
      64
      154
      64
      73
      154)
    ColAligments = (
      1
      0
      1
      1
      1
      0
      1
      1
      0)
  end
  object Edit1: TEdit
    Left = 104
    Top = 104
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 3
    Text = 'Ime'
  end
  object Edit5: TEdit
    Left = 312
    Top = 104
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 4
    Text = 'Materijal_izrade'
  end
  object Edit8: TEdit
    Left = 312
    Top = 224
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 5
    Text = 'Tip'
  end
  object Button3: TButton
    Left = 464
    Top = 102
    Width = 105
    Height = 143
    Anchors = []
    Caption = 'Unesi podatke'
    TabOrder = 6
    OnClick = Button3Click
  end
  object NavigatorBindSourceDB1: TBindNavigator
    Left = 145
    Top = 271
    Width = 660
    Height = 59
    DataSource = BindSourceDB1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh, nbApplyUpdates]
    Anchors = []
    Orientation = orHorizontal
    TabOrder = 7
  end
  object NumberBox1: TNumberBox
    Left = 104
    Top = 144
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 8
  end
  object NumberBox2: TNumberBox
    Left = 104
    Top = 184
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 9
  end
  object NumberBox3: TNumberBox
    Left = 104
    Top = 224
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 10
  end
  object NumberBox4: TNumberBox
    Left = 312
    Top = 144
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 11
  end
  object NumberBox5: TNumberBox
    Left = 312
    Top = 184
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 12
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from proizvodi')
    Left = 896
    Top = 24
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Delphi 10.4 Pr\Magacin\Database\storage.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    Left = 896
    Top = 232
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = FDQuery1
    ScopeMappings = <>
    Left = 736
    Top = 400
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 12
    Top = 85
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <>
    end
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 896
    Top = 88
  end
  object BindSourceDB2: TBindSourceDB
    DataSet = FDQuery2
    ScopeMappings = <>
    Left = 872
    Top = 384
  end
end
