unit Modulo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  Tdm = class(TDataModule)
    fd: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    query_cargos: TFDQuery;
    tb_Contratos: TFDTable;
    tb_Contratosid: TStringField;
    tb_Contratoscliente: TStringField;
    tb_Contratosobra: TStringField;
    tb_Contratositem: TStringField;
    tb_Contratosdescricao: TStringField;
    tb_Contratosunid: TStringField;
    tb_Contratosqtd: TStringField;
    tb_Contratosvalor_unitario: TStringField;
    tb_Contratossubtotal: TStringField;
    tb_Cargos: TFDTable;
    DSCargos: TDataSource;
    query_contratos: TFDQuery;
    DSContratos: TDataSource;
    tb_Func: TFDTable;
    query_func: TFDQuery;
    DSFunc: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
fd.Connected := True;
end;

end.
