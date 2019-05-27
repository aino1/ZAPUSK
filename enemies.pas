unit Enemies;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  Tenemy = class
    public
      kor1,kor2 : longint;
      sum,sum2,hp : longint;
      isDestroy : boolean;
      constructor Create();
      procedure Hod();
      destructor Free;

  end;

implementation
  constructor Tenemy.Create();
    begin
    kor1 := random(17+1);
    kor2 := random(3+1);
    sum := 30;
    sum2 := 0;
    hp := 2;
    isDestroy := false;
    end;
  destructor Tenemy.Free();
    begin

    end;
  procedure Tenemy.Hod;
    begin
    inc(sum2);
    if sum2 = sum then begin
      inc(kor2);
      sum2 := 0;
      end;
    end;

end.

