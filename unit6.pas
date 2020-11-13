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
   LblClassNum: TLabel;
   LblGroup: TLabel;
   LblClass: TLabel;
   LblColor: TLabel;
   LblDay:TLabel;
   LblRoom: TLabel;
   RadioGroup2: TRadioGroup;
   RdBtnClNumFifth: TRadioButton;
   RdBtnMonday:TRadioButton;
   RdBtnClNumFirst: TRadioButton;
   RdBtnClNumThourth: TRadioButton;
   RdBtnTuesday:TRadioButton;
   RdBtnClNumSecond: TRadioButton;
   RdBtnWednesday:TRadioButton;
   RdBtnThursday:TRadioButton;
   RdBtnFriday:TRadioButton;
   RadioGroup1:TRadioGroup;
   RdBtnClNumThird: TRadioButton;
   StringGrid1: TStringGrid;
   procedure BtnAddClick(Sender: TObject);
   procedure ClBtnGroupColorColorChanged(Sender: TObject);
   procedure FormCreate(Sender: TObject);
   procedure RdBtnClNumFifthChange(Sender: TObject);
   procedure RdBtnClNumFirstChange(Sender: TObject);
   procedure RdBtnClNumSecondChange(Sender: TObject);
   procedure RdBtnClNumThirdChange(Sender: TObject);
   procedure RdBtnClNumThourthChange(Sender: TObject);
   procedure RdBtnFridayChange(Sender: TObject);
   procedure RdBtnMondayChange(Sender:TObject);
   procedure RdBtnThursdayChange(Sender: TObject);
   procedure RdBtnTuesdayChange(Sender: TObject);
   procedure RdBtnWednesdayChange(Sender: TObject);
   procedure StringGrid1DrawCell(Sender:TObject; aCol,aRow:Integer;
    aRect:TRect; aState:TGridDrawState);
 private

 public

 end;

 scheduleCell = record
   groupName: String;
   roomNumber: String;
   className: String;
   cellColor: TColor;
   classNum: Integer;
   day: integer; // 1 for monday to 5 for friday
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

 LockCrClr: Boolean;
 currentColor: TColor;

 scheduleCells: array[0..ARR_SIZE] of scheduleCell;
 groups: array[0..ARR_SIZE] of String;
 currentIndex: Integer;

 selectedDay: integer;
 LockSelDay: Boolean;

 SelectedClNum: integer;
 LockSelClNum: Boolean;

implementation

{$R *.lfm}

{ TForm6 }

procedure TForm6.FormCreate(Sender: TObject);
begin
    StringGrid1.ColCount:=6;
    StringGrid1.RowCount:=6;
    StringGrid1.FixedCols:=1;
    StringGrid1.FixedRows:=1;

    StringGrid1.Cells[1,0] := 'Понедельник';
    StringGrid1.Cells[2,0] := 'Вторник';
    StringGrid1.Cells[3,0] := 'Среда';
    StringGrid1.Cells[4,0] := 'Четверг';
    StringGrid1.Cells[5,0] := 'Пятница';

    StringGrid1.Cells[0,1] := '1';
    StringGrid1.Cells[0,2] := '2';
    StringGrid1.Cells[0,3] := '3';
    StringGrid1.Cells[0,4] := '4';
    StringGrid1.Cells[0,5] := '5';

    LockCrClr:=true;
    currentColor:=clDefault;
    LockCrClr:=false;

    LockSelDay := true;
    RdBtnMonday.Checked := true;
    selectedDay := SC_MONDAY;
    LockSelDay := false;

    LockSelClNum := true;
    SelectedClNum := 1;
    LockSelClNum := false;
end;

procedure TForm6.StringGrid1DrawCell(Sender:TObject; aCol,aRow:Integer;
 aRect:TRect; aState:TGridDrawState);
begin

end;

procedure TForm6.ClBtnGroupColorColorChanged(Sender: TObject);
begin
    While(not LockCrClr) do
    Begin
	    LockCrClr := true;
        currentColor := ClBtnGroupColor.ColorDialog.Color;
    end;
    LockCrClr:=false;
end;

function isScFree(day: integer; classNum: Integer; room: String): Boolean;
Var
  i:Integer;
  f: Boolean;
Begin
    f := true;
    for i := 0 to currentIndex do
        If (scheduleCells[i].day = day) and (scheduleCells[i].classNum = classNum) and () then ;
end;

procedure TForm6.BtnAddClick(Sender: TObject);
begin
    If (EditClass.Text <> '') and (EditGroup.Text <> '') and (EditRoom.Text <> '') then
    Begin
         While (not LockCrClr and not LockSelDay)
         Begin
             LockCrClr := true;
             LockSelDay := true;
             if (isScFree(selectedDay, SelectedClNum, EditRoom.Text) ) then
             Begin

	     end;
             currentIndex := currentIndex + 1;
	 end;
    end
    else ShowMessage('Поля не могут быть пустыми');
end;

procedure TForm6.RdBtnMondayChange(Sender:TObject);
begin
    LockSelDay := true;
    selectedDay := SC_MONDAY;
    LockSelDay := false;
end;

procedure TForm6.RdBtnTuesdayChange(Sender: TObject);
begin
    LockSelDay := true;
    selectedDay := SC_TUESDAY;
    LockSelDay := false;
end;

procedure TForm6.RdBtnWednesdayChange(Sender: TObject);
begin
    LockSelDay := true;
    selectedDay := SC_WEDNESDAY;
    LockSelDay := false;
end;

procedure TForm6.RdBtnThursdayChange(Sender: TObject);
begin
    LockSelDay := true;
    selectedDay := SC_THURSDAY;
    LockSelDay := false;
end;

procedure TForm6.RdBtnFridayChange(Sender: TObject);
begin
    LockSelDay := true;
    selectedDay := SC_FRIDAY;
    LockSelDay := false;
end;

procedure TForm6.RdBtnClNumFirstChange(Sender: TObject);
begin
    LockSelClNum := true;
    SelectedClNum := 1;
    LockSelClNum := false;
end;

procedure TForm6.RdBtnClNumSecondChange(Sender: TObject);
begin
    LockSelClNum := true;
    SelectedClNum := 2;
    LockSelClNum := false;
end;

procedure TForm6.RdBtnClNumThirdChange(Sender: TObject);
begin
    LockSelClNum := true;
    SelectedClNum := 3;
    LockSelClNum := false;
end;

procedure TForm6.RdBtnClNumThourthChange(Sender: TObject);
begin
    LockSelClNum := true;
    SelectedClNum := 4;
    LockSelClNum := false;
end;

procedure TForm6.RdBtnClNumFifthChange(Sender: TObject);
begin
    LockSelClNum := true;
    SelectedClNum := 5;
    LockSelClNum := false;
end;

end.

