object DM_CONEXAO: TDM_CONEXAO
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 223
  Width = 369
  object FDConexao: TFDConnection
    ConnectionName = 'Conexao'
    Params.Strings = (
      'DriverID=FB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=C:\Nivelamento_Extradigital\Dados\DADOS.FDB')
    LoginPrompt = False
    Transaction = FDTransacao
    Left = 64
    Top = 48
  end
  object FDTransacao: TFDTransaction
    Connection = FDConexao
    Left = 208
    Top = 40
  end
  object Q_COMANDOS: TFDQuery
    ConnectionName = 'C:\Nivelamento_Extradigital\Dados\Dados.fdb'
    Left = 64
    Top = 112
  end
end
