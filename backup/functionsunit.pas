unit functionsUnit;

{$mode objfpc}{$H+}

interface

uses
    Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
    ComCtrls, ExtCtrls, math;

procedure ReportError(s:String; lbl:TLabel);
function IsInBounds(x,y:Integer; grid:TStringGrid):Boolean;
function IsStringCorrect(s:String; alowedChars:String):Boolean;
function IsStringCorrectInv(s:String; disalowedChars:String):Boolean;
function roundToN(x:Real; n:Integer):Real;

implementation

procedure ReportError(s:String; lbl:TLabel);
Begin
     lbl.Caption := s;
end;

function IsInBounds(x,y:Integer; grid:TStringGrid):Boolean;
Begin
    If ((x >= 0) and (x < grid.ColCount)) and ( (y >=0) and (y < grid.RowCount))
       then result := true
    else result := false;
end;

//Checks if all symbols in the string 's' are in string 'alowedChars'
function IsStringCorrect(s:String; alowedChars:String):Boolean;
var
   i,j:Integer;
   stringCorrect:Boolean;
   symbolCorrect:Boolean;
Begin
     If s.Length > 0 then stringCorrect := true
        else stringCorrect := false;
     for i := 1 to length(s) do
         Begin
              symbolCorrect := false;
              for j := 1 to alowedChars.Length do
                  if s[i] = alowedChars[j] then symbolCorrect := true;
              if not symbolCorrect then stringCorrect := false;
         end;
     result := stringCorrect;
end;

//Inversed version of IsStringCorrect.
//Checks if all symbols in the string 's' are NOT in string 'alowedChars'
function IsStringCorrectInv(s:String; disalowedChars:String):Boolean;
var
   i,j:Integer;
   stringCorrect:Boolean;
   symbolCorrect:Boolean;
Begin
     If s.Length > 0 then stringCorrect := true
        else stringCorrect := false;
     for i := 1 to s.Length do
         Begin
              symbolCorrect := true;
              for j := 1 to disalowedChars.Length do
                  if s[i] = disalowedChars[j] then symbolCorrect := false;
              if not symbolCorrect then stringCorrect := false;
         end;
     result := stringCorrect;
end;

function roundToN(x:Real; n:Integer):Real;
var
   y : Integer;
Begin
     y := trunc(power(10, n));
     x := Round(x * y) / y;
     result := x;
end;

end.

