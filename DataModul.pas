unit DataModul;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait;

type
  TDataModule6 = class(TDataModule)
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    queryKorisnici: TFDQuery;
    queryMagacin: TFDQuery;
    queryIzMagacina: TFDQuery;
    queryProstorija: TFDQuery;
    queryPolica: TFDQuery;
    queryRed: TFDQuery;
    querySekcija: TFDQuery;
    queryProizvodDimenzija: TFDQuery;
    queryProizvodKat: TFDQuery;
    queryProizvodMaterijal: TFDQuery;
    queryPoNazivu: TFDQuery;
    queryProizvodi: TFDQuery;
    queryPoKat: TFDQuery;
    queryPoMat: TFDQuery;
    queryExec: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule6: TDataModule6;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule6.DataModuleCreate(Sender: TObject);
begin

    DataModul.DataModule6.FDConnection1.Connected := False;
    var path := ExtractFilePath(ParamStr(0)) + '\magacin.db';
    DataModul.DataModule6.FDConnection1.Params.Values['Database'] := path;
    DataModul.DataModule6.FDConnection1.Connected := True;


    with queryKorisnici do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT Username, Password from Korisnik';
          open;
        end;


    with queryMagacin do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT ID_Magacin, Naziv, Adresa from Magacin';
          open;
        end;


    with queryProstorija do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * from Prostorija';
          open;
        end;

    with queryPolica do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * from Polica';
          open;
        end;

    with queryRed do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * from Red';
          open;
        end;

    with querySekcija do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * from Sekcija';
          open;
        end;

    with queryProizvodDimenzija do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * from Proizvod';
          open;
        end;

    with queryProizvodKat do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * from Kategorija';
          open;
        end;

    with queryProizvodMaterijal do
        begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT * from Materijal_Proizvoda';
          open;
        end;

//    with queryPoNazivu do
//        begin
//          Close;
//          SQL.Clear;
//          SQL.Text := 'SELECT * from Proizvod';
//          open;
//        end;





end;

end.


//with querySarkaPunjenje do
//    begin
//      Close;
//      SQL.Clear;
//      SQL.Text := 'select sarke from sarke' ;
//      open;
//    end;
