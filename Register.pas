unit Register;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DataModul,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Image1: TImage;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
  Uses Login;
{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);

var
  User :  String;
  Pass : String;


begin

  User := Edit1.Text;
  Pass := Edit2.Text;

  DataModule6.FDQuery1.ExecSQL ('INSERT INTO Korisnik(Username, Password) VALUES ("' + User + '", "' + Pass + '")');

//  with FDQuery1 do
//  begin
//      Active := False;
//      Close;
//      SQL.Clear;
//      SQL.Text := 'INSERT INTO Korisnik(Username,Password) VALUES ("'+ User +'","'+ Pass +'")';
//      ExecSQL;
//  end;
  ShowMessage('USPESNA REGISTRACIJA!!!');
  Self.Hide;
  Form1.Show;

end;

procedure TForm5.Button2Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

end.
