-- ReplicatedStorage.Modules.EventConfig

local EventConfig = {
	ActiveEvent = "Default",

	Themes = {
		Default = {
			ColorPalette = { Color3.fromRGB(130,95,65), ... },
			MaterialPool = { Enum.Material.Wood, ... },
			ShapeWeights = { Basic = 70, Medium = 25, Fancy = 5 }
		},

		Godfall = {
			ColorPalette = { Color3.fromRGB(255,255,255), Color3.fromRGB(255,215,0) },
			MaterialPool = { Enum.Material.Neon, Enum.Material.ForceField },
			ShapeWeights = { Basic = 0, Medium = 10, Fancy = 90 }
		},

		-- Add more here...
	}
}

return EventConfig
