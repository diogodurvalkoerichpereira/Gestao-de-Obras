program GSM;

uses
  Vcl.Forms,
  Login in 'Login.pas' {FrmLogin},
  Menu in 'Menu.pas' {FrmMenu},
  Usuarios in 'Cadastros\Usuarios.pas' {FrmUsuarios},
  Clientes in 'Cadastros\Clientes.pas' {Form2},
  Funcionarios in 'Cadastros\Funcionarios.pas' {FrmFuncionarios},
  Cargos in 'Cadastros\Cargos.pas' {FrmCargos},
  Equipamentos in 'Cadastros\Equipamentos.pas' {FrmEquipamentos},
  TiposDeServico in 'Cadastros\TiposDeServico.pas' {FrmTiposDeServico},
  Modulo in 'Modulo.pas' {dm: TDataModule},
  Contratos in 'Cadastros\Contratos.pas' {Form1},
  Graficos in 'Graficos\Graficos.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
