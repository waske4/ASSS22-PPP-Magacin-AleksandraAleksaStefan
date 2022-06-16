unit SklProizvoda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  Data.Bind.Controls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Bind.Navigator,
  Vcl.NumberBox;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    FDQuery1: TFDQuery;
    FDConnection1: TFDConnection;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Edit1: TEdit;
    Edit5: TEdit;
    Edit8: TEdit;
    Button3: TButton;
    NavigatorBindSourceDB1: TBindNavigator;
    Label2: TLabel;
    Label3: TLabel;
    NumberBox1: TNumberBox;
    NumberBox2: TNumberBox;
    NumberBox3: TNumberBox;
    NumberBox4: TNumberBox;
    NumberBox5: TNumberBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    FDQuery2: TFDQuery;
    BindSourceDB2: TBindSourceDB;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
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
  Form4: TForm4;

implementation
  Uses Odabir;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  Form2.Show;
  self.Hide;
end;

procedure TForm4.Button3Click(Sender: TObject);

  var
  Ime1 : String;
  Visina : Integer;
  Debljina : Integer;
  Sirina : Integer;
  MATIZR : String;
  SERNUM : Integer;
  KOLBRV : Integer;
  TIP : String;


begin
  Ime1 := Edit1.Text;
  Visina := Round(NumberBox1.Value);;
  Debljina := Round(NumberBox2.Value);
  Sirina := Round(NumberBox3.Value);;
  MATIZR := Edit5.Text;
  SERNUM := Round(NumberBox4.Value);
  KOLBRV := Round(NumberBox5.Value);
  TIP    := Edit8.Text;

  with FDQuery2 do
  begin
      //Active := False;
      Close;
      SQL.Clear;
      SQL.Text := 'INSERT INTO proizvodi(Ime, Visina, Debljina, Sirina, Materijal_izrade, Serijski_broj, Kolicina_brava, Tip) VALUES ("'+ Ime1 +'","'+ IntToStr(Visina) +'","'+ IntToStr(Debljina) + '","'+ IntToStr(Sirina) +'","'+ MATIZR +'","'+ IntToStr(SERNUM) +'","'+ IntToStr(KOLBRV) +'","'+ TIP +'")' ;
      ExecSQL;
      //open;
  end;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
application.Terminate;
end;

end.
