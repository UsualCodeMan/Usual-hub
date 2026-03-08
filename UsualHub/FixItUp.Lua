-- General Varibles
local Players = game:GetService("Players")
local plyr = Players.LocalPlayer

-- Script Varibles
_G.CharacterPos = plyr.Character.HumanoidRootPart.CFrame

-- Functions
-- Part Creation for Teleportation
function partcreate(Name, postionx, positiony, positionz)
    local NewPart = Instance.new("Part", game:GetService("Workspace"))
    NewPart.Name = Name
    NewPart.Position = Vector3.new(postionx, positiony, positionz)
    NewPart.Anchored = true
    NewPart.Transparency = 1
    NewPart.CanCollide = false
end

-- GUI Setup
local guiName = "UsualHub"
local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/twink"))()
local MainUI = UILibrary.Load(guiName)
local Info = MainUI.AddPage("Info")
local Tools = MainUI.AddPage("Tools")
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

-- Tools
Tools.AddButton("Save Palce", function()
    _G.CharacterPos = plyr.Character.HumanoidRootPart.CFrame
end)
Tools.AddButton("Return to Place", function()
    plyr.Character.HumanoidRootPart.CFrame = _G.CharacterPos
end)

-- Teleport create
if game:GetService("Workspace"):FindFirstChild("UsualWasHere") == nil then
    partcreate("UsualWasHere", 0,0,0)
    partcreate("Pitstop1", -990.9, 5.0, -127.7)
    partcreate("JunkYard", -1632.49, 5, -306)
    partcreate("JunkYard1", -1709.1, 4.3, -256.0)
    partcreate("JunkYard2", -1803.5, 4.3, -163.2)
    partcreate("JunkYard3", -1675.3, 4.3, -158.9)
    partcreate("JunkYard4", -1588.2, 4.3, -40.7)
    partcreate("JunkYard5", -1520.9, 4.3, -161.9)
    partcreate("JunkYard6", -1699.5, 4.3, -13.6)
    partcreate("JunkYard7", -1742.6, 4.3, -406.6)
    partcreate("JunkYard8", -1877.7, 4.3, -348.1)
    partcreate("JunkYard9", -1857.5, 4.3, -459.7)
    partcreate("View", -1709.4, 250, -251.0)
    partcreate("PitWheels", -1359.7, 4, -1490.2)
    else
        print("Already Placed")
end

-- Teleport
Teleport.AddButton("Spawn Point", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").SpawnLocation.CFrame
end)
Teleport.AddButton("ViewPoint", function ()
    game:GetService("Workspace").View.CanCollide = true
    game:GetService("Workspace").View.Transparency = 1
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").View.CFrame + Vector3.new(0, 2, 0)
end)
Teleport.AddDropdown("Car Spawn Spots", {
"JunkYard1",
"JunkYard2",
"JunkYard3",
"JunkYard4",
"JunkYard5",
"JunkYard6",
"JunkYard7",
"JunkYard8",
"JunkYard9",
}, function(Value)
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")[Value].CFrame
end)
Teleport.AddLabel("Jobs")
Teleport.AddButton("Gas Station Cashier", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Jobs["Gas Station Cashier"].Join.CFrame
end)
Teleport.AddButton("RodEx Mail Clerk", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Jobs["RodEx Mail Clerk"].Join.CFrame
end)
Teleport.AddLabel("POIs")
Teleport.AddButton ("JunkYard", function ()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").JunkYard.CFrame
end)
Teleport.AddButton ("PitStop Repairs1", function ()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Pitstop1.CFrame
end)
Teleport.AddButton("Dealership", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Utils.Dealership.ExitPos.CFrame
end)
Teleport.AddButton("Auctions", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Utils.Auctions.Part.CFrame
end)
Teleport.AddLabel("Parts Stores")
Teleport.AddButton("Body Parts Shop", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Utils.PartsShopDetectors.BodyParts.CFrame
end)
Teleport.AddButton("Spare Parts Shop", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").PartsStore.SpareParts.SpawnPosition.CFrame
end)
Teleport.AddButton("PitWheels", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").PitWheels.CFrame
end)
Teleport.AddLabel("Garages")
Teleport.AddButton("Robux garage1", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Garages.RobuxGarage.SpawnLocation.CFrame
end)
Teleport.AddButton("Robux garage2", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Garages.RobuxGarage2.SpawnLocation.CFrame
end)
Teleport.AddButton("Default", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Garages.Default.SpawnLocation.CFrame
end)
Teleport.AddButton("4 Slots", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Garages['4Slots'].SpawnLocation.CFrame
end)
Teleport.AddButton("6 Slots", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Garages['6Slots'].SpawnLocation.CFrame
end)
Teleport.AddButton("8 Slots", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Garages['8Slots'].SpawnLocation.CFrame
end)
Teleport.AddButton("10 Slots", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Garages['10Slots'].SpawnLocation.CFrame
end)
Teleport.AddButton("24 Slots", function()
    plyr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Garages['24Slots'].SpawnLocation.CFrame
end)

-- Misc
Misc.AddLabel("Send suggestions to Usualcno")
Misc.AddButton("Print Player Position", function()
    print(plyr.Character.HumanoidRootPart.Position)
end)
