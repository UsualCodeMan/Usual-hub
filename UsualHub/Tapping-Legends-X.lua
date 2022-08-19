local Players = game:GetService("Players")
local plyr = Players.LocalPlayer

_G.AutoTap = false
_G.AutoBuy = false
_G.AutoRebirth = false
_G.EggList = {}
_G.Egg = ""
_G.RebirthCount = 1

function SendInvites()
    spawn(function()
        for i, v in pairs(Players:GetChildren()) do
            if v.Name ~= plyr.Name then
                local player = v.Name
                local args = {
                    [1] = player
                }
                game:GetService("ReplicatedStorage").Remotes.SendTrade:FireServer(unpack(args))
            end
        end
    end)
end

spawn(function()
    for i, v in pairs(game:GetService("Workspace").Eggs:GetChildren()) do
        table.insert(_G.EggList, v.Name)
    end
end)

function AutoTapFunc()
    spawn(function ()
        while _G.AutoTap == true do
            game:GetService("ReplicatedStorage").Remotes.Tap:FireServer()
            wait()
        end
    end)
end

function AutoBuyFunc()
    spawn(function ()
        while _G.AutoBuy == true do
            local args = {
                [1] = _G.Egg,
                [2] = 1
            }
            game:GetService("ReplicatedStorage").Remotes.BuyEgg:InvokeServer(unpack(args))
            
            wait(2)
        end
    end)
end

function AutoRebirthFunc()
    spawn(function ()
        while _G.AutoRebirth == true do
            local args = {
                [1] = _G.RebirthCount
            }
            game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(unpack(args))            
            wait()
        end
    end)
end

local guiName = "UsualHub"
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/twink"))()
local MainUI = UILibrary.Load(guiName)
local Info = MainUI.AddPage("Info")
local Farming = MainUI.AddPage("Farming")
local Teleport = MainUI.AddPage("Teleports")
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
Farming.AddToggle("Auto Tap", false, function (Value)
    AutoTapFunc()
    _G.AutoTap = Value
end)
Farming.AddToggle("Auto Buy (Must be close)", false, function (Value)
    AutoBuyFunc()
    _G.AutoBuy = Value
end)
Farming.AddDropdown("Egg type", _G.EggList, function(Value)
    _G.Egg = Value
end)
Farming.AddToggle("Auto Rebirth", false, function (Value)
    AutoRebirthFunc()
    _G.AutoRebirth = Value
end)
Farming.AddSlider("Rebirth count", {Min = 1, Max = 43, Def = 1}, function(Value)
    _G.RebirthCount = Value
end)

Teleport.AddButton("Upgrade Machine", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").UIProx.Upgrades.CFrame
end)
Teleport.AddButton("Extractor", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").UIProx.Extractor.CFrame
end)
Teleport.AddButton("Tap Skins", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").UIProx.TapSkins.CFrame
end)
Teleport.AddButton("Vial Machine", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").UIProx.VialMachine.CFrame
end)
Teleport.AddButton("Crown Chest", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Chest["Crown Chest"]["Crown Chest"].Part.CFrame
end)

Misc.AddButton("Sent trade to all", function ()
    SendInvites()
end)