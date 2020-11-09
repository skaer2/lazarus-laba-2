unit Unit6;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
 ExtCtrls, Types;

type

 { TForm6 }

 TForm6 = class(TForm)
   BtnAdd: TButton;
   ClBtnGroupColor: TColorButton;
   ColorDialog1: TColorDialog;
   EditClass: TEdit;
   EditGroup: TEdit;
   EditRoom: TEdit;
   GrpBxControls: TGroupBox;
   LblGroup: TLabel;
   LblClass: TLabel;
   LblColor: TLabel;
   LblDay:TLabel;
   LblRoom: TLabel;
   RdBtnMonday:TRadioButton;
   RdBtnTuesday:TRadioButton;
   RdBtnWednesday:TRadioButton;
   RdBtnThursday:TRadioButton;
   RdBtnFriday:TRadioButton;
   RadioGroup1:TRadioGroup;
   StringGrid1: TStringGrid;
   procedure BtnAddClick(Sender: TObject);
   procedure ClBtnGroupColorColorChanged(Sender: TObject);
   procedure FormCreate(Sender: TObject);
   procedure RdBtnMondayChange(Sender:TObject);
   procedure StringGrid1DrawCell(Sender:TObject; aCol,aRow:Integer;
    aRect:TRect; aState:TGridDrawState);
 private

 public

 end;

 scheduleCell = record
   groupName:String;
   roomNumber:String;
   className:String;
   cellColor:TColor;
   day:byte; // 1 for monday to 5 for friday
 end;

Const
  ARR_SIZE=50;
  SC_MONDAY=1;
  SC_TUESDAY=2;
  SC_WEDNESDAY=3;
  SC_THURSDAY=4;
  SC_FRIDAY=5;

var
 Form6: TForm6;

 LockCrClr:Boolean;
 currentColor: TColor;

 scheduleCells: array[0..ARR_SIZE] of scheduleCell;
 groups: array[0..ARR_SIZE] of String;
 currentIndex:Integer;



implementation

{$R *.lfm}

{ TForm6 }

procedure TForm6.FormCreate(Sender: TObject);
begin
    StringGrid1.ColCount:=6;
    StringGrid1.RowCount:=1;
    StringGrid1.FixedCols:=1;
    StringGrid1.FixedRows:=1;

    StringGrid1.Cells[1,0] := 'Понедельник';
    StringGrid1.Cells[2,0] := 'Вторник';
    StringGrid1.Cells[3,0] := 'Среда';
    StringGrid1.Cells[4,0] := 'Четверг';
    StringGrid1.Cells[5,0] := 'Пятница';

    LockCrClr:=true;
    currentColor:=clDefault;
    LockCrClr:=false;

    RdBtnMonday.Checked:= true;
end;

procedure TForm6.StringGrid1DrawCell(Sender:TObject; aCol,aRow:Integer;
 aRect:TRect; aState:TGridDrawState);
begin

end;

procedure TForm6.ClBtnGroupColorColorChanged(Sender: TObject);
begin
    While(not LockCrClr) do
    Begin
	    LockCrClr:=true;
        currentColor := ClBtnGroupColor.ColorDialog.Color;
    end;
    LockCrClr:=false;
end;

procedure TForm6.BtnAddClick(Sender: TObject);
begin
    If (EditClass.Text <> '') and (EditGroup.Text <> '') and (EditRoom.Text <> '') then
    Begin

    end
    else ShowMessage('Поля не могут быть пустыми');
end;

procedure TForm6.RdBtnMondayChange(Sender:TObject);
begin

end;

end.

