unit Unit4;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls, functionsUnit;

type

 { TForm4 }

 TForm4 = class(TForm)
     Button1: TButton;
     StringGrid1: TStringGrid;
     StringGrid2: TStringGrid;
     function safeStrToInt(s:String):Integer;
     procedure Button1Click(Sender: TObject);
     procedure FormCreate(Sender: TObject);
 private

 public

 end;
const
  ARR_SIZE_N = 5;
  ARR_SIZE_M = 5;
  NUMERIC_CHARS = '-1234567890';

var
 Form4: TForm4;
 z : array[0..ARR_SIZE_N,0..ARR_SIZE_M] of Integer;

implementation

procedure TForm4.FormCreate(Sender: TObject);
Var
   i,j:Integer;
begin
     For i := 0 to ARR_SIZE_N - 1 do
         For j := 0 to ARR_SIZE_M - 1 do
         Begin
             z[i, j] := ARR_SIZE_M * i + j;
             StringGrid1.Cells[j, i] := IntToStr(z[i,j]);
         end;

end;

//If string contains a number then returns the number, otherwise returns zero
function TForm4.safeStrToInt(s:String):Integer;
Begin
     If IsStringCorrect(s, NUMERIC_CHARS) then
        result := StrToInt(s)
     else result := 0;
end;

procedure TForm4.Button1Click(Sender: TObject);
Var
   minV:Integer;
   buff:Integer;
   i,j:Integer;
begin
     For i := 0 to ARR_SIZE_N - 1 do
     Begin
         minV := safeStrToInt(StringGrid1.Cells[0, i]);
         For j := 0 to ARR_SIZE_M - 1 do
         Begin
             buff := safeStrToInt(StringGrid1.Cells[j, i]);
             If buff < minV
                then minV := buff;
         end;
         StringGrid2.Cells[0, i] := IntToStr(minV);
     end;
end;

{$R *.lfm}

end.

