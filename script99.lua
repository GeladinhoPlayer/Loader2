-- GeladinhoPlayer Hub Completo

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Criar a GUI
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "GeladinhoHub"
ScreenGui.ResetOnSpawn = false

-- Fundo principal
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.BorderSizePixel = 0

-- Topo
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TopBar.BorderSizePixel = 0

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🌲 Geladinho Hub"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Aba lateral
local TabBar = Instance.new("Frame", MainFrame)
TabBar.Size = UDim2.new(0, 100, 1, -40)
TabBar.Position = UDim2.new(0, 0, 0, 40)
TabBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

-- Botões das abas
local function createTabButton(name, yPosition)
	local button = Instance.new("TextButton", TabBar)
	button.Size = UDim2.new(1, 0, 0, 40)
	button.Position = UDim2.new(0, 0, 0, yPosition)
	button.Text = name
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.Gotham
	button.TextSize = 14
	return button
end

local scriptTabBtn = createTabButton("Scripts", 0)
local configTabBtn = createTabButton("Config", 50)
local creditTabBtn = createTabButton("Créditos", 100)

-- Páginas
local Pages = {}

local function createPage(name)
	local page = Instance.new("Frame", MainFrame)
	page.Name = name
	page.Size = UDim2.new(1, -100, 1, -40)
	page.Position = UDim2.new(0, 100, 0, 40)
	page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	page.Visible = false
	Pages[name] = page
	return page
end

local ScriptPage = createPage("Scripts")
local ConfigPage = createPage("Config")
local CreditPage = createPage("Créditos")

-- Mostrar página
local function showPage(name)
	for _, page in pairs(Pages) do
		page.Visible = false
	end
	Pages[name].Visible = true
end

-- Conectar botões das abas
scriptTabBtn.MouseButton1Click:Connect(function() showPage("Scripts") end)
configTabBtn.MouseButton1Click:Connect(function() showPage("Config") end)
creditTabBtn.MouseButton1Click:Connect(function() showPage("Créditos") end)
showPage("Scripts")

-- Conteúdo da aba Scripts
local scriptBtn = Instance.new("TextButton", ScriptPage)
scriptBtn.Size = UDim2.new(0, 200, 0, 40)
scriptBtn.Position = UDim2.new(0, 20, 0, 20)
scriptBtn.Text = "▶️ 99 Dias na Floresta"
scriptBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
scriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptBtn.Font = Enum.Font.Gotham
scriptBtn.TextSize = 14
scriptBtn.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/GeladinhoPlayer/Loader2/main/99dias.lua"))()
end)

-- Conteúdo da aba Config
local infoLabel = Instance.new("TextLabel", ConfigPage)
infoLabel.Size = UDim2.new(1, -20, 0, 100)
infoLabel.Position = UDim2.new(0, 10, 0, 20)
infoLabel.BackgroundTransparency = 1
infoLabel.TextWrapped = true
infoLabel.Text = "🔧 Configurações futuras em desenvolvimento!"
infoLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
infoLabel.Font = Enum.Font.Gotham
infoLabel.TextSize = 14

-- Conteúdo da aba Créditos
local creditText = Instance.new("TextLabel", CreditPage)
creditText.Size = UDim2.new(1, -20, 1, -20)
creditText.Position = UDim2.new(0, 10, 0, 10)
creditText.BackgroundTransparency = 1
creditText.TextWrapped = true
creditText.Text = "🎖️ Feito por GeladinhoPlayer\nGitHub: @GeladinhoPlayer"
creditText.TextColor3 = Color3.fromRGB(255, 255, 255)
creditText.Font = Enum.Font.Gotham
creditText.TextSize = 14
creditText.TextYAlignment = Enum.TextYAlignment.Top
