unit Unit1;

interface

uses
  System.SysUtils, System.Classes, Data.DBXOdbc, Data.DB, Data.SqlExpr,
  Data.Win.ADODB;

type
  TdmConexao = class(TDataModule)
    Conect: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
