unit uScriptDrive;

interface

uses RTTI,  Classes, SysUtils, RegularExpressions, Generics.Collections;

type

    TScriptDrive = class
    private
        fCash : TDictionary<String,TRttiMethod>;
        function GetMethodName(command: string): string;
        function GetParams(command: string): TStringList;
        function CalcMath(command: string): string;
    public
        constructor Create;
        destructor Destroy;
        procedure SetClass( cls: TClass; obj: TObject );
        function Exec(scrt:string): string;
    end;

var
    Script: TScriptDrive;

implementation


var
    parser: TStringList;
    R : TRttiContext;
    T : TRttiType;
    M, _M : TRttiMethod;
    V : TValue;
    _obj: TObject;
    regFunction: TRegEx;
    regMath: TRegEx;

function TScriptDrive.Exec(scrt:string): string;
var
    method, line: string;
    params: TStringList;
    i, j : integer;
    prs: TStringList;

    match : TMatch;
    found,
    scriptCommand  // ������� ����, ��� � ������ ������ �������������� ����������� ������� ������
            : boolean;
    passCount      // ������� ��� ������ ������� ����� ����������
            : integer;
begin
    if not Assigned(T) then
    begin
        result := '����� �� �����.';
        exit;
    end;

    prs := TStringList.Create;

    /// ���������� ����� ������ ��������� �� ������ � ��������� �� �����������
    prs.Text := StringReplace(scrt, ';',#13#10,[rfReplaceAll, rfIgnoreCase]);
    for I := 0 to prs.Count-1 do
    begin

        line := prs[i];
        // � ������ ������� ������ ��������� ������� � ����������� ������ ��������
        // ������: functionA (1,2, functionB( 3 ,4 ),functionC(functionD(5, {6 + 54 + 3} ) ), functionE( {jgj+functionF(7)} ))+UseItem(RestoreHeal)
        // ��� �������� � {} -

        // ��������� ������� � ������ �������, �������
        // �� �������� ���������, �.�. ��� ������� ������� ���:
        // functionB( 3 ,4 )
        // functionD(5, {6 + 54 + 3} )
        // functionF(7)
        // UseItem(RestoreHeal)

        // �������� ������:
        // 1. � ����� ���������� ����� ����������
        // 2. ��� ������� ��������� ���������� �������� ������ ������� ��� ���������
        // 3. ������������ � ��������� ��������� ������ ��� � �������� ������
        // 4. ��� ���������� ��������� ������ - ������ �������
        // 5. ����� ������� ���������� ��������� ��� �� ��� ������ ������� ({}) � ��������� ��� �������������

        // ��������� ������ ������� ����� ���������, �������� ������ ������������ ���������
        if (passCount <= 0)  then
        repeat

            match := regFunction.Match(line);

            method := GetMethodName(match.Value);
            params := GetParams(match.Value);

            /// � ������ ������ � ��� ���� ��� ������ � ��� ��� ��������� � ���� ��������� �����
            /// ��������������, ��� ����� �� ���������� ��� �� �������� ��������, � �� �����������,
            /// �� ����� �������� ��� ��������� �������������� ��������� ( � {} ������� )
            /// �������� ������ ��������� ��� ����������� �������������� ���������� � ������� ������ �� ���������� ��������
            /// ��������: "��������� ����������� �������� {5+8}, ��� ������ ������."
            for j := 0 to params.Count-1 do params[j] := CalcMath(params[j]);


            /// ��������, �� �������� �� ������� ������� ���������.
            /// ��������, ����, ���������� �������� � �.�.
            /// ������ ������� ����������� ����� ���������� ������� � ����������� � ����������� ������
            scriptCommand := false;


            /// ������� �������� ������� ����:
            ///    IF(check, lines);
            ///    ���
            ///    check - ����� 'true'/'false', ������� ����� �������� � �������
            ///            ��������������� ��������� � �������������� ���������� '>' '<' '=',
            ///    lines - ���������� ������, ������� ����� ���������, ���� check = 'false'
            ///
            ///    ������ �������������:
            ///
            ///    If({GetPlayerItemCount(Gold) > 9999}, 4);
            ///    SetVar(iName, GetRandItemName());
            ///    ChangePlayerItemCount(GetVar(iName), 1);
            ///    ChangePlayerItemCount(Gold, -9999);
            ///    AddEvent(Player get GetVar(iName)!);
            ///
            ///    ����� ��� 4 ����������� ������� ����� ���������, ���� � ������
            ///    � ������� ������ 9999 ������, ����� 4 ������� ����� ���������
            ///    � ������� �� ����� ������� (�� ������� �����)

            if AnsiUpperCase(method) = 'IF' then
            begin
                scriptCommand := true;
                if params.Count = 2 then
                begin
                    if params[0] <> 'true'
                    then passCount := StrToIntDef(params[1], 0) + 1; // +1 = ��������� � ������� �������
                    result := '';
                end;
            end;





            if not scriptCommand and (passCount <= 0) then
            begin
                M := nil;
                fCash.TryGetValue(method, M);

                if not Assigned(M) and (method <> '') then
                for _M in t.GetMethods do
                if (_M.Parent = t) and (AnsiUpperCase(_M.Name) = AnsiUpperCase(method))then
                begin
                    M := _M;
                    fCash.Add(method, _M);
                    break;
                end;

                if Assigned(M) then
                begin
                    if   params.Count = 0
                    then V := M.Invoke(_obj,[]);

                    if   params.Count = 1
                    then V := M.Invoke(_obj,[params.CommaText]);

                    if   params.Count = 2
                    then V := M.Invoke(_obj,[params[0], params[1]]);

                    if   params.Count = 3
                    then V := M.Invoke(_obj,[params[0], params[1], params[2]]);

                    if   params.Count = 4
                    then V := M.Invoke(_obj,[params[0], params[1], params[2], params[3]]);

                    if not V.IsEmpty then result := V.AsString;
                end;
            end;

            line := StringReplace(line, match.Value, result, []);



            match := regFunction.Match(line)

        until match.Value = '';

        /// ���� ���� ������ ������������ ������ - ��������� �������
        if passCount > 0
        then Dec(PassCount);

    end;
    prs.Free;

    result := trim(line);
end;

function TScriptDrive.GetMethodName(command: string): string;
begin
    result := Trim(Copy(command, 0, Pos('(', command)-1));
end;

function TScriptDrive.GetParams(command: string): TStringList;
var spos : integer;
begin
    result := TStringList.Create;
    result.StrictDelimiter := true;
    spos := Pos('(', command);
    result.CommaText := Copy(command, spos+1, Pos(')', command)-1 - spos);
end;

procedure TScriptDrive.SetClass(cls: TClass; obj: TObject);
begin
    T := R.GetType(cls);
    _obj := obj;
end;

function TScriptDrive.CalcMath(command: string): string;
/// ���� � ��������� �������������� ��������� � ���������� �����
/// https://habr.com/ru/post/282379/ - �������� �������� �������
///    1. ����������� ������ � ������ ���������� � ��������� �� �������� �������
///    2. ��������� �� ����������� �������
///
/// ��� �������� ������ ����������� ���������, ��� ��������� ���������� � ������ TStringList.
/// ������������� ��������� ���������� ������� � ���������, �� ����������
var
    mth, toCalc,
    operation : string;
    operandA, operandB: integer;
    i : integer;
    beg: integer;
    parse: TStringList;
    notation: TStringList;
    digit, oper: TStringList;
    found: boolean;

    HiPrior : string;
    LowPrior : string;
    ComparePrior : string;
    logicResult : string;

    match : TMatch;
begin
    result := command;

    HiPrior := '()*/';
    LowPrior := '+-';
    ComparePrior := '><=';

    /// ���� ������� ����������
    if Pos('{', command) = 0 then exit;

    /// �������� ���������� � ��������� ������ ��� ���������
    beg := pos('{', command) + 1;
    mth := copy(command, beg, pos('}', command)-beg);

    mth := '('+mth+')';

    // ������� ���������� ������� ��� ���������� ������ ����� ��� ��������� ����� TStringList
    while Pos('  ', mth) > 0 do
        mth := StringReplace(mth, '  ', ' ', [rfReplaceAll]);

    // ������� ������
    parse := TStringList.Create;
{    notation := TStringList.Create;  // ������� ��� ����������� ����������
    digit := TStringList.Create;     // ���� ����� ��� ������� parse
    oper := TStringList.Create;      // ���� ��������� ��� ������� parse

    // ���������� ������� � ������. ��� ��������� ����������� �� ��������� ������ �� ������� � ��������
    parse.CommaText := mth;

    // ���������� �������� ������� � ��������� ������ �������� �������
    for I := 0 to Length(parse) do
    begin
        if Trim(parse[i]) = '' then continue;

    end;
}

    /// � ������ ������ � ��� ���� ������ ��� ������ ��������, ��� �������, � �������, ��������������� ���������� � ��������.
    /// � ������ ������� ��������� ���������� �� ������, �.�. ��������� � ��������� ������ ����� ����������� � ������������ �������,
    /// � ������� ����������� ��������� ������ (������).
    /// ����� �������, ������ �������� � ���������� ����� ��� ������, � ������ � ������ ���� ����������
    /// ���������: \((\s*\d*\s*[\+\-\*\/]?)*\)
    /// ������: (10 + (3 * 6) + (3 * 5 + 3))
    /// �������: (3 * 6) � (3 * 5 + 3)

    // ���� ��������� � ������� � ��� ��������� ������
    repeat
        match := regMath.Match(mth);

        // �������� ��������� ��� ������
        toCalc := copy(match.Value, 2, Length(match.Value)-2);

        repeat

          found := false;
          operation := '';

          // ��������� �� ��������� ��������� � ��������
          parse.CommaText := toCalc;

          // ���� ��� �� ������ ���� ���������� - ���������� ������ ������, ������� ����� ���������
          for I := parse.Count-1 downto 0 do
          if parse[i] = '' then parse.Delete(i);

          // ��������� �� ������ ����� � ���� ������� ��������� � ������ ����������� ( ���������, �������)
          for I := 0 to parse.Count-1 do
          if pos(parse[i], HiPrior) > 0 then
          begin
              found := true;
              operandA := StrToInt(parse[i-1]);
              operation := parse[i];
              operandB := StrToInt(parse[i+1]);
              break;
          end;

          if operation <> '' then
          begin
              /// ���������, �������� ��������� �� ���� ������� ��������
              if operation = '*' then
              operandA := operandA * operandB;

              if operation = '/' then
              operandA := Round(operandA / operandB);

              // �������� � ������ ������� - ������
              parse[i-1] := IntToStr(operandA);
              parse[i] := '';
              parse[i+1] := '';
          end;

          /// �������� ������������ ������� � ������ ��� ��������� ��������
          /// ��� ����, �� ��������� ����� ������ ����� �������� � ������� ��������� �����
          ///  �������������� ��������, ��� �������� ������
          toCalc := parse.CommaText;

        until not found;




        repeat

          found := false;
          operation := '';

        // ��������� �� ��������� ��������� � ��������
          parse.CommaText := toCalc;

          // ���� ��� �� ������ ���� ���������� - ���������� ������ ������, ������� ����� ���������
          for I := parse.Count-1 downto 0 do
          if parse[i] = '' then parse.Delete(i);

          // ��������� �� ������ ����� � ���� ������� ��������� � ������ ����������� ( ���������, �������)
          for I := 0 to parse.Count-1 do
          if pos(parse[i], LowPrior) > 0 then
          begin
              found := true;
              operandA := StrToInt(parse[i-1]);
              operation := parse[i];
              operandB := StrToInt(parse[i+1]);
              break;
          end;

          if operation <> '' then
          begin
              /// ���������, �������� ��������� �� ���� ������� ��������
              if operation = '+' then
              operandA := operandA + operandB;

              if operation = '-' then
              operandA := operandA - operandB;

              // �������� � ������ ������� - ������
              parse[i-1] := IntToStr(operandA);
              parse[i] := '';
              parse[i+1] := '';
          end;

          /// �������� ������������ ������� � ������ ��� ��������� ��������
          /// ��� ����, �� ��������� ����� ������ ����� �������� � ������� ��������� �����
          ///  �������������� ��������, ��� �������� ������
          toCalc := parse.CommaText;

        until not found;




        repeat

          found := false;
          operation := '';
          logicResult := '';

        // ��������� �� ��������� ��������� � ��������
          parse.CommaText := toCalc;

          // ���� ��� �� ������ ���� ���������� - ���������� ������ ������, ������� ����� ���������
          for I := parse.Count-1 downto 0 do
          if parse[i] = '' then parse.Delete(i);

          // ��������� �� ������ ����� � ���� ��������� ���������
          for I := 0 to parse.Count-1 do
          if pos(parse[i], ComparePrior) > 0 then
          begin
              found := true;
              operandA := StrToInt(parse[i-1]);
              operation := parse[i];
              operandB := StrToInt(parse[i+1]);
              break;
          end;

          if operation <> '' then
          begin
              /// ���������, �������� ��������� �� ���� ������� ��������
              if operation = '<' then
                  if operandA < operandB
                  then logicResult := 'true'
                  else logicResult := 'false';

              if operation = '>' then
                  if operandA > operandB
                  then logicResult := 'true'
                  else logicResult := 'false';

              if operation = '=' then
                  if operandA = operandB
                  then logicResult := 'true'
                  else logicResult := 'false';

              // �������� � ������ ������� - ������
              parse[i-1] := logicResult;
              parse[i] := '';
              parse[i+1] := '';
          end;

          /// �������� ������������ ������� � ������ ��� ��������� ��������
          /// ��� ����, �� ��������� ����� ������ ����� �������� � ������� ��������� �����
          ///  �������������� ��������, ��� �������� ������
          toCalc := parse.CommaText;

        until not found;

    until regMath.Match(mth).Value <> '';

    result := toCalc;
end;

constructor TScriptDrive.Create;
begin
    parser := TStringList.Create;
    parser.StrictDelimiter := true;

    // functionA (1,2, functionB( 3 ,4 ),functionC(functionD(5, {6 + 54 + 3} ) ), functionE( {jgj+functionF(7)} ))+UseItem(RestoreHeal)
    regFunction:=TRegEx.Create('\w+\(\s*((\{((\d|\w)\s*[\+\-\*\/\>\<\=]?\s*)*\}|(\w|[�-��-�]|[\+\-\*\/\!\?\.\]\[\=\<\>\`]))\s*\,*\s*)*\)');
    regMath := TRegEx.Create('\((\s*\d*\s*[\+\-\*\/\>\<\=]?)*\)');

    fCash := TDictionary<String,TRttiMethod>.Create();
end;

destructor TScriptDrive.Destroy;
begin
    fCash.Free;
    parser.Free;
end;

end.
