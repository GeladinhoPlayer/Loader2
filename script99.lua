-- script99.lua
-- Menu GUI completo e bonito

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Button1 = Instance.new("TextButton")
local Button2 = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

-- Configurações iniciais
ScreenGui.Name = "GeladinhoMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Estilo do menu
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 350, 0, 250)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Active = true
MainFrame.Draggable = true

-- Título
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "🌲 99 Dias na Floresta - Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

-- Botão 1
Button1.Name = "Button1"
Button1.Parent = MainFrame
Button1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button1.Position = UDim2.new(0.1, 0, 0.3, 0)
Button1.Size = UDim2.new(0.8, 0, 0, 40)
Button1.Font = Enum.Font.Gotham
Button1.Text = "Executar ação 1"
Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
Button1.TextSize = 14
Button1.MouseButton1Click:Connect(function()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Ação 1";
		Text = "Você clicou no botão 1!";
		Duration = 3;
	})
end)

-- Botão 2
Button2.Name = "Button2"
Button2.Parent = MainFrame
Button2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button2.Position = UDim2.new(0.1, 0, 0.55, 0)
Button2.Size = UDim2.new(0.8, 0, 0, 40)
Button2.Font = Enum.Font.Gotham
Button2.Text = "Executar ação 2"
Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
Button2.TextSize = 14
Button2.MouseButton1Click:Connect(function()
	game.StarterGui:SetCore("SendNotification", {
		Title = "Ação 2";
		Text = "Você clicou no botão 2!";
		Duration = 3;
	})
end)

-- Botão Fechar
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Position = UDim2.new(1, -25, 0, 5)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
