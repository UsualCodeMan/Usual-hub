-- General Varibles
local Players = game:GetService("Players")
local plyr = Players.LocalPlayer

-- Script Varibles
_G.Esp = True

-- GUI Setup
local guiName = "UsualHub"
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/twink"))()
local MainUI = UILibrary.Load(guiName)
local Info = MainUI.AddPage("Info")
local Esp = MainUI.AddPage("Esp")
local Teleport = MainUI.AddPage("Teleports")
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
Esp.AddToggle("Auto Tap", false, function (Value)
    AutoTapFunc()
    _G.AutoTap = Value
end)

-- Teleport
Teleport.AddButton("Obby Finish", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_THINGS"].Obby.Trophy.CFrame
end)

-- Misc
Misc.AddLabel("Send suggestions to Usualcno")
