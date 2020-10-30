unit uConst;

interface

uses SysUtils;

const
    FOLDER_DATA = 'DATA\';

    FILE_MENU_DATA = '\menu.dat';
    FILE_GAME_DATA = '\toto.dat';
    FILE_GAME_DATA_TEST = '\test_toto.txt';
    FILE_GAME_LOG = '\log.txt';

    STEPS_BY_FLOOR = 5; /// ���������� ��� ���������� ���������� �����.
                        /// ���������� �� ����� �������� �����

    MONSTER_IMAGE_COUNT = 30;

    /// �������� ���� ��������� ��� ������������ ����������,
    /// ��������� ����� ��������������������� � json
    ITEM_GOLD = 'gold';
    ITEM_SPEED_BUFF = 'buffSPEED';

    /// �������� ����
    /// ��������� ����� ��������������������� � json


    /// �������� ����������
    PRM_NEEDEXP = 'needexp';

    /// ����� ������ ����������
    INT_MAIN  = 1;
    INT_LOG   = 2;
    INT_TOWER = 4;
    INT_THINK = 8;
    INT_ALL   = MaxInt;

    CREATURE_SHABLON = '{'+
        'name: {RU:"", ENG:""},'+
        'params: {LVL:1, HP:0, MP:0, ATK:0, DEF:0, MDEF:0, BODY:0},'+
        'skills: {},'+
        'items: {},'+
        'effects: {},'+
        'loot: {},'+
        'events: {'+
            'OnAttack:{},'+
            'onParamChange:{},'+
            'onDeath:{},'+
            'onRestore:{},'+
        '},'+
    '},';

    /// ��������� ���� ��� ������ �������
    MENU_DATA_DEF =
    '{gold:0, '+
     'Lang:ENG, '+
     'NewLevel:1, '+
     'IntroOver:0, '+
     'Skills: {'+
         'Research:     {Name:{ENG:"Research",RU:"������������"},Enabled:0, Level:0, NeedGold:10,  NeedResearch:1 },'+
         'MoneyEaring:  {Name:{ENG:"Money Earing",RU:"�����"},Enabled:0, Level:1, NeedGold:20,  NeedResearch:5 },'+
         'BuildSpeed:   {Name:{ENG:"Build Speed",RU:"�������������"},Enabled:0, Level:1, NeedGold:50,  NeedResearch:10},'+
         'AutoMoney:    {Name:{ENG:"Auto Money",RU:"���������"},Enabled:0, Level:0, NeedGold:500, NeedResearch:15}'+
    '},'+
     'Objects: {'+
         'Logo:       {NeedResearch:3,  BuildCost:5,  Attempts:0, FullAttempts:10 },'+
         'MenuExit:   {Name:{ENG:"EXIT",RU:"�����"}, '+
                      'NeedResearch:6,  BuildCost:10, Attempts:0, FullAttempts:20 },'+
         'MenuLang:   {Name:{ENG:"����",RU:"LANGUAGE"},'+
                      'NeedResearch:9,  BuildCost:20, Attempts:0, FullAttempts:50 },'+
         'MenuResume: {Name:{ENG:"RESUME",RU:"����������"},'+
                      'NeedResearch:11, BuildCost:30, Attempts:0, FullAttempts:100 },'+
         'MenuNew:    {Name:{ENG:"NEW GAME",RU:"����� ����"},'+
                      'NeedResearch:14, BuildCost:50, Attempts:0, FullAttempts:150 },'+
         'Tower1: {NeedResearch:17, BuildCost:100, Attempts:0, FullAttempts:100 },'+
         'Tower2: {NeedResearch:20, BuildCost:150, Attempts:0, FullAttempts:150 },'+
         'Tower3: {NeedResearch:23, BuildCost:200, Attempts:0, FullAttempts:200 },'+
         'Tower4: {NeedResearch:26, BuildCost:250, Attempts:0, FullAttempts:250 }'+
    '}}';

    GAME_DATA =
    '{'+
    'state: {'+
        'Lang:"ENG",'+
        'CurrStep: 1,'+
        'MaxStep: 1,'+
        'CurrFloor: 1,'+
        'CurrTargetFloor: 1,'+
        'CurrItem: "gold",'+
        'CurrThink: "",'+      /// ��������, �� ������� ����� ����������� ����
        'CurrBookThink: "",'+      /// ������������� ��������, ������ ������� �������� � �����
        'thinks:{'+
//          'wakeup: 100,'+        /// ��������� � ������ �� ������� ��������. ������� ��������, ��� �������� ��� ������������
                                   /// ���������� - ������� �� ����������. ��� ���� - ������������ � ��������
        '},'+
        'modes:{'+            /// ����� ����������� ��������� ������� ������
          'tower: {'+         /// ����� �����
              'allow: true,'+ /// ������� �� �����
              'pool: 0,'+     /// ������� �������� � ��������� ����
              'auto: false,'+ /// ������� �� ����� ������������ �� ������� ���� ��������
          '},'+
          'think: {'+         /// ����� ��������
              'allow: false,'+
              'pool: 0,'+
              'auto: false,'+
          '},'+
        '},'+
        'player: {'+
            'params: {AutoAction: 0, LVL:1, HP:100, MP:20, ATK:5, DEF:0, MDEF:0, BODY:1, MIND:1, ENERGY:1, TECH:1, EXP:0, needexp:0 },'+
            'skills: {},'+
            'items: {},'+    // ���������
            'effects: {},'+  // ��������� ������� (���� � ������)
            'loot: {},'+     // �������
            'events: {'+
                'onAttack:{},'+  /// ����� ��������, ������� ����� ���������� �� ������� ����� ������� ������� � �����
                'onParamChange:{},'+
                'onDeath:{},'+
                'onRestore:{},'+
                'onLevelUp:{},'+
///                   'default:""'+  � ����� ����� ��� � �������. ��� ������������ ��� ������������� ����� ��������
///                                  �������� �� ��� ������� � ��� ������ ������� ����� ���� �������� � ������

            '},'+
        '},'+
        'creature: {'+
            'name: {RU:"", ENG:""},'+
            'params: {LVL:1, HP:0, MP:0, ATK:0, DEF:0, MDEF:0, BODY:0},'+
            'skills: {},'+
            'items: {},'+
            'effects: {},'+
            'loot: {},'+
            'events: {'+
                'OnAttack:{},'+
                'onParamChange:{},'+
                'onDeath:{},'+
                'onRestore:{},'+
                'onLevelUp:{},'+
            '},'+
        '},'+
        'items:{'+
            'gold:         { count: 0, cost:    0, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'restoreHealth:{ count: 0, cost:  100, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'restoreMana:  { count: 0, cost:  250, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'permanentATK: { count: 0, cost:  200, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'permanentDEF: { count: 0, cost:  200, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'PermanentMDEF:{ count: 0, cost:  200, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'exp:          { count: 0, cost:  150, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'regenHP:      { count: 0, cost:  300, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'regenMP:      { count: 0, cost:  500, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'buffATK:      { count: 0, cost:  100, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'buffDEF:      { count: 0, cost:  100, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'buffMDEF:     { count: 0, cost:  100, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'buffEXP:      { count: 0, cost:  100, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'buffREG:      { count: 0, cost:  100, craft: {}, isCraftAllow: false, isUseAllow: true},'+
            'autoAction:   { count: 0, cost: 1000, craft: {}, isCraftAllow: false, isUseAllow: true}'+
        '},'+
        'skills:{'+
            'healing:      {lvl: 0, cost: 10, isEnabled: true},'+
            'explosion:    {lvl: 0, cost: 50, isEnabled: true},'+
            'heroism:      {lvl: 0, cost: 20, isEnabled: true},'+
            'breakDEF:     {lvl: 0, cost: 15, isEnabled: true},'+
            'breakMDEF:    {lvl: 0, cost: 15, isEnabled: true},'+
            'breakATK:     {lvl: 0, cost: 30, isEnabled: true},'+
            'leakMP:       {lvl: 0, cost: 10, isEnabled: true},'+
            'vampireStrike:{lvl: 0, cost: 10, isEnabled: true},'+
            'metabolism:   {lvl: 0, cost: 10, isEnabled: true}'+
        '},'+
        'tools:{'+
            'shovel:       {isAllow: false,lvl: 1},'+
            'pick:         {isAllow: false,lvl: 1},'+
            'axe:          {isAllow: false,lvl: 1},'+
            'lockpick:     {isAllow: false,lvl: 1},'+
            'sword:        {isAllow: false,lvl: 0},'+
            'lifeAmulet:   {isAllow: false,lvl: 0},'+
            'timeSand:     {isAllow: false,lvl: 0},'+
            'leggings:     {isAllow: false,lvl: 0},'+
            'wisdom:       {isAllow: false,lvl: 1},'+
            'resist:       {isAllow: false,lvl: 0},'+
            'expStone:     {isAllow: false,lvl: 0}'+
        '},'+

        //// ����� �������� �� ������ �����. ����������� ��� ������ ����� ����
        'floors:{'+
        '},'+

        /// ����� ���������� ����������, ������������ � ������ �������� �� ��������� �������.
        /// ��������, ������������� ���������� ���, ����� ������� ������� onAttack.
        /// ��� �� ����� �������� �������� ���������� �� ��������
        'vars:{'+
            'GAME_SPEED: 1000,'+  /// �������� ����. 1000 = 1 ������� �� ���. ������� = 100
            'first_meet: 1,'+  /// �������� ���������� ������ ������� � ������ ��������
            // ���������, ���������������� ����� �������� �������� �� onAttack
            'mc_DMG: 0,'+ // ��������� �������� ����
            'mc_BLK: 0,'+ // ����������� �������� ����� ����� �� ������
            'mc_GEM: 0,'+ // ���������� ���������� �������� ����������
            'pl_DMG: 0,'+ // ����������� ���� ������ �� �������
            'pl_BLK: 0,'+ // ����������� �������� ����� ����� �� �������
            'gm_RED: 0,'+ // ���������� �������� �� ������� ������� ����������
            'gm_WHT: 0,'+ // ���������� �������� �� ������� ����� ����������
            'gm_BLU: 0,'+ // ���������� �������� �� ������� ����� ����������
            'gm_GRN: 0,'+ // ���������� �������� �� ������� ������� ����������
            'gm_PRP: 0,'+ // ���������� �������� �� ������� ���������� ����������
            'gm_YLW: 0,'+ // ���������� �������� �� ������� ������ ����������

            // ���������, ���������������� ����� �������� �������� �� onParamChange
            'prm_Action: "",'+ // ��� ������� � ������ �������� ����������. � ������ ������ "onAttack"
                               // ����� �������������� ��� ��������� ���������,
                               // �������� ������� ���� �� �����, �� �������� �� �����
            'prm_Name: "",'+   // ��� ����������� ���������, �������� HP
            'prm_Delta: 0,'+   //�����/������� �������� ��������, ����� ���� ��� � ����, ��� � � �����
        '},'+
    '},'+



    /// rarity - �������� �������. ��� ������, ��� ���� �����������
    /// cost - ��������� ������� ������� � ������
    ///        ��������� �� �������: cost = FULL / rarity, ��� FULL = ����� rarity ���� ��������
    'resRaritySumm: 50,'+
    'resources:{'+
        'wood:   {name:"wood",    caption:{RU:"������",  ENG:"Wood"},    rarity: 10,  cost:  5},'+
        'stone:  {name:"stone",   caption:{RU:"������",  ENG:"Stone"},   rarity: 10,  cost:  5},'+
        'herbal: {name:"herbal",  caption:{RU:"�����",   ENG:"Herbal"},  rarity:  8,  cost:  6},'+
        'wheat:  {name:"wheat",   caption:{RU:"�����",   ENG:"Wheat"},   rarity:  6,  cost:  8},'+
        'meat:   {name:"meat",    caption:{RU:"����",    ENG:"Meat"},    rarity:  4,  cost: 13},'+
        'blood:  {name:"blood",   caption:{RU:"�����",   ENG:"Blood"},   rarity:  3,  cost: 17},'+
        'bone:   {name:"bone",    caption:{RU:"�����",   ENG:"Bone"},    rarity:  3,  cost: 17},'+
        'skin:   {name:"skin",    caption:{RU:"�����",   ENG:"Skin"},    rarity:  3,  cost: 17},'+
        'ore:    {name:"ore",     caption:{RU:"����",    ENG:"Ore"},     rarity:  2,  cost: 25},'+
        'essence:{name:"essence", caption:{RU:"��������",ENG:"Essence"}, rarity:  1,  cost: 50}'+
    '},'+

    /// rarity - �������� �������. ��� ������, ��� ���� �����������
    /// allowCount - ����������, ��������� ��� �������������: -1 = ��� �����������
    'objRaritySumm: 50,'+
    'floorObjects:{'+
        'Diary: {name:"Diary", caption:{RU:"�����",ENG:"Trash"}, rarity:1, allowCount:1,'+
            'hpCalc:"Rand(CurrFloor() * 50) + 50",'+
            'script:"'+
                'OpenThink(Diary);'+
                'IF(GetLang() = RU, 2);'+
                'AddEvent(\"������, �� ����������, �������� ���������� ��� ������������...\");'+
                'AddEvent(!!! ��������� ������� !!!);'+
                'IF(GetLang() = ENG, 2);'+
                'AddEvent(\"It looks like it is encrypted, we will have to work on decryption ...\");'+
                'AddEvent(!!! The player discovered the Diary !!!);'+
        '"},'+
        'Shovel: {name:"Shovel", caption:{RU:"�����",ENG:"Trash"}, rarity:1, allowCount:1,'+
            'hpCalc:"Rand(CurrFloor() * 50) + 50",'+
            'script:"'+
                'AllowTool(Shovel);' +
                'IF(GetLang() = RU, 1);'+
                'AddEvent(!!! ��������� �������� ������ !!!);'+
                'IF(GetLang() = ENG, 1);'+
                'AddEvent(!!! The player discovered the Shovel artifact !!!);'+
        '"},'+
        'Pick: {name:"Pick", caption:{RU:"�����",ENG:"Trash"}, rarity:1, allowCount:1,'+
            'hpCalc:"Rand(CurrFloor() * 50) + 50",'+
            'script:"'+
                'AllowTool(Pick);' +
                'IF(GetLang() = RU, 1);'+
                'AddEvent(!!! ����� ��������� �������� ����� !!!);'+
                'IF(GetLang() = ENG, 1);'+
                'AddEvent(!!! The player discovered the Pick artifact !!!);'+
        '"},'+
        'Axe: {name:"Axe", caption:{RU:"�����",ENG:"Trash"}, rarity:1, allowCount:1,'+
            'hpCalc:"Rand(CurrFloor() * 50) + 50",'+
            'script:"'+
                'AllowTool(Axe);' +
                'IF(GetLang() = RU}, 1);'+
                'AddEvent(!!! ����� ��������� �������� ����� !!!);'+
                'IF(GetLang() = ENG, 1);'+
                'AddEvent(!!! The player discovered the Axe artifact !!!);'+
        '"},'+
        'lockpick: {name:"lockpick", caption:{RU:"�����",ENG:"Trash"}, rarity:1, allowCount:1,'+
            'hpCalc:"Rand(CurrFloor() * 50) + 50",'+
            'script:"'+
                'AllowTool(lockpick);' +
                'IF(GetLang() = RU, 1);'+
                'AddEvent(!!! ����� ��������� �������� ������� !!!);'+
                'IF(GetLang() = ENG, 1);'+
                'AddEvent(!!! The player discovered the Lock pick artifact !!!);'+
        '"},'+
        'TimeSand: {name:"TimeSand", caption:{RU:"������",ENG:"Chest"}, rarity:1, allowCount:1,'+
            'hpCalc:"Rand(CurrFloor() * 80) + 200",'+
            'script:"'+
                'AllowTool(TimeSand);'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(!!! ������ �������� ����� ������� !!!);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(!!! The player found Sand of Time artifact !!!);'+
        '"},'+
        'leggings: {name:"leggings", caption:{RU:"�������� �����",ENG:"Stone blockage"}, rarity:1, allowCount:1,'+
            'hpCalc:"Rand(CurrFloor() * 250) + 1000",'+
            'script:"'+
                'AllowTool(leggings);'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(!!! ������ �������� ������ !!!);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(!!! The player found the leggings artifact !!!);'+
        '"},'+
        'LifeAmulet: {name:"LifeAmulet", caption:{RU:"������",ENG:"Cache"}, rarity:1, allowCount:1,'+
            'hpCalc:"Rand(CurrFloor() * 70) + 150",'+
            'script:"'+
                'AllowTool(LifeAmulet);'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(!!! ������ �������� ������ ����� !!!);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(!!! The player found the Amulet of Life artifact !!!);'+
        '"},'+



        'Cache: {name:"Cache", caption:{RU:"������",ENG:"Cache"}, rarity:1, allowCount:-1,'+
            'hpCalc:"Rand(CurrFloor() * 70) + 150",'+
            'script:"'+
                'SetVar(gold, Rand(CurrFloor() * 10000) + 1);'+
                'ChangePlayerItemCount(Gold, GetVar(gold));'+

                'If(GetLang() = RU, 1);'+
                'AddEvent(�������� GetVar(gold) ������);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Gained GetVar(gold) gold);'+
        '"},'+
        'Spider: {name:"Spider", caption:{RU:"����",ENG:"Spider"}, rarity:2, allowCount:-1,'+
            'hpCalc:"1",'+
            'script:"'+
                'SetVar(val, Rand(100));'+

                'IF(GetVar(val) > GetArtLvl(leggings), 5);'+
                'SetPlayerAutoBuff(HP, -Rand(CurrFloor() * 100));'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(�������� ���� ������ ����!);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(The poisonous spider bit you!);'+

                'IF(GetVar(val) <= GetArtLvl(leggings), 4);'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(�������� ���� ������� �������, �� ������ ������ �� ���!);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Poisonous spider tried to bite you but Leggings saved you from poison!);'+
        '"},'+
        'Trap: {name:"Trap", caption:{RU:"�������",ENG:"Trap"}, rarity:2, allowCount:-1,'+
            'hpCalc:"1",'+
            'script:"'+
                'SetVar(case, Rand(3));'+
                'IF(GetVar(case) = 0, 1);'+
                'SetVar(param, ATK);'+
                'IF(GetVar(case) = 1, 1);'+
                'SetVar(param, DEF);'+
                'IF(GetVar(case) = 2, 1);'+
                'SetVar(param, MDEF);'+

                'SetVar(val, Rand(100));'+

                'IF(GetVar(val) > GetArtLvl(leggings), 5);'+
                'ChangePlayerParam(GetVar(param), -1);'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(������� ������� ������! �������� 1 GetVar(param)!);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(The trap hurt! Lost 1 GetVar(param)!);'+

                'IF([GetVar(val) <= GetArtLvl(leggings)], 4);'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(������� ��������� �� ������ ��� ������������ ��������!);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(The trap was triggered but the effect was blocked by Leggins!);'+
        '"},'+
        'StoneBlockage: {name:"StoneBlockage", caption:{RU:"�������� �����",ENG:"Stone blockage"}, rarity:2, allowCount:-1,'+
            'hpCalc:"Rand(CurrFloor() * 250) + 1000",'+
            'script:"'+
                'SetVar(count, Rand(CurrFloor() * 100) + 10]);'+
                'SetPlayerRes(Stone, GetVar(count));' +
                'If(GetLang() = RU, 1);'+
                'AddEvent(�������� GetVar(count) �����);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Gained GetVar(count) stone);'+
        '"},'+
        'WoodBlockage: {name:"WoodBlockage", caption:{RU:"���������� �����",ENG:"Wood blockage"}, rarity:2, allowCount:-1,'+
            'hpCalc:"Rand(CurrFloor() * 250) + 1000",'+
            'script:"'+
                'SetVar(count, Rand(CurrFloor() * 100) + 10);'+
                'SetPlayerRes(Wood, GetVar(count));' +
                'If(GetLang() = RU, 1);'+
                'AddEvent(�������� GetVar(count) ������);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Gained GetVar(count) wood);'+
        '"},'+
        'Chest: {name:"Chest", caption:{RU:"������",ENG:"Chest"}, rarity:2, allowCount:-1,'+
            'hpCalc:"Rand(CurrFloor() * 80) + 200",'+
            'script:"'+
                'SetVar(iName, GetRandItemName());'+
                'SetVar(iCount, Rand(CurrFloor()) + 1);'+
                'ChangePlayerItemCount(GetVar(iName), GetVar(iCount));'+

                'SetVar(lName, GetRandResName());'+
                'SetVar(lCount, Random(GetCurrFloor() * 2) + 1);'+
                'SetPlayerRes(GetVar(lName), GetVar(lCount));' +

                'SetVar(gold, Rand(CurrFloor() * 1000) + 1);'+
                'ChangePlayerItem(gold, GetVar(gold));'+

                'If(GetLang() = RU, 3);'+
                'AddEvent(�������� GetVar(gold) ������);'+
                'AddEvent(�������� GetVar(lCount) GetVar(lName)!);'+
                'AddEvent(�������� GetVar(iCount) GetVar(iName)!);'+
                'If(GetLang() = ENG, 3);'+
                'AddEvent(Gained GetVar(gold) Gold!);'+
                'AddEvent(Gained GetVar(lCount) GetVar(lName)!);'+
                'AddEvent(Gained GetVar(iCount) GetVar(iName)!);'+
        '"},'+
        'Box: {name:"Box", caption:{RU:"����",ENG:"Box"}, rarity:3, allowCount:-1,'+
            'hpCalc:"Rand(CurrFloor() * 60) + 100",'+
            'script:"'+
                'SetVar(iName, GetRandItemName());'+
                'ChangePlayerItemCount(GetVar(iName), 1);'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(�������� GetVar(iName));'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Gained GetVar(iName));'+
        '"},'+
        'Rat: {name:"Rat", caption:{RU:"�����",ENG:"Rat"}, rarity:5, allowCount:-1,'+
            'hpCalc:"1",'+
            'script:"'+
                'SetVar(val, Rand(100));'+

                'IF(GetVar(val) > GetArtLvl(leggings), 6);'+
                'SetVar(dmg, Rand(CurrFloor() * 25) + 20);'+
                'ChangePlayerParam(HP, -GetVar(dmg));'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(�� ���� ������ ��������� ����� � ������� �� GetVar(dmg) HP!);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(A rat jumped out of a pile of garbage and bit you for GetVar(dmg) HP!);'+

                'IF(GetVar(val) <= GetArtLvl(leggings), 4);'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(�� ���� ������ ��������� ����� �� �� ������ ��������� ������!);'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(A rat jumped out of a pile of garbage but could not bite through the Leggings!);'+
        '"},'+
        'Trash: {name:"Trash", caption:{RU:"�����",ENG:"Trash"}, rarity:10, allowCount:-1,'+
            'hpCalc:"Rand(CurrFloor() * 50) + 50",'+
            'script:"'+
                'SetVar(obj, GetRandResName());'+
                'SetVar(count, Rand(CurrFloor() * 10) + 1);'+
                'SetPlayerRes(GetVar(obj), GetVar(count));' +
                'IF(GetLang() = RU, 1);'+
                'AddEvent(����� ��������� GetVar(count) GetVar(obj)!);'+
                'IF(GetLang() = ENG, 1);'+
                'AddEvent(Player found GetVar(count) GetVar(obj)!);'+
        '"},'+
    '},'+



    /// cost - ��������� ������� � ������
    /// craft - ����� �������� ��� ������. �������� ��������� ��� ������ ����
    /// isCraftAllow - �������� �� ��� ������
    /// isUseAllow - �������� �� ��� �������������
    'itemsCount: 16,'+
    'items:{'+
        'gold:{'+
            'name:"gold",'+
            'caption: {RU:"������", ENG:"Gold"},'+
            'description:{'+
                'RU:"����������� ������� ������. �� 10 000 ����� ����� �������� ��������� �������. �������� �����?",'+
                'ENG:"Full-weight gold coins. For 10,000 coins, you can get a random item. Lets try our luck?"'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();' +

                'If(GetItemCount(gold) < 10000, 4);'+
                'If(GetLang() = RU, 1);'+
                'Log(normal,\"��������� 10 000 ICON_GOLD\");'+
                'If(GetLang() = ENG, 1);'+
                'Log(normal,\"Need 10 000 ICON_GOLD\");'+

                'SilentChange();'+
                'ChangeItemCount(gold, 1);'+

                'If(GetItemCount(gold) > 9999, 3);'+
                'SilentChange();'+
                'ChangeItemCount(gold, -10000);'+
                'ChangeItemCount(GetRandItemName(), 1);'+
        '"},'+
        'restoreHealth:{'+
            'name:"restoreHealth",'+
            'caption: {RU:"����� ��������", ENG:"Potion of health"},'+
            'description:{'+
                'RU:"��������� ��������� ��������. ���������� ��������: �� ���� �� 100 ����������� �� ������� ������� ������.",'+
                'ENG:"Instantly adds health. The amount is random: from zero to 100 multiplied by the players current level."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();' +
                'ChangeParam(HP,Rand(GetParam(LVL) * 100));'+
        '"},'+
        'restoreMana:{'+
            'name:"restoreMana",'+
            'caption: {RU:"����� ����", ENG:"Potion of mana"},'+
            'description:{'+
                'RU:"��������� ��������� �������. ���������� ��������: �� ���� �� 50 ����������� �� ������� ������� ������.",'+
                'ENG:"Instantly adds energy. The amount is random: from zero to 50 multiplied by the players current level."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();' +
                'ChangeParam(MP,Rand(GetParam(LVL) * 50));'+
        '"},'+
        'permanentATK:{'+
            'name:"permanentATK",'+
            'caption: {RU:"����� �����", ENG:"Potion of attack"},'+
            'description:{'+
                'RU:"�������� ��������� �����. ���������� ������.",'+
                'ENG:"Increases attack potential. Permanent effect."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();' +
                'ChangeParam(ATK,1);'+
        '"},'+
        'permanentDEF:{'+
            'name:"permanentDEF",'+
            'caption: {RU:"����� ������", ENG:"Potion of defence"},'+
            'description:{'+
                'RU:"�������� ���������� ������. ���������� ������.",'+
                'ENG:"Increases physical protection. Permanent effect."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();' +
                'ChangeParam(DEF,1);'+
        '"},'+
        'permanentMDEF:{'+
            'name:"permanentMDEF",'+
            'caption: {RU:"����� ���������� ������", ENG:"Potion of magic defence"},'+
            'description:{'+
                'RU:"�������� ������ �� �������������� �����������. ���������� ������.",'+
                'ENG:"Increases protection against energetic influences. Permanent effect."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();' +
                'ChangeParam(MDEF,1);'+
        '"},'+
        'potionexp:{'+
            'name:"potionexp",'+
            'caption: {RU:"����� �����", ENG:"Potion of experience"},'+
            'description:{'+
                'RU:"��������� ���� ���������� ����. ���������� �� 0 �� 100 ���������� �� ������� ������� ������.",'+
                'ENG:"Gives you a free experience instantly. A number between 0 and 100 multiplied by the players current level."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();' +
                'ChangeParam(EXP,Rand(GetParam(LVL) * 100));'+
        '"},'+
        'regenHP:{'+
            'name:"regenHP",'+
            'caption: {RU:"���� ��������", ENG:"Ointment of health"},'+
            'description:{'+
                'RU:"���������� ��������������� ��������. ��������� �������������� �� 0 �� 500 ���������� �� ������� ������� ������.",'+
                'ENG:"Restores health over time. Recovery potential from 0 to 500 multiplied by the players current level."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();' +
                'AddEffect(RegenPlayerHP, Rand(GetParam(LVL) * 500));'+
        '"},'+
        'regenMP:{'+
            'name:"regenMP",'+
            'caption: {RU:"���� �������", ENG:"Ointment of mana"},'+
            'description:{'+
                'RU:"���������� ��������������� �������. ��������� �������������� �� 0 �� 250 ���������� �� ������� ������� ������.",'+
                'ENG:"Restores energy over time. Recovery potential from 0 to 250 multiplied by the players current level."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();' +
                'AddEffect(RegenPlayerMP, Rand(GetParam(LVL) * 250));'+
        '"},'+
        'buffATK:{'+
            'name:"buffATK",'+
            'caption: {RU:"������� �����", ENG:"Powder of attack"},'+
            'description:{'+
                'RU:"�������� �������� ��������� �����. ��������� ����� ������ ����� ������. ������ �� 1 �� 10 ���������� �� ������� ������ ������.",'+
                'ENG:"Temporarily increases attack potential. Decreases after each player attack. Potential from 1 to 10 multiplied by the players current level."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();'+
                'AddEffect(PlayerATKBuff, Rand(GetParam(LVL) * 10) + 1);'+
        '"},'+
        'buffDEF:{'+
            'name:"buffDEF",'+
            'caption: {RU:"������� ������", ENG:"Powder of defence"},'+
            'description:{'+
                'RU:"�������� �������� ��������� ������. ��������� ����� ������ ����� �� ������. ������ �� 1 �� 10 ���������� �� ������� ������ ������.",'+
                'ENG:"Temporarily increases attack potential. Decreases after each attack on the player. Potential from 1 to 10 multiplied by the players current level."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();'+
                'AddEffect(PlayerDEFBuff, Rand(GetParam(LVL) * 10) + 1);'+
        '"},'+
        'buffMDEF:{'+
            'name:"buffMDEF",'+
            'caption: {RU:"������� ���������� ������", ENG:"Powder of magic defence"},'+
            'description:{'+
                'RU:"�������� �������� ��������� ���������� ������. ��������� ����� ������� ����������� ��� ��������������� ����������� �� ������. ������ �� 1 �� 10 ����������� �� ������� ������ ������.",'+
                'ENG:"Temporarily increases the potential of magic protection. Decreases after each magical or energy impact on the player. Potential from 1 to 10 multiplied by the players level."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();'+
                'AddEffect(PlayerMDEFBuff, Rand(GetParam(LVL) * 10) + 1);'+
        '"},'+
        'buffEXP:{'+
            'name:"buffEXP",'+
            'caption: {RU:"������� �����", ENG:"Powder of experience"},'+
            'description:{'+
                'RU:"�������� �������� ��������� ��������� �����. ������ �� 1 �� 5 ����������� �� ������� ������ ������.",'+
                'ENG:"Temporarily increases the potential for gaining experience. Potential from 1 to 5 multiplied by the players current level."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();'+
                'AddEffect(PlayerEXPBuff, Rand(GetParam(LVL) * 5) + 1);'+
        '"},'+
        'buffREG:{'+
            'name:"buffREG",'+
            'caption: {RU:"����� �����������", ENG:"Potion of regeneration"},'+
            'description:{'+
                'RU:"�������� �������� ���� ������� �����������. ��������� ����� ������ �����������. ������ �� 1 �� 10 ����������� �� ������� ������� ������.",'+
                'ENG:"Temporarily increases the strength of the regeneration effect. Potential ftom 10 to 10 multiplied by the players current level."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();'+
                'AddEffect(PlayerREGBuff, Rand(GetParam(LVL) * 10) + 10);'+
        '"},'+
        'buffSPEED:{'+
            'name:"buffSPEED",'+
            'caption: {RU:"����� �������", ENG:"Ticket of Time"},'+
            'description:{'+
                'RU:"�������� �������� �������� �������. ������ 100 + 10 * ������� ������.",'+
                'ENG:"Temporarily increases the speed of time. The duration depends on the current level of the player."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();'+
                'AddEffect(BuffSPEED, GetParam(LVL) * 10 + 100);'+
        '"},'+
        'potionAuto:{'+
            'name:"potionAuto",'+
            'caption: {RU:"����� ������������", ENG:"Potion of autoactions"},'+
            'description:{'+
                'RU:"��������� ������������. ������ �� 500 �� 1000.",'+
                'ENG:"Adds auto-actions. The effect is from 500 to 1000."'+
            '},'+
            'script:"'+
                'SetPlayerAsTarget();' +
                'ChangeParam(AutoAction,Rand(500) + 500);'+
        '"}'+
    '},'+


    /// cost - ��������� ��������� � ���� �� ������� �����
    /// lvl - ��������� ��������� � ���� �� ������� �����
    /// isActivated - ������������ ��� ��������� �����
    /// isEnabled - �������� �� ��� ������������� (����� �� ������������ � ������ ���������)
    'skills:{'+
        'healing:{'+
            'caption:{RU:"�������",ENG:"Healing"},isActivated: true, '+
            'description:{'+
                'RU:"��������������� �������� ����. ������ �� 0 �� 50 ���������� �� ������� ������. ��������� 20 ���� �� ������� ������.",'+
                'ENG:"Restores the targets health. The effect is from 0 to 50 multiplied by the skill level. Cost 20 mana per skill level."'+
            '},'+
            'script:"'+
                'SetVar(IncHP,Rand(GetSkillLvl(healing) * 50));'+
                'ChangeTargetParam(HP,GetVar(IncHP));'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(�arget gets GetVar(IncHP) health);'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(���� ������� GetVar(IncHP) ��������);'+
        '"},'+
        'explosion:{'+
            'caption:{RU:"�����",ENG:"Explosion"},isActivated: true, '+
            'description:{'+
                'RU:"������� ���� ���������� ����. ������ �� 0 �� 300 ���������� �� ������� ������. ��������� 50 ���� �� ������� ������.",'+
                'ENG:"Deals magic damage to the target. The effect is from 0 to 300 multiplied by the skill level. Cost 50 mana per skill level."'+
            '},'+
            'script:"'+
                'SetVar(Expl,Rand(GetSkillLvl(explosion) * 300));'+
                'ChangeTargetParam(HP,-GetVar(Expl));'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Target take GetVar(Expl) damage!);'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(���� ������� GetVar(Expl) �����!);'+
        '"},'+
        'heroism:{'+
            'caption:{RU:"�������",ENG:"Heroism"},isActivated: true, '+
            'description:{'+
                'RU:"�������� �������� ��������� ����: �����, ������ � ���������� ������. ������ �� 0 �� 5 ���������� �� ������� ������. ��������� 20 ���� �� ������� ������.",'+
                'ENG:"Temporarily increases the parameters of the target: attack, defence and magic defence. The effect is from 0 to 5 multiplied by the skill level. Cost 20 mana per skill level."'+
            '},'+
            'script:"'+
                'SetVar(value,Rand(GetSkillLvl(heroism) * 5));'+
                'SetTargetBuff(ATK,GetVar(value));'+
                'SetTargetBuff(DEF,GetVar(value));'+
                'SetTargetBuff(MDEF,GetVar(value));'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Target has received an attack and defence boost of GetVar(value));'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(���� �������� �������� ����� � ������ �� GetVar(value));'+
        '"},'+
        'breakDEF:{'+
            'caption:{RU:"�������� ������",ENG:"Defence break"},isActivated: true, '+
            'description:{'+
                'RU:"������� �������� ������ ����. ������ �� 0 �� 10 ���������� �� ������� ������. ��������� 15 ���� �� ������� ������.",'+
                'ENG:"Reduces the value of target defence. The effect is from 0 to 10 multiplied by the skill level. Cost 15 mana per skill level."'+
            '},'+
            'script:"'+
                'SetVar(value,Rand(GetSkillLvl(breakDEF) * 10));'+
                'ChangeTargetParam(DEF,-GetVar(value));'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Target defense reduced by GetVar(value));'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(������ ���� ������� �� GetVar(value));'+
        '"},'+
        'breakMDEF:{'+
            'caption:{RU:"�������� ���������� ������",ENG:"Magic defence break"},isActivated: true, '+
            'description:{'+
                'RU:"������� �������� ���������� ������ ����. ������ �� 0 �� 10 ���������� �� ������� ������. ��������� 15 ���� �� ������� ������.",'+
                'ENG:"Reduces the value of target magic defence. The effect is from 0 to 10 multiplied by the skill level. Cost 15 mana per skill level."'+
            '},'+
            'script:"'+
                'SetVar(value,Rand(GetSkillLvl(breakMDEF) * 10));'+
                'ChangeTargetParam(MDEF,-GetVar(value));'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Target magic defense reduced by GetVar(value));'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(���������� ������ ���� ������� �� GetVar(value));'+
        '"},'+
        'breakATK:{'+
            'caption:{RU:"������",ENG:"Injury"},isActivated: true, '+
            'description:{'+
                'RU:"������� ����� ����. ������ �� 0 �� 5 ���������� �� ������� ������. ��������� 30 ���� �� ������� ������.",'+
                'ENG:"Reduces target attack. The effect is from 0 to 5 multiplied by the skill level. Cost of 30 mana per skill level."'+
            '},'+
            'script:"'+
                'SetVar(value,Rand(GetSkillLvl(breakATK) * 5));'+
                'ChangeTargetParam(ATK,-GetVar(value));'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Target attack reduced by GetVar(value));'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(����� ���� ������� �� GetVar(value));'+
        '"},'+
        'leakMP:{'+
            'caption:{RU:"������ ����",ENG:"Mana leak"},isActivated: true, '+
            'description:{'+
                'RU:"�������� � ���� ����, �� �� ������ ���������� ����������. ����� �������� �������� ����� ����������. ������ �� 0 �� 30 ���������� �� ������� ������. ��������� 10 ���� �� �������.",'+
                'ENG:"It takes away mana from the target, but not more than the available amount. The player receives half of this amount. The effect is from 0 to 30 multiplied by the skill level. Cost 10 mana per level."'+
            '},'+
            'script:"'+
                'SetVar(leak,Rand(GetSkillLvl(leakMP) * 30));'+  // ������� �������� ������� �����
                'SetVar(monsterMP,GetTargetAttr(MP));'+           // ������� ���� � �������

                'IF(GetVar(leak) >= GetVar(monsterMP), 3);'+        // ���� �������� ������, ��� ����
                'SetVar(leak, GetVar(monsterMP) / 2);'+          // ���������� ������� = �������� �� ����������
                'ChangeTargetParam(MP,-GetVar(monsterMP));'+     // �������� � ������� ���
                'ChangePlayerParam(MP,GetVar(leak));'+             // ����� �������� ����

                'IF(GetVar(leak) < GetVar(monsterMP), 4);'+        // ���� �������� ������ ��� ����
                'SetVar(monsterMP, GetVar(leak));'+                // ������ ����� ������ � ������ ������
                'SetVar(leak, GetVar(leak) / 2);'+               // ����� ������� �������� �� ����������
                'ChangeTargetParam(MP,-GetVar(monsterMP));'+     // ������ ������
                'ChangePlayerParam(MP,GetVar(leak));'+             // ����� ��������

                'If(GetLang() = ENG, 2);'+
                'AddEvent(Target lost GetVar(monsterMP) mana);'+   // ������ ������
                'AddEvent(Player got GetVar(leak) mana);'+
                'If(GetLang() = RU, 2);'+
                'AddEvent(���� �������� GetVar(monsterMP) ����);'+   // ������ ������
                'AddEvent(����� ������� GetVar(leak) ����);'+
        '"},'+
        'vampireStrike:{'+
            'caption:{RU:"���� �������",ENG:"Strike if vampire"},isActivated: true, '+
            'description:{'+
                'RU:"�������� � ���� ��������, �� �� ������ ���������� ����������. ����� �������� �������� ����� ����������. ������ �� 0 �� 20 ���������� �� ������� ������. ��������� 10 ���� �� �������.",'+
                'ENG:"It takes away health from the target, but not more than the available amount. The player receives half of this amount. The effect is from 0 to 20 multiplied by the skill level. Cost 10 mana per level."'+
            '},'+
            'script:"'+
                'SetVar(leak,Rand(GetSkillLvl(vampireStrike) * 20));'+  // ������� �������� ������� �����
                'SetVar(monsterHP,GetTargetAttr(HP));'+           // ������� ���� � �������

                'IF(GetVar(leak) >= GetVar(monsterHP), 3);'+        // ���� �������� ������, ��� ����
                'SetVar(leak, GetVar(monsterHP) / 2);'+          // ���������� ������� = �������� �� ����������
                'ChangeTargetParam(HP,-GetVar(monsterHP));'+     // �������� � ������� ���
                'ChangePlayerParam(HP,GetVar(leak));'+             // ����� �������� ����

                'IF(GetVar(leak) < GetVar(monsterHP), 4);'+        // ���� �������� ������ ��� ����
                'SetVar(monsterHP, GetVar(leak));'+                // ������ ����� ������ � ������ ������
                'SetVar(leak, GetVar(leak) / 2);'+               // ����� ������� �������� �� ����������
                'ChangeTargetParam(HP,-GetVar(monsterHP));'+     // ������ ������
                'ChangePlayerParam(HP,GetVar(leak));'+             // ����� ��������

                'If(GetLang() = ENG, 2);'+
                'AddEvent(Target lost GetVar(monsterHP) health);'+   // ������ ������
                'AddEvent(Player got GetVar(leak) health);'+
                'If(GetLang() = RU, 2);'+
                'AddEvent(���� �������� GetVar(monsterHP) ��������);'+   // ������ ������
                'AddEvent(����� ������� GetVar(leak) ��������);'+
        '"},'+
        'metabolism:{'+
            'caption:{RU:"����������",ENG:"Metabolism"},isActivated: true, '+
            'description:{'+
                'RU:"�������� �������� ���� ������� �����������. ������ �� 0 �� 5 ���������� �� ������� ������. ��������� 10 ���� �� �������.",'+
                'ENG:"Temporarily increases the strength of the regeneration effect. The effect is from 0 to 5 multiplied by the skill level. Cost 10 mana per level."'+
            '},'+
            'script:"'+
                'SetVar(value,Rand(GetSkillLvl(metabolism) * 5) + 10);'+
                'SetTargetBuff(BODY,GetVar(value));'+
                'If(GetLang() = ENG, 1);'+
                'AddEvent(Target speed up regeneration by GetVar(value));'+
                'If(GetLang() = RU, 1);'+
                'AddEvent(����������� ���� ��������� �� GetVar(value));'+
        '"}'+
    '},'+



    /// ��������� �������, ������� ����� ���� �������� �� ���� (������, �������,...)
    ///    ������ ������ ����� ����������� ���������� � ����� ���� � ����� ����� ��� �������
    ///    auto - ���������� ������� CheckStatus ��� ������� ��������� ������� (state.player.effects)
    ///           � ��������� ����������� ������� �� �������. ��������, ����������� ����������� ������� ��� �����
    ///    use - ����������� ������ ���, ����� ���������� � �������� ���������� ����� GetEffect,
    ///          ��� ���� ������������ �������������� ���������� LastValue,
    ///          ����� �� ������� � ����������� �������� ���������� ������� �������� ����� GetEffect
    'effects:{'+
        'platerregbuff:{'+
            'name:"platerregbuff",'+
            'script:{'+
                'auto:"",'+
                'use:"'+
                    'IF(GetVar(LastValue) > 1, 1);'+                                /// ���� ����� ���� �� �������� ������
                        'ChangeEffect(PlayerREGBuff, -1);'+                       /// ��������� ������������� ������
                    'IF(GetVar(LastValue) <= 1, 1);'+                               /// ���� ����� �������
                        'RemoveEffect(PlayerREGBuff);'+                         /// ������� ������
                '",'+
            '},'+
        '},'+

        'playerexpbuff:{'+
            'name:"playerexpbuff",'+
            'script:{'+
                'auto:"",'+
                'use:"'+
                    'IF(GetVar(LastValue) > 1, 1);'+                                /// ���� ����� ���� �� �������� ������
                        'ChangeEffect(PlayerEXPBuff, -1);'+                       /// ��������� ������������� ������
                    'IF(GetVar(LastValue) <= 1, 1);'+                               /// ���� ����� �������
                        'RemoveEffect(PlayerEXPBuff);'+                         /// ������� ������
                '",'+
            '},'+
        '},'+

        'playermdefbuff:{'+
            'name:"playermdefbuff",'+
            'script:{'+
                'auto:"",'+
                'use:"'+
                    'IF(GetVar(LastValue) > 1, 1);'+                               /// ���� ����� ���� �� �������� ������
                        'ChangeEffect(PlayerMDEFBuff, -1);'+                      /// ��������� ������������� ������
                    'IF(GetVar(LastValue) <= 1, 1);'+                              /// ���� ����� �������
                        'RemoveEffect(PlayerMDEFBuff);'+                        /// ������� ������
                '",'+
            '},'+
        '},'+

        'playerdefbuff:{'+
            'name:"playerdefbuff",'+
            'script:{'+
                'auto:"",'+
                'use:"'+
                    'IF(GetVar(LastValue) > 1, 1);'+                                /// ���� ����� ���� �� �������� ������
                        'ChangeEffect(PlayerDEFBuff, -1);'+                       /// ��������� ������������� ������
                    'IF(GetVar(LastValue) <= 1, 1);'+                               /// ���� ����� �������
                        'RemoveEffect(PlayerDEFBuff);'+                         /// ������� ������
                '",'+
            '},'+
        '},'+

        'playeratkbuff:{'+
            'name:"playeratkbuff",'+
            'script:{'+
                'auto:"",'+
                'use:"'+
                    'IF(GetVar(LastValue) > 1, 1);'+                                /// ���� ����� ���� �� �������� ������
                        'ChangeEffect(PlayerATKBuff, -1);'+                       /// ��������� ������������� ������
                    'IF(GetVar(LastValue) <= 1, 1);'+                               /// ���� ����� �������
                        'RemoveEffect(PlayerATKBuff);'+                         /// ������� ������
                '",'+
            '},'+
        '},'+

        'regenplayerhp:{'+
            'name:"regenplayerhp",'+
            'script:{'+
                'auto:"'+
                    'SetPlayerAsTarget();'+                                     /// ������� � ������
                    'SetVar(tmp, GetEffect(PlayerREGBuff));'+               /// �������� ������� ��� �� �����, ��� �������� ������� ��� �� 1. ������, ������ ��� ������ ���� ���
                    'IF(GetEffect(RegenPlayerHP) > 0, 3);'+                     /// ���� �������� �������� ����������� �� �������
                        'SilentChange();'+
                        'ChangeParam(HP, GetParam(BODY) + GetVar(tmp));'+                /// ������������ � �������� � ������ ���������� ���� �� �����
                        'ChangeEffect(RegenPlayerHP, -GetParam(BODY) - GetVar(tmp));'+    /// ��������� � ���� ������ ��������
                    'IF(GetEffect(RegenPlayerHP) <= 0, 1);'+                    /// ���� �������� �������� ����������� �������
                        'RemoveEffect(RegenPlayerHP);'+                         /// ������� ������
                '",'+
                'use:"",'+
            '},'+
        '},'+

        'regenplayermp:{'+
            'name:"regenplayermp",'+
            'script:{'+
                'auto:"'+
                    'SetPlayerAsTarget();'+                                     /// ������� � ������
                    'SetVar(tmp, GetEffect(PlayerREGBuff));'+               /// �������� ������� ��� �� �����, ��� �������� ������� ��� �� 1. ������, ������ ��� ������ ���� ���
                    'IF(GetEffect(RegenPlayerMP) > 0, 3);'+                     /// ���� �������� �������� ����������� �� �������
                        'SilentChange();'+
                        'ChangeParam(MP, GetParam(MIND) + GetVar(tmp));'+                /// ������������ � ������� � ������ ���������� ���� �� �����
                        'ChangeEffect(RegenPlayerMP, -GetParam(MIND) - GetVar(tmp));'+    /// ��������� � ���� ������ �������
                    'IF(GetEffect(RegenPlayerMP) <= 0, 1);'+                    /// ���� �������� �������� ����������� �������
                        'RemoveEffect(RegenPlayerMP);'+                         /// ������� ������
                    '",'+
                'use:"",'+
            '},'+
        '},'+

        'buffspeed:{'+
            'name:"buffspeed",'+
            'script:{'+
                'auto:"'+
                    'SetPlayerAsTarget();'+
                    'IF(GetEffect(buffspeed) > 0, 2);'+
                        'ChangeEffect(buffspeed, -1);'+
                        'SetVar(GAME_SPEED,100);'+
                    'IF(GetEffect(buffspeed) <= 0, 2);'+
                        'SetVar(GAME_SPEED,1000);'+
                        'RemoveEffect(buffspeed);'+
                    '",'+
                'use:"'+
                '",'+
            '},'+
        '},'+

    '},'+



    /// isAllow - �������� �� ��� �������������
    /// lvl - ������� ������� �����������
    'tools:{'+
        'shovel:{'+
            'caption: {RU:"������",ENG:"Shovel"},'+
            'desc: {RU:"��������� ������� ���������� �����",ENG:"Allows you to clear trash faster."},'+
            'script: "SetVar(SHOVEL_LVL, GetVar(SHOVEL_LVL) + 1);"'+
        '},'+
        'pick:{'+
            'caption: {RU:"�����",ENG:"Pick"},'+
            'desc: {RU:"��������� ������� ��������� ������.",ENG:"Allows you to quickly disassemble blockage."},'+
            'script: "SetVar(PICK_LVL, GetVar(PICK_LVL) + 1);"'+
        '},'+
        'axe:{'+
            'caption: {RU:"�����",ENG:"Axe"},'+
            'desc: {RU:"��������� ������� ��������� �����.",ENG:"Allows you to break boxes faster."},'+
            'script: "SetVar(AXE_LVL, GetVar(AXE_LVL) + 1);"'+
        '},'+
        'lockpick:{'+
            'caption: {RU:"�������",ENG:"Lockpick"},'+
            'desc: {RU:"��������� ������� ��������� �������.",ENG:"Allows you to open chests faster."},'+
            'script: "SetVar(KEY_LVL, GetVar(KEY_LVL) + 1);"'+
        '},'+
        'sword:{'+
            'caption: {RU:"���",ENG:"Sword"},'+
            'desc: {RU:"����������� ����������� ���� �� �� ���� ������� �����.",ENG:"Increases minimum damage but not higher than the current attack."},'+
            'script: "SetVar(SWORD_LVL, GetVar(SWORD_LVL) + 1);"'+
        '},'+
        'lifeAmulet:{'+
            'caption: {RU:"������ ��������",ENG:"Amulet of Health"},'+
            'desc: {RU:"��� ����������� ��������� +100 �������� �� �������.",ENG:"Adds +100 HP per level upon respawn."},'+
            'script: "SetVar(LIFEAMULET_LVL, GetVar(LIFEAMULET_LVL) + 1);"'+
        '},'+
        'timeSand:{'+
            'caption: {RU:"����� �������",ENG:"Sand of Time"},'+
            'desc: {RU:"�������� ������������ �� 3% �� �������.",ENG:"Speeds up Auto Actions by 3% per level."},'+
            'script: "SetVar(TIMESAND_LVL, [GetVar(TIMESAND_LVL) + 3]);"'+
        '},'+
        'leggings:{'+
            'caption: {RU:"������",ENG:"Leggings"},'+
            'desc: {RU:"����������� ���� �������� ������� ������� ���� ������ � �.�. �� 3% �� �������.",ENG:"Increases the chance to avoid the effect of traps rats spiders etc. 3% per level."},'+
            'script: "SetVar(LEGGINGS_LVL, GetVar(LEGGINGS_LVL) + 3);"'+
        '},'+
        'wisdom:{'+
            'caption: {RU:"����� ��������",ENG:"Circle of Wisdom"},'+
            'desc: {RU:"��������� ����� � ��������� ������� �������� ����� ����.",ENG:"Clarifies thoughts and allows you to find new ideas faster."},'+
            'script: "SetVar(WISDOM_LVL, GetVar(WISDOM_LVL) + 1);"'+
        '},'+
        'resist:{'+
            'caption: {RU:"������ �������������",ENG:"Ring of resistance"},'+
            'desc: {RU:"����������� �� 2% �� ������� ���� ������������� �������, ��������� ��������� ���������.",ENG:"Increases by 2% per level the chance to block effects that reduce character parameters."},'+
            'script: "SetVar(RESIST_LVL, GetVar(RESIST_LVL) + 2);"'+
        '},'+
        'expStone:{'+
            'caption: {RU:"������ �����",ENG:"Experience stone"},'+
            'desc: {RU:"�� 1 �� ������� ����������� ���������� ����.",ENG:"Increases experience gained by 1 per level."},'+
            'script: "SetVar(EXP_LVL, GetVar(EXP_LVL) + 2);"'+
        '}'+
    '},'+


    /// ������ ����� �� �������
    'targetFloor:{'+
        '1:{ floor: 1, next:2, script:"'+
             'If(GetLang() = RU, 6);'+
             'Log(normal,\"�� ���������� ����� � ��������� �� �������� ����. � ������ �������, ������ ��������� �� �������� ������.\");'+
             'Log(normal,\"������� �����������, �� ���������, ��� ���������� � �����-�� ������� ������ ���������, ���������� ��������� ������. ���� �����������. ������ ������ ������ �� ������. '+
                 '� ������� ���� ������ ��������� �������� ������ � ���������, ������� ������� �����.\");'+
             'Log(normal,\"����������� ��� ����� �������������� ��������� ��������� ������� � ������������ � ���� ��������. � ������ ����� ������� �� � ������ ���������� �����:\");'+
             'Log(note,\"��� ������ � ���-����� ����. ��� �� ������ �����. ������ ����� ������ �� ����. ����, ��� ������ �� ���� � ����� � ������ �� �������, '+
                 '�� ��� ���� ���������� �������. ������� ��� ��� �������. � ��� �� �� ����������� � �����, �����: ����� ����� �����! ������ �� � ����� ������� �� ����, �� � ����� ���������� ����� �����. �����, ��� ����!\");'+
             'Log(normal,\"��������� ��� ��������� ��������, �� ��� � �� ����� ��� ������. �� ����� ������ �� ���� ���� �� ����. ����������, �� ������ ������, ����������� ��������� � ����� �������. '+
                 '���� ������������� �������� ������� ��������� ������ ���������� ������� � ��������� ��� ��������� �������� �� ���� �������.\");'+
             'Log(danger,\"���!\");'+

             'If(GetLang() = ENG, 6);'+
             'Log(normal,\"You open your eyes in the twilight on the stone floor. There is emptiness in my head, my heart squeezes from the feeling of loss.\");'+
             'Log(normal,\"Looking around a little, you realize that you are in some large empty room littered with various rubbish. '+
                 'There are no windows. Only torches are smoked on the walls. In the far corner, a staircase upstairs to a massive iron-clad door is dimly visible.\");'+
             'Log(normal,\"Almost at hand, a weighty rag bag with a note pinned to it is found. In the faint light of torches, you can hardly make out the text:\");'+
             'Log(note,\"There is gold and some things. This is for the first time. I can not help you anymore. I know that now you are confused and do not remember anything, '+
                 'but it was necessary to do it. Later you will understand everything yourself. And whatever happens in the Tower, remember: you need to find a way out! Now you are at the farthest from him, but also the safest entry point. Good luck my friend!\");'+
             'Log(normal,\"After rereading the message several times, you still do not understand its meaning. But you were not allowed to think about it for a long time. Nearby, behind heaps of rubbish, there was a stirring and a low growl. '+
                 'The hand involuntarily gripped the handle of the dagger that had come from nowhere and threw it out towards the monster flying at you.\");'+
             'Log(danger,\"FIGHT!\");'+
             'SetNextTarget();'+

{
             'ChangePlayerItemCount(restoreHealth, Rand(100000));'+
             'ChangePlayerItemCount(restoreMana, Rand(100000));'+
             'ChangePlayerItemCount(permanentATK, Rand(100000));'+
             'ChangePlayerItemCount(permanentDEF, Rand(100000));'+
             'ChangePlayerItemCount(permanentMDEF, Rand(100000));'+
             'ChangePlayerItemCount(potionexp, Rand(100000));'+
             'ChangePlayerItemCount(regenHP, Rand(100000));'+
             'ChangePlayerItemCount(regenMP, Rand(100000));'+
             'ChangePlayerItemCount(buffATK, Rand(100000));'+
             'ChangePlayerItemCount(buffDEF, Rand(100000));'+
             'ChangePlayerItemCount(buffMDEF, Rand(100000));'+
             'ChangePlayerItemCount(buffEXP, Rand(100000));'+
             'ChangePlayerItemCount(buffREG, Rand(100000));'+
             'ChangePlayerItemCount(potionAuto, Rand(100000));'+
}        '"},'+
        '2:{ floor: 2, next:3, script:"'+
             'BreakAuto(Tower);'+

             /// ������ ������� ������
             'IF(GetVar(first_meet) = 6, 8);'+
                 'SetMonsterAsTarget();'+
                 'SetImage(32);'+
                 'SetParam(HP, 5000);'+
                 'SetParam(ATK, 50);'+
                 'SetParam(DEF, 30);'+
                 'SetName(RU,\"������ ���\");'+
                 'SetName(ENG,\"Hell Dog\");'+
                 'ChangeLootCount(essense,20);'+

             /// ����� ������� � ������ ��������
             'IF(GetVar(first_meet) = 5, 14);'+
                 'ChangeVar(first_meet, 1);'+
                 'SetMonsterAsTarget();'+
                 'SetImage(31);'+
                 'SetParam(HP, 9999);'+
                 'SetParam(ATK, 100);'+
                 'SetParam(DEF, 0);'+
                 'SetName(RU,\"������ ������\");'+
                 'SetName(ENG,\"DARK MASER\");'+
                 'ChangeLootCount(essense,100);'+
                 'IF(GetLang() = ENG, 1);'+
                     'Log(danger,\"It''s fun, but I don''t have time to mess with you. But don''t be upset! My dog will sit with you. HA-HA-HA!\");' +
                 'IF(GetLang() = RU, 1);'+
                     'Log(danger,\"��� ������, �� �� ����� � ����� � ���� ��� �������. �� �� �� �������������! � ����� ������� ��� �����. ��-��-��!\");' +
                 'AllowThink(other_path);'+

             /// ��������� ������� � ������ ��������
             'IF(GetVar(first_meet) = 4, 13);'+
                 'ChangeVar(first_meet, 1);'+
                 'SetMonsterAsTarget();'+
                 'SetImage(31);'+
                 'SetParam(HP, 9999);'+
                 'SetParam(ATK, 100);'+
                 'SetParam(DEF, 0);'+
                 'SetName(RU,\"������ ������\");'+
                 'SetName(ENG,\"DARK MASER\");'+
                 'ChangeLootCount(essense,100);'+
                 'IF(GetLang() = ENG, 1);'+
                     'Log(danger,\"Sit where you are told, rat! Now you are my eternal prisoner! HA HA!\");' +
                 'IF(GetLang() = RU, 1);'+
                     'Log(danger,\"���� ���, ��� ���� �������, �����! ������ �� ��� ������ �������! ��-��!\");' +


             // ���� ������ ������� � �� ��� �� ���������
             'IF(GetVar(first_meet) < 2, 16);'+

                 'IF(GetLang() = RU, 5);'+
                 'Log(normal,\"� ������ ������� ����� ������� ������� ������� ������. ��� ��, � ������� ����� ��������� ������ ������:\");'+
                 'Log(note,\"������ ������ �������� ���� ����� ���� � �����, ����� �� ����������� ������. �� ���� ����� ���� �� �������� ��� ����� � ������ ��� �������.\");'+
                 'Log(note,\"������ � �������� ������� ������� �� ������, ��������� ������� ������� ������ � ������������� � ��������� �� �� ������! � ����, ��� �� �������� ���� ��������� ����.\");'+
                 'Log(note,\"�, ����! � ������� ���� ������� � ����� ����� �����! ���� ����������� ������ �������! ���� �� ������ �� ��, ��� �� ����������, ������� ����������� ����� ��� �� ����� �������� � ������ �����... �, ����!..\");'+
                 'Log(normal,\" - ���������. ����� �����, ����� ������ ������? ��� � ����� �����? ����� ��� ������� �������� �� ����...\");'+

                 'IF(GetLang() = ENG, 5);'+
                 'Log(normal,\"There was some gold in a rusty chest between floors. Also, there are several crumpled sheets in the chest:\");'+
                 'Log(note,\"The Dark Master guards his tower day and night, roaming the endless floors. No living soul can escape his wrath and the fury of his monsters.\");'+
                 'Log(note,\"As soon as I was about to put things in order on the floors, the damn monsters smashed the chest with tools and took them to the floors! I know that damn Ikki got them going.\");'+
                 'Log(note,\"Oh woe! I lost my diary in a lot of this junk! Years of accumulated knowledge are gone! Even in spite of the fact that it is encrypted, it is scary to imagine what troubles it can bring in bad hands ... Oh, gods! ..\");'+
                 'Log(normal,\" - Wait. Which tower, which Dark master? What am I doing here? Think about it well...\");'+

                 'AllowMode(Think);'+
                 'AllowThink(wakeup);'+
                 'ChangePlayerItemCount(gold, Rand(100000));'+
                 'SetNextTarget();'+
        '"},'+
        '3:{ floor: 3, next:4, script:"'+
             'BreakAuto(Tower);'+

             /// ������ ������� � ������ ��������
             'IF(GetVar(first_meet) = 3, 18);'+
                 'ChangeVar(first_meet, 1);'+
                 'SetMonsterAsTarget();'+
                 'SetImage(31);'+
                 'SetParam(HP, 9999);'+
                 'SetParam(ATK, 100);'+
                 'SetParam(DEF, 0);'+
                 'SetName(RU,\"������ ������\");'+
                 'SetName(ENG,\"DARK MASER\");'+
                 'ChangeLootCount(essense,100);'+
                 'IF(GetLang() = ENG, 3);'+
                     'Log(danger,\"Well then. I was finally convinced that you are here for a reason, since death has departed from you.\");' +
                     'Log(danger,\"I don''t know who you are and why you are here. Your mind is clear and I see that you yourself do not know this ... A pitiful attempt to deceive me!\");' +
                     'Log(danger,\"Since you are in my wonderful tower for a long time, rat, this is what rats are supposed to do, I will drive you to the basement forever! HA HA!\");' +
                 'IF(GetLang() = RU, 3);'+
                     'Log(danger,\"�� ��� ��. � ������������ ��������, ��� �� ����� �� ������ ���, ��� ������ ����������� �� ����.\");' +
                     'Log(danger,\"�� ���� ��� �� � ����� �����. ���� ����� ���� � � ����, ��� �� ��� ����� �� ������... ��! ������ ������� �������� ����!\");' +
                     'Log(danger,\"��� �� ������� � ���� �������� �����, �����, �� ��� � ���������� ������, � ������ ���� � ������ �������! ��-��!\");' +
                 'SetCurrTarget(2);'+

             /// ������ ������� � ������ ��������
             'IF(GetVar(first_meet) = 2, 17);'+
                 'ChangeVar(first_meet, 1);'+
                 'SetMonsterAsTarget();'+
                 'SetImage(31);'+
                 'SetParam(HP, 9999);'+
                 'SetParam(ATK, 100);'+
                 'SetParam(DEF, 0);'+
                 'SetName(RU,\"������ ������\");'+
                 'SetName(ENG,\"DARK MASER\");'+
                 'ChangeLootCount(essense,100);'+
                 'IF(GetLang() = ENG, 3);'+
                     'Log(danger,\"What? You again? You are insignificant and I swat you like a fly, but are you still here ?!\");' +
                     'Log(danger,\"HA! It seems that sabotage is brewing here ...\");' +
                     'Log(danger,\"But it does not matter. You won''t go further, worm!\");' +
                 'IF(GetLang() = RU, 3);'+
                     'Log(danger,\"���? ����� ��? �� �������� � � ���������� ���� ��� ����, �� �� ��� ��� �����?!\");' +
                     'Log(danger,\"��! �������, � ��� ��� ��������� ��������...\");' +
                     'Log(danger,\"�� ��� �� ����� ��������. ������ �� �� ��������, �����!\");' +

             /// ������ ������� � ������ ��������
             'IF(GetVar(first_meet) = 1, 16);'+
                 'ChangeVar(first_meet, 1);'+
                 'SetMonsterAsTarget();'+
                 'SetImage(31);'+
                 'SetParam(HP, 9999);'+
                 'SetParam(ATK, 100);'+
                 'SetParam(DEF, 0);'+
                 'SetName(RU,\"������ ������\");'+
                 'SetName(ENG,\"DARK MASER\");'+
                 'ChangeLootCount(essense,100);'+
                 'IF(GetLang() = ENG, 2);'+
                     'Log(danger,\"What are you doing in my Tower, insignificance!?\");' +
                     'Log(danger,\"I will DESTROY you!\");' +
                 'IF(GetLang() = RU, 2);'+
                     'Log(danger,\"��� �� ������� � ���� �����, �����������!?\");' +
                     'Log(danger,\"� �������� ����!\");' +
                 'AllowThink(darkmaster);'

//             'IF(GetLang() = RU, 1);'+
//             'Log(normal,\"� ������ ������� ����� ������� ������� ������� �����.\");'+

//             'IF(GetLang() = ENG, 1);'+
//             'Log(normal,\"Some potions were found in a rusty chest between floors.\");'+

//             'ChangePlayerItemCount(potionAuto, 10);'+
//             'SetNextTarget();'
        +'"},'+
        '4:{ floor: 1, next:5, script:"'+
             'BreakAuto(Tower);'+

             'If(GetLang() = RU, 1);'+
             'Log(normal,\"�������� �����! ����� ��������� �� � ������� ����...\");'+
             'If(GetLang() = ENG, 1);'+
             'Log(normal,\"You have found a huge chest! The lock does not give in the first time ...\");'+

             'ChangePlayerItemCount(GetRandItemName(), 1);'+
             'ChangePlayerItemCount(GetRandItemName(), 1);'+
             'ChangePlayerItemCount(GetRandItemName(), 1);'+
             'ChangePlayerItemCount(GetRandItemName(), 1);'+
             'ChangePlayerItemCount(GetRandItemName(), 1);'+

             'SetNextTarget();'
        +'"},'+
        '5:{ floor: 5, next:999, script:"'+
             'BreakAuto(Tower);'+

             /// ������ ������� � ������ ��������
             'IF(GetVar(first_meet) = 3, 18);'+
                 'ChangeVar(first_meet, 1);'+
                 'SetMonsterAsTarget();'+
                 'SetImage(31);'+
                 'SetParam(HP, 9999);'+
                 'SetParam(ATK, 100);'+
                 'SetParam(DEF, 0);'+
                 'SetName(RU,\"������ ������\");'+
                 'SetName(ENG,\"DARK MASER\");'+
                 'ChangeLootCount(essense,100);'+
                 'IF(GetLang() = ENG, 3);'+
                     'Log(danger,\"Well then. I was finally convinced that you are here for a reason, since death has departed from you.\");' +
                     'Log(danger,\"I don''t know who you are and why you are here. Your mind is clear and I see that you yourself do not know this ... A pitiful attempt to deceive me!\");' +
                     'Log(danger,\"Since you are in my wonderful tower for a long time, rat, this is what rats are supposed to do, I will drive you to the basement forever! HA HA!\");' +
                 'IF(GetLang() = RU, 3);'+
                     'Log(danger,\"�� ��� ��. � ������������ ��������, ��� �� ����� �� ������ ���, ��� ������ ����������� �� ����.\");' +
                     'Log(danger,\"�� ���� ��� �� � ����� �����. ���� ����� ���� � � ����, ��� �� ��� ����� �� ������... ��! ������ ������� �������� ����!\");' +
                     'Log(danger,\"��� �� ������� � ���� �������� �����, �����, �� ��� � ���������� ������, � ������ ���� � ������ �������! ��-��!\");' +
                 'SetCurrTarget(2);'+

             /// ������ ������� � ������ ��������
             'IF(GetVar(first_meet) = 2, 17);'+
                 'ChangeVar(first_meet, 1);'+
                 'SetMonsterAsTarget();'+
                 'SetImage(31);'+
                 'SetParam(HP, 9999);'+
                 'SetParam(ATK, 100);'+
                 'SetParam(DEF, 0);'+
                 'SetName(RU,\"������ ������\");'+
                 'SetName(ENG,\"DARK MASER\");'+
                 'ChangeLootCount(essense,100);'+
                 'IF(GetLang() = ENG, 3);'+
                     'Log(danger,\"What? You again? You are insignificant and I swat you like a fly, but are you still here ?!\");' +
                     'Log(danger,\"HA! It seems that sabotage is brewing here ...\");' +
                     'Log(danger,\"But it does not matter. You won''t go further, worm!\");' +
                 'IF(GetLang() = RU, 3);'+
                     'Log(danger,\"���? ����� ��? �� �������� � � ���������� ���� ��� ����, �� �� ��� ��� �����?!\");' +
                     'Log(danger,\"��! �������, � ��� ��� ��������� ��������...\");' +
                     'Log(danger,\"�� ��� �� ����� ��������. ������ �� �� ��������, �����!\");' +

             /// ������ ������� � ������ ��������
             'IF(GetVar(first_meet) = 1, 16);'+
                 'ChangeVar(first_meet, 1);'+
                 'SetMonsterAsTarget();'+
                 'SetImage(31);'+
                 'SetParam(HP, 9999);'+
                 'SetParam(ATK, 100);'+
                 'SetParam(DEF, 0);'+
                 'SetName(RU,\"������ ������\");'+
                 'SetName(ENG,\"DARK MASER\");'+
                 'ChangeLootCount(essense,100);'+
                 'IF(GetLang() = ENG, 2);'+
                     'Log(danger,\"What are you doing in my Tower, insignificance!?\");' +
                     'Log(danger,\"I will DESTROY you!\");' +
                 'IF(GetLang() = RU, 2);'+
                     'Log(danger,\"��� �� ������� � ���� �����, �����������!?\");' +
                     'Log(danger,\"� �������� ����!\");' +
                 'AllowThink(darkmaster);'+



             // ��� ������ ��������� � ���������� �����
             'IF(GetVar(first_meet) > 3, 6);'+
                 'IF(GetLang() = ENG, 1);'+
                     'Log(normal,\"At the place of your meeting with the Dark Master, there is an indelible trace of energy.\");' +
                 'IF(GetLang() = RU, 1);'+
                     'Log(normal,\"�� ����� ����� ������� � ������ �������� ������� ������������ ������������� ����.\");' +
                'ChangePlayerLootCount(essence,10);'+
                'SetNextTarget();'

        +'"},'+
        '6:{ floor: 6, next:7, script:"'+
             'BreakAuto(Tower);'+

             'SetNextTarget();'

        +'"},'+
        '7:{ floor: 7, next:10, script:"'+
             'SetBreak(Tower);'+

             'SetCreature('+
                 '{RUS:������ ������, ENG:DARK MASTER},'+
                 '{HP:99999, ATK:1000, DEF:0, MAXHP:99999, MP:0, MDEF:0},'+
                 '{SpiritBless:1}, );'+

             'AddEvent(..................);'+

             'IF(GetLang() = ENG, 3);'+
             'SetVar(DarkMaster,ANGRY DARK MASTER);'+
             'AddEvent(\" - This is our last meeting, stranger! You will not leave my Tower!\");' +
             'SetCreatureScript(OnDeath,\"AddEvent(..................);AddEvent(- You defeated ME!? Can not be! Who are You?!);AddEvent(..................);SetNextTarget();\");'+

             'IF(GetLang() = RU, 3);'+
             'SetVar(DarkMaster,���� ������ ������);'+
             'AddEvent(\" - ��� ���� ��������� �������, �����! �� �� ������� �� ���� �����!\");' +
             'SetCreatureScript(OnDeath,\"AddEvent(..................);AddEvent(- �� ������� ����!? �� ����� ����! ��� �� �����!?);AddEvent(..................);SetNextTarget();\");'+

             'AddEvent(..................);'+
             'SetNextTarget();'
        +'"},'+
        '10:{ floor: 10, next:11, script:"'+
             'SetBreak(Tower);'+

             'AddEvent(..................);'+

             'IF(GetLang() = ENG, 3);'+
             'AddEvent(\" - You broke into my Tower, scared monsters, looted chests. Who are you after that !?\");' +
             'AddEvent(\" - Now EXACTLY our last meeting!\");' +
             'SetCreatureScript(OnDeath,\"AddEvent(..................);AddEvent(- You defeated ME!? Can not be! Who are You?!);AddEvent(..................);SetNextTarget();\");'+

             'IF(GetLang() = RU, 3);'+
             'AddEvent(\" - �� �������� � ��� �����, ������� ��������, ��������� �������. �� ��� �� ����� ����� �����!?\");' +
             'AddEvent(\" - ��� ������ ����� ���� ��������� �������!\");' +
             'SetCreatureScript(OnDeath,\"AddEvent(..................);AddEvent(- �� ������� ����!? �� ����� ����! ��� �� �����!?);AddEvent(..................);SetNextTarget();\");'+

             'SetCreature('+
                 '{RUS:������ ������, ENG:DARK MASTER},'+
                 '{HP:999999, ATK:10000, DEF:0, MAXHP:999999, MP:0, MDEF:0},'+
                 '{SpiritBless:1}, );'+

             'AddEvent(..................);'+
             'SetNextTarget();'
        +'"},'+
        '11:{ floor: 11, next:11, script:"'+
             'SetBreak(Tower);'+
             'CurrentLevel(1);'
        +'"},'+
    '},'+



    /// �����������
    'thinks:{'+
      'defaultbody:{ENG:"You don''t have any diary entries yet...", RU:"� ����� �������� ���� ��� �������..."},'+
      'wakeup:{'+
        'name: "wakeup",'+         /// ���������� �������������
        'parent: "",'+             /// ������������� ����� ��� ���������� ������� ����������� ������ � ����
        'cost: 10,'+              /// ������� ����� ����������� ��� ��������� ������� redy
        'kind: "tower",'+          /// �� ���������� �������� � ������ � ��������, ��� ����� ������������
        'script:"'+                /// ������ ����������� �� ������ ���������� �����������
          'SetPlayerAsTarget();'+
          'ChangeParam(EXP, 10);'+

          'AllowThink(tower);'+
          'AllowThink(monsters);'+
          'AllowThink(whoami);'+
        '",'+
        'caption:{'+               /// ����� ��� ����������� �� ��������
          'ENG:"Where i am?",'+
          'RU:"��� �?"},'+
        'body:{'+                  /// ����� (�������� html) ��� ����������� � ��������
          'ENG:"'+
            '<p>Not much time has passed since waking up in this terrible place. '+
               'It is frightening and ridiculous that I do not remember anything about myself at all! '+
               'This Tower, a strange note, cramped floors packed with monsters, some ridiculous Dark Master ...</p>'+
            '<p>My head is spinning from all this. And also from the fact that from the moment I woke up I was tormented by a wild headache.</p>'+
            '<p>However, despite all this, there are pleasant little things. I don�t know how and why, but I can imagine quite well how to fight with melee weapons. '+
               'At the moment of the first inspiration, there was no time to be surprised that this thin graceful dagger, '+
               'which I have in my hands, appeared practically out of thin air! '+
               'And how clever and convenient it is for them to chop and stab, as if I had been doing this for more than one year.</p>'+
            '<p>But the feeling that a different kind of weapon is closer to me does not leave me ... '+
               'My hands remember something more weighty and much more deadly ... And it certainly was not a sword or a bow ... '+
               'When trying to remember the pain in my head begins to throb and squeeze consciousness into nothingness.</p>'+
          '",'+
          'RU:"'+
            '<p>������ ������� ������� ������ � ������� ����������� � ���� ������� �����. ������� � ������, ��� � ���������� ������ �� ����� � ����! '+
               '��� �����, �������� �������, ������ ����� ������� ���������, �����-�� ������� ������ ������... </p>'+
            '<p>������ ���� ������ �� ����� �����. � ��� �� ����, ��� � ������� ����������� ���� ������ ����� �������� ����.</p>'+
            '<p>������, �� ������ �� ��� ���, ���� �������� ������. �� ���� ��� � ������, �� � ������ ������ ����������� ��� ������� �������� �������. '+
               '� ������ ������� ��������� �� ���� ������� ���������� ����, ��� ���� ������ ������� ������, '+
               '������� � ���� � �����, �������� ����������� �� �������! � ��� �� ����� � ������ �� ������ � ������, ������ � ��������� ���� ��� �� ���� ���.</p>'+
            '<p>�� ���� �� �������� ��������, ��� ��� ����� ������ ����� ����... ���� ������ ���-�� ����� ��������� � ������� ����� ������������... '+
               '� ��� ����� �� ���� ����� ��� �����... ��� �������� ��������� ���� � ������ �������� ������������ � ����������� �������� � �������.</p>'+
        '"},'+
      '},'+

      'darkmaster:{name: "darkmaster", cost: 200, kind: "tower",'+
        'script:"'+
          'SetPlayerAsTarget();'+
          'ChangeParam(EXP, 50);'+
        '",'+
        'caption:{'+
          'ENG:"The Dark Master? Seriously?!..",'+
          'RU:"������ ������? ��������?!..."},'+
        'body:{'+
          'ENG:"'+
            '<p>What was it? I met some incredibly powerful magician, or whatever he is. Before I had time to look back, he literally destroyed me with several blows. I woke up already in the basement. I don''t know how long I lay unconscious.</p>'+
            '<p>If this is exactly the person mentioned in the note, he really should be feared and avoided. But how? I''m afraid a new meeting is inevitable ...</p>'+
          '",'+
          'RU:"'+
            '<p>��� ��� ����? � �������� ������-�� ���������� ������� ����, ��� ��� �� ���.  ���������� �� �����, ��� ��������� ��������� ���� ����������� �������. '+
               '������� � ��� � �������. �� ����, ������� �������� ��� ��������.</p>'+
            '<p>���� ��� ������ ���, � ��� ���������� � �������, ��� ������������� ����� ��������� � �������� ������. �� ���? �����, ����� ������� ���������...</p>'+
          '"},'+
      '},'+

      'tower:{name: "tower", cost: 200, kind: "tower", parent: "",'+
        'script:"'+
          'SetPlayerAsTarget();'+
          'ChangeParam(EXP, 50);'+
          'AllowThink(floors);'+
        '",'+
        'caption:{'+
          'ENG:"The Tower?",'+
          'RU:"�����?"},'+
        'body:{'+
          'ENG:"'+
            '<p>The floors of this Tower (?) Are similar to each other, but the higher, the larger they are. It feels like this strange tower is like a pyramid standing on top.</p>'+
            '<p>Who would think of building something like this? Perhaps this is a false impression.</p>'+
          '",'+
          'RU:"'+
            '<p>����� ���� �����(?) ������ ���� �� �����, �� ��� ����, ��� ��� ��������. ��������, ��� ��� �������� ����� ������ �� ������� �� ������� ��������.</p>'+
            '<p>���� � ������ ������ ������� ����� ��������? ���������, ��� ������ �����������.</p>'+
          '"},'+
      '},'+

          'floors:{name: "floors", cost: 200, kind: "tower",'+
            'script:"'+
              'SetPlayerAsTarget();'+
              'ChangeParam(EXP, 50);'+
              'AllowMode(Floors);'+
            '",'+
            'caption:{'+
              'ENG:"Floors, endless floors...",'+
              'RU:"�����, ����������� �����..."},'+
            'body:{'+
              'ENG:"'+
                '<p></p>'+
                '<p>But the most interesting thing is that each floor is simply littered with various debris. I noticed that if you don''t make too much noise, '+
                    'the monsters will not react to me and you can study all this stuff. What if you can find a better weapon or some clues?</p>'+
                '<p>I remember that the note mentioned some kind of diary and tools. Resolved! I need to search all the available floors and find at least something that will help me in my current situation.</p>'+
              '",'+
              'RU:"'+
                '<p></p>'+
                '<p>�� ����� ����������, ��� ������ ���� ������ ��� ������� ������� ��������� �������. � �������, ��� ���� ������ �� ������, ������� �� ����� �� ���� ����������� � '+
                    '����� ����� ������� ���� ���� ����. ����� ��������� ����� ������ ������� ��� �����-�� ���������?</p>'+
                '<p>� �����, ��� � ��� ������� ���������� �����-�� ������� � �����������. ������! ����� �������� ��� ��������� ����� � ����� ���� ���-��, ��� ������� ��� � �������� ����������</p>'+
              '"},'+
          '},'+

      'monsters:{name: "monsters", cost: 200, kind: "tower",'+
        'script:"'+
          'SetPlayerAsTarget();'+
          'ChangeParam(EXP, 50);'+
          'ChangeParam(ATK, 5);'+
          'AllowThink(potions);'+
        '",'+
        'caption:{'+
          'ENG:"Monsters?",'+
          'RU:"�������?"},'+
        'body:{'+
          'ENG:"'+
            '<p>This tower is packed to capacity with a variety of creatures. They are all very aggressive. The author of the note did not lie. You can''t hide from them.</p>'+
            '<p>But at the door to the next floor there is always a much stronger monster. Perhaps this is a sign that the Dark Master, or who is in charge here, does not want anyone to rise higher.</p>'+
            '<p>Perhaps I would not do this, but I see no other way out. In this stone bag, the only way is up!</p>'+
            '<p>But these constant battles have their benefits. I became more attentive and began to notice the weak points of these animals. If things continue like this, the monsters will no longer be a serious obstacle to me! Find only better weapons.</p>'+
          '",'+
          'RU:"'+
            '<p>��� ����� ��� ������� ������ �������������� ����������. ��� ��� ����� ����������. ����� ������� �� ����. �� ��� �� ����������.</p>'+
            '<p>�� � ����� �� ��������� ���� ������ ��������� ������� ����� ������� ��������. ��������, ��� ������� ����, ��� ������ ������, ��� ��� ��� �������, �� �����, ����� ���-���� ���������� ����.</p>'+
            '<p>�, ����� ����, � �� ���� �� ����� ������, �� �� ���� ������� ������. � ���� �������� ����� ������������ ���� - ������!</p>'+
            '<p>�� ��� ���������� �������� ����� ���� ������. � ���� ����� ������������ � ����� ��������� ������ ����� � ���� ������. ���� ���� ��� ������ � ������, ������� ������ �� ����� ��� ��������� ���������! ����� �� ������ ������ �������.</p>'+
          '"},'+
      '},'+

          'potions:{name: "potions", cost: 200, kind: "tower",'+
            'script:"'+
              'SetPlayerAsTarget();'+
              'ChangeParam(EXP, 50);'+
            '",'+
            'caption:{'+
              'ENG:"Potions?",'+
              'RU:"�����?"},'+
            'body:{'+
              'ENG:"'+
                '<p>Everything would be completely awful, but after killing especially strong monsters, various flasks with multi-colored liquid and various debris are found: branches, stones, skins, and so on.</p>'+
                '<p>And these potions (let''s call them that) I dared to try. What else do I have to lose?</p>'+
                '<p>The effect is amazing! Despite not the most pleasant smell and taste, I felt stronger and better!</p>'+
                '<p>But suddenly I thought that I could try to study their composition. Who knows, maybe you can cook them yourself?</p>'+
              '",'+
              'RU:"'+
                '<p>��� ���� �� ������ ������, �� ����� �������� ����� ������� �������� �������������� ��������� ������� � ������������ ��������� � ��������� �����: �����, �����, ����� � ������.</p>'+
                '<p>� ��� ����� (������� �� ���) � ��������� �����������. ��� ��� ��� ������?</p>'+
                '<p>������ - �������������! �� ������ �� ������ �� ����� �������� ����� � ����, � ����������� ���� ������� � �����!</p>'+
                '<p>�� �������� � �������, ��� ��� �� ����������� ������� �� ������. ��� �����, ����� ���� ��������� ����������� �� ��������������?</p>'+
              '"},'+
          '},'+



      'whoami:{name: "whoami", cost: 200, kind: "persone",'+
        'script:"'+
          'SetPlayerAsTarget();'+
          'ChangeParam(EXP, 100);'+
          'AllowThink(calmness);'+
          'AllowThink(old_skills);'+
        '",'+
        'caption:{'+
          'ENG:"Who am I?!",'+
          'RU:"��� �?!"},'+
        'body:{'+
          'ENG:"'+
            '<p>No specific memories. From this, panic rolls in waves and nausea rises.</p>'+
            '<p>No! You can''t rush and despair! Perhaps this is a temporary effect and you just need to calm down.</p>'+
            '<p>But muscle memory just surprises me! The dagger is in the palm of your hand and the hand knows exactly how to handle it. Not very confident and fast yet, '+
               'but if you practice a little, you might get better! And this can briefly distract from gloomy thoughts.</p>'+
          '",'+
          'RU:"'+
            '<p>������� ���������� ������������. �� ����� ������ ���������� ������� � ����������� �������.</p>'+
            '<p>���! ������ ���������� � �����������! ��������, ��� ��������� ������ � ����� ������ �����������.</p>'+
            '<p>�� �������� ������ ���� ������ ��������! ������ � ������ ��� ������ � ���� ����� ����� ��� �� �����������. ���� �� ����� �������� � ������, '+
               '�� ���� ������� ���������������, ��������, ����� ���������� �����! � ��� ������ ��������� ������� �� ������� ������.</p>'+
          '"},'+
      '},'+

          'calmness:{name: "calmness", cost: 300, kind: "tower",'+
            'script:"'+
              'SetPlayerAsTarget();'+
              'ChangeParam(EXP, 50);'+
              'ChangeParam(AutoAction, 5000);'+
            '",'+
            'caption:{'+
              'ENG:"This is some kind of nonsense! Need to calm down...",'+
              'RU:"��� �����-�� ����! ����� �����������..."},'+
            'body:{'+
              'ENG:"'+
                '<p>Yes! Now I see that this was the right decision.</p>'+
                '<p>Thoughts flow calmly. The heart no longer breaks from the chest. The panic subsided.</p>'+
                '<p>Now I understand that memories are not important. Not important yet. You need to make every effort to figure out what is happening and where I ended up. This can be the key that will allow you to restore the lost.</p>'+
                '<p>All I need now is confidence and discretion. I''m ready for action!</p>'+
              '",'+
              'RU:"'+
                '<p>��! ������ � ����, ��� ��� ���� ������ ��������.</p>'+
                '<p>����� ����� ��������. ������ ������ �� ������ �� �����. ������ ���������.</p>'+
                '<p>������ � �������, ��� �� ����� ������������. ���� �� �����. ����� ��������� ��� ����, ����� ����������� � ��� ��� ���������� � ��� � ��������. ��� � ����� ����� ��� ������, ������� �������� ������������ ���������.</p>'+
                '<p>���, ��� ��� ������ ����� - ����������� � ����������������. � ����� � ���������!</p>'+
              '"},'+
          '},'+

          'old_skills:{name: "old_skills", cost: 600, kind: "persone",'+
            'script:"'+
              'SetPlayerAsTarget();'+
              'ChangeParam(EXP, 100);'+
              'ChangeParam(ATK, 5);'+
              'ChangeParam(DEF, 10);'+
            '",'+
            'caption:{'+
              'ENG:"The old skills",'+
              'RU:"������ ������"},'+
            'body:{'+
              'ENG:"'+
                '<p>I spent a few hours training and made sure it was not in vain!</p>'+
                '<p>The hand acquired firmness, and the blow acquired confidence and precision. I like it!</p>'+
              '",'+
              'RU:"'+
                '<p>� �������� ��������� ����� �� ���������� � ��������, ��� �� ���!</p>'+
                '<p>���� ��������� ���������, � ���� - ����������� � ��������. ��� ��� ��������!</p>'+
              '"},'+
          '},'+

      'other_path:{name: "other_path", cost: 400, kind: "tower",'+
        'script:"'+
          'SetPlayerAsTarget();'+
          'ChangeParam(EXP, 150);'+
        '",'+
        'caption:{'+
          'ENG:"Deceive the Master!",'+
          'RU:"�������� �������!"},'+
        'body:{'+
          'ENG:"'+
            '<p>Its end! This awful man (?) Locked me in the basement like in a dungeon! The only way out is upstairs, but there another defeat awaits me. And who knows when it will turn into <bold><red>real</red></bold> death !?</p>'+
            '<p>We must not despair! Surely you can think of something. Deceive the guard, find a loophole, defeat him, in the end!</p>'+
            '<p>I think we need to clear the floor and examine every inch of the floor and walls. It is possible that there may be secret passages or something like that.</p>'+
            '<p>Get down to business!</p>'+
          '",'+
          'RU:"'+
            '<p>��� �������! ���� ������� �������(?) ����� ���� � ������� ��� � �������! ������������ ����� - ������, �� ��� ���� ������� ��������� ���������. � ��� �����, ����� ��� ����������� � <bold><red>���������</red></bold> ������!?</p>'+
            '<p>������ �����������! ���������, ���-�� ����� ���������. �������� ������, ����� �������, �������� ���, � �����-������!</p>'+
            '<p>�����, ���������� ���������� ���� � ������� ������ ��������� ���� � ����. �� ���������, ��� ��� ����� ���� ������ ���� ��� ���-�� � ���� ����.</p>'+
            '<p>�� ����!</p>'+
          '"},'+
      '},'+

      '"name":{'+
        'name: "name",'+           /// ���������� �������������
        'cost: 0,'+                /// ������� ����� ����������� ��� ��������� ������� redy
        'kind: "",'+                /// �� ���������� �������� � ������ � ��������, ��� ����� ������������
        'script:"'+                /// ������ ����������� �� ������ ���������� �����������
          '",'+
        'caption:{'+               /// ����� ��� ����������� �� ��������
          'ENG:"",'+
          'RU:""},'+
        'body:{'+                  /// ����� (�������� html) ��� ����������� � ��������
          'ENG:"'+
            '<p></p>'+
          '",'+
          'RU:"'+
            '<p></p>'+
          '"},'+
      '},'+
    '},'+



    /// ����� ��� ��������
    'names:{'+
        'count: 40,'+
        'first:['+
            '{RU:"��������",  ENG:"Stoned"},  {RU:"�������",    ENG:"Strong"},   {RU:"��������",    ENG:"Brave"},     {RU:"��������",    ENG:"Northern"},  {RU:"����������",  ENG:"Doomed"},'+
            '{RU:"�������",   ENG:"Local"},   {RU:"��������",   ENG:"Insidious"},{RU:"������������",ENG:"Great"},     {RU:"������������",ENG:"Deadly"},    {RU:"������",      ENG:"Accurate"},'+
            '{RU:"��������",  ENG:"Hungry"},  {RU:"�������",    ENG:"Heavy"},    {RU:"������",      ENG:"Sleepy"},    {RU:"������",      ENG:"Holy"},      {RU:"�����",       ENG:"Bold"},'+
            '{RU:"�������",   ENG:"Gas"},     {RU:"��������",   ENG:"Beautiful"},{RU:"�����������", ENG:"Similar"},   {RU:"�����������", ENG:"Ugly"},      {RU:"����������",  ENG:"Glassy"},'+
            '{RU:"������",    ENG:"Warm"},    {RU:"�����������",ENG:"Modern"},   {RU:"�����",       ENG:"Narrow"},    {RU:"����������",  ENG:"Unpleasant"},{RU:"�������",     ENG:"Dead"},'+
            '{RU:"��������",  ENG:"Finite"},  {RU:"��������",   ENG:"Main"},     {RU:"���������",   ENG:"Possible"},  {RU:"��������",    ENG:"Evening"},   {RU:"������������",ENG:"Physical"},'+
            '{RU:"����������",ENG:"Previous"},{RU:"��������",   ENG:"Cold"},     {RU:"�������",     ENG:"Convenient"},{RU:"�����������", ENG:"Efficient"}, {RU:"��������",    ENG:"Genuine"},'+
            '{RU:"�������",   ENG:"Good"},    {RU:"����������", ENG:"Monstrous"},{RU:"�������",     ENG:"Green"},     {RU:"�����",       ENG:"Any"},       {RU:"������",      ENG:"Prominent"}'+
        '],'+
        'middle:['+
            '{RU:"����",    ENG:"Freak"},  {RU:"�����",      ENG:"Major"},   {RU:"��������",   ENG:"Seeker"},  {RU:"������",     ENG:"Dweller"},{RU:"���������",    ENG:"Crusher"},'+
            '{RU:"������",  ENG:"Wall"},   {RU:"�����",      ENG:"Mattress"},{RU:"�������",    ENG:"Minister"},{RU:"������",     ENG:"Greedy"}, {RU:"�����",        ENG:"Army"},'+
            '{RU:"��������",ENG:"Drinker"},{RU:"���������",  ENG:"Result"},  {RU:"������",     ENG:"Peptide"}, {RU:"������",     ENG:"Soldier"},{RU:"����������",   ENG:"Cutter"},'+
            '{RU:"������",  ENG:"Air"},    {RU:"������",     ENG:"Kawaii"},  {RU:"����",       ENG:"Bird"},    {RU:"������",     ENG:"Winner"}, {RU:"�������������",ENG:"Follower"},'+
            '{RU:"�����",   ENG:"Tail"},   {RU:"�������",    ENG:"Gift"},    {RU:"�������",    ENG:"Bag"},     {RU:"�����������",ENG:"System"}, {RU:"����",         ENG:"Tank"},'+
            '{RU:"������",  ENG:"Crisis"}, {RU:"������",     ENG:"Mass"},    {RU:"�����������",ENG:"Dream"},   {RU:"�������",    ENG:"Future"}, {RU:"��������",     ENG:"Fate"},'+
            '{RU:"������",  ENG:"Suit"},   {RU:"�����������",ENG:"Doom"},    {RU:"�����",      ENG:"Word"},    {RU:"����������", ENG:"Power"},  {RU:"�����������",  ENG:"Relative"},'+
            '{RU:"�������", ENG:"Machine"},{RU:"����",       ENG:"Brain"},   {RU:"����",       ENG:"Horror"},  {RU:"���",        ENG:"Smoke"},  {RU:"������",       ENG:"Steel"}'+
        '],'+
        'last:['+
            '{RU:"�����������",ENG:"of Hospital"}, {RU:"�������������",ENG:"of Betrayal"},        {RU:"�����������",  ENG:"of Hell"},      {RU:"����������",   ENG:"of Bliss"},'+
            '{RU:"���� �����", ENG:"of Worlds"},   {RU:"�������������",ENG:"of Misunderstanding"},{RU:"����������",   ENG:"of Dungeons"},  {RU:"�������������",ENG:"of Infinity"},'+
            '{RU:"�����",      ENG:"of Forest"},   {RU:"���������",    ENG:"of Wealth"},          {RU:"�������",      ENG:"of Madness"},   {RU:"������",       ENG:"of Poverty"},'+
            '{RU:"����",       ENG:"of Mistery"},  {RU:"���������",    ENG:"of Holiday"},         {RU:"�������������",ENG:"of Hopeless"},  {RU:"������",       ENG:"of Despondency"},'+
            '{RU:"��������",   ENG:"of Heroism"},  {RU:"�����",        ENG:"of Luck"},            {RU:"���������",    ENG:"of Deceit"},    {RU:"�������",      ENG:"of Replay"},'+
            '{RU:"��������",   ENG:"of Agreement"},{RU:"������",       ENG:"of Weapon"},          {RU:"�������",      ENG:"of Crisis"},    {RU:"�����",        ENG:"of Spring"},'+
            '{RU:"������",     ENG:"of Heart"},    {RU:"����",         ENG:"of Body"},            {RU:"�������",      ENG:"of Girlfriend"},{RU:"�������",      ENG:"of Childhood"},'+
            '{RU:"��������",   ENG:"of Conscious"},{RU:"������������", ENG:"of Memory"},          {RU:"���������",    ENG:"of Support"},   {RU:"������",       ENG:"of Stars"},'+
            '{RU:"����",       ENG:"of Essence"},  {RU:"�����",        ENG:"of Scene"},           {RU:"��������",     ENG:"of Doubt"},     {RU:"�����",        ENG:"of Risk"},'+
            '{RU:"����������", ENG:"of Reality"},  {RU:"������",       ENG:"of Guard"},           {RU:"��������",     ENG:"of Murders"},   {RU:"����",         ENG:"of Path"}'+
        ']'+
    '},'+

    '}';

var
    DIR_DATA :string;

implementation

initialization
    DIR_DATA := ExtractFilePath( paramstr(0) ) + FOLDER_DATA;

end.

