unit PregProizvod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, PregMagacin, UnosProizvod;

type
  TForm7 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    StringGrid2: TStringGrid;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Button5: TButton;
    ComboBox5: TComboBox;
    Edit1: TEdit;
    Button6: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    var ponaz, dim, kat, mat, id : string;
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
  Uses Odabir, DataModul, Unos;
{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
begin
  Self.Hide;
  Form2.Show;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  application.Terminate;
end;


procedure TForm7.Button3Click(Sender: TObject);
begin
  Self.Hide;
  Form6.Show;
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
  self.Hide;
  Form9.Show;
end;

procedure TForm7.Button5Click(Sender: TObject);
begin


  if (ComboBox5.Text = '') then
  begin
    ShowMessage('Los unos! Pokusajte ponovo!');
    exit
  end;



  mat := ComboBox5.Text;

  DataModule6.queryProizvodDimenzija.First;
  while not DataModule6.queryProizvodDimenzija.Eof do
  begin

    if DataModule6.queryProizvodDimenzija['Naziv'] = mat then
    begin
      id :=  DataModule6.queryProizvodDimenzija['ID_Proizvod'];
    end;

    DataModule6.queryProizvodDimenzija.Next;
  end;


  DataModule6.queryExec.ExecSQL('DELETE FROM Proi_Sekc WHERE ID_Proizvod = "'+ id + '"');
  DataModule6.queryExec.ExecSQL('DELETE FROM Proi_Mat WHERE ID_Proizvod = "'+ id + '"');
  DataModule6.queryExec.ExecSQL('DELETE FROM Proizvod WHERE ID_Proizvod = "'+ id + '"');

  ShowMessage('Uspesno brisanje proizvoda:  '+ mat +'.');


  DataModule6.queryPoNazivu.Refresh;

end;

procedure TForm7.Button6Click(Sender: TObject);
begin

  if (Edit1.Text = '') then
    begin
      ShowMessage('Los unos! Pokusajte ponovo!');
      exit
    end;

  mat := Edit1.Text;

  DataModule6.queryExec.ExecSQL('DELETE FROM Proi_Mat WHERE ID_ProiMat = "'+ mat + '"');

  ShowMessage('Uspesno ste izbrisali materijal sa indeksom: '+id+'.');

  DataModule6.queryPoNazivu.Refresh;



end;

procedure TForm7.ComboBox1Change(Sender: TObject);
begin

  ponaz := ComboBox1.Text;

  with DataModul.DataModule6.queryPoNazivu do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Mat.ID_ProiMat as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
                    'Materijal_Proizvoda.Naziv as Naziv_mat_izrade, '  +
                    'Sekcija.Oznaka as Oznaka_sekcije, Red.Oznaka as Oznaka_reda, Polica.Oznaka as Oznaka_police, '   +
                    'Prostorija.Oznaka as Oznaka_prostorije, Magacin.Naziv as Naziv_magacina, Magacin.Adresa as Adresa_magacina '  +
                    'FROM Proizvod '  +
                    'INNER JOIN Proi_Mat on Proizvod.ID_Proizvod = Proi_Mat.ID_Proizvod '     +
                    'INNER JOIN Materijal_Proizvoda on Proi_Mat.ID_Materijal = Materijal_Proizvoda.ID_Materijal ' +
                    'INNER JOIN Kategorija on Proizvod.ID_Kategorija = Kategorija.ID_Kategorija ' +
                    'INNER JOIN Proi_Sekc on Proizvod.ID_Proizvod = Proi_Sekc.ID_Proizvod '   +
                    'INNER JOIN Sekcija on Proi_Sekc.ID_Sekcija = Sekcija.ID_Sekcija '  +
                    'INNER JOIN Red on Sekcija.ID_Red = Red.ID_Red '    +
                    'INNER JOIN Polica on Red.ID_Polica = Polica.ID_Polica '  +
                    'INNER JOIN Prostorija on Polica.ID_Prostorija = Prostorija.ID_Prostorija ' +
                    'INNER JOIN Magacin on Prostorija.ID_Magacin = Magacin.ID_Magacin '  +
                    'WHERE Proizvod.Naziv = "' + ponaz + '"' ;
      open;

      Refresh;

    end;

    ComboBox2.ItemIndex := -1;
    ComboBox3.ItemIndex := -1;
    ComboBox4.ItemIndex := -1;

end;

procedure TForm7.ComboBox2Change(Sender: TObject);
begin

  dim := ComboBox2.Text;

  with DataModul.DataModule6.queryPoNazivu do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Mat.ID_ProiMat as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
                    'Materijal_Proizvoda.Naziv as Naziv_mat_izrade, '  +
                    'Sekcija.Oznaka as Oznaka_sekcije, Red.Oznaka as Oznaka_reda, Polica.Oznaka as Oznaka_police, '   +
                    'Prostorija.Oznaka as Oznaka_prostorije, Magacin.Naziv as Naziv_magacina, Magacin.Adresa as Adresa_magacina '  +
                    'FROM Proizvod '  +
                    'INNER JOIN Proi_Mat on Proizvod.ID_Proizvod = Proi_Mat.ID_Proizvod '     +
                    'INNER JOIN Materijal_Proizvoda on Proi_Mat.ID_Materijal = Materijal_Proizvoda.ID_Materijal ' +
                    'INNER JOIN Kategorija on Proizvod.ID_Kategorija = Kategorija.ID_Kategorija ' +
                    'INNER JOIN Proi_Sekc on Proizvod.ID_Proizvod = Proi_Sekc.ID_Proizvod '   +
                    'INNER JOIN Sekcija on Proi_Sekc.ID_Sekcija = Sekcija.ID_Sekcija '  +
                    'INNER JOIN Red on Sekcija.ID_Red = Red.ID_Red '    +
                    'INNER JOIN Polica on Red.ID_Polica = Polica.ID_Polica '  +
                    'INNER JOIN Prostorija on Polica.ID_Prostorija = Prostorija.ID_Prostorija ' +
                    'INNER JOIN Magacin on Prostorija.ID_Magacin = Magacin.ID_Magacin '  +
                    'WHERE Proizvod.Dimenzija = "' + dim + '" ' ;
      open;

      Refresh;

    end;

    ComboBox1.ItemIndex := -1;
    ComboBox3.ItemIndex := -1;
    ComboBox4.ItemIndex := -1;

end;

procedure TForm7.ComboBox3Change(Sender: TObject);
begin

  kat := ComboBox3.Text;

  with DataModul.DataModule6.queryPoNazivu do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Mat.ID_ProiMat as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
                    'Materijal_Proizvoda.Naziv as Naziv_mat_izrade, '  +
                    'Sekcija.Oznaka as Oznaka_sekcije, Red.Oznaka as Oznaka_reda, Polica.Oznaka as Oznaka_police, '   +
                    'Prostorija.Oznaka as Oznaka_prostorije, Magacin.Naziv as Naziv_magacina, Magacin.Adresa as Adresa_magacina '  +
                    'FROM Proizvod '  +
                    'INNER JOIN Proi_Mat on Proizvod.ID_Proizvod = Proi_Mat.ID_Proizvod '     +
                    'INNER JOIN Materijal_Proizvoda on Proi_Mat.ID_Materijal = Materijal_Proizvoda.ID_Materijal ' +
                    'INNER JOIN Kategorija on Proizvod.ID_Kategorija = Kategorija.ID_Kategorija ' +
                    'INNER JOIN Proi_Sekc on Proizvod.ID_Proizvod = Proi_Sekc.ID_Proizvod '   +
                    'INNER JOIN Sekcija on Proi_Sekc.ID_Sekcija = Sekcija.ID_Sekcija '  +
                    'INNER JOIN Red on Sekcija.ID_Red = Red.ID_Red '    +
                    'INNER JOIN Polica on Red.ID_Polica = Polica.ID_Polica '  +
                    'INNER JOIN Prostorija on Polica.ID_Prostorija = Prostorija.ID_Prostorija ' +
                    'INNER JOIN Magacin on Prostorija.ID_Magacin = Magacin.ID_Magacin '  +
                    'WHERE Kategorija.Naziv = "' + kat + '" ' ;
      open;

      Refresh;

    end;

    ComboBox1.ItemIndex := -1;
    ComboBox2.ItemIndex := -1;
    ComboBox4.ItemIndex := -1;

end;

procedure TForm7.ComboBox4Change(Sender: TObject);
begin

  mat := ComboBox4.Text;

  with DataModul.DataModule6.queryPoNazivu do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Mat.ID_ProiMat as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
                    'Materijal_Proizvoda.Naziv as Naziv_mat_izrade, '  +
                    'Sekcija.Oznaka as Oznaka_sekcije, Red.Oznaka as Oznaka_reda, Polica.Oznaka as Oznaka_police, '   +
                    'Prostorija.Oznaka as Oznaka_prostorije, Magacin.Naziv as Naziv_magacina, Magacin.Adresa as Adresa_magacina '  +
                    'FROM Proi_Mat '  +
                    'INNER JOIN Proizvod on Proi_Mat.ID_Proizvod = Proizvod.ID_Proizvod '     +
                    'INNER JOIN Materijal_Proizvoda on Proi_Mat.ID_Materijal = Materijal_Proizvoda.ID_Materijal ' +
                    'INNER JOIN Kategorija on Proizvod.ID_Kategorija = Kategorija.ID_Kategorija ' +
                    'INNER JOIN Proi_Sekc on Proizvod.ID_Proizvod = Proi_Sekc.ID_Proizvod '   +
                    'INNER JOIN Sekcija on Proi_Sekc.ID_Sekcija = Sekcija.ID_Sekcija '  +
                    'INNER JOIN Red on Sekcija.ID_Red = Red.ID_Red '    +
                    'INNER JOIN Polica on Red.ID_Polica = Polica.ID_Polica '  +
                    'INNER JOIN Prostorija on Polica.ID_Prostorija = Prostorija.ID_Prostorija ' +
                    'INNER JOIN Magacin on Prostorija.ID_Magacin = Magacin.ID_Magacin '  +
                    'WHERE Naziv_mat_izrade = "' + mat + '" ' ;
      open;

      Refresh;

    end;

    ComboBox1.ItemIndex := -1;
    ComboBox2.ItemIndex := -1;
    ComboBox3.ItemIndex := -1;

end;

procedure TForm7.ComboBox5Change(Sender: TObject);
begin
  Button5.Enabled := True;
end;

procedure TForm7.Edit1Change(Sender: TObject);
begin
  Button6.Enabled := True;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

procedure TForm7.FormShow(Sender: TObject);
begin

  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  ComboBox3.Items.Clear;
  ComboBox4.Items.Clear;
  ComboBox5.Items.Clear;

  DataModul.DataModule6.queryProizvodDimenzija.First;
  DataModul.DataModule6.queryProizvodKat.First;
  DataModul.DataModule6.queryProizvodMaterijal.First;

  while not DataModul.DataModule6.queryProizvodDimenzija.Eof do
    begin
      ComboBox1.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Naziv']);
      ComboBox5.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Naziv']);
      //ComboBox2.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Dimenzija']);
      if(ComboBox2.Items.IndexOf(DataModul.DataModule6.queryProizvodDimenzija['Dimenzija'])= -1) then
         ComboBox2.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Dimenzija']);
      DataModul.DataModule6.queryProizvodDimenzija.Next;
    end;

  while not DataModul.DataModule6.queryProizvodKat.Eof do
    begin
      ComboBox3.items.Add(DataModul.DataModule6.queryProizvodKat['Naziv']);
      DataModul.DataModule6.queryProizvodKat.Next;
    end;

  while not DataModul.DataModule6.queryProizvodMaterijal.Eof do
    begin
      ComboBox4.items.Add(DataModul.DataModule6.queryProizvodMaterijal['Naziv']);
      DataModul.DataModule6.queryProizvodMaterijal.Next;
    end;



    with DataModul.DataModule6.queryPoNazivu do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Mat.ID_ProiMat as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
                    'Materijal_Proizvoda.Naziv as Naziv_mat_izrade, '  +
                    'Sekcija.Oznaka as Oznaka_sekcije, Red.Oznaka as Oznaka_reda, Polica.Oznaka as Oznaka_police, '   +
                    'Prostorija.Oznaka as Oznaka_prostorije, Magacin.Naziv as Naziv_magacina, Magacin.Adresa as Adresa_magacina '  +
                    'FROM Proizvod '  +
                    'INNER JOIN Proi_Mat on Proizvod.ID_Proizvod = Proi_Mat.ID_Proizvod '     +
                    'INNER JOIN Materijal_Proizvoda on Proi_Mat.ID_Materijal = Materijal_Proizvoda.ID_Materijal ' +
                    'INNER JOIN Kategorija on Proizvod.ID_Kategorija = Kategorija.ID_Kategorija ' +
                    'INNER JOIN Proi_Sekc on Proizvod.ID_Proizvod = Proi_Sekc.ID_Proizvod '   +
                    'INNER JOIN Sekcija on Proi_Sekc.ID_Sekcija = Sekcija.ID_Sekcija '  +
                    'INNER JOIN Red on Sekcija.ID_Red = Red.ID_Red '    +
                    'INNER JOIN Polica on Red.ID_Polica = Polica.ID_Polica '  +
                    'INNER JOIN Prostorija on Polica.ID_Prostorija = Prostorija.ID_Prostorija ' +
                    'INNER JOIN Magacin on Prostorija.ID_Magacin = Magacin.ID_Magacin ';

      open;

      Refresh;

    end;


end;

end.
