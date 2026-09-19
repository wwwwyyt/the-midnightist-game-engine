unit Game;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Fgl;

type

{ TStringIntMap }
TStringStringMap = specialize TFPGMap<UTF8String, UTF8String>;

{ TStringIntMap }
TStringIntMap = specialize TFPGMap<UTF8String, Integer>;

{ TStringBoolMap }
TStringBoolMap = specialize TFPGMap<UTF8String, Boolean>;

{ TStringBoolMap }
TStringRealMap = specialize TFPGMap<UTF8String, Real>;

{ TGameState }

TGameState = class(TObject)
private
  GameStateSVar: TStringStringMap;
  GameStateIVar: TStringIntMap;
  GameStateBVar: TStringBoolMap;
  GameStateFVar: TStringRealMap;
public
  procedure PutGameState(key: UTF8String; value: UTF8String); overload;
  procedure PutGameState(key: UTF8String; value: Integer); overload;
  procedure PutGameState(key: UTF8String; value: Boolean); overload;
  procedure PutGameState(key: UTF8String; value: Real); overload;

  function GetGameState(key: UTF8String): UTF8String; overload;
  function GetGameState(key: UTF8String): Integer; overload;
  function GetGameState(key: UTF8String): Boolean; overload;
  function GetGameState(key: UTF8String): Real; overload;
end;

implementation

{ TGameState }

procedure TGameState.PutGameState(key: UTF8String; value: UTF8String); overload;
begin
  GameStateSVar.Add(key, value);
end;

procedure TGameState.PutGameState(key: UTF8String; value: Integer); overload;
begin
  GameStateIVar.Add(key, value);
end;

procedure TGameState.PutGameState(key: UTF8String; value: Boolean); overload;
begin
  GameStateBVar.Add(key, value);
end;

procedure TGameState.PutGameState(key: UTF8String; value: Real); overload;
begin
  GameStateFVar.Add(key, value);
end;

function TGameState.GetGameState(key: UTF8String): UTF8String; overload;
begin
  GameStateSVar.TryGetData(key, result);
end;

function TGameState.GetGameState(key: UTF8String): Integer; overload;
begin
  GameStateIVar.TryGetData(key, result);
end;

function TGameState.GetGameState(key: UTF8String): Boolean; overload;
begin
  GameStateBVar.TryGetData(key, result);
end;

function TGameState.GetGameState(key: UTF8String): Real; overload;
begin
  GameStateFVar.TryGetData(key, result);
end;

end.

