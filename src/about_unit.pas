unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Ok: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure OkClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation
  uses unit1;

  { TForm3 }

  procedure TForm3.OkClick(Sender: TObject);
  begin
    Form3.Enabled:=False;
    Form3.Visible:=False;
  end;

{$R *.lfm}

end.

