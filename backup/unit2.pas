unit Unit2;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls;

type

 { TForm2 }

 TForm2 = class(TForm)
   BtnGenerate: TButton;
   BtnFill: TButton;
   EditGenArray: TEdit;
   EditA: TEdit;
   EditB: TEdit;
   GroupBox1: TGroupBox;
   LblEnterNums: TLabel;
   LblGenArray: TLabel;
   LblA: TLabel;
   LblB: TLabel;
   StringGrid1: TStringGrid;
   procedure BtnGenerateClick(Sender: TObject);
   procedure FormCreate(Sender: TObject);
 private

 public

 end;

var
 Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.BtnGenerateClick(Sender: TObject);
Var
   a,b:Int;
begin
     Randomize;


     TryStrToInt();
end;

end.

