object DM_ENDERECO: TDM_ENDERECO
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 294
  Width = 425
  object Q_OPERACAO: TFDQuery
    Left = 48
    Top = 48
  end
  object Q_PESQUISA: TFDQuery
    Left = 48
    Top = 120
  end
  object Q_CONSULTA: TFDQuery
    Left = 48
    Top = 192
  end
  object DSP_CONSULTA: TDataSetProvider
    DataSet = Q_CONSULTA
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 112
    Top = 192
  end
  object CDS_CONSULTA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CONSULTA'
    Left = 192
    Top = 192
  end
  object Q_ENDERECO_INATIVO: TFDQuery
    Left = 184
    Top = 48
  end
  object DSP_ENDERECO_INATIVO: TDataSetProvider
    DataSet = Q_ENDERECO_INATIVO
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 248
    Top = 48
  end
  object CDS_ENDERECO_INATIVO: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_ENDERECO_INATIVO'
    Left = 328
    Top = 48
  end
end
