local WhitelistUtilities = {}
function WhitelistUtilities:CustomOR(...)

end 

function WhitelistUtilities:CustomAnd(...)

end 


function WhitelistUtilities:EQ(a, b)
    if a == true then a = "true" elseif a == false then a = "false" end 
    local T = {a == b,b == a,not (a ~= b),not (b ~= a),not (not (a == b)),not (not (b == a)),not (not (not (a ~= b))),not (not (not (b ~= a))),a >= b,a <= b,b >= a,b <= a,a >= b and a <= b,b >= a and b <= a,not (a < b) and not (a > b),not (b < a) and not (b > a),not (a > b or b > a),not (b > a or a > b),not (a < b or b < a),not (b < a or a < b),rawequal(a == b, b == a)}
    local T1 = setmetatable({a == b,b == a,not (a ~= b),not (b ~= a),not (not (a == b)),not (not (b == a)),not (not (not (a ~= b))),not (not (not (b ~= a))),a >= b,a <= b,b >= a,b <= a,a >= b and a <= b,b >= a and b <= a,not (a < b) and not (a > b),not (b < a) and not (b > a),not (a > b or b > a),not (b > a or a > b),not (a < b or b < a),not (b < a or a < b),rawequal(a == b, b == a)}, {})

    -- // Check if T and T1 are equal

    local TLength = #T 
    local T1Length = #T1
    if TLength ~= TLength or TLength > T1Length or TLength < T1Length or T1Length > TLength or T1Length < TLength then return false, nil end
    if TLength ~= 20 or TLength > 20 or TLength < 20 then return false, nil end 
    for i = 1, TLength do 
        local Tv = T[i]
        local T1v = T1[i]
        if Tv == true then Tv = "true" elseif Tv == false then Tv = "false" end 
        if T1v == true then T1v = "true" elseif T1v == false then T1v = "false" end
        if Tv ~= T1v or Tv > T1v or Tv < T1v or T1v > Tv or T1v < Tv then return false, nil end
    end 

    for i = 1, TLength do 
        if T[i] == nil then return false, nil end 
    end 

    -- // Create a while loop
end 

