unit Unit5;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs,Grids,StdCtrls, Types;

type

 { TForm5 }

 TForm5 = class(TForm)
  Button1:TButton;
  StringGrid1:TStringGrid;
  procedure Button1Click(Sender:TObject);
  procedure FormCreate(Sender:TObject);
  procedure StringGrid1DrawCell(Sender:TObject; aCol,aRow:Integer; aRect:TRect;
   aState:TGridDrawState);
 private

 public

 end;

const
  ARR_SIZE_N = 4;
  ARR_SIZE_M = 4;

var
  Form5: TForm5;
  z : array[0..ARR_SIZE_N,0..ARR_SIZE_M] of Integer;
  generatedOnce:Boolean;
  calculatedColIndex:Integer;
  colIndexLock:Boolean;

implementation

{$R *.lfm}

{ TForm5 }

procedure TForm5.Button1Click(Sender:TObject);
var
   i,j:Integer;
   maxSum,sum:Integer;
   colIndex:Integer;
begin
     colIndexLock := true;

     Randomize();
     for i := 0 to ARR_SIZE_N - 1 do
         for j := 0 to ARR_SIZE_M - 1 do
             z[i,j] := random(5);

     maxSum := 0;
     for i := 0 to ARR_SIZE_N - 1 do
     Begin
         sum := 0;
         for j := 0 to ARR_SIZE_M do
             sum := sum + z[i,j];
         StringGrid1.Cells[i,0] := IntToStr(sum);
         If sum > maxSum then
         Begin
            maxSum := sum;
            colIndex:=i;
         end;
     end;

     calculatedColIndex := colIndex;

     for i := 0 to ARR_SIZE_N - 1 do
         for j := 1 to ARR_SIZE_M do
             StringGrid1.Cells[i,j] := IntToStr(z[i,j - 1]);

     colIndexLock:=false;
     StringGrid1.Repaint();
end;

procedure TForm5.FormCreate(Sender:TObject);
begin
     colIndexLock:=true;
     StringGrid1.ColCount:=ARR_SIZE_N;
     StringGrid1.FixedCols:=0;
     StringGrid1.RowCount:=ARR_SIZE_M + 1;
     StringGrid1.FixedRows:=1;
end;

procedure TForm5.StringGrid1DrawCell(Sender:TObject; aCol,aRow:Integer;
 aRect:TRect; aState:TGridDrawState);
var
   rAlign:TTextStyle;
begin
     If (not colIndexLock) then
        Begin
        if (ACol = calculatedColIndex) and (ARow > 0) then
           begin
                with TStringGrid(Sender) do
                begin
                rAlign := Canvas.TextStyle;
                rAlign.Alignment:=taRightJustify;
                Canvas.TextStyle := rAlign;
                Canvas.Brush.Color := clGreen;
                Canvas.FillRect(aRect);
                Canvas.TextRect(aRect,aRect.Left+2,aRect.Top+2,Cells[ACol, ARow] + ' ',rAlign);
                end;
           end;
        end;
           Begin
                with TStringGrid(Sender) do
                begin
                rAlign := Canvas.TextStyle;
                rAlign.Alignment:=taRightJustify;
                Canvas.TextStyle := rAlign;
                Canvas.FillRect(aRect);
                Canvas.TextRect(aRect,aRect.Left+2,aRect.Top+2,Cells[ACol, ARow] + ' ',rAlign);
                end;
           end;
end;

end.

