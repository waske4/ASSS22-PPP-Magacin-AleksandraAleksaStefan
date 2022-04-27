unit frmMain_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmIntro_u, Vcl.StdCtrls, Vcl.Buttons, frmSklRobe_u;

type
  TfrmMain = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  iNew : integer;

implementation
 Uses frmSklProizvoda_u;
{$R *.dfm}

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  frmSklRobe.ShowModal;
  self.Close;
end;

procedure TfrmMain.BitBtn2Click(Sender: TObject);
begin
  frmSklProizvoda.ShowModal;
  self.Close;
end;

procedure TfrmMain.BitBtn3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  frmIntro := TfrmIntro.Create(self);
  frmIntro.ShowModal;
  iNew := frmIntro.NewString;
  if iNew = 0 then
  begin
    Application.Terminate;
  end;
end;

end.