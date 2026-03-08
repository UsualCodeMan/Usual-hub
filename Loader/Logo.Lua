local ScreenCenter = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)

local Line1 = Drawing.new("Line")
local Line2 = Drawing.new("Line")
local Line3 = Drawing.new("Line")
local Line4 = Drawing.new("Line")
local Line5 = Drawing.new("Line")
local Line6 = Drawing.new("Line")
local Line7 = Drawing.new("Line")
local Line8 = Drawing.new("Line")

local Lone1 = Drawing.new("Line")
local Lone2 = Drawing.new("Line")
local Lone3 = Drawing.new("Line")
local Lone4 = Drawing.new("Line")

Line1.Visible = true
Line1.Transparency = 1
Line1.ZIndex = 10
Line1.Color = Color3.fromHex("#FFFFFF")
Line1.From = ScreenCenter + Vector2.new(-200, 40)
Line1.To = ScreenCenter + Vector2.new(-100, -60)

Line2.Visible = true
Line2.Transparency = _G.Transp
Line2.ZIndex = 10
Line2.Color = Color3.fromHex("#FFFFFF")
Line2.From = ScreenCenter + Vector2.new(-200, 60)
Line2.To = ScreenCenter + Vector2.new(-100, -40)

Line3.Visible = true
Line3.Transparency = _G.Transp
Line3.ZIndex = 10
Line3.Color = Color3.fromHex("#FFFFFF")
Line3.From = ScreenCenter + Vector2.new(-100, -40)
Line3.To = ScreenCenter + Vector2.new(0, 60)

Line4.Visible = true
Line4.Transparency = _G.Transp
Line4.ZIndex = 10
Line4.Color = Color3.fromHex("#FFFFFF")
Line4.From = ScreenCenter + Vector2.new(-100, -60)
Line4.To = ScreenCenter + Vector2.new(0, 40)

Line5.Visible = true
Line5.Transparency = _G.Transp
Line5.ZIndex = 10
Line5.Color = Color3.fromHex("#FFFFFF")
Line5.From = ScreenCenter + Vector2.new(0, 40)
Line5.To = ScreenCenter + Vector2.new(100, -60)

Line6.Visible = true
Line6.Transparency = _G.Transp
Line6.ZIndex = 10
Line6.Color = Color3.fromHex("#FFFFFF")
Line6.From = ScreenCenter + Vector2.new(0, 60)
Line6.To = ScreenCenter + Vector2.new(100, -40)

Line7.Visible = true
Line7.Transparency = _G.Transp
Line7.ZIndex = 10
Line7.Color = Color3.fromHex("#FFFFFF")
Line7.From = ScreenCenter + Vector2.new(100, -40)
Line7.To = ScreenCenter + Vector2.new(200, 60)

Line8.Visible = true
Line8.Transparency = _G.Transp
Line8.ZIndex = 10
Line8.Color = Color3.fromHex("#FFFFFF")
Line8.From = ScreenCenter + Vector2.new(100, -60)
Line8.To = ScreenCenter + Vector2.new(200, 40)

Lone1.Visible = true
Lone1.Transparency = _G.Transp
Lone1.ZIndex = 10
Lone1.Color = Color3.fromHex("#FFFFFF")
Lone1.From = ScreenCenter + Vector2.new(-200, -60)
Lone1.To = ScreenCenter + Vector2.new(-100, 60)

Lone2.Visible = true
Lone2.Transparency = _G.Transp
Lone2.ZIndex = 10
Lone2.Color = Color3.fromHex("#FFFFFF")
Lone2.From = ScreenCenter + Vector2.new(-100, 60)
Lone2.To = ScreenCenter + Vector2.new(0, -60)

Lone3.Visible = true
Lone3.Transparency = _G.Transp
Lone3.ZIndex = 10
Lone3.Color = Color3.fromHex("#FFFFFF")
Lone3.From = ScreenCenter + Vector2.new(0, -60)
Lone3.To = ScreenCenter + Vector2.new(100, 60)

Lone4.Visible = true
Lone4.Transparency = _G.Transp
Lone4.ZIndex = 10
Lone4.Color = Color3.fromHex("#FFFFFF")
Lone4.From = ScreenCenter + Vector2.new(100, 60)
Lone4.To = ScreenCenter + Vector2.new(200, -60)

wait(2)
cleardrawcache()
