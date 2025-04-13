local DataStoreService = game:GetService("DataStoreService")
local StickDB = DataStoreService:GetDataStore("PlayerStickInventory")

local InventoryService = {}

local playerInventories = {}

function InventoryService.InitPlayer(player)
	local key = tostring(player.UserId)
	local data = StickDB:GetAsync(key) or {
		Sticks = {},
		Equipped = nil,
		Coins = 0,
		Crescents = 0
	}

	playerInventories[player] = data
end

function InventoryService.RemovePlayer(player)
	local key = tostring(player.UserId)
	local data = playerInventories[player]

	if data then
		local success, err = pcall(function()
			StickDB:SetAsync(key, data)
		end)
		if not success then warn("? Failed to save inventory:", err) end
	end

	playerInventories[player] = nil
end

function InventoryService.GetInventory(player)
	return playerInventories[player]
end

function InventoryService.AddStick(player, stick)
	local data = playerInventories[player]
	if not data then return false end

	table.insert(data.Sticks, stick)
	return true
end

function InventoryService.EquipStick(player, stickID)
	local data = playerInventories[player]
	if not data then return false end

	for _, stick in ipairs(data.Sticks) do
		if stick.ID == stickID then
			data.Equipped = stickID
			return true
		end
	end

	return false
end

function InventoryService.AddCoins(player, amount)
	local data = playerInventories[player]
	if data then
		data.Coins = (data.Coins or 0) + amount
	end
end


function InventoryService.SortInventory(player)
	local data = playerInventories[player]
	if not data then return end

	table.sort(data.Sticks, function(a, b)
		return (a.Rarity or 1) > (b.Rarity or 1)
	end)
end

return InventoryService
