unit SklMaterijala;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.NumberBox,
  Data.Bind.Controls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Bind.Navigator;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    NumberBox1: TNumberBox;
    BindSourceDB2: TBindSourceDB;
    NavigatorBindSourceDB1: TBindNavigator;
    FDQuery2: TFDQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;


implementation
   Uses Odabir;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form2.Show;
  self.Hide;
end;

procedure TForm3.Button3Click(Sender: TObject);

var
  Naz :  String;
  Vrsta : String;
  Kolicina : Integer;
  Sastav : String;


begin

  Naz := Edit1.Text;
  Vrsta := Edit2.Text;
  Kolicina := Round(NumberBox1.Value);
  Sastav := Edit4.Text;

  with FDQuery2 do
  begin
      //Active := False;
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO materijal(Naziv,Vrsta,Kolicina,Sastav) VALUES ("'+ Naz +'","'+ Vrsta +'","'+ IntToStr(Kolicina) + '","'+ Sastav +'")' ;
      ExecSQL;
      //open;
  end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

end.
