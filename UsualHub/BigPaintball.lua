-- General Varibles
local Players = game:GetService("Players")
local plyr = game.Players.LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local worldToViewportPoint = Camera.worldToViewportPoint

-- Script Varibles
_G.unlock_all = false
_G.BEsp = false
_G.Tracers = false
_G.TracerPositon = false
_G.SEsp = false
_G.Teamcheck = false
_G.Vip = false

-- Script Functions
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

        function boxEsp()
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
                            BoxOutline.Visible = _G.BEsp
                            Box.Visible = _G.BEsp
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
        coroutine.wrap(boxEsp)()
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

        function boxEsp()
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
                            BoxOutline.Visible = _G.BEsp
                            Box.Visible = _G.BEsp
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
        coroutine.wrap(boxEsp)()
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

-- GUI setup
local guiName = "UsualHub"
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/twink"))()
local MainUI = UILibrary.Load(guiName)
local Info = MainUI.AddPage("Info")
local Esp = MainUI.AddPage("Esp")
local Misc = MainUI.AddPage("Misc")

-- Info
Info.AddLabel("Discord")
Info.AddLabel("Ui Lib made by Kinlei#6459(Last known)")
Info.AddLabel("Scripts made by Usualcno")
Info.AddButton("Destroy UI", function() 
	local CoreGui = game:GetService("CoreGui")
    local gui = CoreGui:WaitForChild(guiName)
    gui:Destroy()
end)


-- Esp
Esp.AddLabel("Esp")
Esp.AddToggle("Box Esp", false, function(Toggled)
    _G.BEsp = Toggled
end)
Esp.AddToggle("Tracers ", false, function(Toggled)
    _G.Tracers = Toggled
end)
Esp.AddToggle("Tracer Positions", false, function(Toggled)
    _G.TracerPositon = Toggled
end)
Esp.AddToggle("Team Check", false, function(Toggled)
    _G.Teamcheck = Toggled
end)

-- Misc
Misc.AddLabel("Send suggestions to Usualcno")
Misc.AddButton("Destroy spawn barriers", function() 
    workspace.__MAP.SpawnShields.Red:Destroy()
    workspace.__MAP.SpawnShields.Blue:Destroy()
    print("Destroyed");
end)
Misc.AddSlider("Hip Height", {Min = 2, Max = 100, Def = 2}, function(Value)
    plyr.Character.Humanoid.HipHeight = Value
end)
Misc.AddToggle("Double Credits Toggle", false, function(Toggled) 
    workspace.__VARIABLES.DoubleCredits.Value = Toggled;
end)
