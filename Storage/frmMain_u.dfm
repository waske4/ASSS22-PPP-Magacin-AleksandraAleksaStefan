object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 446
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 128
    Top = 104
    Width = 121
    Height = 129
    Caption = 'Skladiste materijala'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 488
    Top = 104
    Width = 121
    Height = 129
    Caption = 'Skladiste proizvoda'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 304
    Top = 344
    Width = 137
    Height = 41
    Caption = 'Close'
    TabOrder = 2
    OnClick = BitBtn3Click
  end
end
