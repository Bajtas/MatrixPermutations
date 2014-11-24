unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls;

type

  { TOperacje }

  TOperacje = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Zamknij: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ZamknijClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Operacje: TOperacje;
  klikniety:Boolean;

implementation
    uses unit1;

    { TOperacje }

    procedure TOperacje.ZamknijClick(Sender: TObject);
    begin
     Operacje.Enabled:=False;
     Operacje.Visible:=False;
    end;

procedure TOperacje.FormShow(Sender: TObject);

  var
  dodawanie, mnozenie, odejmowanie: Int64;
  dzielenie: double;
  ch_1: string;
begin
  dodawanie:=Unit1.dodawanie;
  str(dodawanie, ch_1);
  Label2.Caption:='Wynik z operacji dodawania: '+ch_1;
  odejmowanie:=Unit1.odejmowanie;
  str(odejmowanie, ch_1);
  Label3.Caption:='Wynik z operacji odejmowania: '+ch_1;
  mnozenie:=Unit1.mnozenie;
  str(mnozenie, ch_1);
  Label4.Caption:='Wynik z operacji mnozenia: '+ch_1;
  dzielenie:=Unit1.dzielenie;
  if Unit1.dzielenie<>-1 then
  begin
  str(round(dzielenie), ch_1);
  Label5.Caption:='Wynik z operacji dzielenia: '+ch_1;
  end
  else
     begin
       Label5.Caption:='Wynik z operacji dzielenia: Błąd, nie można dzielić przez 0!';
       Operacje.Width:=650;
     end;
end;

procedure TOperacje.Button1Click(Sender: TObject);
var
file_src: string;
i,wybor: Byte;
begin
  i:=0;
  if (Unit1.matrix_size>=9) then
      begin
        wybor:=Application.MessageBox('Plik będzie zbyt duży aby wczytać go do programu, jednak można zapisać go na dysku, proszę podać ściężkę do zapisu.','Uwaga!',($00000004+$00000030));
        if wybor=6 then // TAK
         if Unit1.MainForm.SaveDialog.Execute then
         file_src:=Unit1.MainForm.SaveDialog.Filename;
        Unit1.sortuj_rosn(file_src);
        klikniety:=True;
      end;
  repeat
    begin
    if (Unit1.matrix_size>=3) then
      begin
        file_src:='tmp3.txt';
        Unit1.sortuj_rosn(file_src);
        Operacje.DBMemo1.Lines.Clear;
        Unit5.Operacje.DBMemo1.Lines.LoadFromFile(file_src);
        klikniety:=True;
      end;
    inc(i);
    end;
    until i=2;
end;

procedure TOperacje.Button2Click(Sender: TObject);
  var
  i,wybor:byte;
  file_src:string;
begin
  i:=0;
  if (Unit1.matrix_size>=9) then
      begin
        wybor:=Application.MessageBox('Plik będzie zbyt duży aby wczytać go do programu, jednak można zapisać go na dysku, proszę podać ściężkę do zapisu.','Uwaga!',($00000004+$00000030));
        if wybor=6 then // TAK
         if Unit1.MainForm.SaveDialog.Execute then
         file_src:=Unit1.MainForm.SaveDialog.Filename;
        Unit1.sortuj_mal(file_src);
        klikniety:=True;
      end;

  repeat
    begin
    if (Unit1.matrix_size>=3) then
      begin
        Unit1.sortuj_mal(file_src);
        file_src:='tmp3.txt';
        Operacje.DBMemo1.Lines.LoadFromFile(file_src);
        klikniety:=True;
      end;
    inc(i);
    end;
  until i=2;
end;

{$R *.lfm}

end.

