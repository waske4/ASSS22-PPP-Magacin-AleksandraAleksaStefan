unit PregMagacin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DataModul, Vcl.Grids,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope;

type
  TForm6 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    ComboBox1: TComboBox;
    StringGrid1: TStringGrid;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    ComboBox6: TComboBox;
    Button5: TButton;
    Edit1: TEdit;
    Button6: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    var mag, id, pro, pol, red, sek: string;

  end;

var
  Form6: TForm6;

implementation
  Uses Odabir, PregProizvod, UnosProizvod, Unos;
{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  Self.Hide;
  Form2.Show;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin

  Self.Hide;
  Form7.Show;

end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  self.Hide;
  Form9.Show;
end;

procedure TForm6.Button5Click(Sender: TObject);
begin


  if (ComboBox2.Text = '') then
  begin
    ShowMessage('Los unos! Pokusajte ponovo!');
    exit
  end;



  pro := ComboBox2.Text;

  DataModule6.queryProizvodDimenzija.First;
  while not DataModule6.queryProizvodDimenzija.Eof do
  begin

    if DataModule6.queryProizvodDimenzija['Naziv'] = pro then
    begin
      id :=  DataModule6.queryProizvodDimenzija['ID_Proizvod'];
    end;

    DataModule6.queryProizvodDimenzija.Next;
  end;


  DataModule6.queryExec.ExecSQL('DELETE FROM Proi_Sekc WHERE ID_Proizvod = "'+ id + '"');
  DataModule6.queryExec.ExecSQL('DELETE FROM Proi_Mat WHERE ID_Proizvod = "'+ id + '"');
  DataModule6.queryExec.ExecSQL('DELETE FROM Proizvod WHERE ID_Proizvod = "'+ id + '"');

  ShowMessage('Uspesno brisanje proizvoda:  '+ pro +'.');


  DataModule6.queryIzMagacina.Refresh;


end;

procedure TForm6.Button6Click(Sender: TObject);
begin

  if (Edit1.Text = '') then
    begin
      ShowMessage('Los unos! Pokusajte ponovo!');
      exit
    end;

  sek := Edit1.Text;

  DataModule6.queryExec.ExecSQL('DELETE FROM Proi_Sekc WHERE ID_Proi_Sekc = "'+ sek + '"');

  ShowMessage('Uspesno ste izbrisali sekciju sa indeksom: '+id+'.');

  DataModule6.queryIzMagacina.Refresh;

end;

procedure TForm6.ComboBox1Change(Sender: TObject);
begin

  mag := ComboBox1.Text;

  with DataModul.DataModule6.queryIzMagacina do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Sekc.ID_Proi_Sekc as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
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
                    'WHERE Magacin.Naziv = "' + mag + '"' ;
      open;

      Refresh;

    end;

    ComboBox2.Enabled := True;
    ComboBox2.Clear;
    ComboBox3.Clear;
    ComboBox4.Clear;
    ComboBox5.Clear;


    var mag := ComboBox1.Text;


    DataModule6.queryMagacin.First;
    while not DataModule6.queryMagacin.Eof do
    begin

      if DataModule6.queryMagacin['Naziv'] = mag then
      begin
        id :=  DataModule6.queryMagacin['ID_Magacin'];
      end;

      DataModule6.queryMagacin.Next;
    end;




    DataModul.DataModule6.queryProstorija.First;


    while not DataModul.DataModule6.queryProstorija.Eof do
    begin
    if ( DataModule6.queryProstorija['ID_Magacin'] = id ) then
    begin
      ComboBox2.items.Add(DataModul.DataModule6.queryProstorija['Oznaka']);
    end;
       DataModul.DataModule6.queryProstorija.Next;
    end;







end;

procedure TForm6.ComboBox2Change(Sender: TObject);
begin

  pro := ComboBox2.Text;

  with DataModul.DataModule6.queryIzMagacina do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Sekc.ID_Proi_Sekc as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
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
                    'WHERE Prostorija.Oznaka = "' + pro + '" and  Magacin.Naziv = "' + mag + '"'  ;
      open;

      Refresh;
    end;

    ComboBox3.Enabled := True;
    ComboBox3.Clear;
    ComboBox4.Clear;
    ComboBox5.Clear;


    var pro := ComboBox2.Text;


    DataModule6.queryProstorija.First;
    while not DataModule6.queryProstorija.Eof do
    begin

      if DataModule6.queryProstorija['Oznaka'] = pro then
      begin
        id :=  DataModule6.queryProstorija['ID_Prostorija'];
      end;

      DataModule6.queryProstorija.Next;
    end;



    DataModul.DataModule6.queryPolica.First;


    while not DataModul.DataModule6.queryPolica.Eof do
    begin
    if ( DataModule6.queryPolica['ID_Prostorija'] = id ) then
    begin
      ComboBox3.items.Add(DataModul.DataModule6.queryPolica['Oznaka']);
    end;
       DataModul.DataModule6.queryPolica.Next;
    end;

end;

procedure TForm6.ComboBox3Change(Sender: TObject);
begin

  pol := ComboBox3.Text;

  with DataModul.DataModule6.queryIzMagacina do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Sekc.ID_Proi_Sekc as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
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
                    'WHERE Polica.Oznaka = "' + pol + '" and Prostorija.Oznaka = "' + pro + '" and  Magacin.Naziv = "' + mag + '"' ;
      open;

      Refresh;
    end;

    ComboBox4.Enabled := True;
    ComboBox4.Clear;
    ComboBox5.Clear;


    var pro := ComboBox3.Text;


    DataModule6.queryPolica.First;
    while not DataModule6.queryPolica.Eof do
    begin

      if DataModule6.queryPolica['Oznaka'] = pro then
      begin
        id :=  DataModule6.queryPolica['ID_Polica'];
      end;

      DataModule6.queryPolica.Next;
    end;



    DataModul.DataModule6.queryRed.First;


    while not DataModul.DataModule6.queryRed.Eof do
    begin
    if ( DataModule6.queryRed['ID_Polica'] = id ) then
    begin
      ComboBox4.items.Add(DataModul.DataModule6.queryRed['Oznaka']);
    end;
       DataModul.DataModule6.queryRed.Next;
    end;

end;

procedure TForm6.ComboBox4Change(Sender: TObject);
begin

  red := ComboBox4.Text;

  with DataModul.DataModule6.queryIzMagacina do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Sekc.ID_Proi_Sekc as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
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
                    'WHERE Red.Oznaka = "' + red + '" and Polica.Oznaka = "' + pol + '" and Prostorija.Oznaka = "' + pro + '" and  Magacin.Naziv = "' + mag + '"' ;
      open;

      Refresh;
    end;

    ComboBox5.Enabled := True;
    ComboBox5.Clear;


    var pro := ComboBox4.Text;


  DataModule6.queryRed.First;
  while not DataModule6.queryRed.Eof do
  begin

    if DataModule6.queryRed['Oznaka'] = pro then
    begin
      id :=  DataModule6.queryRed['ID_Red'];
    end;

    DataModule6.queryRed.Next;
  end;



  DataModul.DataModule6.querySekcija.First;


  while not DataModul.DataModule6.querySekcija.Eof do
  begin
  if ( DataModule6.querySekcija['ID_Red'] = id ) then
  begin
    ComboBox5.items.Add(DataModul.DataModule6.querySekcija['Oznaka']);
  end;
     DataModul.DataModule6.querySekcija.Next;
  end;

end;

procedure TForm6.ComboBox5Change(Sender: TObject);
begin

   sek := ComboBox5.Text;

  with DataModul.DataModule6.queryIzMagacina do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Sekc.ID_Proi_Sekc as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
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
                    'WHERE Sekcija.Oznaka = "' + sek + '"  and Red.Oznaka = "' + red + '" and Polica.Oznaka = "' + pol + '" and Prostorija.Oznaka = "' + pro + '" and  Magacin.Naziv = "' + mag + '"' ;
      open;

      Refresh;
    end;

end;

procedure TForm6.ComboBox6Change(Sender: TObject);
begin

  Button5.Enabled := True;


end;

procedure TForm6.Edit1Change(Sender: TObject);
begin
  Button6.Enabled := True;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  ComboBox3.Items.Clear;
  ComboBox4.Items.Clear;
  ComboBox5.Items.Clear;
  ComboBox6.Items.Clear;

  DataModul.DataModule6.queryMagacin.First;
  DataModul.DataModule6.queryProstorija.First;
  DataModul.DataModule6.querySekcija.First;
  DataModul.DataModule6.queryPolica.First;
  DataModul.DataModule6.queryRed.First;
  DataModul.DataModule6.queryProizvodDimenzija.First;

  while not DataModul.DataModule6.queryMagacin.Eof do
  begin
    ComboBox1.items.Add(DataModul.DataModule6.queryMagacin['Naziv']);
    DataModul.DataModule6.queryMagacin.Next;
  end;

  while not DataModul.DataModule6.queryProizvodDimenzija.Eof do
  begin
    ComboBox6.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Naziv']);
    DataModul.DataModule6.queryProizvodDimenzija.Next;
  end;


  while not DataModul.DataModule6.queryProstorija.Eof do
  begin
    ComboBox2.items.Add(DataModul.DataModule6.queryProstorija['Oznaka']);
    DataModul.DataModule6.queryProstorija.Next;
  end;

  while not DataModul.DataModule6.queryPolica.Eof do
  begin
    ComboBox3.items.Add(DataModul.DataModule6.queryPolica['Oznaka']);
    DataModul.DataModule6.queryPolica.Next;
  end;

  while not DataModul.DataModule6.queryRed.Eof do
  begin
    ComboBox4.items.Add(DataModul.DataModule6.queryRed['Oznaka']);
    DataModul.DataModule6.queryRed.Next;
  end;

  while not DataModul.DataModule6.querySekcija.Eof do
  begin
    ComboBox5.items.Add(DataModul.DataModule6.querySekcija['Oznaka']);
    DataModul.DataModule6.querySekcija.Next;
  end;


  with DataModul.DataModule6.queryIzMagacina do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'SELECT Proi_Sekc.ID_Proi_Sekc as ID, Proizvod.Naziv, Proizvod.Dimenzija, Proi_Sekc.Kolicina,Proi_Sekc.Serijski_broj, Proi_Sekc.Datum_unosa, Kategorija.Naziv as Naziv_kategorije, ' +
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
