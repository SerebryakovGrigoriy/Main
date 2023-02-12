program CustomProj;

uses
  Spring.Container,
  Spring.Persistence.Core.Interfaces,
  Vcl.Forms,
  Main in '..\..\Implementation\Lib\Forms\Main.pas' {MainForm},
  CustomInterfaces in '..\..\Implementation\Interfaces\CustomInterfaces.pas';

{$R *.res}

var
container: TContainer;

begin

  container := GlobalContainer;

  // ����������� ���� TMainForm � ��� ����������
  container.RegisterType<TMainForm, TMainForm>.DelegateTo(
  function: TMainForm
  begin
      // ������� ������ ���� TMainForm
      Application.CreateForm(TMainForm, Result);
  end);
  container.Build;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  MainForm:=GlobalContainer.Resolve<TMainForm>;
  Application.Run;

  // �������� ������ ������
  ReportMemoryLeaksOnShutdown := True;

end.









