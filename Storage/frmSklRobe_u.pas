unit frmSklRobe_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmSklRobe = class(TForm)
    btnClose: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSklRobe: TfrmSklRobe;

implementation
  Uses frmMain_u;

{$R *.dfm}

procedure TfrmSklRobe.btnCloseClick(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmSklRobe.FormCreate(Sender: TObject);
begin
  frmMain := TfrmMain.Create(self);
  frmMain.ShowModal;
end;

end.
