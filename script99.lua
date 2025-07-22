-- script99.lua - Menu Hydroxide Style com Fly System
local player = game:GetService("Players").LocalPlayer
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Criando GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "HydroxideMenu"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", mainFrame)
title.Text = "Hydroxide • 99 Dias"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(200, 200, 200)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Botão para Fly
local flyEnabled = false
local flySpeed = 50

local flyBtn = Instance.new("TextButton", mainFrame)
flyBtn.Text = "Fly: Off"
flyBtn.Size = UDim2.new(0.9, 0, 0, 35)
flyBtn.Position = UDim2.new(0.05, 0, 0.3, 0)
flyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
flyBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0, 6)

-- Fechar
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Text = "Fechar"
closeBtn.Size = UDim2.new(0.9, 0, 0, 35)
closeBtn.Position = UDim2.new(0.05, 0, 0.6, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
closeBtn.TextColor3 = Color3.fromRGB(220, 220, 220)
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

-- Função de fly
local bodyGyro, bodyVelocity

local function setupFly()
    local char = player.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.P = 9e4
    bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bodyGyro.CFrame = char.HumanoidRootPart.CFrame
    bodyGyro.Parent = char.HumanoidRootPart

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0,0,0)
    bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    bodyVelocity.Parent = char.HumanoidRootPart

    runService:BindToRenderStep("Fly", Enum.RenderPriority.Character.Value, function()
        local cam = workspace.CurrentCamera.CFrame
        local moveDir = Vector3.new()
        if uis:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.LookVector end
        if uis:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.RightVector end
        if uis:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.RightVector end
        bodyVelocity.Velocity = moveDir.Unit * flySpeed
        bodyGyro.CFrame = CFrame.new(char.HumanoidRootPart.Position, char.HumanoidRootPart.Position + cam.LookVector)
    end)
end

local function disableFly()
    runService:UnbindFromRenderStep("Fly")
    if bodyGyro then bodyGyro:Destroy() end
    if bodyVelocity then bodyVelocity:Destroy() end
end

-- Conexões dos botões
flyBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    if flyEnabled then
        setupFly()
        flyBtn.Text = "Fly: On"
        flyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
    else
        disableFly()
        flyBtn.Text = "Fly: Off"
        flyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    if flyEnabled then disableFly() end
    gui:Destroy()
end)
