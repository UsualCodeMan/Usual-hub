local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local plyr = Players.LocalPlayer
local worldToViewportPoint = Camera.worldToViewportPoint
local Melee = plyr.Data.Shuffles.Melees
local Announcers = plyr.Data.Shuffles.Announcers
local FileName = "Arsenal_Favorites.txt"
local AnnouncersTable = {}
local WeaponSkinTable = {}
local MeleeTable = {}

_G.Besp = false
_G.Tracers = false
_G.TracerPositon = false
_G.TeamCheck = false
_G.KillAllCheck = false
_G.FavoritesTable = {CurrentAnnouncer = "", CurrentSkin = "", CurrentMelee = ""}

function SaveFavorites()
    local json
    local HttpService = game:GetService("HttpService")
    if(writefile) then
        json = HttpService:JSONEncode(_G.FavoritesTable)
        writefile(FileName, json)
    else
        print("Get synapse Looser")
    end
end

function LoadFavorites()
    local HttpService = game:GetService("HttpService")
    if (readfile and isfile and isfile(FileName)) then
        _G.FavoritesTable = HttpService:JSONDecode(readfile(FileName))
        plyr.Equipped.Value = _G.FavoritesTable.CurrentSkin
        for i, v in pairs(Melee:GetChildren()) do
            v:Destroy()
        end
        local String = Instance.new("StringValue")
        String.Parent = Melee
        String.Name = _G.FavoritesTable.CurrentMelee
        for i, v in pairs(Announcers:GetChildren()) do
            v:Destroy()
        end
        local String = Instance.new("StringValue")
        String.Parent = Announcers
        String.Name = _G.FavoritesTable.CurrentAnnouncer
    end
end

spawn(function()
    for i, v in pairs(game:GetService("ReplicatedStorage").ItemData.Images.Announcers:GetChildren()) do
        table.insert(_G.AnnouncersTable, v.Name)
    end
end)

spawn(function()
    for i, v in pairs(game:GetService("ReplicatedStorage").ItemData.Images.Melees:GetChildren()) do
        table.insert(_G.MeleeTable, v.Name)
    end
end)

spawn(function()
    for i, v in pairs(game:GetService("ReplicatedStorage").ItemData.Images.WeaponSkins:GetChildren()) do
        table.insert(_G.WeaponSkinTable, v.Name)
    end
end)

spawn(function()
    local HeadOff = Vector3.new(0, 0.5, 0)
    local LegOff = Vector3.new(0,3,0)

    for i,v in pairs(game.Players:GetChildren()) do

        local BoxOutline = Drawing.new("Square")
        BoxOutline.Visible = false
        BoxOutline.Color = Color3.new(1,1,1)
        BoxOutline.Thickness = 3
        BoxOutline.Transparency = 1
        BoxOutline.Filled = false

        local Box = Drawing.new("Square")
        Box.Visible = false
        Box.Color = Color3.new(1,1,1)
        Box.Thickness = 1
        Box.Transparency = 1
        Box.Filled = false

        function boxesp()
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= plyr and v.Character.Humanoid.Health > 0 then
                    local Vector, onScreen = Camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(Camera, RootPart.Position)
                    local HeadPosition = worldToViewportPoint(Camera, Head.Position + HeadOff)
                    local LegPosition = worldToViewportPoint(Camera, RootPart.Position - LegOff)
    
                    if onScreen then
                        BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                        BoxOutline.Visible = true
    
                        Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                        Box.Visible = true
    
                        if v.TeamColor == plyr.TeamColor and _G.Teamcheck then
                            BoxOutline.Visible = false
                            Box.Visible = false
                        else
                            BoxOutline.Visible = _G.Besp
                            Box.Visible = _G.Besp
                        end
    
                    else
                        BoxOutline.Visible = false
                        Box.Visible = false
                    end
                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                end
            end)
        end
        coroutine.wrap(boxesp)()
    end

    game.Players.PlayerAdded:Connect(function(v)
        local BoxOutline = Drawing.new("Square")
        BoxOutline.Visible = false
        BoxOutline.Color = Color3.new(1,1,1)
        BoxOutline.Thickness = 3
        BoxOutline.Transparency = 1
        BoxOutline.Filled = false

        local Box = Drawing.new("Square")
        Box.Visible = false
        Box.Color = Color3.new(1,1,1)
        Box.Thickness = 1
        Box.Transparency = 1
        Box.Filled = false

        function boxesp()
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= plyr and v.Character.Humanoid.Health > 0 then
                    local Vector, onScreen = Camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                    local RootPart = v.Character.HumanoidRootPart
                    local Head = v.Character.Head
                    local RootPosition, RootVis = worldToViewportPoint(Camera, RootPart.Position)
                    local HeadPosition = worldToViewportPoint(Camera, Head.Position + HeadOff)
                    local LegPosition = worldToViewportPoint(Camera, RootPart.Position - LegOff)
    
                    if onScreen then
                        BoxOutline.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        BoxOutline.Position = Vector2.new(RootPosition.X - BoxOutline.Size.X / 2, RootPosition.Y - BoxOutline.Size.Y / 2)
                        BoxOutline.Visible = true
    
                        Box.Size = Vector2.new(1000 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
                        Box.Position = Vector2.new(RootPosition.X - Box.Size.X / 2, RootPosition.Y - Box.Size.Y / 2)
                        Box.Visible = true
    
                        if v.TeamColor == plyr.TeamColor and _G.Teamcheck then
                            BoxOutline.Visible = false
                            Box.Visible = false
                        else
                            BoxOutline.Visible = _G.Besp
                            Box.Visible = _G.Besp
                        end
    
                    else
                        BoxOutline.Visible = false
                        Box.Visible = false
                    end
                else
                    BoxOutline.Visible = false
                    Box.Visible = false
                end
            end)
        end
        coroutine.wrap(boxesp)()
    end)
end)

spawn(function()
    for i,v in pairs(game.Players:GetChildren()) do
        local Line = Drawing.new("Line")
        Line.Visible = false
        Line.Color = Color3.new(1,1,1)
        Line.Thickness = 1
        Line.Transparency = 1

        function Tracers()
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v ~= plyr then
                    local vector, onScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)

                    if onScreen then
                        if _G.TracerPositon then
                            Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                            Line.To = Vector2.new(vector.X, vector.Y)
                        else
                            Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                            Line.To = Vector2.new(vector.X, vector.Y)
                        end
                        
                        if v.TeamColor == plyr.TeamColor and _G.Teamcheck then
                            Line.Visible = false
                        else
                            Line.Visible = _G.Tracers
                        end
                    else
                        Line.Visible = false
                    end
                else
                    Line.Visible = false
                end
            end)
        end
        coroutine.wrap(Tracers)()
    end

    game.Players.PlayerAdded:Connect(function(v)
        local Line = Drawing.new("Line")
        Line.Visible = false
        Line.Color = Color3.new(1,1,1)
        Line.Thickness = 1
        Line.Transparency = 1

        function Tracers()
            game:GetService("RunService").RenderStepped:Connect(function()
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v ~= plyr then
                    local vector, onScreen = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)

                    if onScreen then
                        if _G.TracerPositon then
                            Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                            Line.To = Vector2.new(vector.X, vector.Y)
                        else
                            Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                            Line.To = Vector2.new(vector.X, vector.Y)
                        end
                        
                        if v.TeamColor == plyr.TeamColor and _G.Teamcheck then
                            Line.Visible = false
                        else
                            Line.Visible = _G.Tracers
                        end
                    else
                        Line.Visible = false
                    end
                else
                    Line.Visible = false
                end
            end)
        end
        coroutine.wrap(Tracers)()
    end)
end)

local guiName = "UsualHub"
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/twink"))()
local MainUI = UILibrary.Load(guiName)
local Info = MainUI.AddPage("Info")
local Aimbot = MainUI.AddPage("Aimbot")
local Misc = MainUI.AddPage("Misc")

-- Info
Info.AddLabel(" Ui Lib made by Kinlei#6459")
Info.AddLabel("Scripts made by UsualGamer#0012")
Info.AddButton("Destroy UI", function() 
	local CoreGui = game:GetService("CoreGui")
    local gui = CoreGui:WaitForChild(guiName)

    gui:Destroy()
end)

-- Aimbot
Aimbot.AddToggle("Box Esp", false, function(Toggled)
    _G.Besp = Toggled
end)
Aimbot.AddToggle("Tracers ", false, function(Toggled)
    _G.Tracers = Toggled
end)
Aimbot.AddToggle("Tracer Positions", false, function(Toggled)
    _G.TracerPositon = Toggled
end)
Aimbot.AddToggle("Team Check", false, function(Toggled)
    _G.Teamcheck = Toggled
end)

-- Misc
Misc.AddDropdown("Local Weapon Skin", WeaponSkinTable, function(Value)
    _G.FavoritesTable.CurrentSkin = Value
    plyr.Equipped.Value = _G.FavoritesTable.CurrentSkin
end)
Misc.AddDropdown("Local Melee (Equip Shuffle in the Locker)", MeleeTable, function(Value)
    _G.FavoritesTable.CurrentMelee = Value
    for i, v in pairs(Melee:GetChildren()) do
        v:Destroy()
    end
    wait(1)
    local String = Instance.new("StringValue")
    String.Parent = Melee
    String.Name = _G.FavoritesTable.CurrentMelee
end)
Misc.AddDropdown("Announcers (Equip Shuffle in the Locker)", AnnouncersTable, function(Value)
    _G.FavoritesTable.CurrentAnnouncer = Value
    for i, v in pairs(Announcers:GetChildren()) do
        v:Destroy()
    end
    wait(1)
    local String = Instance.new("StringValue")
    String.Parent = Announcers
    String.Name = _G.FavoritesTable.CurrentAnnouncer
end)
Misc.AddButton("Save Favorites", function() 
	SaveFavorites()
end)
Misc.AddButton("Load Favorites", function() 
	LoadFavorites()
end)
-- Misc.AddSlider("Walkspeed slider", "WalkSpeed", 16, 100, false, function(ws)
--     l__Humanoid__4.WalkSpeed = ws;
-- end)
-- Misc.AddSlider("JumpPower slider", "JumpPower", 35, 100, false, function(jp)
--     l__Humanoid__4.JumpPower = jp
-- end)
