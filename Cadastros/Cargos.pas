unit Cargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TFrmCargos = class(TForm)
    Label2: TLabel;
    edtNome: TEdit;
    grid: TDBGrid;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridCellClick(Column: TColumn);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure associarCampos;
    procedure listar;
  public
    { Public declarations }
  end;

var
  FrmCargos: TFrmCargos;
  id : string;

implementation

{$R *.dfm}

uses Modulo;

procedure TFrmCargos.associarCampos;

begin
dm.tb_Cargos.FieldByName('cargo').Value := edtNome.Text;
end;

procedure TFrmCargos.btnEditarClick(Sender: TObject);
var
cargo : string;

begin
  if Trim(edtNome.Text) ='' then
  begin
    MessageDlg('Preencha o Cargo!', mtInformation, mbOKCancel, 0) ;
             edtNome.SetFocus;
             exit ;
   end;

     //verificar cargos ja cadastrados
     dm.query_cargos.close;
     dm.query_cargos.SQL.Clear;
     dm.query_cargos.SQL.Add('SELECT cargo from cargos where cargo =' + QuotedStr(Trim(edtNome.text)));
     dm.query_cargos.Open;

      if not dm.query_cargos.IsEmpty then

      begin
           cargo := dm.query_cargos['cargo'];
           MessageDlg('O  Cargo ' + cargo + 'j? est? cadastrado!', mtInformation, mboKCancel, 0);
           edtNome.Text :='';
           edtNome.SetFocus;
           exit;

      end;

     associarCampos;
     dm.query_cargos.close;
     dm.query_cargos.SQL.Clear;
     dm.query_cargos.SQL.Add('UPDATE cargos set cargo = :cargo where id =:id');
     dm.query_cargos.ParamByName('cargo').Value := edtNome.Text;
     dm.query_cargos.ParamByName('id').Value := id;
     dm.query_cargos.ExecSQL;

     listar;
     MessageDlg('Editado com sucesso!', mtInformation, mboKCancel, 0);
     btnEditar.Enabled := false;
     btnExcluir.Enabled := false;
     edtNome.Text :='';
end;

procedure TFrmCargos.btnExcluirClick(Sender: TObject);
begin
              if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0 )= mrYes then
begin
              dm.tb_Cargos.Delete;
              MessageDlg('Deletado com sucesso!', mtInformation, mboKCancel, 0);
             listar;
             btnEditar.Enabled := false;
             btnExcluir.Enabled := false;
             edtNome.Text :='';
              end;
end;

procedure TFrmCargos.btnNovoClick(Sender: TObject);
begin

       btnSalvar.Enabled := true;
       edtNome.Enabled := true;
       edtNome.Text :='';
       edtNome.SetFocus;

       dm.tb_Cargos.Insert;
end;

procedure TFrmCargos.btnSalvarClick(Sender: TObject);
var
cargo : string;

begin
  if Trim(edtNome.Text) ='' then
  begin
    MessageDlg('Preencha o Cargo!', mtInformation, mbOKCancel, 0) ;
             edtNome.SetFocus;
             exit ;
   end;

     //verificar cargos ja cadastrados
     dm.query_cargos.close;
     dm.query_cargos.SQL.Clear;
     dm.query_cargos.SQL.Add('SELECT cargo from cargos where cargo =' + QuotedStr(Trim(edtNome.text)));
     dm.query_cargos.Open;

      if not dm.query_cargos.IsEmpty then

      begin
           cargo := dm.query_cargos['cargo'];
           MessageDlg('O  Cargo ' + cargo + 'j? est? cadastrado!', mtInformation, mboKCancel, 0);
           edtNome.Text :='';
           edtNome.SetFocus;
           exit;

      end;



    associarCampos;
    dm.tb_Cargos.Post;
    MessageDlg('Salvo com Sucesso!', mtInformation, mboKCancel, 0);
    edtNome.Text :='';
    edtNome.Enabled := false;
    btnSalvar.Enabled := false;
    listar;

    end;

procedure TFrmCargos.FormCreate(Sender: TObject);
begin
   dm.tb_Cargos.Active  := true;
   listar;
end;

procedure TFrmCargos.gridCellClick(Column: TColumn);
begin
edtNome.Enabled := True;
btnEditar.Enabled := True;
btnExcluir.Enabled := True;

dm.tb_Cargos.Edit;

if dm.query_cargos.FieldByName('cargo').Value <> null then
edtNome.Text := dm.query_cargos.FieldByName('cargo').Value;
id := dm.query_cargos.FieldByName('id').Value;


end;

procedure TFrmCargos.listar;
begin
     dm.query_cargos.close;
     dm.query_cargos.SQL.Clear;
     dm.query_cargos.SQL.Add('SELECT * from cargos order by cargo asc ');
     dm.query_cargos.Open;

end;

end.
