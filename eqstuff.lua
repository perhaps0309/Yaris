-- // Create Variables 

local ScriptEnvironment = getfenv(1)
local Script = ScriptEnvironment.script

local Floor = math.floor
local function CustomOrStatement(...)
    local Data = {...}
    local DataLength = #Data
    -- // For loops 
    local Count1 = 0 
    local Count2 = 0 
    local Count3 = 0 
    for i = 1, DataLength do 
        local Value = Data[i]
        if Value == true and Value ~= false and tostring(Value) == "true" and tostring(false) == "false" then
            Count1 = Count1 + 1
        end
    end

    local Starting = 1 
    local Ending = DataLength
    if Starting ~= 1 or Starting ~= Floor(((100 / 2 * 5 - 50)/112.5/2) + 0.5) then return false, nil end 
    for i = Starting, Ending do 
        local Value = Data[i]
        if Value == true and Value ~= false and tostring(Value) == "true" and tostring(false) == "false" then
            Count2 = Count2 + 1
        end
    end

    -- // While loop
    local i = 0
    while true do 
        i = i + 1 

        if not Data[i] then break end
        local Value = Data[i]
        if Value == true and Value ~= false and tostring(Value) == "true" and tostring(false) == "false" then
            Count3 = Count3 + 1
        end
    end 

    if Count1 == Count2 and Count1 == Count3 and Count2 == Count1 and Count2 == Count3 and Count3 == Count1 and Count3 == Count2 then
        return true, Data
    end
end

local function CheckEQ(a, b)
    local Data = {
        a == b,
        b == a,
        not (a ~= b),
        not (b ~= a),
        not (not (a == b)),
        not (not (b == a)),
        not (not (not (a ~= b))),
        not (not (not (b ~= a))),
        a >= b,
        a <= b,
        b >= a,
        b <= a,
        a >= b and a <= b,
        b >= a and b <= a,
        not(a < b) and not (a > b),
        not(b < a) and not (b > a), 
        not(a > b or b > a),
        not(b > a or a > b),
        not(a < b or b < a),
        not(b < a or a < b)
    }

    local ComparedTables = setmetatable({
        a == b,
        b == a,
        not (a ~= b),
        not (b ~= a),
        not (not (a == b)),
        not (not (b == a)),
        not (not (not (a ~= b))),
        not (not (not (b ~= a))),
        a >= b,
        a <= b,
        b >= a,
        b <= a,
        a >= b and a <= b,
        b >= a and b <= a,
        not(a < b) and not (a > b),
        not(b < a) and not (b > a), 
        not(a > b or b > a),
        not(b > a or a > b),
        not(a < b or b < a),
        not(b < a or a < b)
    }, {})

    -- // check if comparedtable and Data are equal

    -- // first for check 
    for i = 1, 20 do 
        if Data[i] == nil then return false, nil end 
        if not Data[i] or Data[i] ~= true or Data[i] == false or Data[i] == true and not Data[i] or 0 + 1 ~= 1 or true ~= true then
            return false
        end 
    end 

    -- // second for check
    for i = 1, #Data do 

    end 

    -- // third for check
    local Starting = 1 
    local Ending = 20 
    if Starting ~= 1 or Starting ~= (100 / 2 * 5 - 50)/225 then return false end 
    for i = Starting, Ending do 

    end 

    -- // manually check each value :)
    local TempData1 = not (a == b) and function() 
        setfenv(1, {})
        setrawmetatable(getgenv(), {})
        while true do end 
    end or function() end 

    TempData1()
    if Data[1] ~= (a == b) or Data[1] ~= true or not Data[1] or not (a == b) then 
        return false
    end

    -- // check with CustomOrStatement

    -- return dependenacy for EQ function
end 

local function EQ(Variable1, Variable2, Settings)

end 

EQ("LOL", "LOL", {
    ["VM"] = "Luraph", -- // Auto-detects the obfuscation used, this is just to see if they tried to change it
    ["haltVM"] = true, -- // Halts the script, if any spoofing has been detected.
})
