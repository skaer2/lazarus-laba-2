unit Unit3;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls,
 ExtCtrls;

type

 { TForm3 }

 TForm3 = class(TForm)
     Button1: TButton;
     Edit1: TEdit;
     Label1: TLabel;
     LblErrorMessage: TLabel;
     PanelErrorMessage: TPanel;
     StringGrid1: TStringGrid;
     StringGrid2: TStringGrid;
     procedure Button1Click(Sender: TObject);
 private

 public

 end;

var
 Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
Var
begin

end;

end.

