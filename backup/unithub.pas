unit unithub;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, Forms, Controls, Graphics, Dialogs,StdCtrls
 ,unit1
 ,unit2
 ,unit3
 ,unit4
 ,unit5
 ,unit6;

type

 { THubForm }

 THubForm = class(TForm)
  Button1:TButton;
  Button2:TButton;
  Button3:TButton;
  Button4:TButton;
  Button5:TButton;
  Button6:TButton;
  procedure Button1Click(Sender:TObject);
  procedure Button2Click(Sender:TObject);
  procedure Button3Click(Sender:TObject);
  procedure Button4Click(Sender:TObject);
  procedure Button5Click(Sender:TObject);
  procedure Button6Click(Sender:TObject);
  procedure CloseAll();
 private

 public

 end;

var
 HubForm: THubForm;

implementation

{$R *.lfm}

{ THubForm }

procedure THubForm.CloseAll();
Begin
     Form1.Close();
     Form2.Close();
     Form3.Close();
     Form4.Close();
     Form5.Close();
     Form6.Close();
end;

procedure THubForm.Button1Click(Sender:TObject);
begin
     CloseAll();
     Form1.Show();
end;

procedure THubForm.Button2Click(Sender:TObject);
begin
     CloseAll();
     Form2.Show();
end;

procedure THubForm.Button3Click(Sender:TObject);
begin
     CloseAll();
     Form3.Show();
end;

procedure THubForm.Button4Click(Sender:TObject);
begin
     CloseAll();
     Form4.Show();
end;

procedure THubForm.Button5Click(Sender:TObject);
begin
     CloseAll();
     Form5.Show();
end;

procedure THubForm.Button6Click(Sender:TObject);
begin
     CloseAll();
     Form6.Show();
end;

end.

