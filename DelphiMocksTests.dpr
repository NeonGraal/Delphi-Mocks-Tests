program DelphiMocksTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

{$R 'DelphiMocksTestVersion.res' 'Source\DelphiMocksTestVersion.rc'}

uses
  FastMM4,
  DUnitTestRunner,
  Test.Delphi.Mocks in 'Source\Test.Delphi.Mocks.pas',
  Test.ITested in 'Source\Test.ITested.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

