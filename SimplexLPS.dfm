object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1057#1080#1084#1087#1083#1077#1082#1089'-'#1084#1077#1090#1086#1076' '#1088#1077#1096#1077#1085#1080#1103' '#1079#1072#1076#1072#1095' '#1083#1080#1085#1077#1081#1085#1086#1075#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1103
  ClientHeight = 473
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 81
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 739
    object GroupBox1: TGroupBox
      Left = 9
      Top = 0
      Width = 720
      Height = 73
      Caption = #1058#1072#1073#1083#1080#1094#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 11
        Top = 33
        Width = 79
        Height = 20
        Caption = #1057#1090#1088#1086#1082#1080' (m):'
      end
      object Label2: TLabel
        Left = 152
        Top = 33
        Width = 105
        Height = 20
        Caption = #1057#1090#1086#1083#1073#1094#1099' (n-m):'
      end
      object EditM: TEdit
        Left = 96
        Top = 26
        Width = 50
        Height = 28
        TabOrder = 0
        Text = '4'
      end
      object EditN: TEdit
        Left = 263
        Top = 26
        Width = 50
        Height = 28
        TabOrder = 1
        Text = '4'
      end
      object RandomBox: TCheckBox
        Left = 551
        Top = 31
        Width = 169
        Height = 17
        Caption = #1057#1083#1091#1095#1072#1081#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103
        TabOrder = 2
      end
      object ButtonAdd: TButton
        Left = 319
        Top = 26
        Width = 227
        Height = 28
        Caption = #1047#1072#1076#1072#1090#1100' '#1089#1080#1084#1087#1083#1077#1082#1089'-'#1090#1072#1073#1083#1080#1094#1091
        TabOrder = 3
        OnClick = ButtonAddClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 741
    Height = 304
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 739
    object StringGrid1: TStringGrid
      Left = 1
      Top = 1
      Width = 739
      Height = 302
      Align = alClient
      DefaultColWidth = 85
      TabOrder = 0
      OnClick = StringGrid1Click
      ExplicitWidth = 737
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 385
    Width = 553
    Height = 88
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 80
    object GroupBox2: TGroupBox
      Left = 9
      Top = 6
      Width = 538
      Height = 75
      Caption = #1042#1099#1073#1086#1088' '#1088#1072#1079#1088#1077#1096#1072#1102#1097#1077#1075#1086' '#1101#1083#1077#1084#1077#1085#1090#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object LabelM: TLabel
        Left = 11
        Top = 24
        Width = 63
        Height = 20
        Caption = #1057#1090#1088#1086#1082#1072': 0'
      end
      object LabelN: TLabel
        Left = 11
        Top = 50
        Width = 73
        Height = 20
        Caption = #1057#1090#1086#1083#1073#1077#1094': 0'
      end
      object LabelNum: TLabel
        Left = 152
        Top = 14
        Width = 152
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
      end
      object ButtonLeft: TButton
        Left = 152
        Top = 40
        Width = 73
        Height = 25
        Caption = '<-'
        Enabled = False
        TabOrder = 0
        OnClick = ButtonLeftClick
      end
      object ButtonRight: TButton
        Left = 231
        Top = 40
        Width = 73
        Height = 25
        Caption = '->'
        Enabled = False
        TabOrder = 1
        OnClick = ButtonRightClick
      end
      object ButtonCalc: TButton
        Left = 310
        Top = 40
        Width = 220
        Height = 25
        Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
        Enabled = False
        TabOrder = 2
        OnClick = ButtonCalcClick
      end
    end
  end
  object Panel4: TPanel
    Left = 553
    Top = 385
    Width = 188
    Height = 88
    Align = alClient
    TabOrder = 3
    ExplicitWidth = 186
    ExplicitHeight = 80
    object ButtonClose: TButton
      Left = 24
      Top = 32
      Width = 145
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonCloseClick
    end
  end
end
