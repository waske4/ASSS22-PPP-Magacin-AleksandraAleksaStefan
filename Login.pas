unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Odabir, Vcl.Imaging.jpeg, DataModul,
  Vcl.ExtCtrls, Register;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  var user,pass,user1,pass1 : String;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin

  DataModule6.queryKorisnici.Refresh;
  user := Edit1.Text;
  pass := Edit2.Text;

  user1 := DataModule6.queryKorisnici['Username'];
  pass1 := DataModule6.queryKorisnici['Password'];

  //for()

  DataModule6.queryKorisnici.First;
  while not DataModule6.queryKorisnici.Eof do
   begin
     user := DataModule6.queryKorisnici['Username'];
     pass := DataModule6.queryKorisnici['Password'];

     if Edit1.Text = user then
       begin
           if Edit2.Text = pass then
         begin
           Form2.Show;
           Self.Hide;
           exit
         end;

         ShowMessage('POGRESNA SIFRA!!!');
       end;

       DataModule6.queryKorisnici.Next;
   end;

   ShowMessage('PROVERITE UNETE PODATKE!!!');



//
//  if ((user = user1) and (pass = pass1)) then
//    begin
//       Form2.Show;
//       self.Hide;
//    end
//
//  else
//
//    begin
//      ShowMessage('PROVERITE UNETE PODATKE!!!');
//    end;

end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form5.Show;
  self.Hide;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

end.
