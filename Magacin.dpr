program Magacin;

uses
  Vcl.Forms,
  Login in 'Login.pas' {Form1},
  Odabir in 'Odabir.pas' {Form2},
  SklMaterijala in 'SklMaterijala.pas' {Form3},
  SklProizvoda in 'SklProizvoda.pas' {Form4},
  Register in 'Register.pas' {Form5},
  DataModul in 'DataModul.pas' {DataModule6: TDataModule},
  PregMagacin in 'PregMagacin.pas' {Form6},
  PregProizvod in 'PregProizvod.pas' {Form7},
  UnosProizvod in 'UnosProizvod.pas' {Form8},
  Unos in 'Unos.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TDataModule6, DataModule6);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
