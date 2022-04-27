unit frmSklProizvoda_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls,frmMain_u;

type
  TfrmSklProizvoda = class(TForm)
    btnClose: TBitBtn;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DBNavigator1: TDBNavigator;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSklProizvoda: TfrmSklProizvoda;

implementation

{$R *.dfm}

procedure TfrmSklProizvoda.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmSklProizvoda.FormCreate(Sender: TObject);
begin
  frmMain := TfrmMain.Create(self);
  frmMain.ShowModal;
end;

end.
