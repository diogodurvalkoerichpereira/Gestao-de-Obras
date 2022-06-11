unit Funcionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TFrmFuncionarios = class(TForm)
    rdNome: TRadioButton;
    rdCPF: TRadioButton;
    Label1: TLabel;
    txtBuscarNome: TEdit;
    edtNome: TEdit;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtEndereco: TEdit;
    edtCPF: TMaskEdit;
    edtTelefone: TMaskEdit;
    Label6: TLabel;
    edtMatricula: TEdit;
    Label7: TLabel;
    edtCep: TMaskEdit;
    Label8: TLabel;
    edtNascimento: TMaskEdit;
    Label9: TLabel;
    edtUf: TEdit;
    Label10: TLabel;
    cbCargo: TComboBox;
    Label11: TLabel;
    edtBairro: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtAso: TEdit;
    Label16: TLabel;
    edtSalario: TEdit;
    Label17: TLabel;
    edtDesligamento: TMaskEdit;
    DBGrid1: TDBGrid;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    SpeedButton6: TSpeedButton;
    edtEmail: TEdit;
    Email: TLabel;
    edtCidade: TEdit;
    Label18: TLabel;
    Label15: TLabel;
    edtIngresso: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure limpar;
    procedure habilitarCampos;
    procedure desabilitarCampos;
    procedure carregaCombobox;
    procedure associarCampos;
    Procedure listar;
    procedure carregarCombobox;
    procedure buscarNome;
    procedure buscarCpf;

  public
    { Public declarations }
  end;

var
  FrmFuncionarios: TFrmFuncionarios;
  id    : string;
implementation

{$R *.dfm}

uses Modulo, Cargos;

{ TFrmFuncionarios }

procedure TFrmFuncionarios.associarCampos;
begin
 dm.tb_Func.FieldByName('nome') .Value := edtNome.Text;
 dm.tb_Func.FieldByName('datanascimento') .Value := edtNascimento.Text;
 dm.tb_Func.FieldByName('cpf') .Value := edtCpf.Text;
 dm.tb_Func.FieldByName('telefone') .Value := edtTelefone.Text;
 dm.tb_Func.FieldByName('email') .Value := edtEmail.Text;
 dm.tb_Func.FieldByName('endereco') .Value := edtEndereco.Text;
 dm.tb_Func.FieldByName('cidade') .Value := edtCidade.Text;
 dm.tb_Func.FieldByName('bairro') .Value := edtBairro.Text;
 dm.tb_Func.FieldByName('uf') .Value := edtUf.Text;
 dm.tb_Func.FieldByName('cep') .Value := edtCep.Text;
 dm.tb_Func.FieldByName('cargo') .Value := cbCargo.Text;
 dm.tb_Func.FieldByName('matricula') .Value := edtMatricula.Text;
 dm.tb_Func.FieldByName('salario') .Value := edtSalario.Text;
 dm.tb_Func.FieldByName('aso') .Value := edtAso.Text;
 dm.tb_Func.FieldByName('datadesligamento') .Value := edtDesligamento.Text;
 dm.query_func.FieldByName('dataIngresso').Value;
 end;

procedure TFrmFuncionarios.buscarCpf;
begin

end;

procedure TFrmFuncionarios.buscarNome;
begin

end;

procedure TFrmFuncionarios.carregaCombobox;
begin

end;

procedure TFrmFuncionarios.carregarCombobox;
begin
     dm.query_cargos.Open;
     if not dm.query_cargos.IsEmpty then
     begin
       while not dm.query_cargos.Eof do
       begin
         cbCargo.Items.Add(dm.query_cargos.FieldByName('cargo').AsString);
         dm.query_cargos.Next;
       end;

     end;
end;

procedure TFrmFuncionarios.DBGrid1CellClick(Column: TColumn);
begin
edtNome.Enabled := True;

     edtCPF.Enabled := True;
     edtNascimento.Enabled := True;
     edtTelefone.Enabled := True;
     edtEndereco.Enabled := True;
     edtCidade.Enabled := True;
     edtBairro.Enabled := True;
     edtCep.Enabled := True;
     edtUf.Enabled := True;
     edtEmail.Enabled := True;
     cbCargo.Enabled := True;
     edtSalario.Enabled := True;
     edtAso.Enabled := True;
     edtMatricula.Enabled := True;
     edtDesligamento.Enabled := True;
     edtIngresso.Enabled := True;

btnEditar.Enabled := True;
btnExcluir.Enabled := True;

dm.tb_func.Edit;

if dm.query_func.FieldByName('nome').Value <> null then
edtNome.Text := dm.query_func.FieldByName('nome').Value;

if dm.query_func.FieldByName('datanascimento').Value <> null then
edtNascimento.Text := dm.query_func.FieldByName('datanascimento').Value;

edtCPF.Text := dm.query_func.FieldByName('cpf').Value;

if dm.query_func.FieldByName('telefone').Value <> null then
edtTelefone.Text := dm.query_func.FieldByName('telefone').Value;

if dm.query_func.FieldByName('endereco').Value <> null then
edtEndereco.Text := dm.query_func.FieldByName('endereco').Value;

if dm.query_func.FieldByName('cidade').Value <> null then
edtCidade.Text := dm.query_func.FieldByName('cidade').Value;

if dm.query_func.FieldByName('bairro').Value <> null then
edtBairro.Text := dm.query_func.FieldByName('bairro').Value;

if dm.query_func.FieldByName('cep').Value <> null then
edtCep.Text := dm.query_func.FieldByName('cep').Value;

if dm.query_func.FieldByName('uf').Value <> null then
edtUf.Text := dm.query_func.FieldByName('uf').Value;

if dm.query_func.FieldByName('email').Value <> null then
edtEmail.Text := dm.query_func.FieldByName('email').Value;

if dm.query_func.FieldByName('cargo').Value <> null then
cbCargo.Text := dm.query_func.FieldByName('cargo').Value;

if dm.query_func.FieldByName('salario').Value <> null then
edtSalario.Text := dm.query_func.FieldByName('salario').Value;

if dm.query_func.FieldByName('aso').Value <> null then
edtAso.Text := dm.query_func.FieldByName('aso').Value;

if dm.query_func.FieldByName('matricula').Value <> null then
edtMatricula.Text := dm.query_func.FieldByName('matricula').Value;

if dm.query_func.FieldByName('datadesligamento').Value <> null then
edtDesligamento.Text := dm.query_func.FieldByName('datadesligamento').Value;

if dm.query_func.FieldByName('dataingresso').Value <> null then
edtIngresso.Text := dm.query_func.FieldByName('dataingresso').Value;

    id := dm.query_func.FieldByName('id').Value;


end;
procedure TFrmFuncionarios.desabilitarCampos;
begin
     edtNome.Enabled := false;
     edtCPF.Enabled := false;
     edtNascimento.Enabled := false;
     edtTelefone.Enabled := false;
     edtEndereco.Enabled := false;
     edtCidade.Enabled := false;
     edtBairro.Enabled := false;
     edtCep.Enabled := false;
     edtUf.Enabled := false;
     edtEmail.Enabled := false;
     cbCargo.Enabled := false;
     edtSalario.Enabled := false;
     edtAso.Enabled := false;
     edtMatricula.Enabled := false;
     edtDesligamento.Enabled := false;
     edtIngresso.Enabled := false;
end;

procedure TFrmFuncionarios.FormCreate(Sender: TObject);
begin
  desabilitarCampos;
  dm.tb_Func.Active := true;
  carregarCombobox;
   listar;
end;


procedure TFrmFuncionarios.habilitarCampos;
begin
     edtNome.Enabled := true;
     edtCPF.Enabled := true;
     edtNascimento.Enabled := true;
     edtTelefone.Enabled := true;
     edtEndereco.Enabled := true;
     edtCidade.Enabled := true;
     edtBairro.Enabled := true;
     edtCep.Enabled := true;
     edtUf.Enabled := true;
     edtEmail.Enabled := true;
     cbCargo.Enabled := true;
     edtSalario.Enabled := true;
     edtAso.Enabled := true;
     edtMatricula.Enabled := true;
     edtIngresso.Enabled := true;
     edtDesligamento.Enabled := true;

end;

procedure TFrmFuncionarios.limpar;
begin
     edtNome.Text :='';
     edtCPF.Text :='';
     edtNascimento.Text :='';
     edtTelefone.Text :='';
     edtEndereco.Text :='';
     edtCidade.Text :='';
     edtBairro.Text :='';
     edtCep.Text :='';
     edtUf.Text :='';
     edtEmail.Text :='';
     cbCargo.Text :='';
     edtSalario.Text :='';
     edtAso.Text :='';
     edtMatricula.Text :='';
     edtIngresso.Text :='';

     edtDesligamento.Text :='';



end;

procedure TFrmFuncionarios.listar;
begin
     dm.query_func.close;
     dm.query_func.SQL.Clear;
     dm.query_func.SQL.Add('SELECT * from funcionarios order by nome asc ');
     dm.query_func.Open;

end;

procedure TFrmFuncionarios.btnExcluirClick(Sender: TObject);
begin
              if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0 )= mrYes then
begin
              dm.tb_Func.Delete;
              MessageDlg('Deletado com sucesso!', mtInformation, mboKCancel, 0);
             listar;
             btnEditar.Enabled := false;
             btnExcluir.Enabled := false;
             edtNome.Text :='';
              end;
end;
procedure TFrmFuncionarios.btnEditarClick(Sender: TObject);
var
nome : string;

begin
  if Trim(edtNome.Text) ='' then
  begin
    MessageDlg('Preencha o Cargo!', mtInformation, mbOKCancel, 0) ;
             edtNome.SetFocus;
             exit ;
   end;

     //verificar cargos ja cadastrados
     dm.query_func.close;
     dm.query_func.SQL.Clear;
     dm.query_func.SQL.Add('SELECT funcionarios from funcionarios where nome =' + QuotedStr(Trim(edtNome.text)));
     dm.query_func.Open;

      if not dm.query_func.IsEmpty then

      begin
           nome := dm.query_func['nome'];
           MessageDlg('O  Funcionarios ' + nome + 'já está cadastrado!', mtInformation, mboKCancel, 0);
           edtNome.Text :='';
           edtNome.SetFocus;
           exit;

      end;

     associarCampos;
     dm.query_Func.close;
     dm.query_Func.SQL.Clear;
     dm.query_Func.SQL.Add('UPDATE funcionarios set nome = :nome, cpf = :cpf, datanascimento = :datanascimento, telefone =:telefone, email = :email, endereco = :endereco, cidade =:cidade, bairro = :bairro, uf = :uf, cep = :cep, cargo = :cargo, matricula = :matricula,   where id =:id');
     dm.query_Func.ParamByName('nome').Value := edtNome.Text;
     dm.tb_Func.FieldByName('nome') .Value := edtNome.Text;
     dm.tb_Func.FieldByName('datanascimento') .Value := edtNascimento.Text;
     dm.tb_Func.FieldByName('cpf') .Value := edtCpf.Text;
     dm.tb_Func.FieldByName('telefone') .Value := edtTelefone.Text;
     dm.tb_Func.FieldByName('email') .Value := edtEmail.Text;
     dm.tb_Func.FieldByName('endereco') .Value := edtEndereco.Text;
     dm.tb_Func.FieldByName('cidade') .Value := edtCidade.Text;
     dm.tb_Func.FieldByName('bairro') .Value := edtBairro.Text;
     dm.tb_Func.FieldByName('uf') .Value := edtUf.Text;
     dm.tb_Func.FieldByName('cep') .Value := edtCep.Text;
     dm.tb_Func.FieldByName('cargo') .Value := cbCargo.Text;
     dm.tb_Func.FieldByName('matricula') .Value := edtMatricula.Text;
     dm.tb_Func.FieldByName('salario') .Value := edtSalario.Text;
     dm.tb_Func.FieldByName('aso') .Value := edtAso.Text;
     dm.tb_Func.FieldByName('datadesligamento') .Value := edtDesligamento.Text;
     dm.tb_func.FieldByName('dataIngresso').Value := edtIngresso.Text;





     dm.query_Func.ExecSQL;

     listar;
     MessageDlg('Editado com sucesso!', mtInformation, mboKCancel, 0);
     btnEditar.Enabled := false;
     btnExcluir.Enabled := false;
     limpar;
     desabilitarCampos;
end;

procedure TFrmFuncionarios.btnSalvarClick(Sender: TObject);
var
cpf : string;

begin
  if Trim(edtCpf.Text) ='' then
  begin
    MessageDlg('Preencha o CPF!', mtInformation, mbOKCancel, 0) ;
             edtCpf.SetFocus;
             exit ;
   end;

     //verificar cpf ja cadastrados
     dm.query_func.close;
     dm.query_func.SQL.Clear;
     dm.query_func.SQL.Add('SELECT * from funcionarios where cpf =' + QuotedStr(Trim(edtCpf.text)));
     dm.query_func.Open;

      if not dm.query_func.IsEmpty then

      begin
           cpf := dm.query_func['cpf'];
           MessageDlg('O  CPF ' + cpf + ' já está cadastrado!', mtInformation, mboKCancel, 0);
           edtCpf.Text :='';
           edtCpf.SetFocus;
           exit;

      end;



    associarCampos;
    dm.tb_func.Post;
    MessageDlg('Salvo com Sucesso!', mtInformation, mboKCancel, 0);
    limpar;
    desabilitarCampos;
    btnSalvar.Enabled := false;
    dm.tb_Func.Insert;
    listar;
end;

procedure TFrmFuncionarios.btnNovoClick(Sender: TObject);
begin
       habilitarCampos;
       dm.tb_Func.Insert;
       btnSalvar.Enabled := true;
end;

end.
