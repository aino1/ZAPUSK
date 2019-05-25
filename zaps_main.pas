unit zaps_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Grids, Buttons,Fire;

type

  { TForm1 }

  TForm1 = class(TForm)
    firebut: TButton;
    down: TButton;
    Right_click: TButton;
    Left_click: TButton;
    High_click: TButton;
    otl: TLabel;
    sg1: TStringGrid;
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
  isFire : boolean;


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
       sg1.cells[i,i2]:= '0';
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
  dec(zach[1]);
end;





procedure TForm1.Timer1Timer(Sender: TObject);
var i,i2 : longint ;
  begin
  for i := 1 to 19 do begin
      for i2 := 1 to 19 do begin
         if (i<>zach[1]) or (i2 <> zach[2]) then begin
           sg1.cells[i,i2] := '0';
         end;
         if (i = zach[1])and (i2 = zach[2])then begin
           sg1.cells[i,i2] := '1';
         end;
  end;

  end;
  end;
procedure TForm1.downClick(Sender: TObject);
begin
  dec(zach[2]);
end;

procedure TForm1.firebutClick(Sender: TObject);
begin
end;

procedure TForm1.Right_clickClick(Sender: TObject);
begin
   inc(zach[1]);
end;

end.

