object DM_CIDADES: TDM_CIDADES
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 270
  Width = 322
  object Q_CONSULTA: TFDQuery
    Left = 32
    Top = 38
  end
  object DSP_CONSULTA: TDataSetProvider
    DataSet = Q_CONSULTA
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 38
  end
  object CDS_CONSULTA: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP_CONSULTA'
    Left = 167
    Top = 38
  end
end
