local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local HttpService = game:GetService("HttpService")

local StickGenerator = require(ReplicatedStorage.Modules.StickGenerator)
local StickUtility = require(ReplicatedStorage.Modules.StickUtility)

local dropContainer = Workspace:FindFirstChild("StickDrops") or Instance.new("Folder", Workspace)
dropContainer.Name = "StickDrops"

local dropTemplateFallback = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("StickDropTemplate")
local modelRoot = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("StickModels")
local spawnFolder = Workspace:WaitForChild("StickSpawnArea")

local DROP_LIFETIME = 90
local DROP_INTERVAL = 15

local SIZE_MULTIPLIERS = {
	Small = 0.7,
	Medium = 1.0,
	Large = 1.3,
	Gigantic = 1.6,
	Colossal = 1.9,
	Titanic = 2.2
}

local function applyVisuals(model, colorData, materialStr)
	local color = Color3.new(1, 1, 1)
	if typeof(colorData) == "table" and colorData.R then
		color = Color3.new(colorData.R, colorData.G, colorData.B)
	end

	local material = Enum.Material.SmoothPlastic
	if typeof(materialStr) == "string" then
		local ok, mat = pcall(function()
			return Enum.Material[materialStr]
		end)
		if ok then material = mat end
	end

	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") then
			-- Only apply if not textured mesh
			local isTextureless = not (part:IsA("MeshPart") and part.TextureID ~= "")
			if isTextureless then
				part.Color = color
				part.Material = material
			end
		end
	end
end

local function scaleModel(model, scaleFactor)
	for _, part in ipairs(model:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Size *= scaleFactor
			part.Position *= scaleFactor
		end
	end
end

local function spawnStick()
	local locations = spawnFolder:GetChildren()
	if #locations == 0 then warn("? No spawn points!") return end

	local chosenPosition = locations[math.random(1, #locations)].Position
	local baseStick = StickGenerator.GenerateBaseStick()

	-- ?? Model lookup
	local categoryFolder = modelRoot:FindFirstChild(baseStick.ShapeCategory)
	if not categoryFolder then warn("?? Missing folder for category:", baseStick.ShapeCategory) return end

	local modelTemplate = categoryFolder:FindFirstChild(baseStick.ModelID)
	local drop = modelTemplate and modelTemplate:Clone() or dropTemplateFallback:Clone()
	if not drop.PrimaryPart then warn("?? Missing PrimaryPart in model:", drop.Name) return end

	drop:SetPrimaryPartCFrame(CFrame.new(chosenPosition + Vector3.new(0, 3, 0)))
	drop.Name = baseStick.ID

	-- ? Apply color/material properly
	applyVisuals(drop, baseStick.Color, baseStick.Material)

	-- ? Scale by stick size
	local scaleFactor = SIZE_MULTIPLIERS[baseStick.Size] or 1.0
	scaleModel(drop, scaleFactor)

	-- ?? Attach stick data
	local stickVal = Instance.new("StringValue")
	stickVal.Name = "StickData"
	stickVal.Value = HttpService:JSONEncode(StickUtility.SanitizeStickForStorage(baseStick))
	stickVal.Parent = drop

	drop.Parent = dropContainer

	task.delay(DROP_LIFETIME, function()
		if drop and drop.Parent then drop:Destroy() end
	end)
end

while true do
	spawnStick()
	task.wait(DROP_INTERVAL)
end
