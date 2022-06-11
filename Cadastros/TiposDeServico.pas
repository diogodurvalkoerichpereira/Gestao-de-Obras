unit TiposDeServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Data.DB,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTiposDeServico = class(TForm)
    Label10: TLabel;
    ComboBox1: TComboBox;
    MaskEdit5: TMaskEdit;
    Label1: TLabel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    Label3: TLabel;
    rdNome: TRadioButton;
    rdCPF: TRadioButton;
    Label4: TLabel;
    txtBuscarNome: TEdit;
    SpeedButton6: TSpeedButton;
    Label12: TLabel;
    MaskEdit1: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTiposDeServico: TFrmTiposDeServico;

implementation

{$R *.dfm}

end.
