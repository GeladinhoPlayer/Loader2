-- loader.lua - Sistema LightScripts com key LightIsPower
local KeyCorreta = "LightIsPower"
local URL_Menu = "https://raw.githubusercontent.com/GeladinhoPlayer/Loader2/refs/heads/main/script99.lua"

local player = game:GetService("Players").LocalPlayer

-- Interface do sistema
local Gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
Gui.Name = "LightScriptsLoader"

local Frame = Instance.new("Frame", Gui)
Frame.Size = UDim2.new(0, 400, 0, 250)
Frame.Position = UDim2.new(0.5, -200, 0.5, -125)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "🚀 LightScripts Loader"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1

local Input = Instance.new("TextBox", Frame)
Input.PlaceholderText = "Digite a key: LightIsPower"
Input.Size = UDim2.new(0.85, 0, 0, 40)
Input.Position = UDim2.new(0.075, 0, 0.4, 0)
Input.Font = Enum.Font.Gotham
Input.TextSize = 16
Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Input.TextColor3 = Color3.new(1, 1, 1)
Input.ClearTextOnFocus = false
Instance.new("UICorner", Input).CornerRadius = UDim.new(0, 8)

local Button = Instance.new("TextButton", Frame)
Button.Text = "Verificar e Iniciar"
Button.Size = UDim2.new(0.85, 0, 0, 38)
Button.Position = UDim2.new(0.075, 0, 0.65, 0)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
Button.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 8)

local Aviso = Instance.new("TextLabel", Frame)
Aviso.Text = ""
Aviso.Size = UDim2.new(1, 0, 0, 25)
Aviso.Position = UDim2.new(0, 0, 0.9, 0)
Aviso.Font = Enum.Font.GothamSemibold
Aviso.TextSize = 14
Aviso.TextColor3 = Color3.new(1, 1, 1)
Aviso.BackgroundTransparency = 1

-- Sistema de verificação
Button.MouseButton1Click:Connect(function()
	if Input.Text == KeyCorreta then
		Aviso.Text = "✅ Key correta! Carregando menu..."
		Aviso.TextColor3 = Color3.fromRGB(0, 255, 127)
		wait(1)
		Gui:Destroy()
		
		local success, result = pcall(function()
			return loadstring(game:HttpGet(URL_Menu, true))()
		end)

		if not success then
			warn("Erro ao carregar o menu:", result)
		end
	else
		Aviso.Text = "❌ Key incorreta! Tente novamente."
		Aviso.TextColor3 = Color3.fromRGB(255, 70, 70)
	end
end)
