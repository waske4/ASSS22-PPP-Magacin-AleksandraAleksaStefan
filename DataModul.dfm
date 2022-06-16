object DataModule6: TDataModule6
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 503
  Width = 740
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 16
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    Left = 696
    Top = 8
  end
  object queryKorisnici: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select Username, Password from Korisnik')
    Left = 32
    Top = 72
  end
  object queryMagacin: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'Select ID_Magacin, Naziv, Adresa From Magacin')
    Left = 32
    Top = 128
  end
  object queryIzMagacina: TFDQuery
    Connection = FDConnection1
    Left = 128
    Top = 128
  end
  object queryProstorija: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 184
  end
  object queryPolica: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 248
  end
  object queryRed: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 304
  end
  object querySekcija: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 360
  end
  object queryProizvodDimenzija: TFDQuery
    Connection = FDConnection1
    Left = 232
    Top = 56
  end
  object queryProizvodKat: TFDQuery
    Connection = FDConnection1
    Left = 232
    Top = 104
  end
  object queryProizvodMaterijal: TFDQuery
    Connection = FDConnection1
    Left = 232
    Top = 176
  end
  object queryPoNazivu: TFDQuery
    Connection = FDConnection1
    Left = 360
    Top = 56
  end
  object queryProizvodi: TFDQuery
    Connection = FDConnection1
    Left = 360
    Top = 120
  end
  object queryPoKat: TFDQuery
    Connection = FDConnection1
    Left = 360
    Top = 176
  end
  object queryPoMat: TFDQuery
    Connection = FDConnection1
    Left = 360
    Top = 232
  end
  object queryExec: TFDQuery
    Connection = FDConnection1
    Left = 232
    Top = 304
  end
end
