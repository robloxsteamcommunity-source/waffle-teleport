-- 📱 StarterPlayerScripts/TeleportGUI (Versão Final Corrigida)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- 🔑 Verifica se é VOCÊ
if player.UserId ~= 7637458316 then
	script:Destroy()
	return
end

-- 🏠 ID DO HANGOUT
local HANGOUT_PLACE_ID = 81148932729884

-- 🎨 Cores Suaves e Modernas
local PRIMARY = Color3.fromRGB(88, 101, 242)
local PRIMARY_HOVER = Color3.fromRGB(100, 115, 255)
local BACKGROUND = Color3.fromRGB(255, 255, 255)
local TEXT_DARK = Color3.fromRGB(45, 45, 50)
local TEXT_LIGHT = Color3.fromRGB(140, 140, 145)
local SUCCESS = Color3.fromRGB(50, 200, 100)
local ERROR = Color3.fromRGB(255, 80, 80)

-- Cria a Interface
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportPanel"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Frame Principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 380, 0, 420)
frame.Position = UDim2.new(0.5, -190, 0.5, -210)
frame.BackgroundColor3 = BACKGROUND
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Sombra suave
local shadow = Instance.new("ImageLabel")
shadow.Image = "rbxassetid://5554236805"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.Size = UDim2.new(1, 40, 1, 40)
shadow.Position = UDim2.new(0, -20, 0, -20)
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(23, 23, 277, 277)
shadow.BackgroundTransparency = 1
shadow.ZIndex = 0
shadow.Parent = frame

-- Cantos Arredondados
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = frame

-- Header (Topo colorido)
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 80)
header.BackgroundColor3 = PRIMARY
header.BorderSizePixel = 0
header.Parent = frame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 16)
headerCorner.Parent = header

-- Título no Header
local title = Instance.new("TextLabel")
title.Text = "Teleporte"
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 15)
title.Font = Enum.Font.GothamBold
title.TextSize = 26
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Parent = header

-- Subtítulo
local subtitle = Instance.new("TextLabel")
subtitle.Text = "Envie jogadores para outro servidor"
subtitle.Size = UDim2.new(1, 0, 0, 20)
subtitle.Position = UDim2.new(0, 0, 0, 50)
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 13
subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
subtitle.TextTransparency = 0.3
subtitle.BackgroundTransparency = 1
subtitle.Parent = header

-- Ícone de Waffle
local icon = Instance.new("TextLabel")
icon.Text = "🧇"
icon.Size = UDim2.new(0, 40, 0, 40)
icon.Position = UDim2.new(1, -55, 0, 20)
icon.Font = Enum.Font.SourceSans
icon.TextSize = 35
icon.BackgroundTransparency = 1
icon.Parent = header

-- Conteúdo Principal
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -40, 0, 280)
content.Position = UDim2.new(0, 20, 0, 95)
content.BackgroundColor3 = Color3.fromRGB(245, 245, 247)
content.BorderSizePixel = 0
content.Parent = frame

local contentCorner = Instance.new("UICorner")
contentCorner.CornerRadius = UDim.new(0, 12)
contentCorner.Parent = content

-- Label informativa
local infoLabel = Instance.new("TextLabel")
infoLabel.Text = "Destino: Hangout Server"
infoLabel.Size = UDim2.new(1, -30, 0, 25)
infoLabel.Position = UDim2.new(0, 15, 0, 15)
infoLabel.Font = Enum.Font.GothamMedium
infoLabel.TextSize = 14
infoLabel.TextColor3 = TEXT_DARK
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.BackgroundTransparency = 1
infoLabel.Parent = content

-- ID do jogo
local idLabel = Instance.new("TextLabel")
idLabel.Text = "ID: " .. tostring(HANGOUT_PLACE_ID)
idLabel.Size = UDim2.new(1, -30, 0, 20)
idLabel.Position = UDim2.new(0, 15, 0, 38)
idLabel.Font = Enum.Font.Gotham
idLabel.TextSize = 11
idLabel.TextColor3 = TEXT_LIGHT
idLabel.TextXAlignment = Enum.TextXAlignment.Left
idLabel.BackgroundTransparency = 1
idLabel.Parent = content

-- Botão Principal
local button = Instance.new("TextButton")
button.Text = "Teleportar Todos"
button.Size = UDim2.new(1, -30, 0, 50)
button.Position = UDim2.new(0, 15, 0, 75)
button.BackgroundColor3 = PRIMARY
button.BorderSizePixel = 0
button.Font = Enum.Font.GothamBold
button.TextSize = 16
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = content

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 10)
buttonCorner.Parent = button

button.MouseEnter:Connect(function()
	button.BackgroundColor3 = PRIMARY_HOVER
end)
button.MouseLeave:Connect(function()
	button.BackgroundColor3 = PRIMARY
end)

-- Separador
local separator = Instance.new("Frame")
separator.Size = UDim2.new(1, -30, 0, 1)
separator.Position = UDim2.new(0, 15, 0, 140)
separator.BackgroundColor3 = Color3.fromRGB(220, 220, 225)
separator.BorderSizePixel = 0
separator.Parent = content

-- Label Personalizado
local customLabel = Instance.new("TextLabel")
customLabel.Text = "Ou use um Place ID diferente"
customLabel.Size = UDim2.new(1, -30, 0, 20)
customLabel.Position = UDim2.new(0, 15, 0, 155)
customLabel.Font = Enum.Font.Gotham
customLabel.TextSize = 12
customLabel.TextColor3 = TEXT_LIGHT
customLabel.TextXAlignment = Enum.TextXAlignment.Left
customLabel.BackgroundTransparency = 1
customLabel.Parent = content

-- Input Personalizado ✅ FONTE CORRIGIDA
local input = Instance.new("TextBox")
input.PlaceholderText = "Ex: 123456789"
input.Size = UDim2.new(1, -30, 0, 40)
input.Position = UDim2.new(0, 15, 0, 180)
input.BackgroundColor3 = BACKGROUND
input.BorderSizePixel = 0
input.Font = Enum.Font.Gotham -- ✅ Trocado de GothamMono para Gotham
input.TextSize = 14
input.TextColor3 = TEXT_DARK
input.PlaceholderColor3 = TEXT_LIGHT
input.ClearTextOnFocus = false
input.Parent = content

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 8)
inputCorner.Parent = input

-- Botão Personalizado
local customButton = Instance.new("TextButton")
customButton.Text = "Teleportar (ID Custom)"
customButton.Size = UDim2.new(1, -30, 0, 40)
customButton.Position = UDim2.new(0, 15, 0, 230)
customButton.BackgroundColor3 = Color3.fromRGB(240, 240, 245)
customButton.BorderSizePixel = 0
customButton.Font = Enum.Font.GothamMedium
customButton.TextSize = 14
customButton.TextColor3 = TEXT_DARK
customButton.Parent = content

local customCorner = Instance.new("UICorner")
customCorner.CornerRadius = UDim.new(0, 8)
customCorner.Parent = customButton

customButton.MouseEnter:Connect(function()
	customButton.BackgroundColor3 = Color3.fromRGB(230, 230, 235)
end)
customButton.MouseLeave:Connect(function()
	customButton.BackgroundColor3 = Color3.fromRGB(240, 240, 245)
end)

-- Status (mensagens)
local status = Instance.new("TextLabel")
status.Text = ""
status.Size = UDim2.new(1, -30, 0, 25)
status.Position = UDim2.new(0, 15, 0, 280)
status.Font = Enum.Font.GothamMedium
status.TextSize = 13
status.TextColor3 = SUCCESS
status.BackgroundTransparency = 1
status.Parent = content

-- Botão Fechar
local closeBtn = Instance.new("TextButton")
closeBtn.Text = "✕"
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BorderSizePixel = 0
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BackgroundTransparency = 1
closeBtn.Parent = header

closeBtn.MouseEnter:Connect(function()
	closeBtn.BackgroundTransparency = 0
	closeBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	closeBtn.TextColor3 = PRIMARY
end)
closeBtn.MouseLeave:Connect(function()
	closeBtn.BackgroundTransparency = 1
	closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

closeBtn.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- 🚀 Função de Teleporte
local function teleport(placeId)
	local event = ReplicatedStorage:FindFirstChild("TeleportRequest")
	if event then
		event:FireServer(placeId)
		status.TextColor3 = SUCCESS
		status.Text = "✅ Teleportando jogadores..."
		task.wait(3)
		status.Text = ""
	else
		status.TextColor3 = ERROR
		status.Text = "❌ Erro de conexão!"
		task.wait(2)
		status.Text = ""
	end
end

-- Botão Principal
button.MouseButton1Click:Connect(function()
	teleport(HANGOUT_PLACE_ID)
end)

-- Botão Personalizado
customButton.MouseButton1Click:Connect(function()
	local customId = tonumber(input.Text)
	if customId then
		teleport(customId)
	else
		status.TextColor3 = ERROR
		status.Text = "❌ Digite um ID válido!"
		task.wait(2)
		status.Text = ""
	end
end)

-- ✅ Animação de entrada (CORRIGIDA)
task.spawn(function()
	frame.Size = UDim2.new(0, 380, 0, 0)
	task.wait(0.1)
	frame:TweenSize(UDim2.new(0, 380, 0, 420), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.4)
end)

-- 🖱️ Sistema de Arrastar a GUI
local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil

local function update(input)
	local delta = input.Position - dragStart
	frame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or 
		input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

header.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or 
		input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

print("🎨 GUI Premium Carregada!")
