unit Odabir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SklMaterijala, SklProizvoda, DataModul,
  Vcl.Grids, PregMagacin, PregProizvod, UnosProizvod, Unos;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
  Uses Login;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form3.Show;
  self.Hide;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Form4.Show;
  self.Hide;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  self.Hide;
  Form6.Show;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
    self.Hide;
    Form7.Show;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
    self.Hide;
    Form9.Show;
end;


procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

end.
