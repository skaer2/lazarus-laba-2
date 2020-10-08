unit Unit1;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
 PopupNotifier, ComCtrls, ExtCtrls, functionsUnit;

type

 { TForm1 }

 TForm1 = class(TForm)
     BtnAddValue: TButton;
     BtnChangeSize: TButton;
     EditNewSizeN: TEdit;
     EditNewSizeM: TEdit;
     EditInputValue: TEdit;
     EditInputXIndex: TEdit;
     EditInputYIndex: TEdit;
     LblErrorMessage: TLabel;
     LblInputX: TLabel;
     LblNewSizeN: TLabel;
     LblInputY: TLabel;
     LblNewSizeM: TLabel;
     Panel1: TPanel;
     PanelErrorMessage: TPanel;
     StringGrid1:TStringGrid;
     procedure BtnChangeSizeClick(Sender: TObject);
     function DoCheckIndexInputs():Boolean;
     function DoCheckSizeInputs():Boolean;
     procedure BtnAddValueClick(Sender: TObject);
 private

 public

 end;

Const
   NUMERIC_CHARS = '1234567890';
var
   Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.DoCheckIndexInputs():Boolean;
var
   f1:Boolean;
   f2:Boolean;
Begin
     f1 := Not IsStringCorrect(EditInputXIndex.Text, NUMERIC_CHARS); //X field
     f2 := Not IsStringCorrect(EditInputYIndex.Text, NUMERIC_CHARS); //Y field

     If f1 or f2 then
     Begin
         If f1
            then ReportError('Поле "X" может содержать только числа', LblErrorMessage)
            else
              If f2
                 then ReportError('Поле "Y" может содержать только числа', LblErrorMessage);
         If f1 = f2
            then ReportError('Поля "X" и "Y" могут содержать только числа', LblErrorMessage);
         result := false;
     end
     else result := true;
end;

procedure TForm1.BtnAddValueClick(Sender: TObject);
Var
   x,y:integer;
begin
     If DoCheckIndexInputs() then
     Begin
        x := StrToInt(EditInputXIndex.Text);
        y := StrToInt(EditInputYIndex.Text);
        if IsInBounds(x,y)
           then StringGrid1.Cells[x,y] := EditInputValue.Text
        else ReportError('Введеные значения вне границ таблицы', LblErrorMessage);
     end;
end;

function TForm1.DoCheckSizeInputs():Boolean;
var
   f1:Boolean;
   f2:Boolean;
Begin
     f1 := Not IsStringCorrect(EditNewSizeN.Text, NUMERIC_CHARS); //X field
     f2 := Not IsStringCorrect(EditNewSizeM.Text, NUMERIC_CHARS); //Y field

     If f1 or f2 then
     Begin
         If f1
            then ReportError('Поле "N" может содержать только числа', LblErrorMessage)
            else
              If f2
                 then ReportError('Поле "M" может содержать только числа', LblErrorMessage);
         If f1 = f2
            then ReportError('Поля "N" и "M" могут содержать только числа', LblErrorMessage);
         result := false;
     end
     else result := true;
end;

procedure TForm1.BtnChangeSizeClick(Sender: TObject);
var
   n,m:Integer;
begin
     If DoCheckSizeInputs() then
     Begin
        n := StrToInt(EditNewSizeN.Text);
        m := StrToInt(EditNewSizeM.Text);
        StringGrid1.ColCount := n;
        StringGrid1.RowCount := m;
     end;
end;


end.

