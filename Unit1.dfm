object dmConexao: TdmConexao
  OldCreateOrder = False
  Height = 150
  Width = 215
  object Conect: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI.1;Integrated Security=SSPI;Persist Security Inf' +
      'o=False;User ID=gustavo;Initial Catalog=Funcionario;Data Source=' +
      'LAPTOP-JIGIEOE0\GUSTAVO;Use Procedure for Prepare=1;Auto Transla' +
      'te=True;Packet Size=4096;Workstation ID=LAPTOP-JIGIEOE0;Use Encr' +
      'yption for Data=False;Tag with column collation when possible=Fa' +
      'lse;MARS Connection=False;DataTypeCompatibility=0;Trust Server C' +
      'ertificate=False;'
    Provider = 'SQLNCLI.1'
    Left = 40
    Top = 24
  end
end
