local Workspace = game:GetService("Workspace")
local lplr = game.Players.LocalPlayer

_G.AutoTrain = false
_G.Type = ""

spawn(function()
    function Train()
        while task.wait(1) and _G.AutoTrain do
            local args = {
                [1] = _G.Type
            }
            game:GetService("ReplicatedStorage").Remotes.train:FireServer(unpack(args))
        end
    end
end)

local guiName = "UsualHub"
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/twink"))()
local MainUI = UILibrary.Load(guiName)
local Info = MainUI.AddPage("Info")
local Farming = MainUI.AddPage("Farming")
local Teleport = MainUI.AddPage("Teleport")
local Misc = MainUI.AddPage("Misc")

-- Info
Info.AddLabel(" Ui Lib made by Kinlei#6459")
Info.AddLabel("Scripts made by UsualGamer#0012")
Info.AddButton("Destroy UI", function() 
	local CoreGui = game:GetService("CoreGui")
    local gui = CoreGui:WaitForChild(guiName)
    gui:Destroy()
end)

-- Farming
Farming.AddToggle("AutoFarm Strength", false, function(Value)
    _G.AutoTrain = Value
    _G.Type = "str"
    Train()
end)
Farming.AddToggle("AutoFarm Durability", false, function(Value)
    _G.AutoTrain = Value
    _G.Type = "dur"
    Train()
end)
Farming.AddToggle("AutoFarm Nen", false, function(Value)
    _G.AutoTrain = Value
    _G.Type = "nen"
    Train()
end)
Farming.AddToggle("AutoFarm Agility", false, function(Value)
    _G.AutoTrain = Value
    _G.Type = "agi"
    Train()
end)

-- Teleport
Teleport.AddLabel("Places")
Teleport.AddButton("Dur - Swamp", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.SwampZone.CFrame
end)
Teleport.AddButton("Str and Dur - Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.GymZone.CFrame
end)
Teleport.AddButton("Str -Gon house", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Whale.Mailbox.Part.CFrame
end)
Teleport.AddButton("Nen - Willow Tree", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.WillowZone.CFrame
end)
Teleport.AddButton("Dur - Nen Impact Crater", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.NenImpactZone.CFrame
end)
Teleport.AddButton("Str - Arm Wresling", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.ArmWrestlingZone.CFrame
end)
Teleport.AddButton("Agi - Running path", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.TrailZone.CFrame
end)
Teleport.AddButton("Str - Troupe Standoff", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.StandoffZone.CFrame
end)
Teleport.AddButton("Nen - Nostrade Garden", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.MansionZone.CFrame
end)
Teleport.AddButton("Nen - Misly Wetlands", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.WetlandsZone.CFrame
end)
Teleport.AddButton("Dur - Zevil ISland", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.ZevilZone.CFrame
end)
Teleport.AddButton("Dur - Icy Lake", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.IceRuinsZone.CFrame
end)
Teleport.AddButton("Str - Trick Tower", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.TrickZone.CFrame
end)
Teleport.AddButton("Str - Town of Prizes", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.PrizeZone.CFrame
end)
Teleport.AddButton("Nen - Dodgeball", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.DodgeballZone.CFrame
end)
Teleport.AddButton("Nen - Badlands", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Zones.BadlandsZone.CFrame
end)

Teleport.AddLabel("Quests")
Teleport.AddButton("King", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Whale.Ging.camView.CFrame
end)
Teleport.AddButton("Gong", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Yorknew.Gon.camView.CFrame
end)
Teleport.AddButton("Killua", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Yorknew.Killua.camView.CFrame
end)
Teleport.AddButton("Chains", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Yorknew.Chains.camView.CFrame
end)
Teleport.AddButton("ChonsoleFF", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Yorknew.GIconsole.Lid["Playstation Logo"].CFrame
end)

Teleport.AddLabel("Spawns")
Teleport.AddButton("Whale", function ()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Whale.WhaleSpawn.CFrame
end)
Teleport.AddButton("Yorknew", function ()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Yorknew.YorkSpawn.CFrame
end)
Teleport.AddButton("Game Spawn", function ()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Game.GameSpawn.CFrame
end)

-- Misc
Misc.AddLabel("Send suggestions to UsualGamer#0012")