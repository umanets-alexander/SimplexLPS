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
    RandomBox: TCheckBox;
    ButtonAdd: TButton;
    LabelM: TLabel;
    LabelN: TLabel;
    ButtonLeft: TButton;
    ButtonRight: TButton;
    LabelNum: TLabel;
    ButtonCalc: TButton;
    ButtonClose: TButton;
    procedure ButtonCloseClick(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonCalcClick(Sender: TObject);
    procedure ButtonLeftClick(Sender: TObject);
    procedure ButtonRightClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:  array[0..100000000] of double;
  k, kMax: integer; //номер итерации
  mt, nt: integer; //номера строк и столбцов
  aij:  array[0..65535,0..1] of word; //номер итерации, (номер строки, номер столбца выбранного элемента)
  Num:  array[0..65535] of dword; // стартовые номера итераций для массива истории a

implementation

{$R *.dfm}

procedure TForm1.ButtonAddClick(Sender: TObject);
var i,j: dword;
begin
  if (0 < StrToInt(EditN.Text)) and (0 < StrToInt(EditM.Text)) then
    begin
      ButtonLeft.Enabled := false;
      ButtonRight.Enabled := false;
      StringGrid1.Options := StringGrid1.Options + [goEditing];
      k := 0;
      LabelNum.Caption := IntToStr(k + 1);
      StringGrid1.ColCount := StrToInt(EditN.Text) + 2;
      StringGrid1.RowCount := StrToInt(EditM.Text) + 2;
      StringGrid1.Cells[0,0] := 'базис. / своб.';
      StringGrid1.Cells[StrToInt(EditN.Text) + 1,0] := 'своб. члены';
      i := 0;
      for j := 1 to StringGrid1.ColCount - 2 do
        StringGrid1.Cells[j,i] := 'X' + IntToStr(j);
      j := 0;
      for i := 1 to StringGrid1.RowCount - 2 do
        StringGrid1.Cells[j,i] := 'Y' + IntToStr(i);
      for i := 1 to StringGrid1.RowCount - 1 do
        for j := 1 to StringGrid1.ColCount - 1 do
          if RandomBox.Checked then StringGrid1.Cells[j,i] := IntToStr(10 - Random(21))
          else StringGrid1.Cells[j,i] := '0';
      StringGrid1.Cells[0,StringGrid1.RowCount - 1] := 'L';
      ButtonAdd.Caption := 'Пересоздать симплекс-таблицу';
      LabelNum.Caption := inttostr(k);
      ButtonCalc.Enabled := false;
      StringGrid1.FixedRows := 1;
      StringGrid1.FixedCols := 1;
      mt := 1;
      LabelM.Caption := 'Строка: ' + inttostr(mt);
      nt := 1;
      LabelN.Caption := 'Столбец: ' + inttostr(nt);
      StringGrid1.Row := 1;
      StringGrid1.Col := 1;
      Num[0] := 0
    end
  else ShowMessage('Размерность матрицы не должна быть нулевой. Повторите ввод!');
end;

procedure TForm1.ButtonCalcClick(Sender: TObject);
var i,j,p,s,n,m: integer;
    tmp: string;

Procedure Next(ap,bp: pointer; r,p,m,n: dword);
var a: array of double absolute ap;
    b: array of double absolute bp;
    i,j: dword;

function ra(i,j: dword): double;
  begin
    ra :=a[i * (n + 1) + j]
  end;

function rb(i,j: dword): double;
  begin
    rb := b[i * (n + 1) + j]
  end;

procedure wa(i,j: dword; f: double);
  begin
    a[i * (n + 1) + j] := f
  end;

procedure wb(i,j: dword; f: double);
  begin
    b[i * (n + 1) + j] := f
  end;

begin
  wb(r,p,1 / ra(r,p));//имеем 1/Arp
    for j := 0 to n do  //получаем новую разрешающую строку
      if j <> p then wb(r,j, ra(r,j) / ra(r,p));
    for i := 0 to m do  //получаем новый разрешающий столбец
      if i <> r then wb(i,p, -ra(i,p) / ra(r,p));
    for i := 0 to m do  //получаем новую симплекс-таблицу
      for j := 0 to n do
        if (i <> r)and(j <> p) then wb(i,j, ra(i,j) + ra(r,j) * rb(i,p))
end;

begin
  if (StringGrid1.col < StringGrid1.ColCount - 1)and(StringGrid1.row < StringGrid1.rowCount - 1) then begin
    if strtofloat(StringGrid1.Cells[StringGrid1.Col,StringGrid1.row]) = 0.0 then begin
      ShowMessage('Выбран нулевой элемент');
  exit
end;

//сохраняем содержимое в массив истории а
m := StringGrid1.RowCount - 1;
n := StringGrid1.ColCount - 1;
aij[k,0] := StringGrid1.row;
aij[k,1] := StringGrid1.col;
s := Num[k];
p := s;
for i := 1 to m do
  for j := 1 to n do begin
    a[s] := strtofloat(StringGrid1.cells[j,i]);
    s := s + 1
  end;
Num[k + 1] :=s ;
tmp := StringGrid1.Cells[0,StringGrid1.Row];
StringGrid1.Cells[0,StringGrid1.Row] := StringGrid1.Cells[StringGrid1.Col,0];
StringGrid1.Cells[StringGrid1.Col,0] := tmp;
Next(@a[p],@a[s],StringGrid1.row - 1,StringGrid1.col - 1,m - 1,n - 1);
k := k + 1;
kMax := k - 1;
LabelNum.Caption := inttostr(k);
for i := 1 to m do
  for j := 1 to n do begin
    StringGrid1.cells[j,i] := floattostr(a[s]);
    s := s+1
  end;
StringGrid1.Options := StringGrid1.Options-[goEditing];
ButtonCalc.Enabled := false;
ButtonRight.Enabled := false;
ButtonLeft.Enabled := true
end else ShowMessage('Неверно выбран столбец и/или строка');
end;

procedure TForm1.ButtonCloseClick(Sender: TObject);
begin
  form1.Close;
end;

procedure TForm1.ButtonLeftClick(Sender: TObject);
var i,j,s,n,m: integer;
    tmp: string;
begin
  aij[k,0] := StringGrid1.row;
  aij[k,1] := StringGrid1.col;
  k := k - 1;
  m := StringGrid1.RowCount - 1;
  n := StringGrid1.ColCount - 1;
  StringGrid1.row := aij[k,0];
  StringGrid1.col := aij[k,1];
  s := Num[k];
  for i := 1 to m do
    for j := 1 to n do begin
      StringGrid1.cells[j,i] := floattostr(a[s]);
      s := s + 1
    end;
  tmp := StringGrid1.Cells[0,StringGrid1.Row];
  StringGrid1.Cells[0,StringGrid1.Row] := StringGrid1.Cells[StringGrid1.Col,0];
  StringGrid1.Cells[StringGrid1.Col,0] := tmp;
  LabelNum.Caption:=inttostr(k);
  if k = 0 then ButtonLeft.Enabled := false;
  ButtonRight.Enabled := true;
  ButtonCalc.Enabled := false
end;

procedure TForm1.ButtonRightClick(Sender: TObject);
var i,j,s,n,m: integer;
    tmp: string;
begin
  k := k + 1;
  m := StringGrid1.RowCount - 1;
  n := StringGrid1.ColCount - 1;
  StringGrid1.row := aij[k,0];
  StringGrid1.col := aij[k,1];
  s := Num[k];
  for i := 1 to m do
    for j := 1 to n do begin
      StringGrid1.cells[j,i] := floattostr(a[s]);
      s := s + 1
    end;
  tmp := StringGrid1.Cells[0,StringGrid1.Row];
  StringGrid1.Cells[0,StringGrid1.Row] := StringGrid1.Cells[StringGrid1.Col,0];
  StringGrid1.Cells[StringGrid1.Col,0] := tmp;
  LabelNum.Caption:=inttostr(k);
  if k > kMax then ButtonRight.Enabled := false;
  ButtonLeft.Enabled := true;
  ButtonCalc.Enabled := false
end;

procedure TForm1.StringGrid1Click(Sender: TObject);
begin
  mt := StringGrid1.Row;
  LabelM.Caption := 'Строка: ' + inttostr(mt);
  nt := StringGrid1.Col;
  LabelN.Caption := 'Столбец: ' + inttostr(nt);
  ButtonCalc.Enabled := true
end;

end.
