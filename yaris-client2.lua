-- idk what version again could be the same skull
-- // Variables

CustomPrintYaris("Debug", "Checking exploit compatibility...")
local httprequest = (http and http.request) or (syn and syn.request) or "false" -- // Check if user is using a supported exploit, if not, return false
local Timestamp, Key53, Key14, HWID, Fingerprint -- // Intialize variables
local List = {"Syn-Fingerprint", "SW-Fingerprint", "Sw-Fingerprint", "Krnl-Fingerprint"}

if KRNL_LOADED then
    httprequest = request
end

local CheckEquality = function(a, b) for i, v in pairs(a) do if not b[i] or b[i] ~= v then return false end end return true end 
local _Y_1337_EQ = function(a, b) return EQ(a, b) end
if not httprequest or EQ(tostring(httprequest), "false") then -- // If user is not using a supported exploit, crash/return 
    CustomPrintYaris("Security", "Failed to initialize variables. [1]")
    return;
end 

if Timestamp or Key53 or Key14 or HWID or Fingerprint or not CheckEquality(List, {"Syn-Fingerprint", "SW-Fingerprint", "Sw-Fingerprint", "Krnl-Fingerprint"}) then -- // If any of the variables are set, crash/return 
    CustomPrintYaris("Security", "Failed to initialize variables. [2]")
    return; 
end

if EQ(CustomString(Timestamp), "nil") == false or EQ(CustomString(Key53), "nil") == false or EQ(CustomString(Key14), "nil") == false or EQ(CustomString(HWID), "nil") == false or EQ(CustomString(Fingerprint), "nil") == false or EQ(tostring(CheckEquality(List, {"Syn-Fingerprint", "SW-Fingerprint", "Sw-Fingerprint", "Krnl-Fingerprint"})), "true") == false then -- // Same if statement as above but using EQ to prevent hooking 
    CustomPrintYaris("Security", "Failed to initialize variables. [3]")
    return; 
end 

CustomPrintYaris("Debug", "Passed exploit compatibility check. \n")

-- // Get HWID and set other variables 

CustomPrintYaris("Debug", "Sending request to grab HWID...")
local GetHWID = httprequest({Url="https://httpbin.org/get", Method = "GET"}) -- // Get HWID from HttpBin
CustomPrintYaris("Debug", "Sent request to grab HWID...")
local GetHWIDParsed = json.parse(GetHWID.Body) -- // Get headers from GetHWID
if not GetHWIDParsed.headers then -- // If GetHWIDParsed.headers is not nil, crash/return 
    CustomPrintYaris("Security", "Failed to initialize variables. [4]")
    return; 
end

GetHWIDParsed = GetHWIDParsed.headers -- // Get headers from GetHWIDParsed
for i, v in pairs(List) do -- // Loop through all fingerprints
    if GetHWIDParsed[v] then -- // If the fingerprint is found, set the variable to the value
        HWID = GetHWIDParsed[v]; -- // Set HWID to the value
        if v == "Sw-Fingerprint" then v = "SW-Fingerprint" end -- Idk why this shit happens.
        Fingerprint = v; -- // Set the fingerprint to the variable
    end 
end 

CustomPrintYaris("Debug", "Grabbed HWID: " .. HWID .. "\n")
if not HWID or #HWID <= 31 or EQ(0 + 1, 1) == false or not EQ(0 + 1, 1) == true or 0 + 1 ~= 1 or not (0 + 1 == 1)  then -- // If the HWID is less than or equal to 31, crash/return
    CustomPrintYaris("Initialization", "Failed to get HWID. [1]")
    return; 
end

-- // Set rest of the variables 

CustomPrintYaris("Debug", "Sending request to server.")
       
AntiTime(); AntiTime2();
Timestamp = os.time() -- // Get Timestamp
AntiTime(); AntiTime2();

AntiMath(); AntiMath2();
local Key1 = math.random(3, 100) -- // Get a random number
local FakeKey1 = math.random(3, 100) -- Unused number
local Key2 = math.random(63, 100) 
local FakeKey2 = math.random(63, 100)
local Key3 = math.random(3, 7)
local FakeKey3 = math.random(3, 7)
local Key4 = math.random(9, 15)
local FakeKey4 = math.random(9, 15)
local Key5 = math.floor((game.gameId/10000)) -- Get first 4 digits of game ID
local FakeKey5 = math.floor((game.gameId/10000))

local FakeTimestamp1 = CustomRandom(Timestamp / 2, Timestamp * Key1) -- // Custom random number because lua is retarded
local FakeTimestamp2 = CustomRandom(Timestamp / 2, Timestamp * Key1)
AntiMath(); AntiMath2();

-- Create keys 

local Key53 = math.floor(((Key5*Key1+Key4-Key2/Key3) + math.floor(Timestamp/1000)) + 0.5) -- // Create key 53
local Key14 = math.floor(((Key1*Key2+Key3-Key4/Key5) + Timestamp - math.floor(Timestamp/10000)) + 0.5) -- // Create key 14
if(Key53 < 0) then -- // If Key53 is less than 0
    Key53 = -Key53
end

if(Key14 < 0) then -- // If Key14 is less than 0
    Key14 = -Key14
end

-- // Create encrypted data 

local PlayerVariable = FindPath(game, "Players.LocalPlayer.Name", ".")
local UserIdVariable = FindPath(game, "Players.LocalPlayer.UserId", ".")

local RequestData = {
    data = HWID,
    gameid = game.gameId,
    player = PlayerVariable,
    userid = UserIdVariable,
    a = Key1,
    b = FakeKey1,
    c = Key2,
    d = FakeKey2,
    e = Key3,
    f = FakeKey3,
    g = Key4,
    h = FakeKey4,
    i = Key5,
    j = FakeKey5,
    k = math.floor(Timestamp * Key1),
    apikey = "[%_APIKEY_%]",
    name = "[%_NAME_%]",
    description = "[%_DESCRIPTION_%]"
}

local DataNames = {"data"}

CustomPrintYaris("Debug", "Sent request to server.")
CustomPrintYaris("Debug", "Checking if user is whitelisted.")

-- // Send data to server

local Request = httprequest({
    Url = "https://api.yaris.rocks/access/",
    Method = "POST",
    Headers = {
        ["yaris-authentication"] = "[%_APIKEY_%]",
        ["Content-Type"] = "application/json"
    },
    Body = game:GetService("HttpService"):JSONEncode(RequestData)
})

local PushRay = Request.Headers["cf-pushray"]
if not PushRay or #PushRay ~= 12 or 0 + 1 ~= 1 or not (0 + 1 == 1) then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [1]")
    return; 
end

if EQ(CustomString(PushRay), "nil") or EQ(CustomString(PushRay), "nil") == false and EQ(typeof(PushRay), "string") == false or EQ(#PushRay, 12) == false or not EQ(#PushRay, 12) or EQ(0 + 1, 1) == false or not EQ(0 + 1, 1) == true then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [2]")
    return; 
end

AntiSub("false")
AntiSub("true")

if Request.StatusCode ~= 200 or EQ(Request.StatusCode, 200) == false or not EQ(Request.StatusCode, 200) then -- // If the request failed, crash/return
    CustomPrintYaris("Initialization", "Failed to get data from server. [2]")
    return; 
end

local DecodedData = dec(LightweightDecode(Request.Body, Key53 * 2, Key14 * 2))

-- Check for proper JSON
if not DecodedData:match("information") or not DecodedData:find("information") or not DecodedData:sub(3, 10) == "information" or 0 + 1 ~= 1 or not (0 + 1 == 1) then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [5]")
    return;
end

if EQ(DecodedData:sub(8, 18), "information") == false or not EQ(DecodedData:sub(8, 18), "information") or not EQ(DecodedData:sub(8, 18), "information") == true or EQ(0 + 1, 1) == false or not EQ(0 + 1, 1) == true then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [6]")
    return; 
end

-- Parse JSON
DecodedData = json.parse(DecodedData)

-- Show Debug Information
--[[
CustomPrintYaris("Debug", "Authorized: "..tostring(DecodedData.information.authorized))
CustomPrintYaris("Debug", "User -> Tag: "..DecodedData.information.user.tag)
CustomPrintYaris("Debug", "User -> Data: "..DecodedData.information.user.data)
CustomPrintYaris("Debug", "User -> Role: "..DecodedData.information.user.role)
CustomPrintYaris("Debug", "Data -> Exploit: "..DecodedData.information.data.exploit)
CustomPrintYaris("Debug", "Data -> Fingerprint: "..DecodedData.information.data.fingerprint)
CustomPrintYaris("Debug", "Data -> Constants: ")
for k, v in pairs(DecodedData.information.data.constants) do
    CustomPrintYaris("Debug", "Data -> Constants -> "..k..": "..v)
end
CustomPrintYaris("Debug", "Data -> Extra: ")
for k, v in pairs(DecodedData.information.data.extra) do
    CustomPrintYaris("Debug", "Data -> Extra -> "..k..": "..v)
end
]]

-- Check Exploit
if not DecodedData.information.data or not DecodedData.information.data.exploit or DecodedData.information.data.exploit ~= "Synapse" and DecodedData.information.data.exploit ~= "Scriptware" and DecodedData.information.data.exploit ~= "Temple" and DecodedData.information.data.exploit ~= "KRNL" or 0 + 1 ~= 1 or not (0 + 1 == 1) then 
    CustomPrintYaris("Security", "User is not whitelisted. [7]")
    return; 
end 

if EQ(CustomString(DecodedData.information.data), "nil") or EQ(typeof(DecodedData.information.data), "table") == false or EQ(DecodedData.information.data.exploit, "Synapse") == false and not EQ(DecodedData.information.data.exploit, "Synapse") and EQ(DecodedData.information.data.exploit, "Scriptware") == false and not EQ(DecodedData.information.data.exploit, "Scriptware") and EQ(DecodedData.information.data.exploit, "Temple") == false and not EQ(DecodedData.information.data.exploit, "Temple") and EQ(DecodedData.information.data.exploit, "KRNL") == false and not EQ(DecodedData.information.data.exploit, "KRNL") or EQ(0 + 1, 1) == false or not EQ(0 + 1, 1) == true then 
    CustomPrintYaris("Security", "User is not whitelisted. [8]")
    return; 
end


-- Check Fingerprint
if DecodedData.information.data.fingerprint ~= Fingerprint or 0 + 1 ~= 1 or not (0 + 1 == 1) then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [9]")
    return; 
end

if EQ(CustomString(DecodedData.information.data), "nil") or EQ(typeof(DecodedData.information.data), "table") == false or EQ(DecodedData.information.data.fingerprint, Fingerprint) == false or not EQ(DecodedData.information.data.fingerprint, Fingerprint) or EQ(0 + 1, 1) == false or not EQ(0 + 1, 1) == true then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [10]")
    return; 
end


-- Check Authorized
if not DecodedData.information or not DecodedData.information.authorized or DecodedData.information.authorized ~= true or 0 + 1 ~= 1 or not (0 + 1 == 1) then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [11]")
    return; 
end


-- Check tostring
local Func = "tostring"
if Func ~= "tostring" or not Func:match("tostring") or not Func:sub(1, 8) == "tostring" or 0 + 1 ~= 1 then 
    CustomPrintYaris("Security", "User is not whitelisted. [12]")
    return; 
end 

if CustomString("false") ~= "false" or not CustomString("false") == "false" or 0 + 1 ~= 1 then 
    CustomPrintYaris("Security", "User is not whitelisted. [13]")
end 

if EQ(CustomString("false"), "false") == false or EQ(CustomString("false"), "false") ~= true or not (EQ(CustomString("false"), "false") == true) or 0 + 1 ~= 1 then 
    CustomPrintYaris("Security", "User is not whitelisted. [14]")
end

for i = 1, math.random(10, 20) do 
    local a = CustomString("false")
    if a ~= "false" or not a == "false" or not (a == "false") or 0 + 1 ~= 1 then 
        CustomPrintYaris("Security", "User is not whitelisted. [15]")
    end

    if EQ(a, "false") == false or EQ(a, "false") ~= true or not (EQ(a, "false") == true) or 0 + 1 ~= 1 then 
        CustomPrintYaris("Security", "User is not whitelisted. [16]")
    end
end 


-- Check Authorized 2
if EQ(CustomString(DecodedData.information), "nil") or EQ(typeof(DecodedData.information), "table") == false or EQ(CustomString(DecodedData.information.authorized), "true") == false or not EQ(CustomString(DecodedData.information.authorized), "true") or EQ(0 + 1, 1) == false or not EQ(0 + 1, 1) == true then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [17]")
    return; 
end


-- Check math
for i = 1, math.random(10, 20) do 
    local a = CustomString("false")
    if a ~= "false" or not a == "false" or not (a == "false") or 0 + 1 ~= 1 then 
        CustomPrintYaris("Security", "User is not whitelisted. [18]")
    end

    if EQ(a, "false") == false or EQ(a, "false") ~= true or not (EQ(a, "false") == true) or 0 + 1 ~= 1 then 
        CustomPrintYaris("Security", "User is not whitelisted. [19]")
    end
end 


-- Check API key
if DecodedData.information.data.extra.apikey ~= "[%_APIKEY_%]" or 0 + 1 ~= 1 or not (0 + 1 == 1) then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [22]")
    return; 
end

if EQ(DecodedData.information.data.extra.apikey, "[%_APIKEY_%]") == false or EQ(DecodedData.information.data.extra.apikey, "[%_APIKEY_%]") ~= true or not (EQ(DecodedData.information.data.extra.apikey, "[%_APIKEY_%]") == true) or 0 + 1 ~= 1 then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [23]")
    return; 
end


-- Check Whitelist name
if DecodedData.information.data.extra.name ~= "[%_NAME_%]" or 0 + 1 ~= 1 or not (0 + 1 == 1) then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [22]")
    return; 
end

if EQ(DecodedData.information.data.extra.name, "[%_NAME_%]") == false or EQ(DecodedData.information.data.extra.name, "[%_NAME_%]") ~= true or not (EQ(DecodedData.information.data.extra.name, "[%_NAME_%]") == true) or 0 + 1 ~= 1 then -- // If the data is incorrect, crash/return
    CustomPrintYaris("Security", "User is not whitelisted. [23]")
    return; 
end


-- Check math2
local Func = "tonumber"
if Func ~= "tonumber" or not Func:match("tonumber") or not Func:sub(1, 8) == "tonumber" or 0 + 1 ~= 1 then 
    CustomPrintYaris("Security", "User is not whitelisted. [24]")
    return; 
end 
 
if EQ(Func, "tonumber") == false or EQ(Func, "tonumber") ~= true or not (EQ(Func, "tonumber") == true) or 0 + 1 ~= 1 then 
    CustomPrintYaris("Security", "User is not whitelisted. [25]")
    return; 
end

local Number = getrenv()[Func]
if CustomNumber(Timestamp) ~= Number(Timestamp) or not (CustomNumber(Timestamp) == Number(Timestamp)) or 0 + 1 ~= 1 then
    CustomPrintYaris("Security", "User is not whitelisted. [23]")
end

if EQ(CustomNumber(Timestamp), Number(Timestamp)) == false or EQ(CustomNumber(Timestamp), Number(Timestamp)) ~= true or not (EQ(CustomNumber(Timestamp), Number(Timestamp)) == true) or EQ(0 + 1, 1) == false or 0 + 1 ~= 1 then 
    CustomPrintYaris("Security", "User is not whitelisted. [24]")
    return; 
end

if tonumber(Timestamp) ~= Timestamp or not CustomNumber(Timestamp) == tonumber(Timestamp) or 0 + 1 ~= 1 then 
    CustomPrintYaris("Security", "User is not whitelisted. [25]")
    return; 
end

if EQ(tonumber(Timestamp), Timestamp) == false or EQ(tonumber(Timestamp), Timestamp) ~= true or not (EQ(tonumber(Timestamp), Timestamp) == true) or EQ(0 + 1, 1) == false or 0 + 1 ~= 1 then 
    CustomPrintYaris("Security", "User is not whitelisted. [26]")
    return; 
end

-- Check extra data
if tonumber(DecodedData.information.data.extra.ts) ~= Timestamp or CustomNumber(DecodedData.information.data.extra.ts) ~= Timestamp or CustomNumber(DecodedData.information.data.extra.ts) ~= tonumber(DecodedData.information.data.extra.ts) or 0 + 1 ~= 1 or not (0 + 1 == 1) then 
    CustomPrintYaris("Security", "User is not whitelisted. [27]")
    return; 
end

if EQ(tonumber(DecodedData.information.data.extra.ts), Timestamp) == false or EQ(tonumber(DecodedData.information.data.extra.ts), Timestamp) ~= true or not (EQ(tonumber(DecodedData.information.data.extra.ts), Timestamp) == true) or EQ(0 + 1, 1) == false or 0 + 1 ~= 1 then 
    CustomPrintYaris("Security", "User is not whitelisted. [28]")
    return; 
end

if CustomNumber(DecodedData.information.data.extra.gameid) ~= game.gameId or CustomNumber(DecodedData.information.data.extra.gameid) ~= tonumber(DecodedData.information.data.extra.gameid) or 0 + 1 ~= 1 or not (0 + 1 == 1) then 
    CustomPrintYaris("Security", "User is not whitelisted. [29]")
    return; 
end

if EQ(CustomNumber(DecodedData.information.data.extra.gameid), game.gameId) == false or EQ(CustomNumber(DecodedData.information.data.extra.gameid), game.gameId) ~= true or not (EQ(CustomNumber(DecodedData.information.data.extra.gameid), game.gameId) == true) or EQ(0 + 1, 1) == false or 0 + 1 ~= 1 then 
    CustomPrintYaris("Security", "User is not whitelisted. [30]")
    return; 
end

if CustomNumber(DecodedData.information.data.extra.userid) ~= FindPath(game, "Players.LocalPlayer.UserId", ".") or tonumber(DecodedData.information.data.extra.userid) ~= FindPath(game, "Players.LocalPlayer.UserId", ".") or CustomNumber(DecodedData.information.data.extra.userid) ~= tonumber(DecodedData.information.data.extra.userid) or 0 + 1 ~= 1 or not (0 + 1 == 1) then 
    CustomPrintYaris("Security", "User is not whitelisted. [31]")
    return; 
end

CustomPrintYaris("Debug", "Done.")
