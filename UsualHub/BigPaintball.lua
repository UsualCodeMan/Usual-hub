local Players = game:GetService("Players")
local plyr = game.Players.LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local worldToViewportPoint = Camera.worldToViewportPoint

_G.unlock_all = false
_G.Besp = false
_G.Tracers = false
_G.TracerPositon = false
_G.Sesp = false
_G.Teamcheck = false

spawn(function()
    local library = require(game:GetService("ReplicatedStorage").Framework.Library)
    local env = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Scripts.Game["First Person Controller"])
    
    print("loaded");
    local old_fire = library.Network.Fire
    library.Network.Fire = newcclosure(function(self, ...)
    local args = {...}
    
    if _G.unlock_all and tostring(self) == "Request Respawn" then
        args[1] = "1"
    end
    
    return old_fire(self, unpack(args))
    end)
    
    local old_own = env.DoesOwnGun
    env.DoesOwnGun = function(...)
    return (_G.unlock_all and true) or old_own(...)
    end

    local old_own_gun = library.GunCmds.DoesOwnGun
    library.GunCmds.DoesOwnGun = newcclosure(function(self, ...)
    return (_G.unlock_all and true) or old_own_gun(self, ...)
    end)
    
    for _, gun in next, library.Directory.Guns do
    gun["offsale"] = false
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
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
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
                if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
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
Aimbot.AddLabel("WIP")
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
Misc.AddButton("Unlockall guns", function() 
    _G.unlock_all = true
end)
Misc.AddButton("Destroy spawn barriers", function() 
    workspace.__MAP.SpawnShields.Red:Destroy()
    workspace.__MAP.SpawnShields.Blue:Destroy()
    print("Destroyed");
end)
Misc.AddToggle("Double Credits Toggle", false, function(Toggled) 
    workspace.__VARIABLES.DoubleCredits.Value = Toggled;
end)
-- Misc.AddSlider("Walkspeed slider", "WalkSpeed", 16, 100, false, function(ws)
--     l__Humanoid__4.WalkSpeed = ws;
-- end)
-- Misc.AddSlider("JumpPower slider", "JumpPower", 35, 100, false, function(jp)
--     l__Humanoid__4.JumpPower = jp
-- end)
