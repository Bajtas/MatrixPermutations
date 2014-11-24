unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls, ExtCtrls, Buttons, EditBtn, DbCtrls, crt,
  Unit2,  Unit3, Unit4, Unit5, Unit6;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    DBMemo1: TDBMemo; // Wczytywanie wygenrowanych macierzy.
    losuj: TButton;   // Przycisk [LOSUJ]
    Generuj: TButton;   // Przycisk [GENERUJ]
    Operacje: TButton;   // Przycisk [OPERACJE] -> Unit5 -> Operacje:TForm
    Czyszczenie_: TButton;  // Przycisk [WYCZYSC] -> Czyszczenie MEMO1/ Ukrywanie DBMemo i przywracanie domyslnych wymiarow MainForm
    Label2: TLabel;         // Komunikat o skopiowaniu macierza z MEMO1 do schowka.
    OpenDialog1: TOpenDialog;
    wczytaj_tlo: TMenuItem;  // MENU -> PRZYCISK [WCZYTAJ TLO Z PLIKU...] -> Image1 -> LoadFromFile
    skopiuj: TButton;        // PRZYCISK [SKOPIUJ] -> Kopiowanie z MEMO1 do schowka
    wprowadz: TButton;      // PRZYCISK [WPROWADZ] -> Unit2 -> Form2
    Wczytaj_: TButton;      // Przycisk [WCZYTAJ] -> OPEN DIALOG -> procedura load_file(open_file_src)
    Image1: TImage;
    Label1: TLabel;
    MainMenu: TMainMenu;
    Memo1: TMemo;
    Tlo: TMenuItem;
    zapisz_b: TButton;
    Widok: TMenuItem;
    About: TMenuItem;
    Opcje1: TMenuItem;
    SaveDialog: TSaveDialog;
    Wczytaj: TMenuItem;
    Zapisz: TMenuItem;
    Opcje: TMenuItem;
    OpenDialog: TOpenDialog;
    Wyjscie: TMenuItem;
    About_Form:TForm1;
    procedure AboutClick(Sender: TObject);
    procedure Czyszczenie_Click(Sender: TObject);
    procedure GenerujClick(Sender: TObject);
    procedure losujClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure OperacjeClick(Sender: TObject);
    procedure skopiujClick(Sender: TObject);
    procedure skopiujMouseLeave(Sender: TObject);
    procedure TloClick(Sender: TObject);
    procedure Wczytaj_Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure wczytaj_tloClick(Sender: TObject);
    procedure wprowadzClick(Sender: TObject);
    procedure ZapiszClick(Sender: TObject);
    procedure WczytajClick(Sender: TObject);
    procedure WyjscieClick(Sender: TObject);
    procedure zapisz_bClick(Sender: TObject);


  private
    { private declarations }
  public
    { public declarations }
  end;
Type
  macierz = array of array of INT64;
  T1W = array[0..9] of Byte; // Tablica jedno wymiarowa.
  tab_dynamiczna = array of Byte; // Tablica zdefiniowana dla kolumn.
TYPE macierz_s = RECORD
   tablica2 : macierz;
   iloczyn   : Int64;
   perm: Array of Integer;
 END;
Procedure sortuj_rosn(file_src: string);
Procedure sortuj_mal(file_src:string);
var
  MainForm: TForm1;
  Memo1: TMemo;
  Label2:TLabel;
  OpenDialog: TOpenDialog;
  rozmiar, wybor, matrix_size  : Byte;
  plik_wej,plik_wyj,tmp, tmp_1 : Text;
  //tab : macierz;
  bk,bk_1:Boolean;
  nazwa, file_src: string;
  tablica:macierz;
  dzielenie: double;
  st_size, dodawanie, odejmowanie, mnozenie,max_iloczyn: INT64;
  indeks_max_iloczyn: Integer;
  //sortowanie_ilo_rosnaco:Boolean;
  index_matrix: Array of INT64;

  struktura_m :Array of macierz_s;


implementation

{$R *.lfm}

{ TForm1 }
Procedure TForm1.FormCreate(Sender: TObject);
begin
  DBMemo1.Alignment:=taCenter;
  Randomize;
end;

procedure TForm1.wczytaj_tloClick(Sender: TObject);
var
  img_src: string;
begin
if OpenDialog1.Execute then
begin
  Image1.Visible:=True;
  img_src:=OpenDialog1.Filename;
  Image1.Picture.LoadFromFile(img_src);
end;
end;
Procedure TForm1.wprowadzClick(Sender: TObject);            // Reczne wprowadzanie danych...
begin
  Unit2.Form2.Enabled:=True;
  Unit2.Form2.Visible:=True;
end;
Procedure TForm1.Czyszczenie_Click(Sender: TObject);        // Czyszczenie MEMO1
begin
  Label2.Visible:=False;
  MainForm.Memo1.Lines.Clear;
  Label1.Caption:='Brak wczytanej macierzy.';
  MainForm.Memo1.Height := 176;
  MainForm.DBMemo1.Lines.Clear;
  MainForm.DBMemo1.Visible:=False;
  MainForm.Height:=307;

end;
procedure TForm1.AboutClick(Sender: TObject);
begin
  Form5.ShowModal;
end;

Procedure sortuj_mal(file_src:string);
var
 x: Int64;
 j,i,l,h, p,pmin,pmax: Int64;
 wyniki: Text;
 temp_t: Array of Integer;
begin
if Length(file_src)<>0 then
  AssignFile(wyniki,file_src);
if Length(file_src)=0 then
  AssignFile(wyniki,'tmp3.txt');
SetLength(temp_t, matrix_size);
Rewrite(wyniki);
pmin := 0; pmax := st_size - 1;
      repeat
        p := 0;
        for i := pmin to pmax do
          if struktura_m[i].iloczyn < struktura_m[i+1].iloczyn then
          begin
            x := struktura_m[i].iloczyn;
            struktura_m[i].iloczyn := struktura_m[i+1].iloczyn;
            struktura_m[i+1].iloczyn := x;
            temp_t:=struktura_m[i].perm;
            struktura_m[i].perm:=struktura_m[i+1].perm;
            struktura_m[i+1].perm:=temp_t;
            if p = 0 then pmin := i;
            p := i;
          end;
        if pmin > 1 then dec(pmin);
        pmax := p - 1;
      until p = 0;
p:=0;
while (p<>st_size) do
     begin
     write(wyniki,'Iloczyn permutacji macierza nr ',(p+1),': ',struktura_m[p].iloczyn);
     writeln(wyniki);
     for l:=0 to Length(tablica)-1 do
      begin
        for h:=0 to Length(tablica)-1 do
        begin
             if (l=struktura_m[p].perm[h]-1)  then
                 Write(wyniki,'[':6,tablica[h][l],']  ') ;
             if l<>struktura_m[p].perm[h]-1 then
               Write(wyniki,' ':6,tablica[h][l],'   ');
        end;
        Writeln(wyniki);
        end;
     Writeln(wyniki);
     inc(p);

end;
close(wyniki);
end;

Procedure sortuj_rosn(file_src: string);
var
 x: Int64;
 j,i,l,h, p,pmin ,pmax: Int64;
 wyniki: Text;
 temp_t: Array of Integer;

begin
if Length(file_src)<>0 then
  AssignFile(wyniki,file_src);
if Length(file_src)=0 then
  AssignFile(wyniki,'tmp3.txt');
SetLength(temp_t, matrix_size);
Rewrite(wyniki);
    pmin := 0; pmax := st_size - 1;
      repeat
        p := 0;
        for i := pmin to pmax do
          if struktura_m[i].iloczyn > struktura_m[i+1].iloczyn then
          begin
            x := struktura_m[i].iloczyn;
            struktura_m[i].iloczyn := struktura_m[i+1].iloczyn;
            struktura_m[i+1].iloczyn := x;
            temp_t:=struktura_m[i].perm;
            struktura_m[i].perm:=struktura_m[i+1].perm;
            struktura_m[i+1].perm:=temp_t;
            if p = 0 then pmin := i;
            p := i;
          end;
        if pmin > 1 then dec(pmin);
        pmax := p - 1;
      until p = 0;
     SetLength(temp_t, 0);
p:=0;
while (p<>st_size) do
     begin
     write(wyniki,'Iloczyn permutacji macierza nr ',(p+1),': ',struktura_m[p+1].iloczyn);
     writeln(wyniki);
     for l:=0 to Length(tablica)-1 do
      begin
        for h:=0 to Length(tablica)-1 do
        begin
             if (l=struktura_m[p+1].perm[h]-1)  then
                 Write(wyniki,'[':6,tablica[h][l],']  ') ;
             if l<>struktura_m[p+1].perm[h]-1 then
               Write(wyniki,' ':6,tablica[h][l],'   ');
        end;
        Writeln(wyniki);
        end;
     Writeln(wyniki);
     //SetLength(struktura_m[p].perm, 0);
    // SetLength(struktura_m[p].tablica2, 0);
     inc(p);

end;
close(wyniki);

end;

Procedure reverse_n(var n: Array of Integer;start_:Byte; end_:Byte);
var
  i, j: Integer;
    tmp: Byte;
  begin
    i := start_;
    j := end_;
    while i < j do
    begin
      tmp := n[i-1]; n[i-1] := n[j-1]; n[j-1] := tmp;
      Inc(i); Dec(j);
    end;
 end;
Procedure permutuj( file_src: string; wybor:Byte);
var
  i,j,l,h, counter_1, p,counter_2,mnozenie_2, counter_3, c:INT64;

  pom, pom2: Byte;
  pom3,x: INT64;
  pmin, pmax: Integer;
  wyniki: Text;
  przez_zero: Boolean;
  tmp: string;
  n: Array of Integer;

begin
  counter_1:=0;
  przez_zero:=False;
   // Assignfile(plik,'perm.txt');
    //Rewrite(plik);
    dodawanie:=0;
    odejmowanie:=0;
    max_iloczyn:=0;
    counter_3:=0;
    dzielenie:=1;
    MainForm.Top:=30;
    Unit3.Form3.Visible:=True;
    Unit3.Form3.Ok.Visible:=True;
    Unit3.Form3.Enabled:=True;
    Unit3.Form3.Label1.Caption:='Prosze czekac...';
    if Length(file_src)<>0 then
      AssignFile(wyniki,file_src);
    if Length(file_src)=0 then
      AssignFile(wyniki,'wyniki.txt');
    Rewrite(wyniki);

    case matrix_size of
    3: st_size:=6;
    4: st_size:=24;
    5: st_size:=120;
    6: st_size:=720;
    7: st_size:=5040;
    8: st_size:=40320;
    9: st_size:=362880;
    10: st_size:=3628800;
    END;
    SetLength(struktura_m,st_size+1);
    SetLength(n,matrix_size);
    SetLength(struktura_m[0].tablica2,matrix_size,matrix_size);
    pmin := 0;
    pmax := Length(index_matrix) - 1;
    for i := 0 to matrix_size-1 do
      n[i]:=i+1;
while true do
begin
  write(wyniki, 'Nr PERMUTACJI: ',(counter_1+1));
  writeln(wyniki);
  //SetLength(struktura_m[counter_3].tablica2,matrix_size,matrix_size);
  SetLength(struktura_m[counter_3].perm,matrix_size);
  mnozenie_2:=1;
    for l:=0 to Length(tablica)-1 do
      begin
        for h:=0 to Length(tablica)-1 do
        begin
             struktura_m[0].tablica2[h][l]:=tablica[h][l];
             struktura_m[counter_3].perm[h]:=n[h];
             if (l=n[h]-1)  then
             begin
               Write(wyniki,'[':6,tablica[h][l],']  ') ;
               dodawanie:=dodawanie+tablica[h][l];
               odejmowanie:=odejmowanie-tablica[h][l];
               mnozenie_2:=mnozenie_2*tablica[h][l];
               mnozenie:=mnozenie*tablica[h][l];
             if (dzielenie>0) and (przez_zero=False) then
               dzielenie:=tablica[h][l] / dzielenie ;
             if tablica[h][l]=0 then
               begin
                 przez_zero:=True;
                 dzielenie:=-1;
               end;
             end;
             if l<>n[h]-1 then
               begin
                 Write(wyniki,' ':6,tablica[h][l],'   ');
               end;
        end;
        Writeln(wyniki);
        end;
        struktura_m[counter_3].iloczyn:=mnozenie_2;
      Writeln(wyniki);

      i := matrix_size;
      while (n[i - 2] >= n[i-1]) do
        Dec(i);
      if i = 1 then
        begin
          SetLength(struktura_m[counter_3+1].perm,matrix_size);
       // SetLength(struktura_m[counter_3+1].perm,matrix_size);
        break;
        end;
      inc(counter_3);
      inc(counter_1);
      j := i;
      while (j <= matrix_size) and (n[j-1] > n[i - 2]) do
        Inc(j);
      Dec(j);
      pom := n[i - 2];
      n[i - 2] := n[j-1];
      n[j-1] := pom;
      reverse_n(n, i, matrix_size);
    end;
    writeln(wyniki, 'WSZYSTKICH PERMUTACJI: ',(counter_1+1));
           CloseFile(wyniki);
           str(counter_1+1, tmp);
           Unit3.Form3.Label2.Caption:='Wygenerowano '+tmp+' permutacji.';
         if matrix_size<9 then
         begin
         MainForm.DBMemo1.Lines.LoadFromFile('wyniki.txt');
         MainForm.DBMemo1.Visible:=True;
         MainForm.DBMemo1.Enabled:=True;
         MainForm.Height:=500;
         end;
         Unit3.Form3.Label1.Caption:='Gotowe!';
         Unit3.Form3.Enabled:=True;
         Unit3.Form3.Ok.Enabled:=True;
end;
procedure TForm1.GenerujClick(Sender: TObject);
var
  wybor:integer;
  //file_src: string;
begin
Unit5.klikniety:=False;
mnozenie:=1;
    wybor:=6;
  matrix_size:=Length(tablica);
  if Memo1.Lines.Count=0 then
    Application.MessageBox('Proszę najpierw wczytać macierz'+#13#10+'lub kliknąć przycisk [LOSUJ]','Uwaga!',($00000000+$00000030));
  if Memo1.Lines.Count<>0 then
    begin
    if matrix_size>=9 then
      begin
        wybor:=Application.MessageBox('Plik będzie zbyt duży aby wczytać go do programu, jednak można zapisać go na dysku, proszę podać ściężkę do zapisu.','Uwaga!',($00000004+$00000030));
        if wybor=6 then // TAK
         if SaveDialog.Execute then
         file_src:=SaveDialog.Filename;
      end;
    if wybor=6 then
      permutuj(file_src, wybor);
    end;

end;
procedure TForm1.losujClick(Sender: TObject);                //LOSOWANIE MACIERZA
var
  i,j,random_size:Byte;
  plik:text;
  random_size_s:string ;
begin
  AssignFile(plik,'tmp.txt');
  Rewrite(plik);
  random_size:=(Random(8)+3);
  SetLength(tablica, random_size,random_size);
  for j:=0 to random_size-1 do
    begin
    for i:=0 to random_size-1 do
      begin
      tablica[i][j]:=Random(10);
      Write(plik, ' ',tablica[i][j],' ');
      end;
    Writeln(plik);
    end;
  CloseFile(plik);
  Memo1.Lines.Clear;
  str(random_size, random_size_s);
  Memo1.Lines.LoadFromFile('tmp.txt');
  Label1.Caption:='Wylosowano macierz o wymiarach '+random_size_s+'x'+random_size_s;
  MainForm.Memo1.Height := 19+(MainForm.Memo1.Lines.Count)*15;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  Image1.Visible:=False;
end;

procedure TForm1.OperacjeClick(Sender: TObject);
begin
  if (MainForm.DBMemo1.Lines.Count=0) and (Length(file_src)=0) then
   ShowMessage('Proszę najpierw nacisnąć przycisk [GENERUJ] macierz.');
  if (MainForm.DBMemo1.Lines.Count<>0) or (Length(file_src)>0) then
   begin
     Unit5.Operacje.Enabled:=True;
     Unit5.Operacje.Visible:=True;
   end;

end;
Procedure TForm1.skopiujClick(Sender: TObject);          // Forma->Button [SKOPIUJ] // ---- KOPIOWANIE Z MEMO DO SCHOWKA
var i:Integer;
begin
  i:=MainForm.Memo1.Lines.Count;
  if i=0 then
    begin
      Label2.Visible:=True;
      Label2.Caption:='Brak macierzy do skopiowania...';
    end;
  if i>0 then
    begin
      Label2.Visible:=True;
      MainForm.Memo1.SelectAll;
      MainForm.Memo1.CopyToClipboard;
      Label2.Caption:='Macierz skopiowano do schowka...';
    end;
end;
procedure TForm1.skopiujMouseLeave(Sender: TObject);
begin
  Label2.Visible:=False;
end;
procedure TForm1.TloClick(Sender: TObject);
begin
  Unit4.Form4.Visible:=True;
  Unit4.Form4.Enabled:=True;
end;
Function sprawdz_znaki(open_file_src:string):INTEGER;  // sprawdzam plik w poszukiwaniu niedowzwolonych znakow
var
  test:string;
  tmp,x: integer;
begin
  AssignFILE(plik_wej,open_file_src);
  Reset(plik_wej);
  While not SeekEOF(plik_wej) do
  begin
  While not SeekEOLn(plik_wej) do
    begin
    Read(plik_wej,test);
    for x:=0 to Length(test) do
        begin
        tmp:=Ord(test[x]);
        if (tmp>=33) and (tmp<=47) then
           begin
             close(plik_wej);
             Application.MessageBox('W pliku znajdują się niedozwolone znaki typu:'+#13#10+'~!@#$%^&*()_+-={}[]:"|;\<>?,./\|`'+#13#10+'Prosze je usunac, a nastepnie wczytac plik ponowanie.','Uwaga!',($00000000+$00000030));
             exit(-1);
           end;
        if (tmp>=58) and (tmp<=126) then
           begin
             close(plik_wej);
             Application.MessageBox('W pliku znajdują się niedozwolone znaki typu:'+#13#10+'~!@#$%^&*()_+-={}[]:"|;\<>?,./\|`'+#13#10+'Prosze je usunac, a nastepnie wczytac plik ponowanie.','Uwaga!',($00000000+$00000030));
             exit(-1);
           end;
        end;
    Readln(plik_wej);
    end;
  end;
end;
Function zalosuj():Byte;                        // Losowanie do tablicy
begin
  Result:=(Random(9)+1);
end;
Function przepisz(open_file_src: String):Integer;       // przepisuje tablice do pliku tymczasowego
var
  i: Int64;
  n: Byte;
  test: string;
  ex: iNTEGER;

begin
  n:=0;
  AssignFile(tmp_1,'tmp_1.txt');
  AssignFILE(plik_wej,open_file_src);
  nazwa:=ExtractFileName(open_file_src);
  ex:=sprawdz_znaki(open_file_src);
  if (ex=-1) then
     exit(-1);
  Reset(plik_wej);
  Rewrite(tmp_1);
  While not SeekEoF(plik_wej) do
    begin
    While not SeekEoLn(plik_wej) do
      begin
      Read(plik_wej,i);
      Write(tmp_1,i,' ');
      inc(n);
      end;
    Readln(plik_wej);
    if n<>0 then
    Writeln(tmp_1);
    n:=0;
    end;
  Close(tmp_1);
  Close(plik_wej);
  Erase(plik_wej);
  Rename(tmp_1,nazwa);
end;
Function s_kl(licznik:Byte;var n: Byte;var ilosc_wierszy:Byte;var ilosc_kolumn:tab_dynamiczna;var u_r:BOOLEAN): INTEGER;     // Funkcja liczaca ilosc kolumn w wierszach i sprawdzajaca poprawnosc macierzy.
var
  wyl,c,h: Byte;
  j: INT64;
begin
  while not SeekEoLn(plik_wej) do
  begin
    read(plik_wej,j);
    write(tmp,' ',j,' ');
    inc(n);                   // zliczanie kolumn w kolejnych wierszach
  end;
  if (n<>0) then
  begin
    repeat
      begin
        if u_r=fALSE then
        begin
          if (n>2) and (n<11) then
          begin
          SetLength(ilosc_kolumn, n);
          u_r:=True;
          end else
          begin
          ShowMessage('Prosze podac odpowiedni rozmiar, obslugiwane rozmiary to: 2x2 do 10x10.');
          Result:=-1;
          Exit(-1);
          end;
        end
      end;
    until u_r=True;
  ilosc_wierszy:=licznik+1;
  ilosc_kolumn[licznik]:=n;
  if ilosc_kolumn[licznik]<>ilosc_kolumn[0] then
    begin
      if ilosc_kolumn[0]>ilosc_kolumn[licznik] then
        begin
          c:=ilosc_kolumn[0]-ilosc_kolumn[licznik];
          for h:=1 to c do
            begin
              wyl:=zalosuj();
              Write(tmp,' ',wyl,' ');
            end;
        end;
      if ilosc_kolumn[0]<ilosc_kolumn[licznik] then
        bk_1:=True;
    end;
  Writeln(tmp);
  end;
Readln(plik_wej);

end;
Procedure zeruj(var tablica: Array of byte) ;          // Zeruje tablice
var
  i: Byte;
begin
  for i:=0 to 9 do
    tablica[i]:=0;
end;
Function rozmiar_macierza(var ilosc_wierszy:Byte;var ilosc_kolumn: tab_dynamiczna; var bw:Boolean; open_file_src: String):Byte;        // SPRAWDZAM POPRAWNOSC: Ustalam rozmiar, towrze plik roboczy(tymczasowy), dopelniam brakujace kolumny, sprawdzam ilosc wierszy.
var
  bledne_wiersze : array[0..9] of Byte;
  tmp_str,tmp_str1: String;
  i,j,n,k,s,wybor: Byte;
  ex : Integer;
  u_r:Boolean;
begin
s:=0; u_r:=False; i:=0;
zeruj(bledne_wiersze);
i:=0; k:=0;
AssignFile(plik_wej,nazwa);
reset(plik_wej);
AssignFile(tmp,'tmp.txt');
Rewrite(tmp);
bk:=False;
while not SeekEOF(plik_wej) do     // szukanie konca pliku
  begin
    n:=0;
    ex:=s_kl(i,n,ilosc_wierszy,ilosc_kolumn,u_r);
    if ex=-1 then
      begin
      close(plik_wej);
      close(tmp);
      exit(0);
      end;
    if (n<>0) and (ex<>-1) then
      begin
      if (ilosc_kolumn[i]<>0) and (i>=1) and (ilosc_kolumn[k]<>ilosc_kolumn[i]) then
        begin
          bledne_wiersze[s]:=i+1;
          inc(s);
          bk:=True;
        end;
      end;
  inc(i);
 end;
  if (u_r=false) then
    begin
    ShowMessage('Wczytany plik jest pusty, prosze wczytac inny plik lub nacisnac przycisk [GENERUJ].');
    wybor:=7;
    end;
  if (u_r=True) then
    begin
  if ilosc_wierszy<Length(ilosc_kolumn) then
    bw:=True;
  if (bk=True) then
      begin
        j:=i;
          for i:=0 to j do
            if bledne_wiersze[i]<>0 then
              begin
                str(bledne_wiersze[i],tmp_str);
                tmp_str1:=concat(tmp_str,',',tmp_str1);
              end;
          str(Length(ilosc_kolumn),tmp_str);
          MainForm.Label1.Caption:='Wczytuje...';
          ShowMessage('Macierz w podanym pliku, nie jest macierza kwadratową! Proszę skorygować ilość kolumn w wierszach nr: '+tmp_str1+'. W przeciwnym wypadku, zostanie utworzona macierz,na podstawie ilości kolumn w pierwszym wierszu, w ktorym napotkano dane. W tym przypadku bedzie to macierz: '+tmp_str+'x'+tmp_str);
          wybor:=Application.MessageBox('Brakujace elementy zostana wypelnione losowymi danymi, czy napewno chcesz kontynuowac?','Uwaga!',($00000004+$00000030));
      end
  else
    wybor:=6;
    end;
  if wybor=6 then
    begin
  result:=Length(ilosc_kolumn);
  close(plik_wej);
  close(tmp);
    end;
    if wybor=7 then
      begin
      MainForm.Label1.Caption:='Brak wczytanej macierzy.';
      close(plik_wej);
      close(tmp);
      Result:=0;;
      end;
end;
Procedure wczytywanie(var ilosc_wierszy:Byte;var ilosc_kolumn: tab_dynamiczna; n:byte; var bw:Boolean);    // Wczytywanie pliku do pamieci.
  var
    plik_wej : Text ;
    i,j :Byte;
    n_str: String;
    tab:macierz;
begin
  AssignFile(plik_wej,'tmp.txt');
  SetLength(tab, n, n); // okreslam rozmiar tablicy
  Str(n,n_str);
  MainForm.Label1.Caption:='Wczytano macierz o wymiarach: '+n_str+'x'+n_str;
  Reset(plik_wej);
   for i:=0 to n-1 do
     for j:=0 to n-1 do
         Read(plik_wej, tab[i,j]);         // wczytywanie do tablicy [typ macierz]
   close(plik_wej);
   for i:=0 to n-1 do
     for j:=0 to n-1 do
       begin
           if (bw=True) and (ilosc_kolumn[i]=0) then
             begin
               tab[i,j]:=zalosuj();
             end;
       end;
   AssignFile(plik_wej,'tmp.txt');
   Rewrite(plik_wej);
   MainForm.Memo1.Lines.Clear;
   MainForm.Memo1.Alignment:=taCenter;
   for i:=0 to n-1 do
     begin
     for j:=0 to n-1 do
       begin
        Write(plik_wej,' ',tab[i,j],' ');
       end;
     Writeln(plik_wej);
     end;
   Close(plik_wej);
   MainForm.Memo1.Lines.LoadFromFile('tmp.txt');
   MainForm.Memo1.Height := 19+(MainForm.Memo1.Lines.Count)*15;
  tablica:= tab;
end;
Procedure load_file(open_file_src: String);               // Menu->Wczytaj->Sprawdzenie poprawnosci pliku...
var
  bw:Boolean;
  ilosc_wierszy:Byte;
  exit: iNTEGER;
  ilosc_kolumn: array of Byte;
begin
MainForm.Label2.Visible:=False;
exit:=0;
  bw:=False;
  Randomize;
  exit:=przepisz(open_file_src);
  if exit<>-1 then
  rozmiar:=rozmiar_macierza(ilosc_wierszy,ilosc_kolumn,bw, open_file_src); // Okreslanie rozmiaru macierza w pliku.
  if rozmiar>0 then
  wczytywanie(ilosc_wierszy,ilosc_kolumn,rozmiar,bw);  //tab:=
end;
procedure TForm1.Wczytaj_Click(Sender: TObject);          // Forma->Button [WCZYTAJ]-> ...
  var
  open_file_src: String;  // Zmienna przechowywujaca sciezke do pliku
begin
  OpenDialog.InitialDir:=ExtractFilePath(Application.ExeName);
  if OpenDialog.Execute then
   begin
     open_file_src := OpenDialog.Filename;
     load_file(open_file_src);
   end;

end;
Procedure TForm1.WczytajClick(Sender: TObject);           // Menu -> wczytaj
var
  open_file_src: String;  // Zmienna przechowywujaca sciezke do pliku
begin
  OpenDialog.InitialDir:=ExtractFilePath(Application.ExeName);
  if OpenDialog.Execute then
   begin
     open_file_src := OpenDialog.Filename;
     load_file(open_file_src);
   end;
end;
Procedure TForm1.ZapiszClick(Sender: TObject);           // Menu -> zapisz
begin
  if SaveDialog.Execute then
   begin
     if DBMemo1.Lines.Count=0 then
     ShowMessage('Brak danych do zapisania, proszę wczytać macierz a następnie nacisnąć przycisk [GENERUJ].');
     if DBMemo1.Lines.Count<>0 then
        DBMemo1.Lines.SaveToFile(SaveDialog.Filename);
   end;
end;
Procedure TForm1.WyjscieClick(Sender: TObject);           // Menu -> wyjscie
begin
  Halt(0);
end;
procedure TForm1.zapisz_bClick(Sender: TObject);          // Forma -> Button [ZAPISZ] -> zapisywanie do pliku...
begin
  if SaveDialog.Execute then
   begin
     if Memo1.Lines.Count=0 then
     ShowMessage('Brak danych do zapisania, proszę wczytać macierz a następnie nacisnąć przycisk [GENERUJ].');
     if Memo1.Lines.Count<>0 then
        Memo1.Lines.SaveToFile(SaveDialog.Filename);
   end;
end;
end.

