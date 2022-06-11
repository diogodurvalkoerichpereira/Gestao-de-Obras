unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    pnlLogin: TPanel;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    pnlFundo: TPanel;
    btnLogin: TSpeedButton;
    imgLogin: TImage;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure btnLoginClick(Sender: TObject);

  private
    { Private declarations }
    procedure centralizarPainel;
    procedure login;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses Menu;

procedure TFrmLogin.btnLoginClick(Sender: TObject);
begin
  if Trim(txtUsuario.Text) ='' then
  begin
    MessageDlg('Preencha o Usuário!', mtInformation, mbOKCancel, 0) ;
             txtUsuario.SetFocus;
             exit ;
   end;
    if Trim(txtSenha.Text) ='' then
  begin
    MessageDlg('Preencha a Senha!', mtInformation, mbOKCancel, 0) ;
             txtUsuario.SetFocus;
             exit ;
   end;

    login;
end;

procedure TFrmLogin.centralizarPainel;
begin
      pnlLogin.Top :=(self.Height div 2)-(pnlLogin.Height div 2);
      pnlLogin.Left :=(self.width div 2)-(pnlLogin.width div 2);

end;

procedure TFrmLogin.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
      centralizarPainel;


end;

procedure TFrmLogin.login;
begin
//Aqui vira o codigo de login
 //MessageDlg('Login Efetuado!', mtInformation, mbOKCancel, 0) ;
 FrmMenu     := TFrmMenu.Create(FrmLogin);

 FrmMenu.ShowModal;

end;

end.

