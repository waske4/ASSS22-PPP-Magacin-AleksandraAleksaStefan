object frmSklProizvoda: TfrmSklProizvoda
  Left = 0
  Top = 0
  Caption = 'Skladiste proizvoda'
  ClientHeight = 522
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TBitBtn
    Left = 464
    Top = 472
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 255
    Width = 945
    Height = 185
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 32
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Atribut1'
  end
  object Edit2: TEdit
    Left = 32
    Top = 75
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Atribut2'
  end
  object Edit3: TEdit
    Left = 32
    Top = 117
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Atribut3'
  end
  object Edit4: TEdit
    Left = 32
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Atribut4'
  end
  object DBNavigator1: TDBNavigator
    Left = 323
    Top = 208
    Width = 360
    Height = 41
    TabOrder = 6
  end
end
