unit Test.ITested;

interface

uses
  System.SysUtils;

type
{$M+}
  ITest1 = interface
    ['{C0E8799C-084B-48F3-A797-DAD6E433CCFE}']
    procedure Test1;
  end;

  ITest2 = interface
    ['{514C03A6-BF8D-44AA-AA9A-D99786C8ED45}']
    procedure Test2;
  end;

  ITest3 = interface
    ['{8B65617E-539E-4ED6-BC6F-FC4CA1685353}']
    procedure Test3;
  end;


  ITested = interface
  ['{871E5287-9A81-4E5C-82D8-CABBB5B4023D}']
    procedure ProcOneString(aParam: string);
    procedure ProcOneObject(aParam: TObject);
    procedure ProcOneInterface(aParam: ITest1);
    function FuncNoParamsInt: Integer;
    function FuncNoParamsObject: TObject;
    function FuncOneStringObject(aParam: string): TObject;
    function FuncOneStringInt(aParam: string): Integer;
  end;
{$M-}

  ETesting = class(Exception);

  TTestUnknown = class(TObject, IUnknown)
  public
    // IUnknown
    function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

  TTest12 = class(TTestUnknown, ITest1, ITest2)
  public
    procedure Test1;
    procedure Test2;
  end;

  TTested = class(TTestUnknown, ITested)

  public
    // ITested
    procedure ProcOneString(aParam: string);
    procedure ProcOneObject(aParam: TObject);
    procedure ProcOneInterface(aParam: ITest1);
    function FuncNoParamsInt: Integer;
    function FuncNoParamsObject: TObject;
    function FuncOneStringObject(aParam: string): TObject;
    function FuncOneStringInt(aParam: string): Integer;

  end;

implementation

{ TTested }

function TTested.FuncNoParamsInt: Integer;
begin
  Result := 0;
end;

function TTested.FuncNoParamsObject: TObject;
begin
  Result := nil;
end;

function TTested.FuncOneStringInt(aParam: string): Integer;
begin
  Result := 0;
end;

function TTested.FuncOneStringObject(aParam: string): TObject;
begin
  Result := nil;
end;

procedure TTested.ProcOneInterface(aParam: ITest1);
begin

end;

procedure TTested.ProcOneObject(aParam: TObject);
begin

end;

procedure TTested.ProcOneString(aParam: string);
begin

end;

{ TTestUnknown }

function TTestUnknown.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NoInterface;
end;

function TTestUnknown._AddRef: Integer;
begin
  Result := -1;
end;

function TTestUnknown._Release: Integer;
begin
  Result := -1;
end;

{ TTest12 }

procedure TTest12.Test1;
begin

end;

procedure TTest12.Test2;
begin

end;

end.
