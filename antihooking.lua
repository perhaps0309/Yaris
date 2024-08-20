-- please never do "anti-hooking" this way, this will only stop skids
-- // ANTI HOOKING \\ --

local constantsCheck = Whitelist:getconstantsCheck()
if constantsCheck then
    print("Security", "Hooking detected. [0]") return;
end 

local ispairshooked = Whitelist:ishooked(pairs, 0)
if ispairshooked then print("Security", "Hooking detected. [1]") return; end

local SearchValue = ("noitcnufkooh"):reverse()
local SearchValue2 = ("cnufkooh"):reverse()
local SearchValue3 = ("erusolcecalper"):reverse()

local SearchValue4 = ""
local SearchValue5 = ""
local SearchValue6 = ""

local SearchValue7 = ""
local SearchValue8 = ""
local SearchValue9 = ""

local Characters = {[1] = {"h","o","o","k","f","u","n","c","t","i","o","n"}, [2] = {"h","o","o","k","f","u","n","c"}, [3] = {"r","e","p","l","a","c","e"}}

for i = 1, 12 do 
    if not Characters[1][i] then print("Security", "Hooking detected. [2]") return; end 
    SearchValue4 = SearchValue4..Characters[1][i]
end 

for i = 1, #Characters[1] do 
    if not Characters[1][i] then print("Security", "Hooking detected. [3]") return; end 
    SearchValue7 = SearchValue7..Characters[1][i]
end 

if SearchValue ~= SearchValue4 or SearchValue ~= SearchValue7 or SearchValue4 ~= SearchValue or SearchValue4 ~= SearchValue7 or SearchValue7 ~= SearchValue or SearchValue7 ~= SearchValue4 then 
    print("Security", "Hooking detected. [4]") return;
end 

local Registry = getreg()

local Count = 0 
for i, v in pairs(Registry) do 
    local IsFunction, IsHooked = Whitelist:isfunction(v)
    if IsFunction then 
        if IsHooked or IsFunction[1] then 
            print("Security", "Hooking detected. [5]") return;
        end 
        
        for i1, v1 in pairs(getconstants(v)) do 
            if v1 == SearchValue or v1 == SearchValue4 or v1 == SearchValue7  then
                Count = Count + 1 
                if Count ~= 1 then 
                    print("Security", "Hooking detected. [99]") return;
                end 
            end 
        end 
    elseif IsHooked then 
        print("Security", "Hooking detected. [6]") return; 
    end 
end 

if Count ~= 1 then 
    print("Security", "Hooking detected. [100]") return;
end 
