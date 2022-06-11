object dm: Tdm
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object fd: TFDConnection
    Params.Strings = (
      'Port=3307'
      'Database=getao'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    Left = 24
    Top = 56
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\Estudo\Videos\Captures\01 - Programador Delphi-20220529' +
      'T161120Z-001\01 - Programador Delphi\Arquivos\libmySQL.dll'
    Left = 336
    Top = 72
  end
  object query_cargos: TFDQuery
    Active = True
    Connection = fd
    SQL.Strings = (
      'SELECT * FROM `cargos` order by  cargo asc')
    Left = 120
    Top = 216
  end
  object tb_Contratos: TFDTable
    Active = True
    Connection = fd
    TableName = 'getao.contratos'
    Left = 32
    Top = 152
    object tb_Contratosid: TStringField
      FieldName = 'id'
      Origin = 'id'
      Required = True
      Size = 80
    end
    object tb_Contratoscliente: TStringField
      FieldName = 'cliente'
      Origin = 'cliente'
      Required = True
      Size = 80
    end
    object tb_Contratosobra: TStringField
      FieldName = 'obra'
      Origin = 'obra'
      Required = True
      Size = 80
    end
    object tb_Contratositem: TStringField
      FieldName = 'item'
      Origin = 'item'
      Required = True
      Size = 80
    end
    object tb_Contratosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 80
    end
    object tb_Contratosunid: TStringField
      FieldName = 'unid'
      Origin = 'unid'
      Required = True
      Size = 80
    end
    object tb_Contratosqtd: TStringField
      FieldName = 'qtd'
      Origin = 'qtd'
      Required = True
      Size = 80
    end
    object tb_Contratosvalor_unitario: TStringField
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      Required = True
      Size = 80
    end
    object tb_Contratossubtotal: TStringField
      FieldKind = fkCalculated
      FieldName = 'subtotal'
      Origin = 'subtotal'
      Required = True
      Size = 80
      Calculated = True
    end
  end
  object tb_Cargos: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = fd
    TableName = 'getao.cargos'
    Left = 120
    Top = 152
  end
  object DSCargos: TDataSource
    DataSet = query_cargos
    Left = 120
    Top = 272
  end
  object query_contratos: TFDQuery
    Connection = fd
    SQL.Strings = (
      'SELECT * FROM `contratos` ')
    Left = 32
    Top = 216
  end
  object DSContratos: TDataSource
    AutoEdit = False
    DataSet = query_contratos
    Left = 32
    Top = 272
  end
  object tb_Func: TFDTable
    Active = True
    IndexFieldNames = 'id'
    DetailFields = 
      'aso;bairro;cargo;cep;cpf;datadesligamento;dataingresso;datanasci' +
      'mento;email;endereco;id;matricula;nome;salario;telefone;uf'
    Connection = fd
    TableName = 'funcionarios'
    Left = 216
    Top = 152
  end
  object query_func: TFDQuery
    Active = True
    IndexFieldNames = 
      'aso;bairro;cargo;cep;cidade;cpf;datadesligamento;dataingresso;da' +
      'tanascimento;email;endereco;id;matricula;nome;salario;telefone;u' +
      'f'
    Connection = fd
    SQL.Strings = (
      'SELECT * FROM `funcionarios` ')
    Left = 216
    Top = 216
  end
  object DSFunc: TDataSource
    DataSet = query_func
    Left = 216
    Top = 272
  end
end
