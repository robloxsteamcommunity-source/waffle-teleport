-- 🖥️ ServerScriptService/TeleportHandler
-- 🧇 Waffle Teleport System - Server Side

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- 🔑 CONFIGURAÇÕES
local ADMIN_USER_ID = 7637458316
local HANGOUT_PLACE_ID = 81148932729884

-- 🎨 Função de Log
local function log(message, type)
	local icon = "📝"
	if type == "info" then icon = "📘" end
	if type == "success" then icon = "✅" end
	if type == "warning" then icon = "⚠️" end
	if type == "error" then icon = "❌" end
	print(icon, "[TeleportHandler]", message)
end

-- 🔍 Cria ou encontra o RemoteEvent
local event = ReplicatedStorage:FindFirstChild("TeleportRequest")
if not event then
	event = Instance.new("RemoteEvent")
	event.Name = "TeleportRequest"
	event.Parent = ReplicatedStorage
	log("RemoteEvent criado!", "info")
end

-- 🚀 Função de Teleporte
local function teleportPlayers(admin, placeId)
	local successCount = 0
	local totalTeleported = 0

	for _, target in ipairs(Players:GetPlayers()) do
		if target ~= admin then
			totalTeleported = totalTeleported + 1

			task.spawn(function()
				local success, err = pcall(function()
					TeleportService:Teleport(placeId, target)
				end)

				if success then
					successCount = successCount + 1
					log(target.Name .. " teleportado!", "success")
				else
					log("Falha: " .. target.Name, "error")
				end
			end)
		end
	end

	task.wait(1)
	log("Resumo: " .. successCount .. "/" .. totalTeleported, "info")

	if totalTeleported == 0 then
		admin:Chat("🧇 Nenhum jogador para teleportar!")
	else
		admin:Chat("🧇 " .. successCount .. "/" .. totalTeleported .. " enviados!")
	end
end

-- 📡 Evento de Recebimento
event.OnServerEvent:Connect(function(player, placeId)

	-- 🔐 Verificação 1: É o admin?
	if player.UserId ~= ADMIN_USER_ID then
		log("Tentativa não autorizada: " .. player.Name, "warning")
		return
	end

	-- 🔢 Verificação 2: Place ID é válido?
	if not placeId then
		log("Place ID inválido!", "error")
		return
	end

	if type(placeId) ~= "number" then
		log("Place ID deve ser número!", "error")
		return
	end

	-- ✅ Verificação 3: Informações do jogo
	local placeInfo = nil
	local success, err = pcall(function()
		placeInfo = TeleportService:GetPlaceInfo(placeId)
	end)

	if success then
		if placeInfo then
			local isAllowed = false

			-- Jogo do próprio usuário
			if placeInfo.CreatorId == player.UserId then
				isAllowed = true
				log("Jogo do próprio usuário", "info")
			end

			-- Jogo do mesmo grupo
			if placeInfo.CreatorType == Enum.CreatorType.Group then
				if player:IsInGroup(placeInfo.CreatorId) then
					isAllowed = true
					log("Jogo do mesmo grupo", "info")
				end
			end

			-- Aviso se não estiver no mesmo universo
			if not isAllowed then
				log("Jogo externo - pode falhar!", "warning")
			end
		end
	else
		log("Erro ao verificar jogo: " .. tostring(err), "warning")
	end

	-- 🚀 Executa o Teleporte
	log("Teleportando para: " .. tostring(placeId), "info")
	teleportPlayers(player, placeId)

end)

-- 🎯 Log de Admin Entrando
Players.PlayerAdded:Connect(function(player)
	if player.UserId == ADMIN_USER_ID then
		log("Admin " .. player.Name .. " entrou!", "success")
	end
end)

log("TeleportHandler INICIADO!", "success")
