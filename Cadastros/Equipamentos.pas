unit Equipamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask;

type
  TFrmEquipamentos = class(TForm)
    Label12: TLabel;
    Label2: TLabel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    Label1: TLabel;
    Edit1: TEdit;
    rdNome: TRadioButton;
    rdCPF: TRadioButton;
    Label3: TLabel;
    txtBuscarNome: TEdit;
    MaskEdit1: TMaskEdit;
    SpeedButton6: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEquipamentos: TFrmEquipamentos;

implementation

{$R *.dfm}

procedure TFrmEquipamentos.btnNovoClick(Sender: TObject);
begin
 btnSalvar.Enabled := true;
       edtNome.Enabled := true;
       edtNome.Text :='';
       edtNome.SetFocus;
end;

end.
