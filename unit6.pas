unit Unit6;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
 ExtCtrls;

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
   LblRoom: TLabel;
   StringGrid1: TStringGrid;
   procedure BtnAddClick(Sender: TObject);
   procedure ClBtnGroupColorColorChanged(Sender: TObject);
   procedure FormCreate(Sender: TObject);
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
 currentColorLock:Boolean;
 currentColor: TColor;
 scheduleCells: array[ARR_SIZE] of scheduleCell;
 currentIndex:Integer;

implementation

{$R *.lfm}

{ TForm6 }

procedure TForm6.FormCreate(Sender: TObject);
begin
    StringGrid1.Cells[1,0] := 'Понедельник';
    StringGrid1.Cells[2,0] := 'Вторник';
    StringGrid1.Cells[3,0] := 'Среда';
    StringGrid1.Cells[4,0] := 'Четверг';
    StringGrid1.Cells[5,0] := 'Пятница';
    currentColor=clDef
end;

procedure TForm6.ClBtnGroupColorColorChanged(Sender: TObject);
begin
     currentColor := ClBtnGroupColor.ColorDialog.Color;
end;

procedure TForm6.BtnAddClick(Sender: TObject);
begin
  If (EditClass.Text <> '') and (EditGroup.Text <> '') and (EditRoom.Text <> '') then
     Begin

     end;
end;

end.

