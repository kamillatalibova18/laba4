unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}
 const
 DBName= 'C:\Users\student\Downloads\laba4-main\лаба42\Medal';//путь к текстовому файлу Medal.txt
 var
f:TextFile;

{ TForm1 }
 procedure TForm1.FormActivate(Sender: TObject);
 begin
AssignFile(f,dbName);
 {$I-}
Append(f);
 // сделать недоступными поля ввода в случае, когда файл БД не найден
If IOResult<>0 then
begin
 Edit1.Enabled:=False;
 ComboBox1.Enabled:=False;
 ComboBox2.Enabled:=False;
ComboBox3.Enabled:=False;
ShowMessage('Ошибка! ФайлБДненайден ' + DBName);
end;
 end;

 procedure TForm1.FormCreate(Sender: TObject);
 begin

 end;

 procedure TForm1.Button1Click(Sender: TObject);
begin
Append(f);
if (Length(Edit1.Text)=0) then
ShowMessage('поле СПОРТСМЕН должно быть заполнено!')
else WriteLn(f, Edit1.Text, ' ', ComboBox1.Text, '' , ComboBox2.Text, ' ' ,
ComboBox3.Text);
// очистить поля
Edit1.Text:=' ';
ComboBox1.Text:=' ';
 ComboBox2.Text:=' ';
 ComboBox3.Text:=' ';
CloseFile(f);
end;

end.

