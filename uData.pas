unit uData;

interface

uses
    uTypes, uScriptDrive,
    System.SysUtils, Generics.Collections, Vcl.Dialogs, Classes, Math, StrUtils;

type

    TData = class
    private
        Player : TCreature;
        Creatures: TList<TCreature>;
        Variables: TDictionary<String,String>;

        CurrCreature: integer;     // ������� �������� ������ �� ������� Creatures
        CurrLevel: integer;        // ������� ���������� �������

        CurrTargetIndex: integer;  // ���������� ������� ������� �����

        CurrLang: integer;         // ������� ����

        EventText: string;

        AllowModes: string;
        /// �������� ����������� ����� ������ � ������� ��������� ������ ������� ������������
        /// ������������ ����������� ��� ������������ ������� � ��� ��� ���� ������������.
        /// �������, ������ ����������� ����� ������� ��������, ��� ����� �������������� ���
        /// �� ���������. ��������, ���������� � �������� ��������� �������� � ������.

        AutoATKCount: integer;
    public


        constructor Create;
        destructor Destroy;

        function GetAutoATK: string;
        procedure SetAutoATK(count: variant);
        procedure ChangeAutoATK(delta: variant);

        procedure PlayerAttack;   // ������� ������ ��������� ������� ����
        procedure CreatureAttack; // ������� ������� ���������

        procedure DoDamageToCreature(input: string); // ��������� ����� �������� ��������
        procedure DoDamageToPlayer(input: string); // ��������� ����� ������

        function GetCurrCreatureInfo: string;
        function GetPlayerInfo: string;
        function GetPlayerBuffs: string;
        function GetPlayerItems: string;
        function GetPlayerLoot: string;
        function GetPlayerAttr(name: string): string;

        function GetCurrTarget: string;
        procedure SetCurrTargetIndex(value: variant);

        procedure SetPlayerBuff(name, count: variant);
        // ���������� ������ � Player.Buffs

        procedure SetPlayerAutoBuff(name, count: variant);
        // ���������� ������ � Player.Buffs

        procedure InitPlayer;
        procedure InitCreatures;

        function CurrentCreature: string;
        function CreaturesCount: string;

        procedure CheckStatus;  // �������� �������� ������� � ������� ������� ������
        procedure CurrentLevel(input: string);
        function GetCurrentLevel: string;

        function GetEvents: string;

        procedure LevelUpPlayer;
        function AllowLevelUp: string;
        // �������� �� ������������� �������� ����� ��� �������� ������

        function NeedExp: string;
        // ���������� ���������� ����� ��� �������� ������

        procedure ChangePlayerParam(name, delta: string);
        // ����� ��������� ��������� ������

        procedure AddEvent(text: string);
        procedure UseItem(name: string);

        procedure SetVar(name, value: string);
        function GetVar(name: string): string;

        function Rand(max: string): string;
        function Min(first, second: variant): string;

        procedure ChangePlayerItemCount(name, delta: variant);
        function GetPlayerItemCount(name: variant):string;
        function GetItemCount(list, name: string): string;
        /// ��������� ���������� � ��������� ������

        function GetRandItemName: string;

        function ProcessAuto: string;
        // ���������� ��� ����������� ������������, �������� �����������

        function GetAllowModes: string;
        procedure AllowMode(name, value: variant);
        // ��������� � ������ ��������� ������ ������������ �����

        procedure SetCreature(name, params: string; items: string = ''; loot: string = '');
        procedure DropCreatures;

        procedure SetLang(lang: string);
        function GetLang: string;
    private
        parser: TStringList;
        Script : TScriptDrive;

        function FillVars(creature: TCreature; scr: string): string;

        function GetParamValue(creature: TCreature; param: string): string;
        procedure SetParamValue(creature: TCreature; param, value: string);
        procedure ChangeParamValue(creature: TCreature; param: string; delta: integer);

        procedure SetPlayer(name, params: string; items: string = ''; loot: string = '');
    procedure SetPlayerAuto(name, count: variant);  // ����������� � ����� ������� �������� ��������� ��������/������
    end;

    /// �����-�������� ��� ����������� � ���������� ���������
    TInventory = class
    private
        items: TStringList;   // ������ � ����������
    public
        constructor Create;
        destructor Destroy;

        procedure Fill(inv: string);
        procedure Clear;
        function Get: string;
        function Draw(name, count: variant): integer;
        /// ���������� ������� �������� ���������� �������� � ��������� � ���� count

        procedure SetItemCount(name: string; count: integer);
        // ������ ��������� ���������� ��������� � ���������
        // ��������� �������, ���� ����������� ��� �������� > 0
        // ������� �������, ��� �������� <= 0

        procedure ChangeItemCount(name: string; count: integer);
        // �������� ���������� �� ��������� ������ (+/-)
        // ��������� �������, ���� ����������� ��� ���������� ���������� > 0
        // ������� �������, ��� ���������� �������� <= 0

        procedure RemoveItem(name: string);
        // ������� ��� ������� � ��������� ������

        function GetItemCount(name: string): integer;
        // ���������� ���������� ��������� ���������, 0 = �����������

        procedure Loot(lootInv: string);
        // �������� ������ ��������� � ��������� ��� ��������� �������� � "����"
    end;

Var
    Data : TData;

implementation

{ TData }

var
   Inventory : TInventory;

{PUBLIC // Script allow}

function TData.GetAllowModes: string;
begin
    result := AllowModes;
end;

function TData.GetAutoATK: string;
begin
    result := IntToStr(AutoATKCount);
end;

function TData.GetCurrCreatureInfo: string;
begin
    if CurrCreature > Creatures.Count -1 then exit;

    result := Creatures[CurrCreature].Name + ': ' + Creatures[CurrCreature].Params;
end;

function TData.GetCurrentLevel: string;
begin
    result := IntToStr(CurrLevel);
end;

function TData.GetCurrTarget: string;
begin
    result := IntToStr(targets[CurrTargetIndex][0].level);
end;

function TData.GetEvents: string;
begin
    result := EventText;
    EventText := '';
end;

function TData.GetPlayerAttr(name: string): string;
var
    param: TStringList;
begin
    param := TStringList.Create;
    param.CommaText := Player.Params;

    result := param.Values[name];

    param.Free;
end;

function TData.GetPlayerBuffs: string;
begin
    result := Player.AutoBuffs;
end;

function TData.GetPlayerInfo: string;
var
    count: string;
    i: integer;
    resultList: string;
    parser: TStringList;
begin
    resultList := '';

    parser := TStringList.Create;
    parser.CommaText := Player.Params;

    for i := 0 to parser.Count-1 do
    begin
        count := GetItemCount( Player.Buffs, parser.Names[i]);
        if count <> '0'
        then resultList := resultList + parser[i] + '[' + count + '],'
        else resultList := resultList + parser[i] + ',';
    end;

    parser.Free;

    result := Player.Name + ' ' + resultList;

end;

function TData.GetPlayerItemCount(name: variant): string;
begin
    result := '0';

    parser.CommaText := Player.Items;
    if   parser.IndexOfName(name) <> -1
    then result := parser.Values[name];
end;

function TData.GetItemCount(list, name: string): string;
begin
    result := '0';

    parser.CommaText := list;
    if   parser.IndexOfName(name) <> -1
    then result := parser.Values[name];
end;

function TData.GetLang: string;
begin
    result := 'ENG';

    if CurrLang = 0 then result := 'ENG';
    if CurrLang = 1 then result := 'RU';
end;

function TData.GetPlayerItems: string;
begin
    result := Player.Items;
end;

function TData.GetPlayerLoot: string;
begin
    result := Player.Loot;
end;

function TData.GetRandItemName: string;
begin
    result := items[Random(Length(items))].name;
end;

procedure TData.InitCreatures;
// ������������ ����
var
    i, count: integer;
    itm, lt: string;
begin

    count := CurrLevel * 5;

    Creatures.Clear;
    for I := 0 to count-1 do
    begin
        /// ������� ������
        if i <> count-1 then
        begin
            Inventory.Clear;
            Inventory.SetItemCount( items[I_GOLD].name, Random( CurrLevel*2 ) + CurrLevel );
            itm := Inventory.Get;

            Inventory.Clear;
            Inventory.SetItemCount( loot[Random(Length(loot))], 1 );
            lt := Inventory.Get;

            SetCreature(
                Format('%s %s %s', [name1[Random(Length(name1))],name2[Random(Length(name2))],name3[Random(Length(name3))]]),
                Format('HP=%d, ATK=%d, DEF=%d', [
                    Random( CurrLevel*10 ) + CurrLevel*5,
                    Random( CurrLevel*5 )  + CurrLevel*2,
                    Random( CurrLevel*2 )
                ]),
                itm,
                lt
            );

        end;

        /// ���� ������!
        if i = count-1 then
        begin
            Inventory.Clear;
            Inventory.SetItemCount( items[I_GOLD].name, Random( CurrLevel*5 ) + CurrLevel*2 );
            Inventory.SetItemCount( items[Random(Length(items))].name, 1 );
            itm := Inventory.Get;

            Inventory.Clear;
            Inventory.SetItemCount( loot[Random(Length(loot))], Random( CurrLevel ) + 1 );
            Inventory.SetItemCount( loot[Random(Length(loot))], Random( CurrLevel ) + 1 );
            lt := Inventory.Get;

            SetCreature(
                Format('!!! %s %s %s', [name1[Random(Length(name1))],name2[Random(Length(name2))],name3[Random(Length(name3))]]),
                Format('HP=%d, ATK=%d, DEF=%d', [
                    Random( CurrLevel*50 ) + CurrLevel*30,
                    Random( CurrLevel*25 )  + CurrLevel*10,
                    Random( CurrLevel*6 )
                ]),
                itm,
                lt
            );
        end;
    end;

    CurrCreature := 0;
end;

procedure TData.InitPlayer;
/// ������������� ��������� ��������� ������
begin
    SetPlayer( 'Player', 'LVL=1, HP=100, MP=20, ATK=5, DEF=0, EXP=0', '');
end;

procedure TData.LevelUpPlayer;
/// �������� ������ ������
var
    CurrLvl: integer;
    DEF: integer;
begin
    CurrLvl := StrToIntDef( GetParamValue( Player, 'LVL' ), 1);
    DEF := StrToIntDef( GetParamValue( Player, 'DEF' ), 1);

    ChangeParamValue( Player,  'HP', CurrLvl * 100);
    ChangeParamValue( Player,  'MP', CurrLvl * 20);
    ChangeParamValue( Player, 'ATK', CurrLvl );
    ChangeParamValue( Player, 'DEF', 1 );
    ChangeParamValue( Player, 'EXP', -StrToIntDef( NeedExp, 0));
    ChangeParamValue( Player, 'LVL', 1);

    AddEvent(phrases[PHRASE_LEVEL_UP][CurrLang]);
end;



function TData.Min(first, second: variant): string;
begin
    first := StrToIntDef(first, 0);
    second := StrToIntDef(second, 0);
    result := Min(first, second);
end;

procedure TData.PlayerAttack;
// ������� ��������� ��������� ������� ����
// ��������� ������ OnAttack
var
    scr: string; // ����� �������
begin
    scr := Player.OnAttack;
    scr := FillVars(Player, scr);
    Script.Exec( scr );
end;

function TData.ProcessAuto: string;
var
    i, count : integer;
    prs: TStringList;
begin
    result := '';

    prs := TStringList.Create;
    prs.CommaText := Player.AutoBuffs;

    Inventory.Fill( Player.AutoBuffs );

    for I := 0 to prs.Count-1 do
    begin
        count := Inventory.Draw( prs.Names[i], 1 );
        if count <> 0 then
        begin
            ChangeParamValue( Player, prs.Names[i], 1 );
            result := '+';
        end;
    end;

    Player.AutoBuffs := Inventory.Get;

    prs.Free;
end;

function TData.Rand(max: string): string;
begin
    result := IntToStr(Random(StrToIntDef(max, 0)));
end;

procedure TData.CreatureAttack;
// ������� ������� ��������� ������
// ��������� ������ OnAttack
var
    scr: string; // ����� �������
begin
    if CurrCreature > Creatures.Count -1 then exit;

    scr := Creatures[CurrCreature].OnAttack;
    scr := FillVars(Creatures[CurrCreature], scr);
    Script.Exec( scr );
end;

procedure TData.DoDamageToCreature(input: string);
// ��������� ����� �������� ��������
var
    CreatureHP: integer;
    CreatureDEF: integer;
    PlayerATK: integer;
    DMG : integer;
    ATKbuff: integer;
begin
    if CurrCreature > Creatures.Count -1 then exit;

    Inventory.Fill( Player.Buffs );
    ATKbuff := Inventory.Draw( 'ATK', 1 );
    Player.Buffs := Inventory.Get;

    PlayerATK   := StrToIntDef(input, 0) + ATKbuff;
    CreatureHP  := StrToIntDef( GetParamValue( Creatures[CurrCreature], 'HP'), 0 );
    CreatureDEF := StrToIntDef( GetParamValue( Creatures[CurrCreature], 'DEF'), 0 );

//    CreatureDEF := Min(99, CreatureDEF);  // ������ �������� 1% �����

    DMG := Round(PlayerATK - PlayerATK * ((CreatureDEF / 10) / 100));  // 1 DEF = -0.1% dmg

    CreatureHP  := CreatureHP - DMG;

    SetParamValue( Creatures[CurrCreature], 'HP', IntToStr(CreatureHP) );
end;

procedure TData.DoDamageToPlayer(input: string);
// ��������� ����� ������
var
    PlayerHP: integer;
    PlayerDEF: integer;
    CreatureATK: integer;
    DMG : integer;
    DEFbuff: integer;
begin

    Inventory.Fill( Player.Buffs );
    DEFbuff := Inventory.Draw( 'DEF', 1 );
    Player.Buffs := Inventory.Get;

    CreatureATK   := StrToIntDef(input, 0);
    PlayerHP  := StrToIntDef( GetParamValue( Player, 'HP'), 0 );
    PlayerDEF := StrToIntDef( GetParamValue( Player, 'DEF'), 0 ) + DEFbuff;

//    PlayerDEF := Min(99, PlayerDEF);  // ������ �������� 1% �����

    DMG := Round(CreatureATK - CreatureATK * (( PlayerDEF/10 ) / 100));  // 1 DEF = -0.1% dmg

    PlayerHP  := PlayerHP - DMG;

    SetParamValue( Player, 'HP', IntToStr(PlayerHP) );
end;

procedure TData.DropCreatures;
begin
    Creatures.Clear;
end;

function TData.CurrentCreature: string;
// ������� ��������
begin
    result := IntToStr(CurrCreature+1);
end;

function TData.CreaturesCount: string;
// ����� ���������� ��������
begin
    result := IntToStr(Creatures.Count);
end;

procedure TData.CurrentLevel(input: string);
// ������� ������� �����/���������
begin
    // ���� ������ �������� - ������, ����� �������� �������
    CurrLevel := StrToIntDef(input, CurrLevel);
end;


{PRIVATE}

procedure TData.SetAutoATK(count: variant);
begin
    AutoATKCount := count;
end;

procedure TData.SetCreature(name, params: string; items: string = ''; loot: string = '');
var creature : TCreature;
begin
    creature := TCreature.Create;

    creature.Params := params;
    creature.Name   := name;
    creature.Items  := items;
    creature.Loot   := loot;

    creature.OnAttack := 'DoDamageToPlayer({ATK})';

    Creatures.Add( creature );
end;

procedure TData.SetCurrTargetIndex(value: variant);
begin
    if (value < 0) or (value > High(targets)) then exit;

    CurrTargetIndex := value;
end;

procedure TData.SetLang(lang: string);
begin
    CurrLang := 0;

    if UpperCase(lang) = 'ENG' then CurrLang := 0;
    if UpperCase(lang) = 'RU' then CurrLang := 1;
end;

procedure TData.SetPlayer(name, params: string; items: string = ''; loot: string = '');
begin
    if not assigned(Player) then Player := TCreature.Create;

    Player.params := params;
    Player.Name   := name;
    Player.Items  := items;
    Player.Loot   := loot;

    Player.OnAttack := 'DoDamageToCreature({ATK})';
end;

procedure TData.SetPlayerAuto(name, count: variant);
begin
end;

procedure TData.SetPlayerAutoBuff(name, count: variant);
begin
    Inventory.Fill(Player.AutoBuffs);
    Inventory.ChangeItemCount(name, count);
    Player.AutoBuffs := Inventory.Get;
end;

procedure TData.SetPlayerBuff(name, count: variant);
begin
    Inventory.Fill(Player.Buffs);
    Inventory.ChangeItemCount(name, count);
    Player.Buffs := Inventory.Get;
end;

procedure TData.SetVar(name, value: string);
begin
    Variables.AddOrSetValue(Trim(name), Trim(value));
end;

function TData.GetVar(name: string): string;
begin
    Variables.TryGetValue(name, result);
end;

procedure TData.UseItem(name: string);
var
    count: integer;
    i: integer;
begin
    /// ����� ��������� ������
    parser.CommaText := player.Items;

    /// ���� �� ��� ������� ������?
    if pos(name, parser.CommaText) = 0 then exit;

    /// ���� �� ���� ����, ����� ���������?
    count := StrToIntDef(parser.Values[name], 0);
    if count <= 0 then exit;

    /// ��������� (��������� ����������� ������ �������)
    for I := 0 to High(items) do
        if items[i].name = name then
        Script.Exec( items[i].script );

    ChangePlayerItemCount(name, -1);
end;

procedure TData.ChangePlayerItemCount(name, delta: variant);
var
    curr: integer;
begin

    /// ��������� ������� �� ���������
    parser.CommaText := player.Items;

    if parser.IndexOfName(name) <> -1 then
    begin
        curr := StrToInt(parser.Values[name]);
        curr := curr + delta
    end else
        curr := delta;

    /// ���� ��� ��������� - ������� ���������� �� ���������
    if (curr <= 0) and (parser.IndexOfName(name) <> -1) then parser.Delete( parser.IndexOfName(name) );
    if (curr > 0) then parser.Values[name] := IntToStr(curr);

    player.Items := parser.CommaText;
end;

function TData.FillVars(creature: TCreature; scr: string): string;
// ����������� � ����� ������� �������� ��������� ��������/������
var
    i: integer;
begin

    result := scr;

    parser.CommaText := creature.Params;
    // ����� ����������, ������ ����������� �� ��������� �� ������� � ������ ���
    // ������ ���� ����=��������
    // ��������� ��� ����� � �������� �� ���������� ����������
    for i := 0 to parser.Count-1 do
        result := StringReplace(result, '{'+Trim(parser.Names[i])+'}', Trim(parser.Values[parser.Names[i]]), [rfReplaceAll, rfIgnoreCase]);
end;

function TData.GetParamValue(creature: TCreature; param: string): string;
begin
    parser.CommaText := creature.Params;
    result := parser.Values[param];
end;

procedure TData.SetParamValue(creature: TCreature; param, value: string);
begin
    parser.CommaText := creature.Params;
    parser.Values[param] := value;
    creature.Params := parser.CommaText;
end;

procedure TData.AddEvent(text: string);
/// ��� ���������� ������� ������ ����������� � ������ ��� �����������
/// ����������� � ����������
begin
    EventText := text + ifthen(EventText <> '', sLineBreak, '') + EventText;
end;

function TData.AllowLevelUp: string;
var
    exp : integer;
    need: integer;
begin
    exp := StrToIntDef( GetParamValue( Player, 'EXP' ), 1);
    need := StrToIntDef( NeedExp, 99999);
    result := ifthen( exp >= need, '!', '');
end;

procedure TData.AllowMode(name, value: variant);
begin
    Inventory.Fill( AllowModes );
    Inventory.SetItemCount( name, value );
    AllowModes := Inventory.Get;
end;

function TData.NeedExp: string;
var
    prev, cost, buff, // ���������� ��� ���������� ���������
    lvl,              // ������� ������� ������
    i: integer;
begin

    lvl := StrToIntDef( GetParamValue( Player, 'LVL' ), 1);

    prev := 0;
    cost := 10;

    /// �������� �������� � ������ �������� � ���� ��������� - ��� ��������� ��������
    for I := 0 to lvl do
    begin
        buff := cost;
        cost := cost + prev;
        prev := buff;
    end;

    result := IntToStr(cost);
end;

procedure TData.ChangeAutoATK(delta: variant);
begin
    AutoATKCount := AutoATKCount + delta;
end;

procedure TData.ChangeParamValue(creature: TCreature; param: string; delta: integer);
var
    val: integer;
begin
    parser.CommaText := creature.Params;
    val := StrToIntDef(parser.Values[param], 0);
    val := val + delta;
    parser.Values[param] := IntToStr(val);
    creature.Params := parser.CommaText;
end;


procedure TData.ChangePlayerParam(name, delta: string);
// ����� ��������� ��������� ������ �� ��������
begin
    ChangeParamValue(Player, name, StrToIntDef(delta, 0));
end;

procedure TData.CheckStatus;
// ����� ��������� ��������� �������� ������� ������
var
    HP, EXPbuff: integer;
    playerLVL : integer;
begin
    // ��������� ��������
    if CurrCreature <= Creatures.Count then
    begin

        // �������� ��������� ������
        HP := StrToIntDef( GetParamValue( Player, 'HP'), 0 );

        if HP <= 0 then
        begin
            AddEvent(phrases[PHRASE_KILLED_BY][CurrLang]+ Creatures[CurrCreature].Name +'!');
            AddEvent(phrases[PHRASE_DUNGEON_ENTER][CurrLang]);

            // ������������ �� ������ �������
            CurrLevel := 1;
            // ������� ��������
            InitCreatures();
            CurrCreature := 0;

            // ����� ������
            playerLVL := StrToInt(GetParamValue( Player, 'LVL'));
            ChangeParamValue(Player, 'HP', playerLVL * 100);
//            ChangeParamValue(Player, 'MP', playerLVL * 20);
            exit;
        end;

        // �������� ��������� �������� �������
        HP := StrToIntDef( GetParamValue( Creatures[CurrCreature], 'HP'), 0 );

        if HP <= 0 then
        begin

            // ����� �������� ����
            Inventory.Fill( Player.Buffs );
            EXPbuff := Inventory.Draw( 'EXP', 1 );
            Player.Buffs := Inventory.Get;

            ChangeParamValue(Player, 'EXP', CurrLevel + EXPbuff);

            if EXPbuff = 0
            then AddEvent(Format(phrases[PHRASE_MONSTER_KILLED][CurrLang],[Creatures[CurrCreature].Name, IntToStr(CurrLevel)]))
            else AddEvent(Format(phrases[PHRASE_MONSTER_KILLED][CurrLang],[Creatures[CurrCreature].Name, IntToStr(CurrLevel) + ' [+'+IntToStr(EXPbuff)+']']));

            // ����� �������� �������� � ���
            Inventory.Fill( Player.Items );
            Inventory.Loot( Creatures[CurrCreature].Items );
            Player.Items := Inventory.Get;

            Inventory.Fill( Player.Loot );
            Inventory.Loot( Creatures[CurrCreature].Loot );
            Player.Loot := Inventory.Get;

            // ��������� �� ����������� ��������
            if   AllowLevelUp <> ''
            then LevelUpPlayer;

            // ��������� � ���������� �������
            Inc(CurrCreature);

        end;

    end;

    // �������� �� ��������� ������
    if CurrCreature > Creatures.Count -1 then
    begin
        // ��������� �� ����� ������� ����������
        inc(CurrLevel);
        // ������� ����� ����� ��������
        InitCreatures();
        CurrCreature := 0;
        AddEvent(phrases[PHRASE_TO_NEXT_FLOOR][CurrLang]);
    end;

    // �������� �� ���������� ����
    if CurrLevel >= targets[CurrTargetIndex][0].level then
    begin
        /// ��������� ������ ���������� ����
        Script.Exec( targets[CurrTargetIndex][CurrLang].script );

        /// ��������� � ���������, ���� ����
        if CurrTargetIndex < High(targets)
        then Inc(CurrTargetIndex);
    end;
end;

constructor TData.Create;
begin
   inherited;
   CurrCreature := 0;
   CurrLevel := 1;
   Creatures := TList<TCreature>.Create();
   Script := TScriptDrive.Create;
   parser := TStringList.Create;
   Variables := TDictionary<String,String>.Create();

   CurrTargetIndex := 0;
   CurrLang := 1;
end;

destructor TData.Destroy;
begin
    Variables.Free;
    parser.Free;
    Script.Free;
    Creatures.Free;
    inherited;
end;


{ TInventary }

procedure TInventory.ChangeItemCount(name: string; count: integer);
var
    has: integer;
begin

    // ���� ����� ������� ��� ����, �������� ������� ����������
    if Pos(name, items.CommaText) > 0
    then has := StrToIntDef(items.Values[name], 0)
    else has := 0;

    has := Max( 0, has + count ); // ��������� ���������, �� ��������� �� ���� ����
    items.Values[name] := IntToStr(has);

end;

function TInventory.Get: string;
begin
    result := items.CommaText;
end;

function TInventory.GetItemCount(name: string): integer;
begin
    result := 0;

    // ���� ������� ���� � ���������
    if   Pos(name, items.CommaText) > 0
    then result := StrToIntDef(items.Values[name], 0);
end;

procedure TInventory.Loot(lootInv: string);
// ���������� � ������� ������������� ��������� ���, ��� ���� � lootInv ���������
var
    loot: TStringList;
    i: integer;
begin
    if Trim(lootInv) = '' then exit;

    loot := TStringList.Create;
    loot.CommaText := lootInv;

    for I := 0 to loot.Count-1 do
    begin
        ChangeItemCount( loot.Names[i], StrToInt( loot.Values[ loot.Names[i] ]) );
        Data.AddEvent('Get ' + loot.Values[ loot.Names[i] ] + ' '+ loot.Names[i]);
    end;

    loot.Free;
end;

procedure TInventory.RemoveItem(name: string);
begin
    items.Values[name] := '0';
end;

procedure TInventory.Clear;
begin
    items.CommaText := '';
end;

procedure TInventory.Fill(inv: string);
begin
    items.CommaText := inv;
end;

procedure TInventory.SetItemCount(name: string; count: integer);
begin
    items.Values[name] := IntToStr(count);
end;

constructor TInventory.Create;
begin
    inherited;
    items := TStringList.Create;
end;

destructor TInventory.Destroy;
begin
    items.Free;
    inherited;
end;

function TInventory.Draw(name, count: variant): integer;
begin
    result := 0;
    if items.IndexOfName(name) = -1 then exit;

    result := StrToIntDef( items.Values[name], 0 );

    if (result - count) > 0
    then items.Values[name] := IntToStr(result - count)
    else items.Delete( items.IndexOfName(name) );
end;

initialization
   Data := TData.Create;
   Inventory := TInventory.Create;


finalization
   Data.Free;
   Inventory.Free;

end.
