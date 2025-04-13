local StickDefinitions = require(script.Parent.StickDefinitions)

local StickUtility = {}

function StickUtility.RandomFromWeightedTable(weightedTable)
	local totalWeight = 0
	for _, entry in ipairs(weightedTable) do
		totalWeight += entry.Weight
	end
	local roll = math.random() * totalWeight
	local cumulative = 0
	for _, entry in ipairs(weightedTable) do
		cumulative += entry.Weight
		if roll <= cumulative then
			return entry.Value
		end
	end
end

function StickUtility.RandomModelIDFromShapeCategory(category)
	local models = StickDefinitions.Shapes[category]
	if not models or #models == 0 then return "UnknownModel" end

	local totalWeight = 0
	for _, entry in ipairs(models) do
		totalWeight += entry.Weight
	end

	local roll = math.random() * totalWeight
	local cumulative = 0
	for _, entry in ipairs(models) do
		cumulative += entry.Weight
		if roll <= cumulative then
			return entry.ModelID
		end
	end

	return models[1].ModelID
end

function StickUtility.RandomFromTable(tbl)
	if not tbl or #tbl == 0 then return "Unknown" end
	return tbl[math.random(1, #tbl)]
end

function StickUtility.GenerateTraits()
	local roll = math.random(1, 100)
	local traits = {}

	if roll <= 70 then
		table.insert(traits, StickUtility.RandomFromTable(StickDefinitions.Traits))
	elseif roll <= 95 then
		table.insert(traits, StickUtility.RandomFromTable(StickDefinitions.Traits))
		table.insert(traits, StickUtility.RandomFromTable(StickDefinitions.Traits))
	else
		table.insert(traits, StickUtility.RandomFromTable(StickDefinitions.Traits))
		table.insert(traits, StickUtility.RandomFromTable(StickDefinitions.Traits))
		table.insert(traits, StickUtility.RandomFromTable(StickDefinitions.Traits))
	end

	return traits
end

function StickUtility.RollEnchant()
	return math.random() <= 0.025 and StickUtility.RandomFromTable(StickDefinitions.Enchants) or nil
end

function StickUtility.RollSpirit()
	return math.random() <= 0.001 and StickUtility.RandomFromTable(StickDefinitions.Spirits) or nil
end

function StickUtility.CalculateRarity(stick)
	local score = 0
	if stick.Traits then score += #stick.Traits end
	if stick.Enchant then score += 2 end
	if stick.Spirit then score += 3 end
	score += StickDefinitions.SizeBonuses[stick.Size] or 0

	for tier, data in ipairs(StickDefinitions.RarityOdds) do
		if score <= data.MaxScore then
			stick.RarityTier = tier
			stick.RarityOdds = data.Odds
			return tier
		end
	end

	local max = #StickDefinitions.RarityOdds
	stick.RarityTier = max
	stick.RarityOdds = StickDefinitions.RarityOdds[max].Odds
	return max
end

function StickUtility.GenerateLore()
	return "A mysterious stick, brimming with potential."
end

function StickUtility.SanitizeStickForStorage(stick)
	local clean = table.clone(stick)
	if typeof(stick.Color) == "Color3" then
		clean.Color = { R = stick.Color.R, G = stick.Color.G, B = stick.Color.B }
	end
	if typeof(stick.Material) == "EnumItem" then
		clean.Material = stick.Material.Name
	end
	return clean
end

return StickUtility
