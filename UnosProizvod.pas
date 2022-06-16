unit UnosProizvod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, PregMagacin, DataModul;

type
  TForm8 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button5: TButton;
    Label3: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
     var id : string
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation
  Uses Odabir, PregProizvod;
{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
  Self.Hide;
  Form2.Show;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
  Self.Hide;
  Form6.Show;
end;

procedure TForm8.Button4Click(Sender: TObject);
begin
  Self.Hide;
  Form7.Show;
end;

procedure TForm8.Button5Click(Sender: TObject);
begin

  var naz, idpro, idsek, kol, sb, sek: string;

  naz := ComboBox1.Text;
  kol := Edit2.Text;
  sb := Edit3.Text;
  var dateAndTime := DateToStr(Now)+ ' u ' + TimeToStr(Now);
  sek := ComboBox7.Text;

  DataModule6.queryProizvodDimenzija.First;
  while not DataModule6.queryProizvodDimenzija.Eof do
  begin

    if DataModule6.queryProizvodDimenzija['Naziv'] = naz then
    begin
      idpro :=  DataModule6.queryProizvodDimenzija['ID_Proizvod'];
    end;

    DataModule6.queryProizvodDimenzija.Next;
  end;


  DataModule6.querySekcija.First;
  while not DataModule6.querySekcija.Eof do
  begin

    if DataModule6.querySekcija['Oznaka'] = sek then
    begin
      idsek :=  DataModule6.querySekcija['ID_Sekcija'];
    end;

    DataModule6.querySekcija.Next;
  end;

     DataModule6.queryExec.ExecSQL('INSERT INTO Proi_Sekc (ID_Proizvod, ID_Sekcija, Kolicina, Serijski_broj, Datum_unosa) VALUES ("' + idpro +'", "' + idsek +'", "' + kol +'", "' + sb +'", "' + dateAndTime +'" )');
//   ShowMessage('INSERT INTO Proi_Sekc (ID_Proizvod, ID_Sekcija, Kolicina, Serijski_broj, Datum) VALUES ("' + idpro +'", "' + idsek +'", "' + kol +'", "' + sb +'", "' + dateAndTime +'" )');
     ShowMessage('Proizvod: "' + naz +'",' + sLineBreak + 'kolicine: '+ kol +', '+ sLineBreak +'serijskog broja: "' + sb +'",'+ sLineBreak + 'rasporedjen je dana: "' + dateAndTime +'" u sekciju '+ sek +'!');






end;

procedure TForm8.ComboBox3Change(Sender: TObject);
begin
  ComboBox4.Enabled := True;

  var mag := ComboBox3.Text;


  DataModule6.queryMagacin.First;
  while not DataModule6.queryMagacin.Eof do
  begin

    if DataModule6.queryMagacin['Naziv'] = mag then
    begin
      id :=  DataModule6.queryMagacin['ID_Magacin'];
    end;

    DataModule6.queryMagacin.Next;
  end;


  ComboBox4.Clear;

  DataModul.DataModule6.queryProstorija.First;


  while not DataModul.DataModule6.queryProstorija.Eof do
  begin
  if ( DataModule6.queryProstorija['ID_Magacin'] = id ) then
  begin
    ComboBox4.items.Add(DataModul.DataModule6.queryProstorija['Oznaka']);
  end;
     DataModul.DataModule6.queryProstorija.Next;
  end;


end;


procedure TForm8.ComboBox4Change(Sender: TObject);
begin
  ComboBox5.Enabled := True;

  var pro := ComboBox4.Text;


  DataModule6.queryProstorija.First;
  while not DataModule6.queryProstorija.Eof do
  begin

    if DataModule6.queryProstorija['Oznaka'] = pro then
    begin
      id :=  DataModule6.queryProstorija['ID_Prostorija'];
    end;

    DataModule6.queryProstorija.Next;
  end;


  ComboBox5.Clear;

  DataModul.DataModule6.queryPolica.First;


  while not DataModul.DataModule6.queryPolica.Eof do
  begin
  if ( DataModule6.queryPolica['ID_Prostorija'] = id ) then
  begin
    ComboBox5.items.Add(DataModul.DataModule6.queryPolica['Oznaka']);
  end;
     DataModul.DataModule6.queryPolica.Next;
  end;

end;

procedure TForm8.ComboBox5Change(Sender: TObject);
begin
   ComboBox6.Enabled := True;

  var pro := ComboBox5.Text;


  DataModule6.queryPolica.First;
  while not DataModule6.queryPolica.Eof do
  begin

    if DataModule6.queryPolica['Oznaka'] = pro then
    begin
      id :=  DataModule6.queryPolica['ID_Polica'];
    end;

    DataModule6.queryPolica.Next;
  end;


  ComboBox6.Clear;

  DataModul.DataModule6.queryRed.First;


  while not DataModul.DataModule6.queryRed.Eof do
  begin
  if ( DataModule6.queryRed['ID_Polica'] = id ) then
  begin
    ComboBox6.items.Add(DataModul.DataModule6.queryRed['Oznaka']);
  end;
     DataModul.DataModule6.queryRed.Next;
  end;
end;

procedure TForm8.ComboBox6Change(Sender: TObject);
begin
  ComboBox7.Enabled := True;

  var pro := ComboBox6.Text;


  DataModule6.queryRed.First;
  while not DataModule6.queryRed.Eof do
  begin

    if DataModule6.queryRed['Oznaka'] = pro then
    begin
      id :=  DataModule6.queryRed['ID_Red'];
    end;

    DataModule6.queryRed.Next;
  end;


  ComboBox7.Clear;

  DataModul.DataModule6.querySekcija.First;


  while not DataModul.DataModule6.querySekcija.Eof do
  begin
  if ( DataModule6.querySekcija['ID_Red'] = id ) then
  begin
    ComboBox7.items.Add(DataModul.DataModule6.querySekcija['Oznaka']);
  end;
     DataModul.DataModule6.querySekcija.Next;
  end;
end;

procedure TForm8.ComboBox7Change(Sender: TObject);
begin
  Button5.Enabled := TRUE;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

procedure TForm8.FormShow(Sender: TObject);
begin

  ComboBox1.Items.Clear;
  ComboBox3.Items.Clear;

  DataModul.DataModule6.queryProizvodDimenzija.First;
  DataModul.DataModule6.queryProizvodKat.First;

//  while not DataModul.DataModule6.queryProizvodDimenzija.Eof do
//    begin
//      ComboBox1.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Naziv']);
//      //ComboBox2.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Dimenzija']);
//      if(ComboBox2.Items.IndexOf(DataModul.DataModule6.queryProizvodDimenzija['Dimenzija'])= -1) then
//         ComboBox2.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Dimenzija']);
//      DataModul.DataModule6.queryProizvodDimenzija.Next;
//    end;

  while not DataModul.DataModule6.queryProizvodDimenzija.Eof do
    begin
      ComboBox1.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Naziv']);
      DataModul.DataModule6.queryProizvodDimenzija.Next;
    end;

//  while not DataModul.DataModule6.queryProizvodMaterijal.Eof do
//    begin
//      ComboBox2.items.Add(DataModul.DataModule6.queryProizvodMaterijal['Naziv']);
//      DataModul.DataModule6.queryProizvodMaterijal.Next;
//    end;



  DataModul.DataModule6.queryMagacin.First;

  while not DataModul.DataModule6.queryMagacin.Eof do
  begin
    ComboBox3.items.Add(DataModul.DataModule6.queryMagacin['Naziv']);
    DataModul.DataModule6.queryMagacin.Next;

  end;

end;

end.
