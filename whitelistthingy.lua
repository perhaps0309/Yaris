-- what the fuck is this. 
local Whitelist = {}

local coroutine = coroutine
local coroutineCreate = coroutine.create
local coroutineResume = coroutine.resume

local typeof = typeof
function Whitelist:eq(a, b)

end 

function Whitelist:ishooked(Input, ExpectedOutput)
    if self:islclosure(Input) then return true end 
    if not self.pcall then self.pcall = clonefunction(pcall) end

    local pcall = self.pcall
    
    local S1, Upvalues = pcall(getupvalues, Input)
    local S2, Upvalues2 = pcall(debug.getupvalues, Input)

    local S3, Upvalues3 = pcall(getupvalues, clonefunction)
    local S4, Upvalues4 = pcall(debug.getupvalues, clonefunction)
    if not S1 or not S2 or not S3 or not S4 or #Upvalues ~= ExpectedOutput or #Upvalues2 ~= ExpectedOutput or #Upvalues3 ~= 1 or #Upvalues4 ~= 1 then return true end 

    return false 
end 

function Whitelist:islclosure(Input)
    local StoredClosures = self.StoredClosures
    if not StoredClosures then self.StoredClosures = {} StoredClosures = self.StoredClosures end
    if StoredClosures[Input] then return StoredClosures[Input] end

    -- // Clone the functions

    if not self.pcall then self.pcall = clonefunction(pcall) end 
    if not self.islclosurefunction then self.islclosurefunction = clonefunction(islclosure) end
    if not self.coroutineCreate then self.coroutineCreate = clonefunction(coroutineCreate) end
    if not self.coroutineResume then self.coroutineResume = clonefunction(coroutineResume) end

    -- // Define them as locals

    local pcall = self.pcall
    local islclosure = self.islclosurefunction

    -- // Check lclosure first

    if islclosure(Input) then return true end 

    -- // Create functions to see if islclosure is being spoofed
    
    local LClosure = function() end
    local CClosure = newcclosure(function() end)

    -- // Check those functions

    if not islclosure(LClosure) then return {} end -- // Return {} so we can check if it's being spoofed.
    if islclosure(CClosure) then return {} end

    -- // Attempt to use getconstants, pcall so it doesn't stop the script.

    local S1, Constants = pcall(getconstants, Input)
    local S2, Constants2 = pcall(debug.getconstants, Input)

    local S3, Protos = pcall(getprotos, Input)
    local S4, Protos2 = pcall(debug.getprotos, Input)

    if S1 or S2 or S3 or S4 then 
        return {Constants, Constants2, Protos, Protos2}, {}
    end

    -- // Attept to use getconstants, instead use coroutine

    local ConstantsThread1 = coroutineCreate(function() return getconstants(Input) end)
    local ConstantsThread2 = coroutineCreate(function() return debug.getconstants(Input) end)

    local ProtosThread1 = coroutineCreate(function() return getprotos(Input) end)
    local ProtosThread2 = coroutineCreate(function() return debug.getprotos(Input) end)

    -- // Get the result of the coroutine

    local ConstantsResult1 = coroutineResume(ConstantsThread1)
    local ConstantsResult2 = coroutineResume(ConstantsThread2)

    local ProtosResult1 = coroutineResume(ProtosThread1)
    local ProtosResult2 = coroutineResume(ProtosThread2)

    -- // Check the result 

    if typeof(ConstantsResult1) == "table" or typeof(ConstantsResult2) == "table" or typeof(ProtosResult1) == "table" or typeof(ProtosResult2) == "table" then -- // Use typeof as it doesn't really matter, they can still get it.
        return {ConstantsResult1, ConstantsResult2, ProtosResult1, ProtosResult2}, {}
    end 

    -- // Check getinfo

    local Info = getinfo(Input)
    local Info2 = debug.getinfo(Input)
    if Info.source:find("@") or Info.what == "Lua" or Info.source == "@"..Info.short_src then 
        return true, {}
    end 

    if Info2.source:find("@") or Info2.what == "Lua" or Info2.source == "@"..Info2.short_src then 
        return true, {}
    end

    self.StoredClosures[Input] = false

    return false 
end

function Whitelist:getconstantsCheck(Input)
    -- // Create function to check if getconstants is being spoofed
    local LClosure = function()local b = "hookfunction" end

    -- // Check if its an lclosure

    if not islclosure(LClosure) then return true end 

    -- // Clone pcall

    if not self.pcall then self.pcall = clonefunction(pcall) end

    -- // Set pcall as a local

    local pcall = self.pcall
    
    -- // Call the constants inside pcall so it won't break if its not an lclosure somehow?

    local S1, Constants = pcall(getconstants, LClosure)
    local S2, Constants2 = pcall(debug.getconstants, LClosure)
        
    if not S1 or not S2 then return true end 

    -- // Create the expected constants

    local ExpectedConstants = {
        "hookfunction"
    }

    -- // For loop check
    
    for i = 1, #Constants - 1 do 
        if not ExpectedConstants[i] or not Constants[i] then return true end -- // Return true if its being spoofed
        if Constants[i] ~= ExpectedConstants[i] then return true end
        if Constants[i] > ExpectedConstants[i] or Constants[i] < ExpectedConstants[i] then return true end 
    end 
    
    for i = 1, 1 do
        if not ExpectedConstants[i] or not Constants[i] then return true end 
        if Constants[i] ~= ExpectedConstants[i] then return true end 
        if Constants[i] > ExpectedConstants[i] or Constants[i] < ExpectedConstants[i] then return true end
    end 

    for i = 1, #Constants2 - 1 do 
        if not ExpectedConstants[i] or not Constants2[i] then return true end -- // Return true if its being spoofed
        if Constants2[i] ~= ExpectedConstants[i] then return true end
        if Constants2[i] > ExpectedConstants[i] or Constants2[i] < ExpectedConstants[i] then return true end 
    end 

    for i = 1, 1 do
        if not ExpectedConstants[i] or not Constants2[i] then return true end 
        if Constants2[i] ~= ExpectedConstants[i] then return true end 
        if Constants2[i] > ExpectedConstants[i] or Constants2[i] < ExpectedConstants[i] then return true end
    end 

    -- // While loop check
    local LoopCount = 1 
    while true do 
        if not ExpectedConstants[LoopCount] or not Constants[LoopCount] then break end
        if Constants[LoopCount] ~= ExpectedConstants[LoopCount] then return true end
        if Constants[LoopCount] > ExpectedConstants[LoopCount] or Constants[LoopCount] < ExpectedConstants[LoopCount] then return true end

        LoopCount = LoopCount + 1
    end 

    LoopCount = 1 
    while true do 
        if not ExpectedConstants[LoopCount] or not Constants2[LoopCount] then break end
        if Constants2[LoopCount] ~= ExpectedConstants[LoopCount] then return true end
        if Constants2[LoopCount] > ExpectedConstants[LoopCount] or Constants2[LoopCount] < ExpectedConstants[LoopCount] then return true end

        LoopCount = LoopCount + 1
    end 

    return false 
end 

function Whitelist:isfunction(Input)
    -- // Check if pcall has been cloned

    if not self.pcall then self.pcall = clonefunction(pcall) end

    -- // Check islclosure

    local S, IsL = pcall(islclosure, Input)

    if S and IsL then return {} end 

    -- // Check constants, upvalues, and protos 

    local S1, Constants = pcall(getconstants, Input)
    local S2, Constants2 = pcall(debug.getconstants, Input)

    local S3, Upvalues = pcall(getupvalues, Input)
    local S4, Upvalues2 = pcall(debug.getupvalues, Input)
    
    local S5, Protos = pcall(getprotos, Input)
    local S6, Protos2 = pcall(debug.getprotos, Input)

    local S7, IsNumber = pcall(function() return Input == 1 or Input > 1 or Input < 1 end)
    local S8, IsNumber2 = pcall(newcclosure(function() return Input == 1 or Input > 1 or Input < 1 end))

    if not IsNumber and not IsNumber2 and typeof(Input) ~= "number" then 
        if S1 or S2 or S5 or S6 then 
            return {Constants, Constants2, Upvalues, Upvalues2, Protos, Protos2}, {}
        end
    end 

    -- // Check getinfo 

    local S9, Info = pcall(getinfo, Input)
    local S10, Info2 = pcall(debug.getinfo, Input)

    if (S9 and Info and not IsNumber) or (S9 and Info and not IsNumber2) or (S10 and Info2 and not IsNumber) or (S10 and Info2 and not IsNumber2) then 
        return {Info, Info2}, {}
    end

    return false 
end 

function Whitelist:GetSelf(Input)
    return self[Input]
end 
