local StickDefinitions = {}

StickDefinitions.Sizes = {"Small", "Medium", "Large", "Gigantic", "Colossal", "Titanic"}

StickDefinitions.SizeWeights = {
	{ Value = "Small", Weight = 60 },
	{ Value = "Medium", Weight = 25 },
	{ Value = "Large", Weight = 8 },
	{ Value = "Gigantic", Weight = 2 },
	{ Value = "Colossal", Weight = 0.5 },
	{ Value = "Titanic", Weight = 0.1 }
}

StickDefinitions.SizeBonuses = {
	Small = -1, Medium = 0, Large = 1, Gigantic = 3, Colossal = 4, Titanic = 5
}

StickDefinitions.Traits = {
	"Splintered", "Wobbly", "Brittle", "Thorned", "Lucky", "Swift",
	"Heavy", "Glowing", "Toxic", "Magnetic", "Piercing", "Sturdy"
}

StickDefinitions.Enchants = { "Flame", "Frost", "Shock", "Void", "Temporal", "Gravity" }
StickDefinitions.Spirits = { "Vengeful", "Kindred", "Ancient", "Chaotic", "Mystic" }
StickDefinitions.Wears = { "Pristine", "Worn", "Cracked", "Chipped", "Damaged" }
StickDefinitions.Origins = { "Forest", "Mountain", "Swamp", "Ashlands", "Ruins", "Skyreach" }

StickDefinitions.RarityOdds = {
	{ MaxScore = 1, Odds = "1 in 5" },
	{ MaxScore = 2, Odds = "1 in 15" },
	{ MaxScore = 3, Odds = "1 in 60" },
	{ MaxScore = 4, Odds = "1 in 250" },
	{ MaxScore = 5, Odds = "1 in 1,000" },
	{ MaxScore = 6, Odds = "1 in 10,000" },
	{ MaxScore = 7, Odds = "1 in 100,000" },
	{ MaxScore = 8, Odds = "1 in 1,000,000" },
	{ MaxScore = 9, Odds = "1 in 1,000,000,000" },
}

StickDefinitions.RarityNames = {
	[1] = "Common", [2] = "Uncommon", [3] = "Rare", [4] = "Epic",
	[5] = "Legendary", [6] = "Mythic", [7] = "Divine", [8] = "Celestial", [9] = "Godlike"
}

StickDefinitions.RarityColors = {
	[1] = Color3.fromRGB(170,170,170), [2] = Color3.fromRGB(150,150,255),
	[3] = Color3.fromRGB(85,255,85),   [4] = Color3.fromRGB(255,175,0),
	[5] = Color3.fromRGB(255,0,255),   [6] = Color3.fromRGB(255,50,50),
	[7] = Color3.fromRGB(100,255,255), [8] = Color3.fromRGB(255,255,0),
	[9] = Color3.fromRGB(255,255,255),
}

StickDefinitions.ShapeCategoryWeights = {
	{ Value = "Basic", Weight = 60 },
	{ Value = "Medium", Weight = 30 },
	{ Value = "Fancy", Weight = 10 }
}

StickDefinitions.Shapes = {
	Basic = {
		{ ModelID = "Stick_Basic1", Weight = 15 },
		{ ModelID = "Stick_Basic2", Weight = 10 },
		-- Add more Basic sticks here...
	},
	Medium = {
		{ ModelID = "Stick_Medium1", Weight = 8 },
		{ ModelID = "Stick_Medium2", Weight = 5 },
	},
	Fancy = {
		{ ModelID = "Stick_Fancy1", Weight = 2 },
		{ ModelID = "Stick_Fancy2", Weight = 1 },
	}
}

StickDefinitions.StickColorPalette = {
	Color3.fromRGB(139, 69, 19),
	Color3.fromRGB(160, 82, 45),
	Color3.fromRGB(205, 133, 63),
	Color3.fromRGB(222, 184, 135),
	Color3.fromRGB(188, 143, 143),
	Color3.fromRGB(101, 67, 33)
}

StickDefinitions.MaterialChoices = {
	Enum.Material.Wood,
	Enum.Material.Concrete,
	Enum.Material.Cardboard,
}

return StickDefinitions
