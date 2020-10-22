program project2;

{$mode objfpc}{$H+}

uses
 {$IFDEF UNIX}{$IFDEF UseCThreads}
 cthreads,
 {$ENDIF}{$ENDIF}
 Interfaces, // this includes the LCL widgetset
 Forms,unithub,Unit1,Unit2,Unit3,Unit4,Unit5,Unit6, functionsUnit
 { you can add units after this };

{$R *.res}

begin
 RequireDerivedFormResource:=True;
 Application.Scaled:=True;
 Application.Initialize;
 Application.CreateForm(THubForm,HubForm);
 Application.CreateForm(TForm1,Form1);
 Application.CreateForm(TForm2,Form2);
 Application.CreateForm(TForm3,Form3);
 Application.CreateForm(TForm4,Form4);
 Application.CreateForm(TForm5,Form5);
 Application.CreateForm(TForm6,Form6);
 Application.Run;
end.

