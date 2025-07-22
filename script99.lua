-- Carrega a Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/Source.lua"))()

-- Função para criar o menu principal
local function createMainMenu()
    local Window = OrionLib:MakeWindow({
        Name = "LightScripts - Menu Principal",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "LightScripts"
    })

    -- Aba de Voo
    local FlyTab = Window:MakeTab({
        Name = "Voo",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Variáveis para o sistema de voo
    local flyEnabled = false
    local flySpeed = 50
    local bodyGyro, bodyVelocity

    -- Função para ativar o voo
    local function setupFly()
        local char = game.Players.LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        bodyGyro = Instance.new("BodyGyro", char.HumanoidRootPart)
        bodyGyro.P = 9e4
        bodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        bodyVelocity = Instance.new("BodyVelocity", char.HumanoidRootPart)
        bodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        game:GetService("RunService"):BindToRenderStep("Fly", Enum.RenderPriority.Character.Value, function()
            local cam = workspace.CurrentCamera.CFrame
            local move = Vector3.new()
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then move += cam.LookVector end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then move -= cam.LookVector end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then move -= cam.RightVector end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then move += cam.RightVector end
            if move.Magnitude > 0 then
                bodyVelocity.Velocity = move.Unit * flySpeed
                bodyGyro.CFrame = CFrame.new(char.HumanoidRootPart.Position, char.HumanoidRootPart.Position + cam.LookVector)
            else
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
        end)
    end

    -- Função para desativar o voo
    local function disableFly()
        game:GetService("RunService"):UnbindFromRenderStep("Fly")
        if bodyGyro then bodyGyro:Destroy() end
        if bodyVelocity then bodyVelocity:Destroy() end
    end

    -- Toggle para ativar/desativar o voo
    FlyTab:AddToggle({
        Name = "Ativar Voo",
        Default = false,
        Callback = function(value)
            flyEnabled = value
            if flyEnabled then setupFly() else disableFly() end
        end
    })

    -- Slider para ajustar a velocidade do voo
    FlyTab:AddSlider({
        Name = "Velocidade do Voo",
        Min = 10,
        Max = 200,
        Default = 50,
        Increment = 10,
        Suffix = " studs/s",
        Callback = function(v)
            flySpeed = v
        end
    })

    -- Fechar o menu
    FlyTab:AddButton({
        Name = "Fechar Menu",
        Callback = function()
            if flyEnabled then disableFly() end
            OrionLib:Destroy()
        end
    })
end

-- Chama a função para criar o menu principal
createMainMenu()

-- Inicializa a Orion Library
OrionLib:Init()
