unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ColorButton1: TColorButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form4: TForm4;

implementation
   uses unit1;

   { TForm4 }

   procedure TForm4.Button2Click(Sender: TObject);
   begin
     Form4.Visible:=False;
     Form4.Enabled:=False;
   end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  Unit1.MainForm.Color:=ColorButton1.ButtonColor;
  Unit1.MainForm.Image1.Visible:=False;
end;

{$R *.lfm}









end.

