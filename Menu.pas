unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ComCtrls,
  Vcl.WinXCalendars, Vcl.ExtCtrls, Vcl.Grids, Vcl.Samples.Calendar,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Comp.Client,
  Vcl.AppAnalytics, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys.MongoDB,
  FireDAC.Phys.MongoDBDef, System.Rtti, System.JSON.Types, System.JSON.Readers,
  System.JSON.BSON, System.JSON.Builders, FireDAC.Phys.MongoDBWrapper,
  FireDAC.VCLUI.Wait, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Data.DB,
  VCLTee.TeeData, Data.FMTBcd, Data.SqlExpr, VclTee.TeeGDIPlus,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.UI, FireDAC.Comp.DataSet, Vcl.DBGrids, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, VCLTee.TeeDBCrossTab,
  VCLTee.Series;

type
  TFrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    TiposDeServico: TMenuItem;
    Materiais1: TMenuItem;
    Equipamentos: TMenuItem;
    UnidadedeMedida1: TMenuItem;
    Contratos1: TMenuItem;
    Obras1: TMenuItem;
    Produo1: TMenuItem;
    Produo2: TMenuItem;
    MateriaisExecutados1: TMenuItem;
    Relatorios1: TMenuItem;
    Usuarios: TMenuItem;
    Cargos1: TMenuItem;
    Chart1: TChart;
    DBGrid1: TDBGrid;
    FDTable1: TFDTable;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDConnection1: TFDConnection;
    FDTable1cliente: TStringField;
    DBCrossTabSource1: TDBCrossTabSource;
    pnlChart: TPanel;
    Series1: TBarSeries;
    DBCrossTabSource2: TDBCrossTabSource;
    FDTable1subtotal: TFloatField;
    FDTable1id: TStringField;
    FDTable1obra: TStringField;
    FDTable1item: TStringField;
    FDTable1descricao: TStringField;
    FDTable1unid: TStringField;
    FDTable1qtd: TStringField;
    FDTable1valor_unitario: TStringField;


    procedure UsuariosClick(Sender: TObject);
    procedure FuncionariosClick(Sender: TObject);
    procedure Cargos1Click(Sender: TObject);
    procedure EquipamentosClick(Sender: TObject);
    procedure TiposDeServicoClick(Sender: TObject);
    procedure pnlCalendarioCanResize(Sender: TObject; var NewWidth,
    NewHeight: Integer; var Resize: Boolean);



  private
    { Private declarations }
    procedure centralizarPainel;
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

uses Usuarios, Funcionarios, Cargos, Equipamentos, TiposDeServico, Modulo;







procedure TFrmMenu.Cargos1Click(Sender: TObject);
begin
FrmCargos := TFrmCargos.Create(self);
FrmCargos.ShowModal;
end;

procedure TFrmMenu.FuncionariosClick(Sender: TObject);
begin
FrmFuncionarios := TFrmFuncionarios.Create(self);
FrmFuncionarios.ShowModal;
end;



procedure TFrmMenu.TiposDeServicoClick(Sender: TObject);
begin
FrmTiposDeServico := TFrmTiposDeServico.Create(self);
FrmTiposDeServico.ShowModal;
end;

procedure TFrmMenu.EquipamentosClick(Sender: TObject);
begin
FrmEquipamentos := TFrmEquipamentos.Create(self);
FrmEquipamentos.ShowModal;
end;

procedure TFrmMenu.UsuariosClick(Sender: TObject);
begin
FrmUsuarios := TFrmUsuarios.Create(self);
FrmUsuarios.ShowModal;
end;

    procedure TFrmMenu.centralizarPainel;
begin
      pnlChart.Top :=(self.Height div 2)-(pnlChart.Height div 2);
      pnlChart.Left :=(self.width div 2)-(pnlChart.width div 2);

end;


     procedure TFrmMenu.pnlCalendarioCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
             centralizarPainel;


//Aqui vira o codigo de login
 //MessageDlg('Login Efetuado!', mtInformation, mbOKCancel, 0) ;

end;

end.
