local HttpService = game:GetService("HttpService")
local StickDefinitions = require(script.Parent.StickDefinitions)
local StickUtility = require(script.Parent.StickUtility)

local StickGenerator = {}

-- Phase 1: Visual & identity data for spawning
function StickGenerator.GenerateBaseStick(params)
	local stick = {}

	stick.Size = params and params.Size or StickUtility.RandomFromWeightedTable(StickDefinitions.SizeWeights)
	stick.Origin = params and params.Origin or StickUtility.RandomFromTable(StickDefinitions.Origins)

	stick.ShapeCategory = StickUtility.RandomFromWeightedTable(StickDefinitions.ShapeCategoryWeights)
	stick.ModelID = StickUtility.RandomModelIDFromShapeCategory(stick.ShapeCategory)

	stick.Color = params and params.Color or StickUtility.RandomFromTable(StickDefinitions.StickColorPalette)
	stick.Material = params and params.Material or StickUtility.RandomFromTable(StickDefinitions.MaterialChoices)

	stick.ID = "STICK_" .. HttpService:GenerateGUID(false)
	stick.Name = "Unnamed Stick"

	return stick
end

-- Phase 2: Rolled only after pickup confirmation
function StickGenerator.FinalizeStick(stick)
	if not stick then return end

	stick.Traits = StickUtility.GenerateTraits()
	stick.Enchant = StickUtility.RollEnchant()
	stick.Spirit = StickUtility.RollSpirit()
	stick.Wear = StickUtility.RandomFromTable(StickDefinitions.Wears)

	stick.RarityTier = StickUtility.CalculateRarity(stick)
	stick.Rarity = stick.RarityTier
	stick.Odds = stick.RarityOdds

	stick.Lore = StickUtility.GenerateLore(stick)

	return stick
end

return StickGenerator
