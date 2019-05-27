unit zaps_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Grids, Buttons,Fire,Enemies;

type

  { TForm1 }

  TForm1 = class(TForm)
    firebut: TButton;
    down: TButton;
    Label1: TLabel;
    Right_click: TButton;
    Left_click: TButton;
    High_click: TButton;
    otl: TLabel;
    sg1: TStringGrid;
    score: TStaticText;
    Timer1: TTimer;
    procedure downClick(Sender: TObject);
    procedure firebutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure High_clickClick(Sender: TObject);
    procedure Left_clickClick(Sender: TObject);
    procedure Right_clickClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  zach : array[1..2]of longint;
  enemy : array of Tenemy;
  isFire,isCreateEnemy : boolean;
  bul : array of TFire;
  raz,raz2 ,s,scor: longint;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var i,i2 : longint;
begin

  zach[1] := 10;
  zach[2] := 10;
  for i := 1 to 19 do begin
    for i2 := 1 to 19 do begin
       sg1.cells[i,i2]:= '_';
    end;
  end;

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  otl.caption := inttostr(1);
end;

procedure TForm1.High_clickClick(Sender: TObject);
begin
  inc(zach[2]);
end;

procedure TForm1.Left_clickClick(Sender: TObject);
begin
  if zach[1] >= 2 then begin
  dec(zach[1]);
end;

end;




procedure TForm1.Timer1Timer(Sender: TObject);
var i,i2,i3,i4 : longint ;
  begin
  s := random(10);
  if s = 1 then isCreateEnemy := true;
  if s <> 1 then isCreateEnemy := false;

  if isCreateEnemy then begin
  inc(raz2);
  Setlength(enemy,raz2);
  enemy[raz2-1] := Tenemy.create;
   otl.Caption := inttostr(raz2);
  end;
  for i := 0 to raz2-1 do begin
    for i2 := 0 to raz-1 do begin
      if (bul[i2].k2-1 = enemy[i].kor2) and (bul[i2].k1 = enemy[i].kor1) then begin
        dec(enemy[i].hp);
        if enemy[i].hp <= 0 then begin
        enemy[i].isDestroy := true;
        inc(scor);
        score.caption := inttostr(scor);
        end;
      end;
    end;
  end;
  for i := 0 to raz-1 do begin
  if isFire then bul[i].fly;
  end;
  for i := 0 to raz2-1 do begin
  enemy[i].hod;
  end;
  for i := 1 to 19 do begin
      for i2 := 1 to 19 do begin
         if (i<>zach[1]) or (i2 <> zach[2]) then begin
           sg1.cells[i,i2] := '_';
         end;
         if (i = zach[1])and (i2 = zach[2])then begin
           sg1.cells[i,i2] := 'H';
         end;
         if isFire then begin
           for i3 := 0 to raz - 1 do begin
         if (i = bul[i3].k1)and (i2 = bul[i3].k2)then begin
           sg1.cells[i,i2] := '3';

         end;

           end;
           for i4 := 0 to raz2-1 do begin
         if (i = enemy[i4].kor1)and (i2 = enemy[i4].kor2)then begin
           if enemy[i4].isDestroy = false then sg1.cells[i,i2] := 'x';
         end;

           end;
         end;

  end;
  end;
      /// рисование поля

  end;
procedure TForm1.downClick(Sender: TObject);
begin
  dec(zach[2]);
end;

procedure TForm1.firebutClick(Sender: TObject);
begin
  inc(raz);
  SetLength(bul,raz);
  bul[raz-1] := Tfire.create;
  bul[raz-1].k2 := zach[2] - 1;
  bul[raz-1].k1 := zach[1];
  isFire := true;


end;

procedure TForm1.Right_clickClick(Sender: TObject);
begin
   if zach[1] <= 18 then begin
   inc(zach[1]);
end;

end;

end.

