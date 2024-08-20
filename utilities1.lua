-- what is this? idk aimbot stuff 

local Utilities = {}

local stringformat = string.format -- // Stored for performance
local mathpi = math.pi
local mathsin = math.sin 
local mathcos = math.cos
local mathpow = math.pow
local mathsqrt = math.sqrt
local mathabs = math.abs
local stringsplit = string.split
local mathrandom = math.random 
local stringchar = string.char
local tableinsert = table.insert
local taskwait = task.wait

local game = game 
local GetService = game.GetService 
local Players = GetService(game, "Players")
local LocalPlayer = Players["LocalPlayer"]
local GetMouse = LocalPlayer.GetMouse
local RunService = GetService(game, "RunService")
local RenderStepped = RunService.RenderStepped

local workspace = workspace 
local Camera = workspace["CurrentCamera"]
local WorldToViewportPoint = Camera.WorldToViewportPoint

function Utilities:Factorial(Number) -- // lua doesn't have math.factorial so we make our own
    for i = 1, Number - 1 do 
        Number = Number * i
    end 

    return Number
end

function Utilities:CreateString(Length)
    local Current = ""
    for i = 1, Length do 
        Current = Current..stringchar(mathrandom(97, 122))
    end 

    return Current
end 

function Utilities:ToString(Number)
    return stringformat("%f", Number)
end

function Utilities:ToNumber(String)
    return String + 0
end

function Utilities:ExpandTable(Table, Func, Spacing, LastSpacing, StartingTable) -- table.foreach but it goes through all tables
    Table = Table or {}

    Spacing = Spacing or 1
    LastSpacing = LastSpacing or " "
    StartingTable = StartingTable or false
    if not StartingTable then 
        Func(tostring(Table))
    end 


    for i, v in pairs(Table) do 
        Func(stringformat("%s%s %s", LastSpacing, tostring(i), tostring(v)))
        if type(v) == "table" then 
            local AddSpacing = LastSpacing  
            for i = 1, Spacing do 
                AddSpacing = AddSpacing .. " "
            end

            self:ExpandTable(v, Func, Spacing, AddSpacing, true)
        end
    end
end 

function Utilities:SearchPath(Starting, Path, Current)
    Starting = Starting or game 
    Path = Path or ""
    Current = Current or Starting

    local Paths = stringsplit(Path, ".")
    local CurrentPath = ""
    for i, v in pairs(Paths) do 
        CurrentPath = CurrentPath .. v
        if Current[CurrentPath] then 
            Current = Current[CurrentPath]
        else 
            return nil
        end 
    end

    return Current
end

function Utilities:Reverse(Table)
    for i = 1, math.floor(#Table/2) do
        local Temp = Table[i]
        Table[i] = Table[#Table - i + 1]
        Table[#Table - i + 1] = Temp
    end

    return Table
end 

function Utilities:Sort(Table, SortType) 
    SortType = SortType or "ascending"

    local SortedTable = {}
    for i, v in pairs(Table) do 
        SortedTable[i] = v
    end

    table.sort(SortedTable)

    if SortType == "descending" then 
        SortedTable = self:Reverse(SortedTable)
    end

    return SortedTable
end

Utilities.Easings = {
    easeInSine = function(x)
        return 1 - mathcos((x * mathpi) / 2)
    end,
    easeOutSine = function(x)
        return mathsin((x * mathpi) / 2)
    end,
    easeInOutSine = function(x)
        return -(mathcos(mathpi * x) - 1) / 2
    end,
    easeInQuad = function(x)
        return x^2
    end,
    easeOutQuad = function(x)
        return 1 - (1- x) * (1 - x)
    end,
    easeInOutQuad = function(x)
        return x < 0.5 and 2 * x^2 or 1 - mathpow(-2 * x + 2, 2) / 2
    end,
    easeInCubic = function(x)
        return x^3
    end,
    easeOutCubic = function(x)
        return 1 - mathpow(1 - x, 3)
    end,
    easeInOutCubic = function(x)
        return x < 0.5 and 4 * x^3 or 1 - mathpow(-2 * x + 2, 3) / 2
    end,
    easeInQuart = function(x)
        return x^4
    end,
    easeOutQuart = function(x)
        return 1 - mathpow(1 - x, 4)
    end,
    easeInOutQuart = function(x)
        return x < 0.5 and 8 * x^4 or 1 - mathpow(-2 * x + 2, 4) / 2
    end,
    easeInQuint = function(x)
        return x^5
    end,
    easeOutQuint = function(x)
        return 1 - mathpow(1 - x, 5)
    end,
    easeInOutQuint = function(x)
        return x < 0.5 and 16 * x^5 or 1 - mathpow(-2 * x + 2, 5) / 2
    end,
    easeInExpo = function(x)
        return x == 0 and 0 or mathpow(2, 10 * x - 10)
    end,
    easeOutExpo = function(x)
        return x == 1 and 1 or 1 - mathpow(2, -10 * x)
    end,
    easeInOutExpo = function(x)
        return x == 0 and 0 or x == 1 and 1 or x < 0.5 and mathpow(2, 20 * x - 10) / 2 or (2 - mathpow(2, -20 * x + 10)) / 2
    end,
    easeInCirc = function(x)
        return 1 - mathsqrt(1 - mathpow(x, 2))
    end,
    easeOutCirc = function(x)
        return mathsqrt(1 - mathpow(x - 1, 2))
    end, 
    easeInOutCirc = function(x)
        return x < 0.5 and (1 - mathsqrt(1 - mathpow(2 * x, 2))) / 2 or (mathsqrt(1 - mathpow(-2 * x + 2, 2)) + 1) / 2
    end,
    easeInBack = function(x)
        local c1 = 1.70158
        local c3 = c1 + 1
        return c3 * x^3 - c1 * x^2
    end,
    easeOutBack = function(x)
        local c1 = 1.70158
        local c3 = c1 + 1
        return 1 + c3 * mathpow(x - 1, 3) + c1 * mathpow(x - 1, 2)
    end,
    easeInOutBack = function(x)
        local c1 = 1.70158
        local c2 = c1 * 1.525
        return x < 0.5 and (mathpow(2 * x, 2) * ((c2 + 1) * 2 * x - c2)) / 2 or (mathpow(2 * x - 2, 2) * ((c2 + 1) * (x * 2 -2) + c2) + 2) / 2
    end,
    easeInElastic = function(x)
        local c4 = (2 * mathpi) / 3
        return x == 0 and 0 or x == 1 and 1 or -mathpow(2, 10 * x - 10) * mathsin((x * 10 - 10.75) * c4)
    end,
    easeOutElastic = function(x)
        local c4 = (2 * mathpi) / 3
        return x == 0 and 0 or x == 1 and 1 or mathpow(2, -10 * x) * mathsin((x * 10 -0.75) * c4) + 1 
    end,
    easeInOutElastic = function(x)
        local c5 = (2 * mathpi) / 4.5
        return x == 0 and 0 or x == 1 and 1 or x < 0.5 and -(mathpow(2, 20 * x - 10) * mathsin((20 * x - 11.125) * c5)) / 2 or (mathpow(2, -20 * x + 10) * mathsin((20 * x - 11.125) * c5)) / 2 + 1
    end,
    easeInBounce = function(x) -- bounce took forever cus i waanted it to be one line and failed so i copied it from someone else
        return 1 - Utilities.Easings.easeOutBounce(1 - x)
    end,
    easeOutBounce = function(x)
        if x < 1 / 2.75 then 
            return 1 * (7.5625 * x^2)
        elseif x < 2 / 2.75 then 
            x = x - (1.5 / 2.75)
            return 1 * (7.5625 * x^2 + 0.75)
        elseif x < 2.5 / 2.75 then 
            x = x - (2.25 / 2.75)
            return 1 * (7.5625 * x^2 + 0.9375)
        else 
            x = x - (2.625 / 2.75)
            return 1 * (7.5625 * x^2 + 0.984375)
        end 
    end,
    easeInOutBounce = function(x)
        if x < 0.5 then 
            return Utilities.Easings.easeInBounce(x * 2) * 0.5 
        else 
            return Utilities.Easings.easeOutBounce(x * 2 - 1) * 0.5 + 1 * 0.5
        end 
    end 
}

function Utilities:CreateEasing(Type, Smoothness, Function)
    Type = Type and typeof(Type) == "string" and Type or "easeInCirc"
    Smoothness = Smoothness and typeof(Smoothness) == "number" and Smoothness or 0.5
    Function = Function and typeof(Function) == "function" and Function or function(x) return x end 

    local Result = {}
    local Easing = self.Easings[Type] or self.Easings.easeInCirc
    for i = 0, 1, Smoothness do
        local EasingTemp = Easing(i)
        Function(EasingTemp)
        tableinsert(Result, EasingTemp)
    end
    
    return Result 
end

function Utilities:CreateBezierCurve(Points, Smoothness, Type, Delay, Function)
    Points = Points or {Vector2.new(0, 0), Vector2.new(100, 100), Vector2.new(250, 250), Vector2.new(500, 0)}
    Type = Type or "Quadratic" -- // Linear, Quadratic, Cubic
    Smoothness = Smoothness or 0.01 
    Delay = Delay or 0
    Function = Function or function(x) return x end

    local Point1 = Points[1] -- Starting(for All)
    local Point2 = Points[2] -- Ending(Linear)
    local Point3 = Points[3] -- Ending(Quadratic)
    local Point4 = Points[4] -- Ending(Cubic)

    local Curve = {}
    if Type == "Linear" then 
        for i = 0, 1, Smoothness do
            local Result = (1-i) * Point1 + i * Point2
            Curve[#Curve + 1] = Result
            Function(Result)
            if Delay ~= 0 then 
                taskwait(Delay)
            end 
        end
    elseif Type == "Quadratic" then 
        for i = 0, 1, Smoothness do 
            local Result = (1-i)^2 * Point1 + 2 * (1-i) * i * Point2 + i^2 * Point3
            Curve[#Curve + 1] = Result
            Function(Result)
            if Delay ~= 0 then 
                taskwait(Delay)
            end 
        end 
    elseif Type == "Cubic" then 
        for i = 0, 1, Smoothness do 
            local Result = (1-i)^3 * Point1 + 3 * (1-i)^2 * i * Point2 + 3 * (1-i) * i^2 * Point3 + i^3 * Point4
            Curve[#Curve + 1] = Result
            Function(Result)
            if Delay ~= 0 then 
                taskwait(Delay)
            end 
        end 
    elseif Type == "Custom" then -- // Infinite control points for the curve
        for i = 0, 1, Smoothness do 
            local Result = 0
            for j = 1, #Points do 
                local PointX = Points[j].X 
                local PointY = Points[j].Y
                Result = Result + (1-i)^(#Points - j) * i^j * PointX
                Result = Result + (1-i)^(#Points - j) * i^j * PointY
            end 

            Curve[#Curve + 1] = Result
            Function(Result)
            if Delay ~= 0 then 
                taskwait(Delay)
            end
        end 
    end 

    return Curve
end 

wait(1)
local mousemoveabs = mousemoveabs
local Mouse = GetMouse(LocalPlayer)
function Utilities:MoveMouse(Position, Smoothness, Speed, MoveType, MoveType2)
    Position = Position or {x=0, y=0}
    Smoothness = Smoothness or 0.1
    Speed = Speed or 50 -- // 1-100
    MoveType = MoveType or "easeInSine" -- // Utilites.Easings
    MoveType2 = MoveType2 or "Linear" -- // Linear, Quadratic, Cubic, Custom

    if MoveType2 == "Linear" then 
        local Curve = self:CreateBezierCurve({
            Vector2.new(Mouse.X, Mouse.Y),
            Vector2.new(Position.x, Position.y)
        }, Smoothness, MoveType2)

        for i, v in pairs(Utilities:CreateEasing(MoveType, Smoothness)) do 
            mousemoveabs(Curve[i].X, Curve[i].Y)
            taskwait(v/Speed)
        end 
    elseif MoveType2 == "Quadratic" then 
        local DistanceX = Position.x - Mouse.X 
        local DistanceY = Position.y - Mouse.Y
        if DistanceX < 0 then DistanceX = Mouse.X - Position.x end 
        if DistanceY < 0 then DistanceY = Mouse.Y - Position.y end

        local Curve = self:CreateBezierCurve({
            Vector2.new(Mouse.X, Mouse.Y),
            Vector2.new(Position.x + DistanceX/2, Position.y + DistanceY/2),
            Vector2.new(Position.x, Position.y)
        }, Smoothness, MoveType2)

        for i, v in pairs(Utilities:CreateEasing(MoveType, Smoothness)) do 
            mousemoveabs(Curve[i].X, Curve[i].Y)
            taskwait(v/Speed)
        end 
    elseif MoveType2 == "Cubic" then 
        local DistanceX = Position.x - Mouse.X 
        local DistanceY = Position.y - Mouse.Y
        if DistanceX < 0 then DistanceX = Mouse.X - Position.x end 
        if DistanceY < 0 then DistanceY = Mouse.Y - Position.y end

        local Curve = self:CreateBezierCurve({
            Vector2.new(Mouse.X, Mouse.Y),
            Vector2.new(Position.x + DistanceX/2, Position.y + DistanceY/2),
            Vector2.new(Position.x - DistanceX/2, Position.y - DistanceY/2),
            Vector2.new(Position.x, Position.y)
        }, Smoothness, MoveType2)

        for i, v in pairs(Utilities:CreateEasing(MoveType, Smoothness)) do 
            mousemoveabs(Curve[i].X, Curve[i].Y)
            taskwait(v/Speed)
        end 
    end 
end 

local TargetPlayer = "perhapsbutinroblox"
TargetPlayer = Players:FindFirstChild(TargetPlayer).Character.Head.Position
    
local vector, vis = Camera:WorldToViewportPoint(TargetPlayer)
Utilities:MoveMouse({x=vector.X, y=vector.Y}, 0.01, 50, "easeInSine", "Quadratic")
