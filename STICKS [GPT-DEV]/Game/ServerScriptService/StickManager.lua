local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TextService = game:GetService("TextService")

local StickGenerator = require(ReplicatedStorage.Modules.StickGenerator)
local InventoryService = require(ReplicatedStorage.Modules.InventoryService)

local RemoteEvents = ReplicatedStorage:WaitForChild("RemoteEvents")
local RequestPickup = RemoteEvents:WaitForChild("RequestPickup")
local StickPickupResult = RemoteEvents:WaitForChild("StickPickupResult")
local StickConfirm = RemoteEvents:WaitForChild("StickConfirm")
local RequestInventory = RemoteEvents:WaitForChild("RequestInventory")
local ReceiveInventory = RemoteEvents:WaitForChild("ReceiveInventory")
local StickEquippedUpdate = RemoteEvents:WaitForChild("StickEquippedUpdate")
local RequestEquipStick = RemoteEvents:WaitForChild("RequestEquipStick")

local pendingSticks = {}

Players.PlayerAdded:Connect(function(player)
	InventoryService.InitPlayer(player)
	print("? Inventory initialized for", player.Name)
end)

Players.PlayerRemoving:Connect(function(player)
	InventoryService.RemovePlayer(player)
	pendingSticks[player.UserId] = nil
end)

-- When a player interacts with a dropped stick
RequestPickup.OnServerEvent:Connect(function(player, baseStickData)
	if not player or not baseStickData then return end

	local finalized = StickGenerator.FinalizeStick(baseStickData)
	pendingSticks[player.UserId] = finalized

	StickPickupResult:FireClient(player, finalized)
end)

-- Confirm or deny pickup
StickConfirm.OnServerEvent:Connect(function(player, action, nameInput)
	local stick = pendingSticks[player.UserId]
	if not stick then return end

	if action == "deny" then
		pendingSticks[player.UserId] = nil
		return
	end

	if typeof(nameInput) == "string" and nameInput ~= "" then
		local success, result = pcall(function()
			local filter = TextService:FilterStringAsync(nameInput, player.UserId)
			return filter:GetNonChatStringForBroadcastAsync()
		end)

		if success and result and result ~= "" and not result:match("^#+$") then
			stick.Name = result
		end
	end

	if InventoryService.AddStick(player, stick) then
		print("?? Stick added:", stick.Name)
		local data = InventoryService.GetInventory(player)
		ReceiveInventory:FireClient(player, data)
	else
		warn("? Failed to save stick")
	end

	pendingSticks[player.UserId] = nil
end)

-- Equip stick
RequestEquipStick.OnServerEvent:Connect(function(player, stickID)
	if InventoryService.EquipStick(player, stickID) then
		local data = InventoryService.GetInventory(player)
		StickEquippedUpdate:FireClient(player, data.Equipped)
	end
end)

-- Request view or sorting
RequestInventory.OnServerEvent:Connect(function(player, action)
	if action == "sort" then
		InventoryService.SortInventory(player)
	end

	local data = InventoryService.GetInventory(player)
	ReceiveInventory:FireClient(player, data)
end)
