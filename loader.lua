-- LightScripts Loader com Key System
local keyCorreta = "LightIsPower"
local linkScript = "https://raw.githubusercontent.com/GeladinhoPlayer/Loader2/refs/heads/main/script99.lua"

-- Criar GUI
local gui = Instance.new("ScreenGui")
gui.Name = "LightScriptsKeySystem"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1

local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Text = "🔐 LightScripts - Key System"
title.Size = UDim2.new(1, 0, 0, 40)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local textbox = Instance.new("TextBox", frame)
textbox.PlaceholderText = "Digite a key aqui..."
textbox.Size = UDim2.new(0.9, 0, 0, 40)
textbox.Position = UDim2.new(0.05, 0, 0.4, 0)
textbox.Font = Enum.Font.Gotham
textbox.TextScaled = true
textbox.Text = ""
textbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)

local uiCorner2 = Instance.new("UICorner", textbox)
uiCorner2.CornerRadius = UDim.new(0, 6)

local botao = Instance.new("TextButton", frame)
botao.Text = "✅ Verificar Key"
botao.Size = UDim2.new(0.9, 0, 0, 35)
botao.Position = UDim2.new(0.05, 0, 0.7, 0)
botao.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
botao.TextColor3 = Color3.fromRGB(255, 255, 255)
botao.Font = Enum.Font.GothamBold
botao.TextScaled = true

local uiCorner3 = Instance.new("UICorner", botao)
uiCorner3.CornerRadius = UDim.new(0, 6)

local aviso = Instance.new("TextLabel", frame)
aviso.Text = ""
aviso.Size = UDim2.new(1, 0, 0, 20)
aviso.Position = UDim2.new(0, 0, 1, -20)
aviso.TextColor3 = Color3.fromRGB(255, 100, 100)
aviso.BackgroundTransparency = 1
aviso.Font = Enum.Font.Gotham
aviso.TextScaled = true

-- Verificação
botao.MouseButton1Click:Connect(function()
	local digitado = textbox.Text
	if digitado == keyCorreta then
		aviso.TextColor3 = Color3.fromRGB(0, 255, 127)
		aviso.Text = "✅ Key correta! Carregando menu..."
		wait(1)
		gui:Destroy()
		loadstring(game:HttpGet(linkScript))()
	else
		aviso.TextColor3 = Color3.fromRGB(255, 70, 70)
		aviso.Text = "❌ Key incorreta. Tente novamente!"
	end
end)
