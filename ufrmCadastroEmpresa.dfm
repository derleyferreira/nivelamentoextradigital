object frmCadastroEmpresa: TfrmCadastroEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Empresas'
  ClientHeight = 537
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBotoes: TPanel
    Left = 0
    Top = 459
    Width = 575
    Height = 59
    Align = alBottom
    TabOrder = 0
    object btnIncluir: TBitBtn
      Left = 291
      Top = 4
      Width = 66
      Height = 50
      Caption = 'F2 - Incluir'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF05710A05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF05710A14A82405710AFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A24B63C1CAF3005710A05710A05
        710A05710A05710A05710A05710A05710AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A39C6592FBF4C27B7
        3F1FB13318AA2811A6200EA31B0EA31B0EA31B0EA31B05710AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A4BD575
        44CF693BC85D32C14F29B94321B33618AC2B12A6220EA31B0EA31B0EA31B0571
        0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF05710A4ED77746D16C3DCA5F34C3532BBB4522B4391BAD2E14A824
        0FA31C0EA31B05710AFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78
        D51C78D51C78D51C78D51C5996FF00FF05710A4FD87A48D26F05710A05710A05
        710A05710A05710A05710A05710A05710A1C78D51C78D5FF00FF1C78D5A7DAFF
        4EB3FE4CB1FE4AAFFF48ADFF46ABFF44A9FF1C5996FF00FFFF00FF05710A50D9
        7C05710AFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499FF3499FF3499FF1C
        78D51C78D5A8DBFF50B5FE4EB3FE4CB1FE4AAFFF48ADFF46ABFF1C5996FF00FF
        FF00FFFF00FF05710A05710AFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499
        FF3499FF3499FF1C78D51C78D5A9DCFF52B7FE50B5FE4EB3FE4CB1FE4AAFFF48
        ADFF1C5996FF00FFFF00FFFF00FFFF00FF05710AFF00FFFF00FFE4F0FC3499FF
        3499FF3499FF3499FF3499FF3499FF1C78D51C78D5AADDFF54B9FE52B7FE50B5
        FE4EB3FE4CB1FE4AAFFF1C5996FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFE4F0FC3499FF3499FF3499FF3499FF3499FF3499FF1C78D51C78D5ABDEFF
        56BBFE54B9FE52B7FE50B5FE4EB3FE4CB1FE1C5996FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499FF3499FF3499FF1C
        78D51C78D5ACDFFF58BDFE56BBFE54B9FE52B7FE50B5FE4EB3FE1C5996FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499
        FF3499FF3499FF1C78D51C78D5ADE0FF5ABFFE58BDFE56BBFE54B9FE52B7FE50
        B5FE1C5996FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE4F0FCE4F0FC
        E4F0FCE4F0FCE4F0FCE4F0FCE4F0FCE4F0FC1C78D5629DCF398DCF388CCF378B
        CF368ACF3589CF3488CF1C59961C59961C59961C59961C59961C59961C59961C
        59961C5996FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D5AFE2FF
        5EC3FE5CC1FE5ABFFE58BDFE56BBFE54B9FE3488CF50B5FE4EB3FE4CB1FE4AAF
        FF48ADFF46ABFF44A9FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF1C78D5B0E2FF5FC4FE5EC3FE5CC1FE5ABFFE58BDFE56BBFE3589CF52B7FE
        50B5FE4EB3FE4CB1FE4AAFFF48ADFF46ABFF1C78D5FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D5B0E3FF61C6FE5FC4FE5DC2FE5CC1FE5ABFFE58
        BDFE368ACF54B9FE52B7FE50B5FE4EB3FE4CB1FE4AAFFF48ADFF1C78D5FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D5B0E3FF61C6FE61C6FE5FC4
        FE5DC2FE5BC0FE59BEFE378BCF56BBFE54B9FE52B7FE50B5FE4EB3FE4CB1FE4A
        AFFF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D5B0E3FF
        61C6FE61C6FE61C6FE5FC4FE5DC2FE5BC0FE388CCF58BDFE56BBFE54B9FE52B7
        FE50B5FE4EB3FE4CB1FE1C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF1C78D5BAE6FF61C6FE61C6FE61C6FE61C6FE5FC4FE5DC2FE398DCF59BEFE
        58BDFE56BBFE54B9FE52B7FE50B5FE4EB3FE1C78D5FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D5E7F3FCBAE6FFB0E3FFB0E3FFB0E3FFB0E2FFAF
        E1FF629DCFADDFFFACDEFFABDEFFAADDFFA9DCFFA8DBFFA7DAFF1C78D5FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78
        D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C
        78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TBitBtn
      Left = 360
      Top = 4
      Width = 66
      Height = 50
      Caption = 'F3 - Alterar'
      Enabled = False
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFA97F79B78183B78183B78183B78183B78183B78183B78183B78183B78183
        B78183B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF00
        FFFF00FFFF00FFFF00FFA97F7AF2DEC8F7E3CAF5DFC2F1D9BAECD4B1E8CEA9E6
        CAA3E8CA9FEBCB9CEDCB99EDCB96EECC97EECC97EECC97EECC97EFCD97EDCB96
        B3897BFF00FFFF00FFFF00FFFF00FFFF00FFA97F7AF2E0CEF7E6CEF4E1C7EED8
        BDE2CCAED5BFA0CFB897D3B996DCC097E3C497E8C795EAC995EDCB96EECC97EE
        CC97EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FFFF00FFA97F7AF3E3D2
        F8E8D3F4E2CBECD9C038373958534EA3927BB19E81BCA585C8AF89D4B78DDCBD
        8EE6C592EBCA95EDCB96EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FFFF
        00FFA97F7BF4E6D8F9EBD9F7E6D2EFDEC656524F3535372C424C4D5E5F9B8971
        A49074B29B7AC3A882D4B689E2C28FEAC995EDCB96EDCB96B3897BFF00FFFF00
        FFFF00FFFF00FFFF00FFAA807BF5E9DDFBEFE0F8EAD9F4E3D0BEB1A12255690C
        82AF106A8E1A566D546463907E67A08B6EB79D7ACBAE83DCBD8CE8C792EAC994
        B3897BFF00FFFF00FFFF00FFFF00FFFF00FFAD837DF5ECE3FBF2E6F9EDDEF7E8
        D6F0E1CC2E58680A84B10D81AD2F6B88424D5A5B4E5284705D968367AD9573C3
        A77DD8B988E3C290B1877AFF00FFFF00FFFF00FFFF00FFFF00FFB2887EF7EFE8
        FCF5ECFAEFE4F9ECDDF6E7D68D9D9D0B749B4A6B7FAA7B7BBC8888AB78787E55
        547F6D5A8F7D62A48D6CBBA078CEB083AB8375FF00FFFF00FFFF00FFFF00FFFF
        00FFB68B80F8F2EEFDF8F1FAF3EAF9EFE3F9ECDDF4E5D5185B74A37676D8A4A4
        CA9696BC8888AB77777E55547E6C5889785E9A8666AF96709D786CFF00FFFF00
        FFFF00FFFF00FFFF00FFBA8E82FAF6F4FEFCF8FCF6F0FAF2EAFAF0E4F8ECDC69
        868FB08383E5B1B1D7A3A3C99595BB8787A77474754E4D7C6B5784735B948063
        8C6B61FF00FFFF00FFFF00FFFF00FFFF00FFBE9283FBF8F7FFFFFEFEFAF6FCF5
        EFFAF2EAFAF0E3F7EADB946B6AE9B7B7E4B1B1D6A3A3C99595BB8787A3727275
        4E4D7B6A5786745C7C5F56FF00FFFF00FFFF00FFFF00FFFF00FFC29685FBF8F7
        FFFFFFFFFEFCFEF9F4FCF6EFFBF3EAFAEFE3E8D8CA946B6AE9B6B6E4B0B0D6A2
        A2C89494BA8686A37171754E4E806D59735951FF00FFFF00FFFF00FFFF00FFFF
        00FFC69986FBF8F7FFFFFFFFFFFFFFFDFCFEF9F5FCF6F0FAF2EAFAF0E4E8D8CA
        8C6362E8B6B6E3B0B0D5A2A2C89494BA8686A271717852506E564FFF00FFFF00
        FFFF00FFFF00FFFF00FFCA9C88FBF8F7FFFFFFFFFFFFFFFFFFFFFEFCFEF9F5FC
        F6EFFBF2EAFAEFE3CAB5AB8C6362E8B5B5E3AFAFD5A1A1C79393B98585A27070
        754F4EFF00FFFF00FFFF00FFFF00FFFF00FFCEA089FCF9F7FFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFCFEF9F5FCF5EFFBF2E9FAF0E3CAB5AB8C6362E7B5B5E2AFAFD4
        A1A1C79393B98585A17070764E4EFF00FFFF00FFFF00FFFF00FFD2A38AFCF9F7
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFAF5FCF6EFFAF2E9FAEFE2CBB5
        ABA77B7BF0BCBCE2AEAED4A0A0C692929869695C63704F6271FF00FFFF00FFFF
        00FFD7A78CFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFDF9F4
        FCF5EEFCF5EBEEDDD19C6F67A77B7BEFBCBCE1AEAE6E697207A1D100BCEF00B9
        EC009ED1FF00FFFF00FFDAAB8DFCF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B38176BC9171A67B7BD0A0A01594BD
        00CCFF00CCFF00B9EC0130B100009AFF00FFDEAD8EFDFAF8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFEF9E5D1CBB38176EFC48DC7
        95618C626200B3E600CCFF00A3DC0130B1041CB10316AC00009ADEAD8EFDFAF8
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D4
        D0B38176EFC38CF3BA6C93646500A9DC00C2F50443BA113CE40C36C80732C203
        16ACDEAD8EFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE9DBD9B38176F1C58BB88285FF00FFFF00FF019CCF1A37CD456A
        F81E47D80833C2020EA5DAA482DAA482DAA482DAA482DAA482DAA482DAA482DA
        A482DAA482DAA482DAA482DAA482DAA482B38176B88285FF00FFFF00FFFF00FF
        FF00FF293BCD6D8AFD2B53EA0515ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF2538CC0E1BB8FF00FFFF00FF}
      Layout = blGlyphTop
      TabOrder = 1
      OnClick = btnAlterarClick
    end
    object btnGravar: TBitBtn
      Left = 497
      Top = 4
      Width = 66
      Height = 50
      Caption = 'F6 - Gravar'
      Enabled = False
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE58
        58A74B4CA36E6FBABFBECED0CFD0CDCCCCCDCCC5C5C5A76E6E953838A44E4EFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFBE7670D06666CA5E5FA46B6CAC9190D8C0BEFAF4F1FDFDFCEBEBEAB26E
        6D8F2221B85252B45B5BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFBD766FCE6666C86160A97272985252AB5858E2D4D2
        FFFFFFFAF7F6B873728F2121B75151B35A5BFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD766FCE6566C65F5FB17A7A9D
        5655922424BBA6A5F0F8F6FFFFFFBC79778A1D1DB65050B35A5BFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD766FCE66
        66C65D5DB87B7BB68785A46262A29091CCCECBF4EDECBE77778F2122B75151B3
        5A5BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAE5858A74B4CA36E6F
        BABFBEBD7670CE6667CB6162C76566CC7877C87676C16C6CC36C6CD07979C763
        63BE5353C96262B15859FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBE7670D0
        6666CA5E5FA46B6CAC9190BC746EB85452BC6866CE8D8CD49A9AD59C9BD69A99
        D39190D19293D59F9DD79E9DD07171B05556FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFBD766FCE6666C86160A97272985252B86D66BA6763EBDDDBF8F4F4F7
        F2F1F7F3F1F7F3F1F8F3F2F8F2F1FBFAF9EADBDAC97070AE5153FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFBD766FCE6566C65F5FB17A7A9D5655B86C65BF6F
        6CF6F1EFF7F5F5F1ECEBF2EDECF2EDECF2EDECF1ECEBF7F7F6EBDBDAC86E6EAE
        5152FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD766FCE6666C65D5DB87B7B
        B68785B86C65C06F6CF3ECEAE4E3E3D7D4D3D9D6D6D9D6D6D9D6D6D7D4D3E1E4
        E3E9D8D7C96F6FAE5152FF00FFAE5858A74B4CA36E6FBABFBECED0CFBD7670CE
        6667CB6162C76566CC7877B86C65BF6E6CF4EDECECEAE9E1DDDCE3DFDFE3DFDF
        E3DFDFE1DDDCEAEBEAE9D8D8C96F6EAE5152BE7670D06666CA5E5FA46B6CAC91
        90D8C0BEBC746EB85452BC6866CE8D8CD49A9AB86C65C06F6CF3ECECE7E5E4DA
        D7D6DCDAD9DCDAD9DCDAD9DAD7D6E5E6E5EAD9D7CA706FAE5152BD766FCE6666
        C86160A97272985252AB5858B86D66BA6763EBDDDBF8F4F4F7F2F1B86C65BF6E
        6BF5EEEEF8F5F5F2EBEAF2EDECF2EDECF2EDECF2EBEAF8F7F5ECDBDAC9706FAE
        5252BD766FCE6566C65F5FB17A7A9D5655922424B86C65BF6F6CF6F1EFF7F5F5
        F1ECEBF2EDECB16663D4CFCEDADADAD8D3D3D8D4D4D8D4D4D8D4D4D8D3D3DADA
        DAD4C7C6AF6363FF00FFBD766FCE6666C65D5DB87B7BB68785A46262B86C65C0
        6F6CF3ECEAE4E3E3D7D4D3D9D6D6D9D6D6D9D6D6D7D4D3E1E4E3E9D8D7C96F6F
        AE5152FF00FFFF00FFFF00FFFF00FFFF00FFBD7670CE6667CB6162C76566CC78
        77C87676B86C65BF6E6CF4EDECECEAE9E1DDDCE3DFDFE3DFDFE3DFDFE1DDDCEA
        EBEAE9D8D8C96F6EAE5152FF00FFFF00FFFF00FFFF00FFFF00FFBC746EB85452
        BC6866CE8D8CD49A9AD59C9BB86C65C06F6CF3ECECE7E5E4DAD7D6DCDAD9DCDA
        D9DCDAD9DAD7D6E5E6E5EAD9D7CA706FAE5152FF00FFFF00FFFF00FFFF00FFFF
        00FFB86D66BA6763EBDDDBF8F4F4F7F2F1F7F3F1B86C65BF6E6BF5EEEEF8F5F5
        F2EBEAF2EDECF2EDECF2EDECF2EBEAF8F7F5ECDBDAC9706FAE5252FF00FFFF00
        FFFF00FFFF00FFFF00FFB86C65BF6F6CF6F1EFF7F5F5F1ECEBF2EDECF2EDECB1
        6663D4CFCEDADADAD8D3D3D8D4D4D8D4D4D8D4D4D8D3D3DADADAD4C7C6AF6363
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB86C65C06F6CF3ECEAE4E3E3D7D4
        D3D9D6D6D9D6D6D9D6D6D7D4D3E1E4E3E9D8D7C96F6FAE5152FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB86C65BF6E6C
        F4EDECECEAE9E1DDDCE3DFDFE3DFDFE3DFDFE1DDDCEAEBEAE9D8D8C96F6EAE51
        52FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFB86C65C06F6CF3ECECE7E5E4DAD7D6DCDAD9DCDAD9DCDAD9DAD7D6E5E6E5
        EAD9D7CA706FAE5152FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFB86C65BF6E6BF5EEEEF8F5F5F2EBEAF2EDECF2EDECF2
        EDECF2EBEAF8F7F5ECDBDAC9706FAE5252FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB16663D4CFCEDADADAD8D3
        D3D8D4D4D8D4D4D8D4D4D8D3D3DADADAD4C7C6AF6363FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      TabOrder = 2
      OnClick = btnGravarClick
    end
    object btnConsultar: TBitBtn
      Left = 6
      Top = 4
      Width = 107
      Height = 50
      Caption = 'F5 - Consultar'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFA87D78B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183B78183B78183B78183B78183B78183B78183FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFA87D78F3E7D8F3E7D8F3E7D8F3E7D8F3E7D8F3E7D8
        F3E7D8F3E7D8F0E2CFF0E2CFF0E2CFF0E2CFF0E2CFF0E2CFF0E2CFF0E2CFB781
        83FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA87D78F3E7D8F2E6D7FDEFE0FD
        EFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0
        F0E2CFF0E2CFB78183FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA87D78F3E8
        DBF3E7D9FECC9AFECC9AFECC9AFECC9AFECC9AFECC9AFECC9AFECC9AFECC9AFE
        CC9AFECC9AFECC9AF0E2CFF0E2CFB78183FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFA87D78F4EADEF4E9DCF3E8DAF3E7D9F2E6D7F2E5D5F1E4D4F1E4D2F0E3
        D0F0E2CFF0E2CFF0E2CFF0E2CFF0E2CFF0E2CFF0E2CFB78183FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFA87D78F4EBE0F3E9DEFDEFE0FDEFE0FDEFE0FDEFE0
        FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0EFE1CEEFE1CEB781
        83FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA87D78EDE5DBEDE4DAFECC9AFE
        CC9AFECC9AFECC9AFECC9AFECC9AFECC9AFECC9AFECC9AFECC9AFECC9AFECC9A
        E8DAC8E8DAC8B78183FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB2887ED9D3
        CBD9D2C9D9D1C7D8D0C7D7CFC5D7CEC4D6CEC2D6CDC0D6CCBFD6CBBED6CABCD5
        C9BAD5C8B9D4C7B8D4C7B7D4C7B7B78183FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFA07A71B5AFAAB4AEA9B4ADA7B4ACA6B4ACA4B3ACA3B2ABA2B2AAA1B1A9
        A0B1A99EB0A89DB0A89CB0A79AB0A69AB0A599AFA498A47476FF00FFFF00FFFF
        00FFA35228A35228A35228A35228A35228A35228A35228A35228A35228A35228
        A35228A35228A35228A35228A35228A35228A35228A35228A35228A35228A352
        28A35228A35228A35228A35228FF00FFFF00FFBA8E82E7E2DDE7E2DBE6E0DAE6
        E0D9E5DED7E5DED5E5DDD4E5DBD2E4DBD1E3D9CFE3D9CDE2D9CCE2D8CBE1D6C9
        E1D6C7E1D5C6B78183FF00FFFF00FFA35228A35228FF00FFFF00FFBA8E82DCD8
        D4DCD6D2D87542D87542D87542D87542D87542D87542D87542D87542D87542D8
        7542D87542D87542D5CBBFD5CABDB78183FF00FFFF00FFA35228A35228FF00FF
        FF00FFAE8777B7B5B1B6B4B0F6CAB3F6CAB3F6CAB3F6CAB3F6CAB3F6CAB3F6CA
        B3F6CAB3F6CAB3F6CAB3F6CAB3F6CAB3B1AAA1B1A99FA47476FF00FFFF00FFA3
        5228A35228A35228A35228A35228A35228A35228A35228A35228A35228A35228
        A35228A35228A35228A35228A35228A35228A35228A35228A35228A35228A352
        28A35228A35228A35228FF00FFFF00FFFF00FFC29685FFFEFDFFFEFDFFFEFDFF
        FEFDFFFEFDFBF7F3FBF7F3FAF5EFFAF5EFF8F1EBF8F1EBF7F1E9F7F1E9F6ECE2
        F6ECE2F6ECE2B78183FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCA9C88FEFD
        FCFDFCFAFDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FD
        EFE0FDEFE0FDEFE0F5ECE3F5EBE1B78183FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFCEA089FFFFFFFFFFFFFECC9AFECC9AFECC9AFECC9AFECC9AFECC9AFECC
        9AFECC9AFECC9AFECC9AFECC9AFECC9AF6EFE6F6EEE5B78183FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD2A38AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F1E9F7F0E7B781
        83FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD7A78CFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFDFEFCFAFEFBF8FCF9F6FBF8F4FBF7F3FAF6F1FAF4EFF9F3EE
        F9F2ECF7F1EAB78183FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDAAB8DFFFF
        FFFFFFFFFDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FDEFE0FD
        EFE0FDEFE0FDEFE0F9F4EFF9F3EDB78183FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFDEAD8EFFFFFFFFFFFFFECC9AFECC9AFECC9AFECC9AFECC9AFECC9AFECC
        9AFECC9AFECC9AFECC9AFECC9AFECC9AFAF6F1FAF5EFB78183FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFDEAD8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFEFCFAFDFBF8FCF9F6FBF8F4FAF6F2B781
        83FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEAD8EFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFBFEFBF9
        FDFAF7FBF8F5B78183FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEAD8FDAA4
        82DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DAA482DA
        A482DAA482DAA482DAA482DAA482AA807CFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      TabOrder = 3
      OnClick = btnConsultarClick
    end
    object btnExcluir: TBitBtn
      Left = 429
      Top = 4
      Width = 66
      Height = 50
      Caption = 'F4 - Excluir'
      Enabled = False
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0571
        0AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF05710A05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF05710A0EA31B05710AFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF05710A05710A05710A05710A05710A05710A05710A05710A0FA41D0EA31B05
        710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF05710A57DF8550D97C48D26F3DCA6032C04F27B73F1CAF
        3114A8240EA31B0EA31B05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A58E08756DE844ED87A45D16C
        3BC85C2FBF4C24B63C1AAD2E13A7220EA31B0EA31B05710AFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A58E08758
        E08755DD824DD77843CF6938C65A2EBD4922B43919AC2B11A52005710AFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78
        D505710A05710A05710A05710A05710A05710A05710A05710A2BBB4620B23605
        710AE4F0FC1C78D51C78D51C78D51C78D51C78D51C78D5FF00FF1C78D5A7DAFF
        4EB3FE4CB1FE4AAFFF48ADFF46ABFF44A9FF1C5996FF00FFFF00FFFF00FF0571
        0A34C25205710AFF00FFE4F0FC3499FF3499FF3499FF3499FF3499FF3499FF1C
        78D51C78D5A8DBFF50B5FE4EB3FE4CB1FE4AAFFF48ADFF46ABFF1C5996FF00FF
        FF00FFFF00FF05710A05710AFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499
        FF3499FF3499FF1C78D51C78D5A9DCFF52B7FE50B5FE4EB3FE4CB1FE4AAFFF48
        ADFF1C5996FF00FFFF00FFFF00FF05710AFF00FFFF00FFFF00FFE4F0FC3499FF
        3499FF3499FF3499FF3499FF3499FF1C78D51C78D5AADDFF54B9FE52B7FE50B5
        FE4EB3FE4CB1FE4AAFFF1C5996FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFE4F0FC3499FF3499FF3499FF3499FF3499FF3499FF1C78D51C78D5ABDEFF
        56BBFE54B9FE52B7FE50B5FE4EB3FE4CB1FE1C5996FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499FF3499FF3499FF1C
        78D51C78D5ACDFFF58BDFE56BBFE54B9FE52B7FE50B5FE4EB3FE1C5996FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE4F0FC3499FF3499FF3499FF3499
        FF3499FF3499FF1C78D51C78D5ADE0FF5ABFFE58BDFE56BBFE54B9FE52B7FE50
        B5FE1C5996FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE4F0FCE4F0FC
        E4F0FCE4F0FCE4F0FCE4F0FCE4F0FCE4F0FC1C78D5629DCF398DCF388CCF378B
        CF368ACF3589CF3488CF1C59961C59961C59961C59961C59961C59961C59961C
        59961C5996FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D5AFE2FF
        5EC3FE5CC1FE5ABFFE58BDFE56BBFE54B9FE3488CF50B5FE4EB3FE4CB1FE4AAF
        FF48ADFF46ABFF44A9FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF1C78D5B0E2FF5FC4FE5EC3FE5CC1FE5ABFFE58BDFE56BBFE3589CF52B7FE
        50B5FE4EB3FE4CB1FE4AAFFF48ADFF46ABFF1C78D5FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D5B0E3FF61C6FE5FC4FE5DC2FE5CC1FE5ABFFE58
        BDFE368ACF54B9FE52B7FE50B5FE4EB3FE4CB1FE4AAFFF48ADFF1C78D5FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D5B0E3FF61C6FE61C6FE5FC4
        FE5DC2FE5BC0FE59BEFE378BCF56BBFE54B9FE52B7FE50B5FE4EB3FE4CB1FE4A
        AFFF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D5B0E3FF
        61C6FE61C6FE61C6FE5FC4FE5DC2FE5BC0FE388CCF58BDFE56BBFE54B9FE52B7
        FE50B5FE4EB3FE4CB1FE1C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF1C78D5BAE6FF61C6FE61C6FE61C6FE61C6FE5FC4FE5DC2FE398DCF59BEFE
        58BDFE56BBFE54B9FE52B7FE50B5FE4EB3FE1C78D5FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D5E7F3FCBAE6FFB0E3FFB0E3FFB0E3FFB0E2FFAF
        E1FF629DCFADDFFFACDEFFABDEFFAADDFFA9DCFFA8DBFFA7DAFF1C78D5FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78
        D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C78D51C
        78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphTop
      TabOrder = 4
      OnClick = btnExcluirClick
    end
  end
  object pnlGeral: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 459
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 311
      Width = 573
      Height = 147
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet2: TTabSheet
        Caption = ' Funcion'#225'rios  '
        ImageIndex = 1
        object dbgFuncionarios: TDBGrid
          Left = 0
          Top = 0
          Width = 565
          Height = 85
          Align = alClient
          DataSource = DS_FUNCIONARIOS
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'IDFUNCIONARIO'
              Title.Caption = 'C'#243'digo'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMFUNCIONARIO'
              Title.Caption = 'Nome'
              Width = 217
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TLCONTATO'
              Title.Caption = 'Celular'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TLCELULAR'
              Title.Caption = 'Telefone'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTCONTRATACAO'
              Title.Caption = 'Data Contrata'#231#227'o'
              Width = 93
              Visible = True
            end>
        end
        object Panel1: TPanel
          Left = 0
          Top = 85
          Width = 565
          Height = 34
          Align = alBottom
          TabOrder = 1
          object spbFuncionarios: TSpeedButton
            Left = 1
            Top = 3
            Width = 216
            Height = 29
            Hint = 'Permite abrir a tela de cadastro de funcion'#225'irios'
            Caption = 'Manuten'#231#227'o de Funcion'#225'rios'
            ParentShowHint = False
            ShowHint = True
            OnClick = spbFuncionariosClick
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = ' Outros Endere'#231'os  (Inativos)'
        ImageIndex = 2
        object dbgOutrosEnderecos: TDBGrid
          Left = 0
          Top = 0
          Width = 565
          Height = 85
          Align = alClient
          DataSource = DS_OUTROSENDERECOS
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NMENDERECO'
              Title.Caption = 'Endere'#231'o'
              Width = 192
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUENDERECO'
              Title.Caption = 'N'#250'mero'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMBAIRRO'
              Title.Caption = 'Bairro'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NMCIDADE'
              Title.Caption = 'Cidade'
              Width = 126
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SGESTADO'
              Title.Caption = 'UF'
              Width = 32
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 0
          Top = 85
          Width = 565
          Height = 34
          Align = alBottom
          TabOrder = 1
          object SpeedButton1: TSpeedButton
            Left = 1
            Top = 3
            Width = 216
            Height = 29
            Hint = 'Permite abrir a tela de cadastro de endere'#231'os'
            Caption = 'Manuten'#231#227'o de Endere'#231'os'
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton1Click
          end
        end
      end
    end
    object pnlControlesCadastro: TPanel
      Left = 1
      Top = 1
      Width = 573
      Height = 310
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 7
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 16
        Top = 51
        Width = 60
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label3: TLabel
        Left = 16
        Top = 135
        Width = 25
        Height = 13
        Caption = 'CNPJ'
      end
      object Label4: TLabel
        Left = 173
        Top = 135
        Width = 87
        Height = 13
        Caption = 'Inscri'#231#227'o Estadual'
      end
      object Label5: TLabel
        Left = 325
        Top = 135
        Width = 84
        Height = 13
        Caption = 'Data de Abertura'
      end
      object Label6: TLabel
        Left = 16
        Top = 93
        Width = 28
        Height = 13
        Caption = 'E-mail'
      end
      object Label7: TLabel
        Left = 16
        Top = 178
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Label8: TLabel
        Left = 173
        Top = 178
        Width = 33
        Height = 13
        Caption = 'Celular'
      end
      object Bevel1: TBevel
        Left = 1
        Top = 221
        Width = 566
        Height = 3
      end
      object Label9: TLabel
        Left = 16
        Top = 226
        Width = 45
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label10: TLabel
        Left = 472
        Top = 226
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label11: TLabel
        Left = 112
        Top = 263
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label12: TLabel
        Left = 323
        Top = 263
        Width = 21
        Height = 13
        Caption = 'U.F.'
      end
      object Label13: TLabel
        Left = 367
        Top = 263
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label14: TLabel
        Left = 16
        Top = 263
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object edtCodigo: TEdit
        Left = 16
        Top = 21
        Width = 43
        Height = 21
        TabOrder = 0
      end
      object edtRazaoSocial: TEdit
        Left = 16
        Top = 65
        Width = 545
        Height = 21
        TabOrder = 1
      end
      object edtInscricao: TEdit
        Left = 173
        Top = 150
        Width = 140
        Height = 21
        TabOrder = 4
      end
      object cbAtiva: TCheckBox
        Left = 517
        Top = 161
        Width = 44
        Height = 17
        Caption = 'Ativa'
        TabOrder = 6
      end
      object edtEmail: TEdit
        Left = 16
        Top = 107
        Width = 545
        Height = 21
        TabOrder = 2
      end
      object mskCNPJ: TMaskEdit
        Left = 16
        Top = 150
        Width = 139
        Height = 21
        EditMask = '99.999.999/9999-99;0'
        MaxLength = 18
        TabOrder = 3
        Text = ''
      end
      object mskDtAbertura: TMaskEdit
        Left = 325
        Top = 150
        Width = 141
        Height = 21
        EditMask = '99/99/9999;0'
        MaxLength = 10
        TabOrder = 5
        Text = ''
      end
      object mskTelefone: TMaskEdit
        Left = 16
        Top = 193
        Width = 144
        Height = 21
        TabOrder = 7
        Text = ''
      end
      object mskCelular: TMaskEdit
        Left = 173
        Top = 193
        Width = 144
        Height = 21
        TabOrder = 8
        Text = ''
      end
      object edtEndereco: TEdit
        Left = 16
        Top = 240
        Width = 452
        Height = 21
        TabOrder = 9
      end
      object edtNumero: TEdit
        Left = 472
        Top = 240
        Width = 89
        Height = 21
        TabOrder = 10
      end
      object edtBairro: TEdit
        Left = 112
        Top = 277
        Width = 205
        Height = 21
        TabOrder = 12
      end
      object edtUF: TEdit
        Left = 323
        Top = 277
        Width = 37
        Height = 21
        TabOrder = 13
        OnExit = edtUFExit
      end
      object dblCidade: TDBLookupComboBox
        Left = 367
        Top = 277
        Width = 194
        Height = 21
        KeyField = 'IDCIDADE'
        ListField = 'IDCIDADE;NMCIDADE'
        ListFieldIndex = 1
        ListSource = DS_CIDADE
        TabOrder = 14
        OnCloseUp = dblCidadeCloseUp
      end
      object mskCEP: TMaskEdit
        Left = 16
        Top = 277
        Width = 92
        Height = 21
        TabOrder = 11
        Text = ''
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 518
    Width = 575
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object DS_CIDADE: TDataSource
    AutoEdit = False
    Left = 349
    Top = 529
  end
  object DS_FUNCIONARIOS: TDataSource
    AutoEdit = False
    Left = 437
    Top = 529
  end
  object DS_OUTROSENDERECOS: TDataSource
    AutoEdit = False
    Left = 533
    Top = 529
  end
end