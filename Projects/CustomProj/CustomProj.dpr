program CustomProj;

uses
  SysUtils,
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

  // регистрация типа TMainForm и его реализации
  container.RegisterType<IMainFormInterface, TMainForm>.DelegateTo(
  function: TMainForm
  begin
      // создаем объект типа TMainForm
      Application.CreateForm(TMainForm, Result);
  end);

  container.Build;

  try
    GlobalContainer.Resolve<IMainFormInterface>;
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.Run;

    // контроль утечки памяти
    ReportMemoryLeaksOnShutdown := True;
  except
    raise Exception.Create('Instance of type TMainForm not found !');
  end;

end.










