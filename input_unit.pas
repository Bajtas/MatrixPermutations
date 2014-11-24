unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  EditBtn, Spin;

type

  { TForm2 }

  TForm2 = class(TForm)
    Ok: TButton;
    Anuluj: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure AnulujClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OkClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;
  rozmiar: Byte;
  Ok:TButton;
  Anuluj:TButton;
  Edit: Array of Array of TSpinEdit;
  wymiar:Byte;
implementation
uses unit1;

{$R *.lfm}

{ TForm2 }

procedure TForm2.AnulujClick(Sender: TObject);
begin
  Form2.Visible:=False;
  Form2.Enabled:=False;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
var
  wym_2,i,j:byte;

begin

  case ComboBox1.ItemIndex  of
  0:begin
    Anuluj.top:=208;
    Ok.top:=208;
    Ok.left:=56;
     Anuluj.left:=184;
      Form2.Height:=240;
      Form2.Width:=320;
      wym_2:=Length(Edit);
      if wym_2<>0 then
        for i:=0 to wym_2-1 do
          for j:=0 to wym_2-1 do
            Edit[i][j].Free;
      wymiar:=3;
      SetLength(Edit, wymiar,wymiar);
      for i:=0 to wymiar-1 do
      begin
          for j:=0 to wymiar-1 do
          begin
            Edit[i][j]:=TSpinEdit.Create(Form2);
            Edit[i][j].Parent:=Self;
            Edit[i][j].Width:=60;
            Edit[i][j].top:=(55+(j*23));
            Edit[i][j].left:=(70+(i*57));
            Edit[i][j].MaxValue:=2000000000;
          end;

      end;
    end;
  1:begin
    Anuluj.top:=208;
    Ok.top:=208;
    Anuluj.left:=184;
    Ok.left:=56;
          Form2.Height:=240;
      Form2.Width:=320;
     wym_2:=Length(Edit);
      if wym_2<>0 then
        for i:=0 to wym_2-1 do
          for j:=0 to wym_2-1 do
            Edit[i][j].Free;
      wymiar:=4;
      SetLength(Edit, wymiar,wymiar);
      for i:=0 to wymiar-1 do
      begin
          for j:=0 to wymiar-1 do
          begin
            Edit[i][j]:=TSpinEdit.Create(Form2);
            Edit[i][j].Parent:=Self;
            Edit[i][j].Width:=45;
            Edit[i][j].top:=(55+(j*23));
            Edit[i][j].left:=(50+(i*48));
          end;
      end;
    end;
  2:begin
    Anuluj.top:=208;
    Ok.top:=208;
    Anuluj.left:=184;
    Ok.left:=56;
          Form2.Height:=240;
      Form2.Width:=320;
     wym_2:=Length(Edit);
      if wym_2<>0 then
        for i:=0 to wym_2-1 do
          for j:=0 to wym_2-1 do
            Edit[i][j].Free;
      wymiar:=5;
      SetLength(Edit, wymiar,wymiar);
      for i:=0 to wymiar-1 do
      begin
          for j:=0 to wymiar-1 do
          begin
            Edit[i][j]:=TSpinEdit.Create(Form2);
            Edit[i][j].Parent:=Self;
            Edit[i][j].Width:=45;
            Edit[i][j].top:=(55+(j*23));
            Edit[i][j].left:=(30+(i*49));
          end;
      end;
    end;
  3:begin
    Anuluj.top:=208;
    Ok.top:=208;
    Anuluj.left:=184;
    Ok.left:=56;
          Form2.Height:=240;
      Form2.Width:=320;
     wym_2:=Length(Edit);
      if wym_2<>0 then
        for i:=0 to wym_2-1 do
          for j:=0 to wym_2-1 do
            Edit[i][j].Free;
      wymiar:=6;
      SetLength(Edit, wymiar,wymiar);
      for i:=0 to wymiar-1 do
      begin
          for j:=0 to wymiar-1 do
          begin
            Edit[i][j]:=TSpinEdit.Create(Form2);
            Edit[i][j].Parent:=Self;
            Edit[i][j].Width:=45;
            Edit[i][j].top:=(55+(j*23));
            Edit[i][j].left:=(10+(i*50));
          end;
      end;
    end;
  4:begin
    Anuluj.top:=225;
    Ok.top:=225;
    Anuluj.left:=210;
    Ok.left:=80;
      Form2.Height:=260;
      Form2.Width:=365;
     wym_2:=Length(Edit);
      if wym_2<>0 then
        for i:=0 to wym_2-1 do
          for j:=0 to wym_2-1 do
            Edit[i][j].Free;
      wymiar:=7;
      SetLength(Edit, wymiar,wymiar);
      for i:=0 to wymiar-1 do
      begin
          for j:=0 to wymiar-1 do
          begin
            Edit[i][j]:=TSpinEdit.Create(Form2);
            Edit[i][j].Parent:=Self;
            Edit[i][j].Width:=45;
            Edit[i][j].top:=(55+(j*20));
            Edit[i][j].left:=(5+(i*51));
          end;
      end;
    end;
  5: begin
     Form2.Height:=280;
    Form2.Width:=440;
    Anuluj.left:=225;
    Ok.left:=95;
    Anuluj.top:=245;
    Ok.top:=245;
     wym_2:=Length(Edit);
      if wym_2<>0 then
        for i:=0 to wym_2-1 do
          for j:=0 to wym_2-1 do
            Edit[i][j].Free;
      wymiar:=8;
      SetLength(Edit, wymiar,wymiar);
      for i:=0 to wymiar-1 do
      begin
          for j:=0 to wymiar-1 do
          begin
            Edit[i][j]:=TSpinEdit.Create(Form2);
            Edit[i][j].Parent:=Self;
            Edit[i][j].Width:=45;
            Edit[i][j].top:=(45+(j*23));
            Edit[i][j].left:=(15+(i*51));
          end;
      end;
    end;
  6:begin
    Form2.Height:=300;
    Form2.Width:=480;
    Anuluj.left:=245;
    Ok.left:=110;
    Anuluj.top:=260;
    Ok.top:=260;
     wym_2:=Length(Edit);
      if wym_2<>0 then
        for i:=0 to wym_2-1 do
          for j:=0 to wym_2-1 do
            Edit[i][j].Free;
      wymiar:=9;
      SetLength(Edit, wymiar,wymiar);
      for i:=0 to wymiar-1 do
      begin
          for j:=0 to wymiar-1 do
          begin
            Edit[i][j]:=TSpinEdit.Create(Form2);
            Edit[i][j].Parent:=Self;
            Edit[i][j].Width:=45;
            Edit[i][j].top:=(45+(j*23));
            Edit[i][j].left:=(10+(i*51));
          end;
      end;
    end;
  7:begin
    Form2.Height:=320;
    Form2.Width:=520;
    Anuluj.left:=260;
    Ok.left:=130;
    Anuluj.top:=275;
    Ok.top:=275;
     wym_2:=Length(Edit);
      if wym_2<>0 then
        for i:=0 to wym_2-1 do
          for j:=0 to wym_2-1 do
            Edit[i][j].Free;
      wymiar:=10;
      SetLength(Edit, wymiar,wymiar);
      for i:=0 to wymiar-1 do
      begin
          for j:=0 to wymiar-1 do
          begin
            Edit[i][j]:=TSpinEdit.Create(Form2);
            Edit[i][j].Parent:=Self;
            Edit[i][j].Width:=45;
            Edit[i][j].top:=(45+(j*22));
            Edit[i][j].left:=(10+(i*51));
          end;
      end;
    end;
end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 wymiar:=0;
end;

procedure TForm2.OkClick(Sender: TObject);
var
  i,j,tmp_w: Byte;
  plik,plik_tmp:Text;
  tmp_ch:string;
begin

 if wymiar=0 then
   begin
     Form2.Visible:=False;
     Form2.Enabled:=False;
   end;
 if wymiar<>0 then
   begin

     AssignFILE(plik,'tmp2.txt');
     AssignFile(plik_tmp,'tmp.txt');
     Rewrite(plik_tmp);
     CloseFile(plik_tmp);
     Erase(plik_tmp);
     Rewrite(plik);
     tmp_w:=Length(Edit);
     SetLength(Unit1.tablica,tmp_w,tmp_w);
     for i:=0 to tmp_w-1 do
     begin
       for j:=0 to tmp_w-1 do
       begin
         Write(plik,' ', Edit[j][i].ValueToStr(Edit[j][i].Value), ' ');
         Unit1.tablica[i][j]:=Edit[j][i].Value;
       end;
       Writeln(plik);
     end;
     closefile(plik);
     Str(wymiar,tmp_ch);
     Unit1.MainForm.Memo1.Lines.LoadFromFile('tmp2.txt');
     Rename(plik,'tmp.txt');
     Unit1.MainForm.Label1.Caption:='Wczytano macierz o wymiarach'+tmp_ch+'x'+tmp_ch;
     Unit1.MainForm.Memo1.Height := 19+(MainForm.Memo1.Lines.Count)*15;
     Form2.Visible:=False;
     Form2.Enabled:=False;
   end;

end;


end.
