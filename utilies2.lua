-- i dont know if i made this
local WhitelistUtilities = {}
function WhitelistUtilities:EQ(a, b)
    return a == b
end

local Encryption = {}
function Encryption:Split(String, Delimiter)
    local Split = String:split(Delimiter)
    
    local CombinedSplit = ""
    local CombinedSplit2 = ""
    
    local SCount = 0
    for i = 1, #Split do 
        local v = Split[i]
        if not v then return false end 
        SCount = SCount + 1 
        
        CombinedSplit = CombinedSplit..Delimiter..v
    end 
    
    local Count = 0
    while true do 
        Count = Count + 1 
        
        local v = Split[Count]
        if not v then break end 
        CombinedSplit2 = CombinedSplit2..Delimiter..v
    end 
    
    if Count - 1 ~= SCount or Count - 1 > SCount or Count - 1 < SCount then 
        return false 
    end 
    
    if CombinedSplit ~= CombinedSplit2 or CombinedSplit > CombinedSplit2 or CombinedSplit < CombinedSplit2 or CombinedSplit2 > CombinedSplit or CombinedSplit2 < CombinedSplit then 
        return false 
    end 

    return Split
end 

function Encryption:Floor(Number)
    return Number - Number % 1
end 

function Encryption:toBits(Number)
    local t = {}
    while Number > 0 do 
        local Temp = Number % 2
        t[#t + 1] = Temp
        Number = (Number - Temp) / 2 
    end 
    
    return t 
end

function Encryption:BinaryToDecimal(Table)
    local Ex, Dec = #Table - 1, 0
    for i = 1, (Ex + 1) do 
        local Bit = Table[i]
        if Bit == 1 then 
            Dec = Dec + 2 ^ Ex 
        end

        Ex = Ex - 1
    end 

    return Dec
end 
local Bytes2 = {[97] = 'a',[96] = '`',[99] = 'c',[98] = 'b',[101] = 'e',[100] = 'd',[103] = 'g',[102] = 'f',[105] = 'i',[104] = 'h',[107] = 'k',[106] = 'j',[109] = 'm',[108] = 'l',[111] = 'o',[110] = 'n',[113] = 'q',[112] = 'p',[115] = 's',[114] = 'r',[117] = 'u',[116] = 't',[119] = 'w',[118] = 'v',[121] = 'y',[120] = 'x',[123] = '{',[122] = 'z',[125] = '}',[124] = '|',[126] = '~',[33] = '!',[32] = ' ',[35] = '#',[34] = '"',[37] = '%',[36] = '$',[39] = "'",[38] = '&',[41] = ')',[40] = '(',[43] = '+',[42] = '*',[45] = '-',[44] = ',',[47] = '/',[46] = '.',[49] = '1',[48] = '0',[51] = '3',[50] = '2',[53] = '5',[52] = '4',[55] = '7',[54] = '6',[57] = '9',[56] = '8',[59] = ';',[58] = ':',[61] = '=',[60] = '<',[63] = '?',[62] = '>',[65] = 'A',[64] = '@',[67] = 'C',[66] = 'B',[69] = 'E',[68] = 'D',[71] = 'G',[70] = 'F',[73] = 'I',[72] = 'H',[75] = 'K',[74] = 'J',[77] = 'M',[76] = 'L',[79] = 'O',[78] = 'N',[81] = 'Q',[80] = 'P',[83] = 'S',[82] = 'R',[85] = 'U',[84] = 'T',[87] = 'W',[86] = 'V',[89] = 'Y',[88] = 'X',[91] = '[',[90] = 'Z',[93] = ']',[95] = '_',[94] = '^'}
local Bytes = {[' '] = 32,['!'] = 33,['"'] = 34,['#'] = 35,['$'] = 36,['%'] = 37,['&'] = 38,["'"] = 39,['('] = 40,[')'] = 41,['*'] = 42,['+'] = 43,[','] = 44,['-'] = 45,['.'] = 46,['/'] = 47,['0'] = 48,['1'] = 49,['2'] = 50,['3'] = 51,['4'] = 52,['5'] = 53,['6'] = 54,['7'] = 55,['8'] = 56,['9'] = 57,[':'] = 58,[';'] = 59,['<'] = 60,['='] = 61,['>'] = 62,['?'] = 63,['@'] = 64,['A'] = 65,['B'] = 66,['C'] = 67,['D'] = 68,['E'] = 69,['F'] = 70,['G'] = 71,['H'] = 72,['I'] = 73,['J'] = 74,['K'] = 75,['L'] = 76,['M'] = 77,['N'] = 78,['O'] = 79,['P'] = 80,['Q'] = 81,['R'] = 82,['S'] = 83,['T'] = 84,['U'] = 85,['V'] = 86,['W'] = 87,['X'] = 88,['Y'] = 89,['Z'] = 90,['['] = 91,[']'] = 93,['^'] = 94,['_'] = 95,['`'] = 96,['a'] = 97,['b'] = 98,['c'] = 99,['d'] = 100,['e'] = 101,['f'] = 102,['g'] = 103,['h'] = 104,['i'] = 105,['j'] = 106,['k'] = 107,['l'] = 108,['m'] = 109,['n'] = 110,['o'] = 111,['p'] = 112,['q'] = 113,['r'] = 114,['s'] = 115,['t'] = 116,['u'] = 117,['v'] = 118,['w'] = 119,['x'] = 120,['y'] = 121,['z'] = 122,['{'] = 123,['|'] = 124,['}'] = 125,['~'] = 126}

function Encryption:byte(Character)
    return Bytes[Character] or false 
end 

function Encryption:char(Number)
    return Bytes2[Number] or false 
end 

function Encryption:concat(Table)
    local Result = ""
    local Result2 = ""
    -- // For loop
    
    local ForCount = 0
    for i = 1, #Table do 
        ForCount = ForCount + 1 

        local v = Table[i]
        if not v then return false end 
        if v == 0 then Result = Result.."0" elseif v == 1 then Result = Result.."1" else Result = Result..v end 
    end 

    -- // While loop

    local WhileCount = 1
    while true do 
        if not Table[WhileCount] then break end 

        local v = Table[WhileCount]
        if v == 0 then Result2 = Result2.."0" elseif v == 1 then Result2 = Result2.."1" else Result2 = Result2..v end 
    end 

    if not WhitelistUtilities:EQ(Result, Result2) then return false end
    if not WhitelistUtilities:EQ(#Result, #Result2) then return false end
    if not WhitelistUtilities:EQ(ForCount, WhileCount) then return false end
    
    return Result
end 

function Encryption:textToBinary(Split)
    local Binary = {}
    local Binary2 = {} -- Later 
    for i = 1, #Split do 
        local v = Split[i]
        
        local Byte = self:byte(v)
        local Bits = self:toBits(Byte)
        
        local Result = {}

        for i = 1, 8 - #Bits do 
            Result[i] = 0
        end 
        
        for i = 1, #Bits do 
            local v = Bits[#Bits + 1 - i]
            if not v then return false end 
            Result[#Result + 1] = v
        end 
        
        Binary[#Binary + 1] = Result
    end 
    
    return Binary
end 

function Encryption:binaryToText(Binary) -- // Binary will always be a table 
    local Output = {}
    local Output2 = {}

    local BinaryCount = 1
    local BinaryCount2 = 1
    while true do 
        local v = Binary[BinaryCount]
        if not v then break end 

        BinaryCount = BinaryCount + 1
    end 

    for i = 1, #Binary do 
        local v = Binary[i]
        if not v then return false end 
        
        local BinToDec = self:BinaryToDecimal(v)
        local Character = self:char(BinToDec)
        Output[i] = Character

        BinaryCount2 = BinaryCount2 + 1
    end 

    if not WhitelistUtilities:EQ(BinaryCount, BinaryCount2) then return false end 

    -- // Check if Output is equal to Output2

    return Output, Output2
end 

function Encryption:GetRandomMethod()
    local methodValues, method = {}, nil
    
    if math.random(1,2) == 1 then
        method = 1
        for i = 1,5 do
            local char
            while true do
                char = math.random(1, 200)
                repeat 
                    char = math.random(1, 200)
                until char > 32 or char < 126
                
                if char % 2 == 0 then
                    char = self:char(char)
                    break
                end
            end
            if i == 1 then
                methodValues[3] = char
            elseif i == 2 then
                methodValues[8] = char
            elseif i == 3 then
                methodValues[12] = char
            elseif i == 4 then
                methodValues[6] = char
            elseif i == 5 then
                methodValues[18] = char
            end
        end
    else
        method = 2
        for i = 1,5 do
            local char
            while true do
                char = math.random(1, 200)
                repeat 
                    char = math.random(1, 200)
                until char > 32 or char < 126
                if char % 2 ~= 0 then
                    char = self:char(char)
                    break
                end
            end
            if i == 1 then
                methodValues[3] = char
            elseif i == 2 then
                methodValues[8] = char
            elseif i == 3 then
                methodValues[12] = char
            elseif i == 4 then
                methodValues[6] = char
            elseif i == 5 then
                methodValues[18] = char
            end
        end
    end

    return methodValues, method
end

function Encryption:BitToNumber(Binary)
    local Numbers1 = {}
    local Numbers2 = {}
    local MethodUsed = WhitelistUtilities:EQ(Binary[#Binary], 0) and 9 or 4
    for i = 1, #Binary do 
        local v = Binary[i]

        if not v then return false end
        if v == 0 then v = MethodUsed else v = 2 end 
        
        if i ~= 1 then 
            Numbers1[i] = v^i * (i + Numbers1[i - 1])
        elseif i == 1 then
            Numbers1[i] = ((v^2)^i) + (2^8)
        end 
    end  

    return Numbers1, MethodUsed
end

function Encryption:NumberToBit(Numbers, MethodUsed)
    local bit1
    local v = MethodUsed

    bit1 = 

    print(bit1)
end

function Encryption:TextToNumber(Text)
    local Result = {}
    local Result2 = {}

    for i = 1,#Text do 
        if not i then return false end
        local bits = Text[i]
        
        local numbers = self:BitToNumber(bits)

        Result[i] = numbers
    end

    return Result
end

function Encryption:DecimalToHex(Number)
    if Number == 0 then return "0" end

    local Neg = false 
    if Number < 0 then Neg = true Number = Number * -1 end 

    local HexTable = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"}
    local Result = ""
    while Number > 0 do 
        local n = Number % 16
        Result = HexTable[n + 1]..Result
        Number = Number / 16 
    end 

    if Neg then Result = "-"..Result end

    return Result
end 

function Encryption:NumbersToEncoded(Numbers, Key53, Key14)
    if not self.inv256 then 
        self.inv256 = {}
        for i = 0, 127 do 
            local inv = -1
            repeat inv = inv + 2 
            until inv * (2 * i + 1) % 256 == 1 
            self.inv256[i] = inv
        end 
    end 

    local K, F = Key53, 16384 + Key14 
    local Result = {}
    for i = 1, #Numbers do 
        local m = Numbers[i]
        if not m then return false end
        local L = K % 2^38
        local H = (K - L) / 2^38
        local M = H % 128 

        if i == 7 or i == 8 then 
            repeat 
                m = math.floor(m / 2)
            until (m * self.inv256[M] - (H - M) / 128) % 256 ~= 0 
        end 
        
        local c = (m * self.inv256[M] - (H - M) / 128) % 256 
        K = L * F + H + c + m 
        Result[i] = c
    end 

    local Output = ""
    for i, v in pairs(Result) do 
        for i1, v1 in pairs(Bytes) do 
            if v == v1 or math.floor(v/2) == v1 then 
                Output = Output..i1
                break
            end 
        end
    end 

    return Output
end 

function Encryption:EncodedToNumbers(Numbers, Key53, Key14)
    
end

local start = tick()
local OrginalText = 'abcdefghijklmnopqrstuvwxyz'
--local Binary = Encryption:textToBinary(Encryption:Split(OrginalText, ""))

-- // Encryption:Split(OrginalText, "") will return false if hooked or modified
local a = string.byte("1")
table.foreach(Encryption:textToBinary(a), warn)
