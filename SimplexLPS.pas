unit SimplexLPS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    EditM: TEdit;
    Label2: TLabel;
    EditN: TEdit;
    CheckBox1: TCheckBox;
    ButtonAdd: TButton;
    LabelM: TLabel;
    LabelN: TLabel;
    ButtonLeft: TButton;
    ButtonRight: TButton;
    LabelNum: TLabel;
    ButtonCalc: TButton;
    ButtonClose: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
