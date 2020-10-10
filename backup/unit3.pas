unit Unit3;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
 ExtCtrls, functionsUnit;

type

 { TForm3 }

 TForm3 = class(TForm)
     BtnCalculate: TButton;
     Edit1: TEdit;
     Label1: TLabel;
     LblErrorMessage: TLabel;
     PanelErrorMessage: TPanel;
     StringGrid1: TStringGrid;
     StringGrid2: TStringGrid;
     function DoCheckInput():Boolean;
     procedure BtnCalculateClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
 private

 public

 end;

const
  ARR_SIZE_N = 5;
  ARR_SIZE_M = 5;
  NUMERIC_CHARS = '1234567890';

var
 Form3: TForm3;
 z : array[0..ARR_SIZE_N,0..ARR_SIZE_M] of Integer;
 d : array[0..ARR_SIZE_N,0..ARR_SIZE_M] of Real;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.FormCreate(Sender: TObject);
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

function TForm3.DoCheckInput():Boolean;
var
   f1:Boolean;
Begin
     f1 := IsStringCorrect(Edit1.Text, NUMERIC_CHARS); //N field

     result := f1;
     If not f1 then ReportError('Поле "N" может содержать только числа', LblErrorMessage);
end;

procedure TForm3.BtnCalculateClick(Sender: TObject);
Var
   i,j:Integer;
   n:Integer;
   Y:real;
Begin
     If DoCheckInput() then
        Begin
          n := StrToInt(Edit1.Text);
          If n <> 0 then
             Begin
                  For i := 0 to ARR_SIZE_N - 1 do
                      For j := 0 to ARR_SIZE_M - 1 do
                      Begin
                           d[i, j] := z[i, j] / n;
                           StringGrid2.Cells[j, i] := FloatToStr(roundToN(d[i,j],1));
                      end;
             end
          else ReportError('Поле "N" не может быть нулём', LblErrorMessage);
        end;
end;

end.

