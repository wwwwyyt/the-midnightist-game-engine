unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    ListBox1: TListBox;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1SelectionChange(Sender: TObject; User: boolean);
  private
    GameLogList: TList;
  public
    procedure AddGameLog(Brief, Detail: UTF8String);
  end;

  { TGameLog }

  TGameLog = class(TObject)
  private
  public
    GameLogIdx: Integer;
    GameLogBrief: UTF8String;
    GameLogDetail: UTF8String;
    constructor Create(Brief, Detail: UTF8String);
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  AddGameLog('1', '222');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Text := '';
  Image1.Picture.LoadFromFile('./assets/001.jpg');
  GameLogList := TList.Create;
end;

procedure TForm1.ListBox1SelectionChange(Sender: TObject; User: boolean);
begin
  Memo1.Text := ListBox1.Items.Objects[ListBox1.ItemIndex];
end;

procedure TForm1.AddGameLog(Brief, Detail: UTF8String);
begin
  GameLogList.Add(TGameLog.Create(Brief, Detail));
  ListBox1.AddItem(TGameLog(GameLogList.Last).GameLogBrief,
                   TObject(TGameLog(GameLogList.Last).GameLogDetail));
end;

{ TGameLog }

constructor TGameLog.Create(Brief, Detail: UTF8String);
begin
  inherited Create;
  GameLogBrief := Brief;
  GameLogDetail := Detail;
end;

end.

