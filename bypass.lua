-- bypass my own whitelist bcus of how bad the code is.
local StoredVariables = ""

local HttpService = game:GetService("HttpService")
local Role = "User"
local Tag = "suck it"
local Constants = {
    ["0"] = "game",
    ["1"] = "GetService",
    ["2"] = "Players",
    ["3"] = "LocalPlayer"
}

local a 
a = hookfunction(syn.request, newcclosure(function(Data, ...)
    if Data["Url"]:find("yaris.rocks") then 
        local TempBody = HttpService:JSONDecode(Data.Body)
        local ReturnBody={information={authorized=true,user={data=TempBody.data,expires="",role=Role,blacklisted="false",reason="",tag=Tag},data={exploit="Synapse",fingerprint="Syn-Fingerprint",["fingerprint-data"]=TempBody.data,constants=Constants,extra={a=TempBody.a,b=TempBody.b,c=TempBody.c,d=TempBody.d,e=TempBody.e,f=TempBody.f,g=TempBody.g,h=TempBody.h,i=TempBody.i,j=TempBody.j,k=TempBody.k,userid=TempBody.userid,player=TempBody.player,name=TempBody.name,description=TempBody.description,apikey=TempBody.apikey,gameid=TempBody.gameid,ts=TempBody.k/TempBody.a}}}}
        
        StoredVariables = HttpService:JSONEncode(ReturnBody)
    end 
    
    return a(Data, ...)
end))

local Count = 0 

local b 
b = hookfunction(string.gsub, newcclosure(function(...)
    Count = Count + 1
    if Count % 7 == 0 then 
        return StoredVariables
    end 

    return b(...)
end))

local c 
c = hookfunction(string.match, newcclosure(function(Str, Match, ...)
    if Match == "information" then 
        return true 
    end 
    
    return c(Str, Match, ...)
end))

local d
d = hookfunction(string.sub, newcclosure(function(Str, Match1, Match2, ...)
    if Match1 == 8 and Match2 == 18 then 
        return "information"
    elseif Match1 == 3 and Match2 == 10 then
        return "fuck"
    end 
    
    return d(Str, Match1, Match2, ...)
end))
