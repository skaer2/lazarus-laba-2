unit Unit2;

{$mode objfpc}{$H+}

interface

uses
 Classes,SysUtils,Forms,Controls,Graphics,Dialogs,Grids,StdCtrls,ExtCtrls, functionsUnit, Types;

type

 { TForm2 }

 TForm2 = class(TForm)
   BtnGenerate: TButton;
   EditGenArray: TEdit;
   EditA: TEdit;
   EditB: TEdit;
   GrpBxControls: TGroupBox;
   LblEnterNums: TLabel;
   LblErrorMessage:TLabel;
   LblGenArray: TLabel;
   LblA: TLabel;
   LblB: TLabel;
   PanelErrorMessage1:TPanel;
   StringGrid1: TStringGrid;
   procedure BtnGenerateClick(Sender: TObject);
   procedure FormCreate(Sender: TObject);
   procedure StringGrid1DrawCell(Sender:TObject; aCol,aRow:Integer;
    aRect:TRect; aState:TGridDrawState);
 private

 public

 end;

const
  ARR_SIZE_N = 5000;

var
 Form2: TForm2;
 a,b:Integer;
 genArrEmpty:Boolean;
 genArr:array[0..ARR_SIZE_N] of TPoint;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin
     genArrEmpty := true;
end;

procedure TForm2.StringGrid1DrawCell(Sender:TObject; aCol,aRow:Integer;
 aRect:TRect; aState:TGridDrawState);
var
   i:Integer;
begin
     If not genArrEmpty then
        Begin
        For i := 0 to (a*b) do
        if (ACol = genArr[i].Y) and (ARow = genArr[i].X) then
           begin
                with TStringGrid(Sender) do
                begin
                Cells[ACol,ARow] := 'X';
                Canvas.Brush.Color := clRed;
                Canvas.FillRect(aRect);
                Canvas.TextOut(aRect.Left+2,aRect.Top+2,Cells[ACol, ARow]);
                end;
           end;
        end;
end;

procedure TForm2.BtnGenerateClick(Sender: TObject);
Var
   i:Integer;
begin
     Randomize();

     If not TryStrToInt(EditA.Text, a) then ReportError('Поле "А" поддерживает только числа', LblErrorMessage)
     else If not TryStrToInt(EditB.Text, b) then ReportError('Поле "B" поддерживает только числа', LblErrorMessage)
        else Begin
             genArrEmpty := false;
             EditGenArray.Text := '';
             StringGrid1.ColCount := a;
             StringGrid1.RowCount := b;
             StringGrid1.Clean;

             genArr[0].X := random(a);
             genArr[0].Y := random(b);
             EditGenArray.Text := EditGenArray.Text + '0 [' + genArr[0].X.ToString + ','  +  genArr[0].y.ToString + ']';
             For i := 1 to (a * b) do
                 Begin
                     genArr[i].X := random(a);
                     genArr[i].Y := random(b);
                     EditGenArray.Text := EditGenArray.Text + ',' + IntToStr(i) + '[' + IntToStr(genArr[i].X) + ',' + IntToStr(genArr[i].y) + ']';
                 end;
             StringGrid1.Repaint();
        end;
end;

end.

