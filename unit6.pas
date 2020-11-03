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
   EditClass: TEdit;
   EditGroup: TEdit;
   EditRoom: TEdit;
   GrpBxControls: TGroupBox;
   LblGroup: TLabel;
   LblClass: TLabel;
   LblColor: TLabel;
   LblRoom: TLabel;
   StringGrid1: TStringGrid;
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
 end;

var
 Form6: TForm6;

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
end;

procedure TForm6.ClBtnGroupColorColorChanged(Sender: TObject);
begin
     ClBtnGroupColor.ColorDialog.;
end;

end.

