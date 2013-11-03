unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
const e=0.001;

implementation

{$R *.lfm}

{ TForm1 }

function F(x:real):real;
begin
F:=sqr(x)*arctan(x)-1;
end;

procedure TForm1.Button1Click(Sender: TObject);
var a,b,c,x:real;
    code:integer;
begin
val(Edit1.text,a,code);
if code=0 then
   begin
   val(Edit2.text,b,code);
   if code=0 then
      begin
//a:=strtofloat(Edit1.text);
//b:=strtofloat(Edit2.text);
      memo1.lines.add('Отрезок ['+floattostr(a)+';'+floattostr(b)+']');

      if F(a)*F(b)<0 then
      begin
      //Рисуем график
      x:=a;
      while x<b do
         begin
         Chart1LineSeries1.AddXY(x,F(x));
         x:=x+abs(b-a)/12;
         end;

      memo1.lines.add('Промежуточные корни');
      repeat
         c:=(a+b)/2;
         memo1.lines.add(floattostr(c));
         if F(a)*F(c)<0 then b:=c
                        else a:=c;
      until b-a<e ;
      x:=(a+b)/2;
      end
      else x:=a-1;
      if x<a then memo1.lines.add('На данном интервале нету корней')
             else memo1.lines.add('Ответ: '+floattostr(x));
      end
   else ShowMessage('Данные введены не корректно');
   end
else ShowMessage('Данные введены не корректно');
end;

end.

