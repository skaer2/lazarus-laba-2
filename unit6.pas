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
   Button1:TButton;
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
   procedure populateGrid();
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

 currentColor: TColor;

 scheduleCells: array[0..ARR_SIZE] of scheduleCell;
 groups: array[0..ARR_SIZE] of String;
 currentIndex: Integer;

 selectedDay: integer;

 SelectedClNum: integer;
implementation

{$R *.lfm}

{ TForm6 }

function newScheduleCell(groupName, roomNumber, className: String; cellColor: TColor; classNum, day: integer): scheduleCell;
var
    buff: scheduleCell;
begin
    buff.groupName := groupName;
    buff.roomNumber := roomNumber;
    buff.className := className;
    buff.cellColor := cellColor;
    buff.classNum := classNum;
    buff.day := day;

    result := buff;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin

    currentIndex := -1;

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

    currentColor:=clDefault;
    RdBtnMonday.Checked := true;
    selectedDay := SC_MONDAY;
    SelectedClNum := 1;
end;

procedure TForm6.StringGrid1DrawCell(Sender:TObject; aCol,aRow:Integer;
 aRect:TRect; aState:TGridDrawState);
var
   multiline: TTextStyle;
   i: Integer;
begin
    For i := 0 to currentIndex do
        if (ACol = scheduleCells[i].day) and (ARow = scheduleCells[i].classNum) then
        begin
             with TStringGrid(Sender) do
	             begin
                 multiline := Canvas.TextStyle;
                 multiline.SingleLine := false;
                 Canvas.TextStyle := multiline;
                 Canvas.Brush.Color := scheduleCells[i].cellColor;
                 Canvas.FillRect(aRect);
                 Canvas.TextRect(aRect,aRect.Left+2,aRect.Top+2,Cells[ACol, ARow], multiline);
                 end;
        end;
end;

procedure TForm6.ClBtnGroupColorColorChanged(Sender: TObject);
begin
    currentColor := ClBtnGroupColor.ColorDialog.Color;
end;

function isScFree(day: integer; classNum: Integer; room: String): Boolean;
Var
  i:Integer;
  f: Boolean;
Begin
    f := true;
    for i := 0 to currentIndex do
        If (scheduleCells[i].day = day) and (scheduleCells[i].classNum = classNum) then f := false;
    result := f;
end;

procedure TForm6.populateGrid();
Var
  i:Integer;
  k,l:Integer;
Begin
    for i := 0 to currentIndex do
    Begin
        k := scheduleCells[i].day;
        l := scheduleCells[i].classNum;
        StringGrid1.Cells[k,l] := 'Группа ' + scheduleCells[i].groupName + '/ауд.' + scheduleCells[i].roomNumber + LineEnding + scheduleCells[i].className;
	end;
end;

procedure TForm6.BtnAddClick(Sender: TObject);
begin
    If (EditClass.Text <> '') and (EditGroup.Text <> '') and (EditRoom.Text <> '') then
    Begin
         if (isScFree(selectedDay, SelectedClNum, EditRoom.Text)) then
         Begin
              currentIndex := currentIndex + 1;
              scheduleCells[currentIndex] := newScheduleCell(EditGroup.Text, EditRoom.Text, EditClass.Text, currentColor, SelectedClNum, selectedDay);
	     end
         else ShowMessage('Аудитория занята');
    end
    else ShowMessage('Поля не могут быть пустыми');
    populateGrid();
    StringGrid1.Repaint();

end;

procedure TForm6.RdBtnMondayChange(Sender:TObject);
begin
    selectedDay := SC_MONDAY;
end;

procedure TForm6.RdBtnTuesdayChange(Sender: TObject);
begin
    selectedDay := SC_TUESDAY;
end;

procedure TForm6.RdBtnWednesdayChange(Sender: TObject);
begin
    selectedDay := SC_WEDNESDAY;
end;

procedure TForm6.RdBtnThursdayChange(Sender: TObject);
begin
    selectedDay := SC_THURSDAY;
end;

procedure TForm6.RdBtnFridayChange(Sender: TObject);
begin
    selectedDay := SC_FRIDAY;
end;

procedure TForm6.RdBtnClNumFirstChange(Sender: TObject);
begin
    SelectedClNum := 1;
end;

procedure TForm6.RdBtnClNumSecondChange(Sender: TObject);
begin
    SelectedClNum := 2;
end;

procedure TForm6.RdBtnClNumThirdChange(Sender: TObject);
begin
    SelectedClNum := 3;
end;

procedure TForm6.RdBtnClNumThourthChange(Sender: TObject);
begin
    SelectedClNum := 4;
end;

procedure TForm6.RdBtnClNumFifthChange(Sender: TObject);
begin
    SelectedClNum := 5;
end;

end.

