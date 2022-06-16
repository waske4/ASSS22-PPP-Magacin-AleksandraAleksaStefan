object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'SKLADISTE/Odabir skladista/Skladiste materijala'
  ClientHeight = 597
  ClientWidth = 992
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    992
    597)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 63
    Top = 179
    Width = 35
    Height = 13
    Anchors = []
    Caption = 'Kolicina'
  end
  object Label2: TLabel
    Left = 576
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
    Left = 624
    Top = 230
    Width = 197
    Height = 13
    Anchors = []
    Caption = 'Poslednje dugme u navigacionom panelu.'
  end
  object Label4: TLabel
    Left = 72
    Top = 101
    Width = 26
    Height = 13
    Anchors = []
    Caption = 'Naziv'
  end
  object Label5: TLabel
    Left = 73
    Top = 143
    Width = 25
    Height = 13
    Anchors = []
    Caption = 'Vrsta'
  end
  object Label6: TLabel
    Left = 65
    Top = 216
    Width = 33
    Height = 13
    Anchors = []
    Caption = 'Sastav'
  end
  object Label7: TLabel
    Left = 8
    Top = 8
    Width = 293
    Height = 33
    Anchors = []
    AutoSize = False
    Caption = 'SKLADISTE MATERIJALA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 440
    Top = 536
    Width = 75
    Height = 25
    Anchors = []
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 536
    Width = 75
    Height = 25
    Anchors = []
    Caption = '<Nazad'
    TabOrder = 1
    OnClick = Button2Click
  end
  object StringGrid1: TStringGrid
    Tag = 5
    Left = 136
    Top = 336
    Width = 697
    Height = 177
    Anchors = []
    FixedCols = 0
    TabOrder = 2
    ColWidths = (
      64
      154
      154
      64
      154)
    ColAligments = (
      1
      0
      0
      1
      0)
  end
  object Button3: TButton
    Left = 264
    Top = 143
    Width = 89
    Height = 33
    Anchors = []
    Caption = 'Unesi podatke'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 104
    Top = 93
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 4
    Text = 'Unesi naziv'
  end
  object Edit2: TEdit
    Left = 104
    Top = 135
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 5
    Text = 'Unesi vrstu'
  end
  object Edit4: TEdit
    Left = 104
    Top = 208
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 6
    Text = 'Unesi sastav'
  end
  object NumberBox1: TNumberBox
    Left = 104
    Top = 171
    Width = 121
    Height = 21
    Anchors = []
    TabOrder = 7
    TextHint = 'Unesi kolicinu'
  end
  object NavigatorBindSourceDB1: TBindNavigator
    Left = 248
    Top = 269
    Width = 480
    Height = 52
    DataSource = BindSourceDB1
    Anchors = []
    Orientation = orHorizontal
    TabOrder = 8
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from materijal')
    Left = 904
    Top = 8
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=D:\Delphi 10.4 Pr\Magacin\Database\storage.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    UpdateOptions.AssignedValues = [uvLockMode]
    Connected = True
    Left = 904
    Top = 136
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = FDQuery1
    ScopeMappings = <>
    Left = 760
    Top = 360
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 12
    Top = 109
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <>
    end
  end
  object BindSourceDB2: TBindSourceDB
    ScopeMappings = <>
    Left = 912
    Top = 288
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    Left = 904
    Top = 72
  end
end
