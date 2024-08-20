local ScriptEnvironment = getfenv(1)
local Script = ScriptEnvironment.script

-- investigate non lua functions that are in our script

local ExpectedConstants = {
    ("string"):reverse():reverse(),
    ("byte"):reverse():reverse(),
    ("char"):reverse():reverse(),
    ("sub"):reverse():reverse(),
    ("table"):reverse():reverse(),
    ("concat"):reverse():reverse(),
    ("math"):reverse():reverse(),
    ("ldexp"):reverse():reverse(),
    ("getfenv"):reverse():reverse(),
    ("setmetatable"):reverse():reverse(),
    ("select"):reverse():reverse(),
    ("unpack"):reverse():reverse(),
    ("tonumber"):reverse():reverse(),
    ("Ignore"):reverse():reverse(),
    ("bit"):reverse():reverse(),
    ("bxor"):reverse():reverse(),
    1
}

for i, v in pairs(getreg()) do -- // No need to make an anti pairs hook, getreg can be hooked anyways
    if typeof(v) == "function" and getfenv(v).script == Script and islclosure(v) or typeof(v) == "function" and getfenv(v).script == Script and getinfo(v).what == "Lua" then 
        local Constants = getconstants(v)
        if #Constants - 1 ~= #ExpectedConstants then 
            print("Script modifications detected.")
        end 
        
        for Index, Value in pairs(Constants) do
            if ExpectedConstants[Index] ~= Value and ExpectedConstants[Index] ~= "Ignore" and typeof(Value) ~= "userdata" then 
                print("Script modifications detected.")
                return;
            end          
        end 
    end 
end

local Stack = getstack(1)
local ExpectedStack = {
    "getfenv",
    1,
    "script",
    "string",
    "reverse",
    "byte",
    "char",
    "sub",
    "table",
    "concat",
    "math",
    "ldexp",
    "setmetatable",
    "select",
    "unpack",
    "tonumber",
    "Ignore",
    "bit",
    "bxor",
    "pairs",
    "getreg",
    "typeof",
    "function",
    "islclosure",
    "getconstants",
    "print",
    "Script modifications detected.",
    "userdata",
    "getstack"
}

Stack = Stack[2]
local Count = 0
while true do 
    if Stack[Count] == nil then return end 
    if ExpectedStack[Count] == nil then return end 

    if Stack[Count] ~= ExpectedStack[Count] then 
        print("Script modifications detected.")
        return;
    end

    Count = Count + 1
end 
