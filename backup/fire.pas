unit Fire;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  Tfire = class
  public
    k1,k2,speed : longint;
    constructor create();
    destructor free;
    procedure Fly;
  end;
implementation
    Constructor Tfire.Create();
    begin
    k1 := 2;
    k2 := 2;
    end;
    Destructor Tfire.free;
    begin

    end;
    Procedure TFire.Fly;
    begin

    end;

end.

