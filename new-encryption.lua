-- doesnt use built in lua functions, creates custom ones;
-- // EQ library

local eqlib = {}
function eq(a, b) return a == b end 

-- // OS library

local os = {old=os}
local oldrandom = math.random
local oldtick = tick 
function os.wait(s)
    local sec = os.clock() + s 
    while(os.clock() < sec) do end
end 

function os.time()
    local Random1 = oldrandom(2, 99)
    local Random2 = oldrandom(2, 99)
    local Random3 = oldrandom(2, 99)
    if Random1 == Random2 and Random2 == Random3 then return false end

    local Time = os.old.time()
    for i = 1, Random1 do 
        oldrandom(2, 99)
        os.old.time()
    end 

    for i = 1, Random2 do 
        oldrandom(2, 99)
        os.old.time()
    end

    for i = 1, Random3 do 
        oldrandom(2, 99)
        os.old.time()
    end

    for i = 1, Random1 + Random2 + Random3 + 32 do 
        oldrandom(2, 99)
        os.old.time()
    end 

    os.wait(1.1)
    if Time == os.old.time() then return false end 

    return Time
end 

function os.tick()
    local Random1 = oldrandom(2, 99)
    local Random2 = oldrandom(2, 99)
    local Random3 = oldrandom(2, 99)
    if Random1 == Random2 and Random2 == Random3 then return false end

    local Tick = oldtick()
    for i = 1, Random1 do 
        oldrandom(2, 99)
        oldtick()
    end 

    for i = 1, Random2 do 
        oldrandom(2, 99)
        oldtick()
    end

    for i = 1, Random3 do 
        oldrandom(2, 99)
        oldtick()
    end

    for i = 1, Random1 + Random2 + Random3 + 32 do 
        oldrandom(2, 99)
        oldtick()
    end 

    os.wait(0.01)
    if Tick == oldtick() then return false end 

    return Tick
end

-- // String library

local Characters = {[0] = "Щ", [1]='',[2]='',[3]='',[4]='',[5]='',[6]='',[7]=' ',[8]='',[9]='	',[10]='ب',[11]='
',[12]='',[13]='ـح',[14]='',[15]='',[16]='',[17]='',[18]='',[19]='',[20]='',[21]='',[22]='',[23]='',[24]='',[25]='',[26]='',[27]='',[28]='',[29]='',[30]='',[31]='',[32]=' ',[33]='!',[34]='"',[35]='#',[36]='$',[37]='%',[38]='&',[39]="'",[40]='(',[41]=')',[42]='*',[43]='+',[44]=',',[45]='-',[46]='.',[47]='/',[48]='0',[49]='1',[50]='2',[51]='3',[52]='4',[53]='5',[54]='6',[55]='7',[56]='8',[57]='9',[58]=':',[59]=';',[60]='<',[61]='=',[62]='>',[63]='?',[64]='@',[65]='A',[66]='B',[67]='C',[68]='D',[69]='E',[70]='F',[71]='G',[72]='H',[73]='I',[74]='J',[75]='K',[76]='L',[77]='M',[78]='N',[79]='O',[80]='P',[81]='Q',[82]='R',[83]='S',[84]='T',[85]='U',[86]='V',[87]='W',[88]='X',[89]='Y',[90]='Z',[91]='[',[92]='\\',[93]=']',[94]='^',[95]='_',[96]='`',[97]='a',[98]='b',[99]='c',[100]='d',[101]='e',[102]='f',[103]='g',[104]='h',[105]='i',[106]='j',[107]='k',[108]='l',[109]='m',[110]='n',[111]='o',[112]='p',[113]='q',[114]='r',[115]='s',[116]='t',[117]='u',[118]='v',[119]='w',[120]='x',[121]='y',[122]='z',[123]='{',[124]='|',[125]='}',[126]='~',[127]='',[128]='€',[129]='',[130]='‚',[131]='ƒ',[132]='„',[133]='…',[134]='†',[135]='‡',[136]='ˆ',[137]='‰',[138]='Š',[139]='‹',[140]='Œ',[141]='',[142]='Ž',[143]='',[144]='',[145]='‘',[146]='’',[147]='“',[148]='”',[149]='•',[150]='–',[151]='—',[152]='˜',[153]='™',[154]='š',[155]='›',[156]='œ',[157]='',[158]='ž',[159]='Ÿ',[160]=' ',[161]='¡',[162]='¢',[163]='£',[164]='¤',[165]='¥',[166]='¦',[167]='§',[168]='¨',[169]='©',[170]='ª',[171]='«',[172]='¬',[173]='­',[174]='®',[175]='¯',[176]='°',[177]='±',[178]='²',[179]='³',[180]='´',[181]='µ',[182]='¶',[183]='·',[184]='¸',[185]='¹',[186]='º',[187]='»',[188]='¼',[189]='½',[190]='¾',[191]='¿',[192]='À',[193]='Á',[194]='Â',[195]='Ã',[196]='Ä',[197]='Å',[198]='Æ',[199]='Ç',[200]='È',[201]='É',[202]='Ê',[203]='Ë',[204]='Ì',[205]='Í',[206]='Î',[207]='Ï',[208]='Ð',[209]='Ñ',[210]='Ò',[211]='Ó',[212]='Ô',[213]='Õ',[214]='Ö',[215]='×',[216]='Ø',[217]='Ù',[218]='Ú',[219]='Û',[220]='Ü',[221]='Ý',[222]='Þ',[223]='ß',[224]='à',[225]='á',[226]='â',[227]='ã',[228]='ä',[229]='å',[230]='æ',[231]='ç',[232]='è',[233]='é',[234]='ê',[235]='ë',[236]='ì',[237]='í',[238]='î',[239]='ï',[240]='ð',[241]='ñ',[242]='ò',[243]='ó',[244]='ô',[245]='õ',[246]='ö',[247]='÷',[248]='ø',[249]='ù',[250]='ú',[251]='û',[252]='ü',[253]='ý',[254]='þ',[255]='ÿ'}
local Bytes = {["Щ"] = 0,['']=1,['']=2,['']=3,['']=4,['']=5,['']=6,[' ']=7,['']=8,['	']=9,['ب']=10,['
']=11,['']=12,['ـح']=13,['']=14,['']=15,['']=16,['']=17,['']=18,['']=19,['']=20,['']=21,['']=22,['']=23,['']=24,['']=25,['']=26,['']=27,['']=28,['']=29,['']=30,['']=31,[' ']=32,['!']=33,['"']=34,['#']=35,['$']=36,['%']=37,['&']=38,["'"]=39,['(']=40,[')']=41,['*']=42,['+']=43,[',']=44,['-']=45,['.']=46,['/']=47,['0']=48,['1']=49,['2']=50,['3']=51,['4']=52,['5']=53,['6']=54,['7']=55,['8']=56,['9']=57,[':']=58,[';']=59,['<']=60,['=']=61,['>']=62,['?']=63,['@']=64,['A']=65,['B']=66,['C']=67,['D']=68,['E']=69,['F']=70,['G']=71,['H']=72,['I']=73,['J']=74,['K']=75,['L']=76,['M']=77,['N']=78,['O']=79,['P']=80,['Q']=81,['R']=82,['S']=83,['T']=84,['U']=85,['V']=86,['W']=87,['X']=88,['Y']=89,['Z']=90,['[']=91,['\\']=92,[']']=93,['^']=94,['_']=95,['`']=96,['a']=97,['b']=98,['c']=99,['d']=100,['e']=101,['f']=102,['g']=103,['h']=104,['i']=105,['j']=106,['k']=107,['l']=108,['m']=109,['n']=110,['o']=111,['p']=112,['q']=113,['r']=114,['s']=115,['t']=116,['u']=117,['v']=118,['w']=119,['x']=120,['y']=121,['z']=122,['{']=123,['|']=124,['}']=125,['~']=126,['']=127,['€']=128,['']=129,['‚']=130,['ƒ']=131,['„']=132,['…']=133,['†']=134,['‡']=135,['ˆ']=136,['‰']=137,['Š']=138,['‹']=139,['Œ']=140,['']=141,['Ž']=142,['']=143,['']=144,['‘']=145,['’']=146,['“']=147,['”']=148,['•']=149,['–']=150,['—']=151,['˜']=152,['™']=153,['š']=154,['›']=155,['œ']=156,['']=157,['ž']=158,['Ÿ']=159,[' ']=160,['¡']=161,['¢']=162,['£']=163,['¤']=164,['¥']=165,['¦']=166,['§']=167,['¨']=168,['©']=169,['ª']=170,['«']=171,['¬']=172,['­']=173,['®']=174,['¯']=175,['°']=176,['±']=177,['²']=178,['³']=179,['´']=180,['µ']=181,['¶']=182,['·']=183,['¸']=184,['¹']=185,['º']=186,['»']=187,['¼']=188,['½']=189,['¾']=190,['¿']=191,['À']=192,['Á']=193,['Â']=194,['Ã']=195,['Ä']=196,['Å']=197,['Æ']=198,['Ç']=199,['È']=200,['É']=201,['Ê']=202,['Ë']=203,['Ì']=204,['Í']=205,['Î']=206,['Ï']=207,['Ð']=208,['Ñ']=209,['Ò']=210,['Ó']=211,['Ô']=212,['Õ']=213,['Ö']=214,['×']=215,['Ø']=216,['Ù']=217,['Ú']=218,['Û']=219,['Ü']=220,['Ý']=221,['Þ']=222,['ß']=223,['à']=224,['á']=225,['מ']=226,['ã']=227,['ä']=228,['צ']=229,['æ']=230,['ç']=231,['è']=232,['é']=233,['ê']=234,['ë']=235,['ì']=236,['í']=237,['î']=238,['ï']=239,['ð']=240,['ñ']=241,['ò']=242,['ó']=243,['ô']=244,['õ']=245,['ö']=246,['÷']=247,['ø']=248,['ù']=249,['ú']=250,['û']=251,['ü']=252,['ý']=253,['þ']=254,['ÿ']=255}
local ShuffledCharacters = Characters
local ShuffledBytes = Bytes
local string = {char = function(b) return Characters[b] end, byte = function(c) return Bytes[c] end, split = function(str, del) local s = str:split(del) local cs1 = "" local cs2 = ""local csc = 0 local csc1 = 1 for i = 1, #s do local v = s[i] if not v then return false end csc = csc + 1 cs1 = cs1..del..v end while true do local v = s[csc1] if not v then break end cs2 = cs2..del..v csc1 = csc1 + 1 end if not eq(csc, csc1 - 1) then return false end if not eq(cs1, cs2) then return false end return s end}
-- // Math library

local math = {floor = function(n) return n - n % 1 end, abs = function(n) return n < 0 and -n or n end, isneg = function(n) return n < 0 and 1 or 0 end}
function math.rand(Seed)
    local A1, A2 = 727595, 798405
    local D20, D40 = 1048576, 1099511627776
    local X1, X2 = 0, 1

    A2 = (Seed * A2) * oldrandom(2, 99) 
    local U = X2*A2
    local V = (X1*A2 + X2*A1) % D20
    V = (V*D20 + U) % D40

    X1 = math.floor(V/D20)
    X2 = V - X1*D20
    return V/D40
end 

function math.random(Number1, Number2)
    local Seed = os.time() + os.tick()

    local Random = math.random(Seed) % 1 
    return math.floor(Random * (Number2 - Number1 + 1)) + Number1
end 

-- // Table library

local table = {concat = function(t, d) local s = "" for i = 1, #t do if t[i] then s = s..t[i]..d end end return s end, insert = function(t, pos, v) local new = {} for i = 1, #t do if i == pos then new[#new+1] = v else new[#new+1] = t[i] end end return new end,remove = function(t, pos) local new = {} local value; for i = 1, #t do if (i == pos) then value = t[i] else new[#new+1] = t[i] end end return new, value end,find = function(t, v) for i = 1, #t do if t[i] == v then return i end end return false end}
function table.shuffle(t, k) -- // Shuffle using K
    for i = 1, #t do
        local j = math.floor(math.random() * #t)
        t[i], t[j] = t[j], t[i]
    end
end 

-- // Conversion library (text to binary)

local lib = {}
function lib.numToBits(n, bits) local t = {}local neg = math.isneg(n) n = math.abs(n) bits = bits or 16 for i=bits-1,0,-1 do t[#t+1] = math.floor(n / 2^i) n = n % 2^i end return t, neg end

function lib.textToBin(s)local b = {}for i = 1, #s do local v = s[i] local byte = string.byte(v)local bits = lib.numToBits(byte)local r = {}for i = 1, #bits do local v = bits[#bits + 1 - i] if not v then return false end r[#r + 1] = v end b[#b + 1] = r end return b end 
function lib.binToNumber(t) local x, dec = #t - 1, 0 for i = 1, x + 1 do local b = t[i] if b and b == 1 then dec = dec + 2 ^ x end x = x - 1 end return dec end 

-- // Bit library

local function band(b,c,d,...)local e=(b%0x2>=0x1 and c%0x2>=0x1 and 0x1 or 0)+(b%0x4>=0x2 and c%0x4>=0x2 and 0x2 or 0)+(b%0x8>=0x4 and c%0x8>=0x4 and 0x4 or 0)+(b%0x10>=0x8 and c%0x10>=0x8 and 0x8 or 0)+(b%0x20>=0x10 and c%0x20>=0x10 and 0x10 or 0)+(b%0x40>=0x20 and c%0x40>=0x20 and 0x20 or 0)+(b%0x80>=0x40 and c%0x80>=0x40 and 0x40 or 0)+(b%0x100>=0x80 and c%0x100>=0x80 and 0x80 or 0)+(b%0x200>=0x100 and c%0x200>=0x100 and 0x100 or 0)+(b%0x400>=0x200 and c%0x400>=0x200 and 0x200 or 0)+(b%0x800>=0x400 and c%0x800>=0x400 and 0x400 or 0)+(b%0x1000>=0x800 and c%0x1000>=0x800 and 0x800 or 0)+(b%0x2000>=0x1000 and c%0x2000>=0x1000 and 0x1000 or 0)+(b%0x4000>=0x2000 and c%0x4000>=0x2000 and 0x2000 or 0)+(b%0x8000>=0x4000 and c%0x8000>=0x4000 and 0x4000 or 0)+(b%0x10000>=0x8000 and c%0x10000>=0x8000 and 0x8000 or 0)+(b%0x20000>=0x10000 and c%0x20000>=0x10000 and 0x10000 or 0)+(b%0x40000>=0x20000 and c%0x40000>=0x20000 and 0x20000 or 0)+(b%0x80000>=0x40000 and c%0x80000>=0x40000 and 0x40000 or 0)+(b%0x100000>=0x80000 and c%0x100000>=0x80000 and 0x80000 or 0)+(b%0x200000>=0x100000 and c%0x200000>=0x100000 and 0x100000 or 0)+(b%0x400000>=0x200000 and c%0x400000>=0x200000 and 0x200000 or 0)+(b%0x800000>=0x400000 and c%0x800000>=0x400000 and 0x400000 or 0)+(b%0x1000000>=0x800000 and c%0x1000000>=0x800000 and 0x800000 or 0)+(b%0x2000000>=0x1000000 and c%0x2000000>=0x1000000 and 0x1000000 or 0)+(b%0x4000000>=0x2000000 and c%0x4000000>=0x2000000 and 0x2000000 or 0)+(b%0x8000000>=0x4000000 and c%0x8000000>=0x4000000 and 0x4000000 or 0)+(b%0x10000000>=0x8000000 and c%0x10000000>=0x8000000 and 0x8000000 or 0)+(b%0x20000000>=0x10000000 and c%0x20000000>=0x10000000 and 0x10000000 or 0)+(b%0x40000000>=0x20000000 and c%0x40000000>=0x20000000 and 0x20000000 or 0)+(b%0x80000000>=0x40000000 and c%0x80000000>=0x40000000 and 0x40000000 or 0)+(b>=0x80000000 and c>=0x80000000 and 0x80000000 or 0)return d and a(e,d,...)or e end
local function bor(b,c,d,...)local e=((b%0x2>=0x1 or c%0x2>=0x1)and 0x1 or 0)+((b%0x4>=0x2 or c%0x4>=0x2)and 0x2 or 0)+((b%0x8>=0x4 or c%0x8>=0x4)and 0x4 or 0)+((b%0x10>=0x8 or c%0x10>=0x8)and 0x8 or 0)+((b%0x20>=0x10 or c%0x20>=0x10)and 0x10 or 0)+((b%0x40>=0x20 or c%0x40>=0x20)and 0x20 or 0)+((b%0x80>=0x40 or c%0x80>=0x40)and 0x40 or 0)+((b%0x100>=0x80 or c%0x100>=0x80)and 0x80 or 0)+((b%0x200>=0x100 or c%0x200>=0x100)and 0x100 or 0)+((b%0x400>=0x200 or c%0x400>=0x200)and 0x200 or 0)+((b%0x800>=0x400 or c%0x800>=0x400)and 0x400 or 0)+((b%0x1000>=0x800 or c%0x1000>=0x800)and 0x800 or 0)+((b%0x2000>=0x1000 or c%0x2000>=0x1000)and 0x1000 or 0)+((b%0x4000>=0x2000 or c%0x4000>=0x2000)and 0x2000 or 0)+((b%0x8000>=0x4000 or c%0x8000>=0x4000)and 0x4000 or 0)+((b%0x10000>=0x8000 or c%0x10000>=0x8000)and 0x8000 or 0)+((b%0x20000>=0x10000 or c%0x20000>=0x10000)and 0x10000 or 0)+((b%0x40000>=0x20000 or c%0x40000>=0x20000)and 0x20000 or 0)+((b%0x80000>=0x40000 or c%0x80000>=0x40000)and 0x40000 or 0)+((b%0x100000>=0x80000 or c%0x100000>=0x80000)and 0x80000 or 0)+((b%0x200000>=0x100000 or c%0x200000>=0x100000)and 0x100000 or 0)+((b%0x400000>=0x200000 or c%0x400000>=0x200000)and 0x200000 or 0)+((b%0x800000>=0x400000 or c%0x800000>=0x400000)and 0x400000 or 0)+((b%0x1000000>=0x800000 or c%0x1000000>=0x800000)and 0x800000 or 0)+((b%0x2000000>=0x1000000 or c%0x2000000>=0x1000000)and 0x1000000 or 0)+((b%0x4000000>=0x2000000 or c%0x4000000>=0x2000000)and 0x2000000 or 0)+((b%0x8000000>=0x4000000 or c%0x8000000>=0x4000000)and 0x4000000 or 0)+((b%0x10000000>=0x8000000 or c%0x10000000>=0x8000000)and 0x8000000 or 0)+((b%0x20000000>=0x10000000 or c%0x20000000>=0x10000000)and 0x10000000 or 0)+((b%0x40000000>=0x20000000 or c%0x40000000>=0x20000000)and 0x20000000 or 0)+((b%0x80000000>=0x40000000 or c%0x80000000>=0x40000000)and 0x40000000 or 0)+((b>=0x80000000 or c>=0x80000000)and 0x80000000 or 0)return d and a(e,d,...)or e end
local function bxor(b,c,d,...)local e=(b%0x2>=0x1~=(c%0x2>=0x1)and 0x1 or 0)+(b%0x4>=0x2~=(c%0x4>=0x2)and 0x2 or 0)+(b%0x8>=0x4~=(c%0x8>=0x4)and 0x4 or 0)+(b%0x10>=0x8~=(c%0x10>=0x8)and 0x8 or 0)+(b%0x20>=0x10~=(c%0x20>=0x10)and 0x10 or 0)+(b%0x40>=0x20~=(c%0x40>=0x20)and 0x20 or 0)+(b%0x80>=0x40~=(c%0x80>=0x40)and 0x40 or 0)+(b%0x100>=0x80~=(c%0x100>=0x80)and 0x80 or 0)+(b%0x200>=0x100~=(c%0x200>=0x100)and 0x100 or 0)+(b%0x400>=0x200~=(c%0x400>=0x200)and 0x200 or 0)+(b%0x800>=0x400~=(c%0x800>=0x400)and 0x400 or 0)+(b%0x1000>=0x800~=(c%0x1000>=0x800)and 0x800 or 0)+(b%0x2000>=0x1000~=(c%0x2000>=0x1000)and 0x1000 or 0)+(b%0x4000>=0x2000~=(c%0x4000>=0x2000)and 0x2000 or 0)+(b%0x8000>=0x4000~=(c%0x8000>=0x4000)and 0x4000 or 0)+(b%0x10000>=0x8000~=(c%0x10000>=0x8000)and 0x8000 or 0)+(b%0x20000>=0x10000~=(c%0x20000>=0x10000)and 0x10000 or 0)+(b%0x40000>=0x20000~=(c%0x40000>=0x20000)and 0x20000 or 0)+(b%0x80000>=0x40000~=(c%0x80000>=0x40000)and 0x40000 or 0)+(b%0x100000>=0x80000~=(c%0x100000>=0x80000)and 0x80000 or 0)+(b%0x200000>=0x100000~=(c%0x200000>=0x100000)and 0x100000 or 0)+(b%0x400000>=0x200000~=(c%0x400000>=0x200000)and 0x200000 or 0)+(b%0x800000>=0x400000~=(c%0x800000>=0x400000)and 0x400000 or 0)+(b%0x1000000>=0x800000~=(c%0x1000000>=0x800000)and 0x800000 or 0)+(b%0x2000000>=0x1000000~=(c%0x2000000>=0x1000000)and 0x1000000 or 0)+(b%0x4000000>=0x2000000~=(c%0x4000000>=0x2000000)and 0x2000000 or 0)+(b%0x8000000>=0x4000000~=(c%0x8000000>=0x4000000)and 0x4000000 or 0)+(b%0x10000000>=0x8000000~=(c%0x10000000>=0x8000000)and 0x8000000 or 0)+(b%0x20000000>=0x10000000~=(c%0x20000000>=0x10000000)and 0x10000000 or 0)+(b%0x40000000>=0x20000000~=(c%0x40000000>=0x20000000)and 0x20000000 or 0)+(b%0x80000000>=0x40000000~=(c%0x80000000>=0x40000000)and 0x40000000 or 0)+(b>=0x80000000~=(c>=0x80000000)and 0x80000000 or 0)return d and a(e,d,...)or e end
local function bxor8(b,c,d,...)local e=(b%2==1~=(c%2==1)and 1 or 0)+(b%4>=2~=(c%4>=2)and 2 or 0)+(b%8>=4~=(c%8>=4)and 4 or 0)+(b%16>=8~=(c%16>=8)and 8 or 0)+(b%32>=16~=(c%32>=16)and 16 or 0)+(b%64>=32~=(c%64>=32)and 32 or 0)+(b%128>=64~=(c%128>=64)and 64 or 0)+(b>=128~=(c>=128)and 128 or 0)return d and a(e,d,...)or e end
 
local bit32 = {band=band,bor=bor,bxor=bxor}
 
function bit32.bnot(a)if a==0 then return 1 else return 0 end end
function bit32.lshift(a,b)return a*2^b%2^32 end
function bit32.rshift(a,b)local c=a/2^b;return c-c%1 end
function bit32.arshift(a,b)local d=2^b;local c=a/d;return c-c%1+(a>=2^31 and(d-1)*2^(32-b)or 0)end
function bit32.lrot(a,b)local c=a/2^(32-b)local e=c%1;return c-e+e*2^32 end
function bit32.rrot(a,b)local c=a/2^b;local e=c%1;return c-e+e*2^32 end
function bit32.ternary(f,g,h)return bxor(h,band(f,bxor(g,h)))end
function bit32.majority(f,g,h)return bor(band(f,bor(g,h)),band(g,h))end
function bit32.invert(i)local j={}for k=1,#i do j[k]=bit32.bnot(i[k])end;return j end

bit32.bitlengths={}
for k=0,32 do bit32.bitlengths[k]=k^2 end

function bit32.getLowestBit(a)
    for i = 1,#bit32.bitlengths do
        if a < bit32.bitlengths[i] then
            return bit32.bitlengths[i]
        end
    end
end

function bit32.TwoBitAdd(B1, B2, Carry)
    local A1 = bit32.band(B1, B2)
    local A2 = bit32.bxor(B1, B2) 
    local A3 = bit32.bxor(A2, Carry)
    local A4 = bit32.band(A2, Carry)
    local A5 = bit32.bor(A4, A1)

    return A3, A5
end 

function bit32.BitAdd(Bits1, Bits2, CarryIn)
    local Carry = CarryIn
    local Data = {}
    for i = #Bits1, 1, -1 do
        local Out, Carry1 = bit32.TwoBitAdd(Bits1[i], Bits2[i], Carry)
        Carry = Carry1 
        Data[i] = Out
    end 

    return Data, Carry
end 

function bit32.TwosCompliment(t, Number)
    if Number == 1 then
        return bit32.BitAdd(bit32.invert(t), lib.numToBits(1), 0)
    end

    return t
end

function bit32.Add(Number1, Number2)
    local Bits1, Negative1 = lib.numToBits(Number1)
    local Bits2, Negative2 = lib.numToBits(Number2)
    Number1 = bit32.TwosCompliment(Bits1, Negative1)
    Number2 = bit32.TwosCompliment(Bits2, Negative2)

    local Total = bit32.BitAdd(Number1, Number2, 0)
    Total, Negative = bit32.TwosCompliment(Total, Total[1])

    local Number = lib.binToNumber(Total)
    if Negative then return -Number end 
    
    return Number
end 

function bit32.Subtract(Number1, Number2)
    local Bits1, Negative1 = lib.numToBits(Number1)
    local Bits2 = lib.numToBits(Number2)
    Number1 = bit32.TwosCompliment(Bits1, Negative1)
    Number2 = bit32.TwosCompliment(Bits2, 1)

    local Total = bit32.BitAdd(Number1, Number2, 0)
    Total, Negative = bit32.TwosCompliment(Total, Total[1])
    
    local Number = lib.binToNumber(Total)
    if Negative then return -Number end 
    
    return Number
end 

function bit32.Multiply(Number1, Number2)
    local Negative1 = math.isneg(Number1)
    local Negative2 = math.isneg(Number2)

    Number1 = math.abs(Number1)
    Number2 = math.abs(Number2)

    if Number1 == 1 then return Number2 end
    if Number2 == 1 then return Number1 end

    local Result = 0
    while Number2 > 0 do 
        if bit32.band(Number2, 1) == 1 then
            Result = bit32.Add(Result, Number1)
        end

        Number1 = bit32.lshift(Number1, 1)
        Number2 = bit32.rshift(Number2, 1)
    end 

    if bit32.bxor(Negative1, Negative2) == 1 then
        return -Result
    end

    return Result
end 

function bit32.Power(Number, Power)
    local Result = 1 
    while Power > 0 do 
        local Last = bit32.band(Power, 1)
        if Last == 1 then 
            Result = bit32.Multiply(Result, Number)
        end 

        Number = Number * Number
        Power = bit32.rshift(Power, 1)
    end 

    return Result
end

function bit32.Divide(Number1, Number2)
    return bit32.Power(bit32.Multiply(Number1, Number2), -1)
end 

-- // Encryption library

local encryption = {inv256 = {[1]=171,[2]=205,[3]=183,[4]=57,[5]=163,[6]=197,[7]=239,[8]=241,[9]=27,[10]=61,[11]=167,[12]=41,[13]=19,[14]=53,[15]=223,[16]=225,[17]=139,[18]=173,[19]=151,[20]=25,[21]=131,[22]=165,[23]=207,[24]=209,[25]=251,[26]=29,[27]=135,[28]=9,[29]=243,[30]=21,[31]=191,[32]=193,[33]=107,[34]=141,[35]=119,[36]=249,[37]=99,[38]=133,[39]=175,[40]=177,[41]=219,[42]=253,[43]=103,[44]=233,[45]=211,[46]=245,[47]=159,[48]=161,[49]=75,[50]=109,[51]=87,[52]=217,[53]=67,[54]=101,[55]=143,[56]=145,[57]=187,[58]=221,[59]=71,[60]=201,[61]=179,[62]=213,[63]=127,[64]=129,[65]=43,[66]=77,[67]=55,[68]=185,[69]=35,[70]=69,[71]=111,[72]=113,[73]=155,[74]=189,[75]=39,[76]=169,[77]=147,[78]=181,[79]=95,[80]=97,[81]=11,[82]=45,[83]=23,[84]=153,[85]=3,[86]=37,[87]=79,[88]=81,[89]=123,[90]=157,[91]=7,[92]=137,[93]=115,[94]=149,[95]=63,[96]=65,[97]=235,[98]=13,[99]=247,[100]=121,[101]=227,[102]=5,[103]=47,[104]=49,[105]=91,[106]=125,[107]=231,[108]=105,[109]=83,[110]=117,[111]=31,[112]=33,[113]=203,[114]=237,[115]=215,[116]=89,[117]=195,[118]=229,[119]=15,[120]=17,[121]=59,[122]=93,[123]=199,[124]=73,[125]=51,[126]=85,[127]=255,[0]=1}}
function encryption.strToBits(String)
    local Split = string.split(String, "")
    local Bits = {}
    for i = 1, #Split do 
        local v = Split[i]; if not v then return false end 

        local Byte = string.byte(v)
        Bits[#Bits + 1] = lib.numToBits(Byte, 8)
    end 

    return Bits 
end 

function encryption.bitsToEncNumbers(Bits)
    local Numbers = {}

    local Method = Bits[#Bits] == 0 and 7 or 5 
    local Method2 = Bits[math.floor(#Bits/2)] == 1 and 3 or 2
    for i = 1, #Bits do 
        local v = Bits[i]; if not v then return false end 
        for ignorethisshit = 1, #v do -- i1
            local ignoremetoo = Bits[i] if not ignoremetoo then return false end  -- v1
            for i1 = 1, #ignoremetoo do 
                local v1 = ignoremetoo[i1] if not v1 then return false end
                if v1 == 0 then v1 = Method else v1 = 2 end 
                
                if not Numbers[i] then Numbers[i] = {} end 
                if i1 ~= 1 then 
                    Numbers[i][i1] = math.floor((v1*i) * (i*i1) + Numbers[i][i1 - 1])
                else
                    Numbers[i][i1] = (v1*Method2) + 2^6 + i
                end 
            end 
        end 
    end 
    
    return Numbers
end 

function encryption.encodeNumbers(Numbers, K, F)
    local EncNumbers = {}

    for i = 1, #Numbers do 
        local v = Numbers[i]; if not v then return false end 
        for i1 = 1, #v do 
            local m = v[i1]; if not m then return false end 
            local L = K % 2^38
            local H = (K - L) / 2^38
            local M = H % 128
            
            local c = (m * encryption.inv256[M] - (H - M) / 128) % 256 
            K = L * F + H + c + m 
            if not EncNumbers[i] then EncNumbers[i] = {} end 
            EncNumbers[i][i1] = c 
        end 
    end 

    return EncNumbers
end 

function encryption.encryptString(String, Keys)
    local Key53, Key14 = Keys[1], Keys[2]

    local K, F = Key53, bit32.Add(16384, Key14)
    local Bits = encryption.strToBits(String)
    local EncNumbers = encryption.bitsToEncNumbers(Bits)
    local EncodedNumbers = encryption.encodeNumbers(EncNumbers, K, F)
    
    local Result = ""
    for i = 1, #EncodedNumbers do 
        local v = EncodedNumbers[i]; if not v then return false end 
        for i1 = 1, #v do 
            local v1 = v[i1] if not v1 then return false end 
            Result = Result..string.char(v1)
        end 
    end 
    
    return Result
end

warn(encryption.encryptString("FUK", {8186484168865098, 9867}))
