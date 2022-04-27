unit frmIntro_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.jpeg;

type
  TfrmIntro = class(TForm)
    Image1: TImage;
    edtName: TEdit;
    edtPassword: TEdit;
    btnLogin: TBitBtn;
    Cancle: TBitBtn;
    procedure btnLoginClick(Sender: TObject);
    procedure CancleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NewString : integer;
  end;

var
  frmIntro: TfrmIntro;
  sName, sPass, sPass1 : string;

implementation

{$R *.dfm}

procedure TfrmIntro.btnLoginClick(Sender: TObject);
begin
  sPass := edtPassword.Text;
  sPass1 := 'storage';
  if edtName.Text = '' then
  begin
    ShowMessage('Unesite validno ime!!');
  end;
  if edtPassword.Text = '' then
  begin
    ShowMessage('Unesite validnu sifru!!');
  end;
  if sPass = sPass1 then
  begin
    NewString := 1;
    close;
  end
  else
  begin
    ShowMessage('Netacna sifra!!!');
  end;
end;

procedure TfrmIntro.CancleClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
