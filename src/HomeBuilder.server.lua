local Workspace = game:GetService("Workspace")

local existingHome = Workspace:FindFirstChild("StarterHome")
if existingHome then
	existingHome:Destroy()
end

local home = Instance.new("Model")
home.Name = "StarterHome"
home.Parent = Workspace

local function createPart(name, size, position, color, material, parent, transparency)
	local part = Instance.new("Part")
	part.Name = name
	part.Size = size
	part.Position = position
	part.Color = color
	part.Material = material or Enum.Material.SmoothPlastic
	part.Anchored = true
	part.TopSurface = Enum.SurfaceType.Smooth
	part.BottomSurface = Enum.SurfaceType.Smooth
	part.Transparency = transparency or 0
	part.Parent = parent or home
	return part
end

local function createWindow(name, position)
	local frame = createPart(name .. "Frame", Vector3.new(0.35, 5, 6), position, Color3.fromRGB(92, 55, 30), Enum.Material.Wood)
	local glass = createPart(name .. "Glass", Vector3.new(0.15, 3.8, 4.8), position + Vector3.new(-0.1, 0, 0), Color3.fromRGB(120, 205, 255), Enum.Material.Glass, home, 0.25)
	glass.CanCollide = false
	local horizontal = createPart(name .. "Crossbar", Vector3.new(0.2, 0.18, 4.8), position + Vector3.new(-0.2, 0, 0), Color3.fromRGB(92, 55, 30), Enum.Material.Wood)
	horizontal.CanCollide = false
	local vertical = createPart(name .. "Mullion", Vector3.new(0.2, 3.8, 0.18), position + Vector3.new(-0.2, 0, 0), Color3.fromRGB(92, 55, 30), Enum.Material.Wood)
	vertical.CanCollide = false
	return frame
end

local floorColor = Color3.fromRGB(166, 103, 55)
local wallColor = Color3.fromRGB(235, 214, 173)
local trimColor = Color3.fromRGB(111, 67, 38)
local roofColor = Color3.fromRGB(126, 45, 42)

createPart("Foundation", Vector3.new(32, 1, 24), Vector3.new(0, 0.5, 0), Color3.fromRGB(95, 95, 95), Enum.Material.Concrete)
createPart("Floor", Vector3.new(28, 0.5, 20), Vector3.new(0, 1.25, 0), floorColor, Enum.Material.WoodPlanks)

createPart("BackWall", Vector3.new(28, 10, 0.6), Vector3.new(0, 6.5, 9.7), wallColor, Enum.Material.Brick)
createPart("LeftWall", Vector3.new(0.6, 10, 20), Vector3.new(-13.7, 6.5, 0), wallColor, Enum.Material.Brick)
createPart("RightWall", Vector3.new(0.6, 10, 20), Vector3.new(13.7, 6.5, 0), wallColor, Enum.Material.Brick)
createPart("FrontLeftWall", Vector3.new(10, 10, 0.6), Vector3.new(-8.7, 6.5, -9.7), wallColor, Enum.Material.Brick)
createPart("FrontRightWall", Vector3.new(10, 10, 0.6), Vector3.new(8.7, 6.5, -9.7), wallColor, Enum.Material.Brick)
createPart("FrontTopWall", Vector3.new(8, 4, 0.6), Vector3.new(0, 9.5, -9.7), wallColor, Enum.Material.Brick)

createPart("Door", Vector3.new(4, 7.5, 0.35), Vector3.new(0, 5.25, -9.95), Color3.fromRGB(103, 61, 34), Enum.Material.Wood)
local doorKnob = createPart("DoorKnob", Vector3.new(0.35, 0.35, 0.35), Vector3.new(1.25, 5.1, -10.2), Color3.fromRGB(245, 190, 60), Enum.Material.Metal)
doorKnob.Shape = Enum.PartType.Ball

createWindow("FrontWindow", Vector3.new(-7.2, 6.5, -10))
createWindow("BackWindow", Vector3.new(6.5, 6.5, 9.35))

local roofLeft = createPart("RoofLeft", Vector3.new(17, 1, 23), Vector3.new(-7, 12.4, 0), roofColor, Enum.Material.Slate)
roofLeft.CFrame = CFrame.new(-7, 12.4, 0) * CFrame.Angles(0, 0, math.rad(-28))
local roofRight = createPart("RoofRight", Vector3.new(17, 1, 23), Vector3.new(7, 12.4, 0), roofColor, Enum.Material.Slate)
roofRight.CFrame = CFrame.new(7, 12.4, 0) * CFrame.Angles(0, 0, math.rad(28))
createPart("RoofPeak", Vector3.new(1, 1, 23), Vector3.new(0, 16.35, 0), trimColor, Enum.Material.Wood)

createPart("WelcomeStep", Vector3.new(7, 0.8, 3), Vector3.new(0, 1.1, -11.5), Color3.fromRGB(142, 142, 142), Enum.Material.Concrete)
createPart("Rug", Vector3.new(8, 0.08, 5), Vector3.new(0, 1.55, -2), Color3.fromRGB(180, 55, 55), Enum.Material.Fabric)

local tableTop = createPart("TableTop", Vector3.new(6, 0.5, 3), Vector3.new(5, 4, 3), trimColor, Enum.Material.Wood)
for index, offset in ipairs({Vector3.new(-2.3, -1.4, -1), Vector3.new(2.3, -1.4, -1), Vector3.new(-2.3, -1.4, 1), Vector3.new(2.3, -1.4, 1)}) do
	createPart("TableLeg" .. index, Vector3.new(0.35, 2.8, 0.35), tableTop.Position + offset, trimColor, Enum.Material.Wood)
end

createPart("BedFrame", Vector3.new(7, 1, 5), Vector3.new(-7, 2, 4), trimColor, Enum.Material.Wood)
createPart("Mattress", Vector3.new(6.6, 0.8, 4.6), Vector3.new(-7, 2.9, 4), Color3.fromRGB(245, 245, 235), Enum.Material.Fabric)
createPart("Pillow", Vector3.new(5, 0.55, 1.4), Vector3.new(-7, 3.55, 5.3), Color3.fromRGB(110, 170, 220), Enum.Material.Fabric)

local lamp = createPart("Lamp", Vector3.new(1, 1, 1), Vector3.new(5, 4.8, 3), Color3.fromRGB(255, 220, 120), Enum.Material.Neon)
lamp.Shape = Enum.PartType.Ball
local pointLight = Instance.new("PointLight")
pointLight.Brightness = 1.5
pointLight.Range = 18
pointLight.Color = Color3.fromRGB(255, 225, 170)
pointLight.Parent = lamp

local spawn = Instance.new("SpawnLocation")
spawn.Name = "HomeSpawn"
spawn.Size = Vector3.new(5, 0.4, 5)
spawn.Position = Vector3.new(0, 1.7, -5)
spawn.Color = Color3.fromRGB(80, 190, 100)
spawn.Material = Enum.Material.Neon
spawn.Transparency = 0.35
spawn.Anchored = true
spawn.Neutral = true
spawn.Parent = home

local sign = createPart("HomeSign", Vector3.new(7, 2.2, 0.3), Vector3.new(0, 8.2, -10.1), trimColor, Enum.Material.Wood)
local signGui = Instance.new("SurfaceGui")
signGui.Face = Enum.NormalId.Front
signGui.AlwaysOnTop = true
signGui.Parent = sign
local label = Instance.new("TextLabel")
label.Size = UDim2.fromScale(1, 1)
label.BackgroundTransparency = 1
label.Text = "MY HOME"
label.TextColor3 = Color3.fromRGB(255, 240, 190)
label.TextScaled = true
label.Font = Enum.Font.GothamBold
label.Parent = signGui
