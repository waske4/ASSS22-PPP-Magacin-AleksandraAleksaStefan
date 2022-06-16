unit Unos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DataModul;

type
  TForm9 = class(TForm)
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Button5: TButton;
    Button6: TButton;
    ComboBox3: TComboBox;
    Button7: TButton;
    Label1: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
  var kat, mat, naz, dim : string;
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

uses PregMagacin, PregProizvod, UnosProizvod, Odabir;

procedure TForm9.Button1Click(Sender: TObject);
begin
  Self.Hide;
  Form2.Show;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm9.Button3Click(Sender: TObject);
begin
  Self.Hide;
  Form6.Show;
end;

procedure TForm9.Button4Click(Sender: TObject);
begin
  Self.Hide;
  Form7.Show;
end;

procedure TForm9.Button5Click(Sender: TObject);

begin

  if ((Edit1.Text = '') or (Edit2.Text = '') or (ComboBox1.Text = '')) then
  begin
    ShowMessage('Los unos! Pokusajte ponovo!');
    exit
  end;

  kat := ComboBox1.Text;
  naz := Edit1.Text;
  dim := Edit2.Text;

  var idkat, idmat: string;

  DataModule6.queryProizvodKat.First;
  while not DataModule6.queryProizvodKat.Eof do
  begin

    if DataModule6.queryProizvodKat['Naziv'] = kat then
    begin
      idkat :=  DataModule6.queryProizvodKat['ID_Kategorija'];
    end;

    DataModule6.queryProizvodKat.Next;
  end;


  //ShowMessage('INSERT INTO Proizvod (Naziv, Dimenzija, ID_Kategorija) VALUES ("' + naz +'", "' + dim +'", "' + idkat +'" )');

  DataModule6.queryExec.ExecSQL('INSERT INTO Proizvod (Naziv, Dimenzija, ID_Kategorija) VALUES ("' + naz +'", "' + dim +'", "' + idkat +'" )');

  ShowMessage('Dodali ste proizvod sa imenom: "' + naz +'",' + sLineBreak + 'dimenzijama: "' + dim +'",' + sLineBreak + 'skategorije: "' + kat +'"!');


  ComboBox3.Items.Clear;

  DataModul.DataModule6.queryProizvodDimenzija.First;

  while not DataModul.DataModule6.queryProizvodDimenzija.Eof do
    begin
      ComboBox3.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Naziv']);
      DataModul.DataModule6.queryProizvodDimenzija.Next;
    end;


end;

procedure TForm9.Button6Click(Sender: TObject);
begin
  Self.Hide;
  Form8.Show;
end;

procedure TForm9.Button7Click(Sender: TObject);
begin

  if ((ComboBox3.Text = '') or (ComboBox2.Text = '')) then
  begin
    ShowMessage('Los unos! Pokusajte ponovo!');
    exit
  end;


  var idpro, idmat: string;

  kat := ComboBox3.Text;
  mat := ComboBox2.Text;

  DataModule6.queryProizvodDimenzija.First;
  while not DataModule6.queryProizvodDimenzija.Eof do
  begin

    if DataModule6.queryProizvodDimenzija['Naziv'] = kat then
    begin
      idpro :=  DataModule6.queryProizvodDimenzija['ID_Proizvod'];
    end;

    DataModule6.queryProizvodDimenzija.Next;
  end;



  DataModule6.queryProizvodMaterijal.First;
  while not DataModule6.queryProizvodMaterijal.Eof do
  begin

    if DataModule6.queryProizvodMaterijal['Naziv'] = mat then
    begin
      idmat :=  DataModule6.queryProizvodMaterijal['ID_Materijal'];
    end;

    DataModule6.queryProizvodMaterijal.Next;
  end;



  DataModule6.queryExec.ExecSQL('INSERT INTO Proi_Mat(ID_Proizvod, ID_Materijal) VALUES ("' + idpro +'", "' + idmat +'")');

  ShowMessage('Proizvodu: "' + kat +'", ' + sLineBreak + 'dodali ste materijal: "' + mat +'"!');



end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;

procedure TForm9.FormShow(Sender: TObject);
begin

  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  ComboBox3.Items.Clear;

  DataModul.DataModule6.queryProizvodDimenzija.First;
  DataModul.DataModule6.queryProizvodKat.First;
  DataModul.DataModule6.queryProizvodMaterijal.First;

  while not DataModul.DataModule6.queryProizvodKat.Eof do
    begin
      ComboBox1.items.Add(DataModul.DataModule6.queryProizvodKat['Naziv']);
      DataModul.DataModule6.queryProizvodKat.Next;
    end;

  while not DataModul.DataModule6.queryProizvodMaterijal.Eof do
    begin
      ComboBox2.items.Add(DataModul.DataModule6.queryProizvodMaterijal['Naziv']);
      DataModul.DataModule6.queryProizvodMaterijal.Next;
    end;

  while not DataModul.DataModule6.queryProizvodDimenzija.Eof do
    begin
      ComboBox3.items.Add(DataModul.DataModule6.queryProizvodDimenzija['Naziv']);
      DataModul.DataModule6.queryProizvodDimenzija.Next;
    end;


end;

end.
