-- ⛔ Anti-Erro: Define LocalPlayer no início
local player = game.Players.LocalPlayer

-- 📦 Carrega OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()

-- 🪟 Cria janela principal
local Window = OrionLib:MakeWindow({
    Name = "99 Dias na Floresta - Geladinho",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "99DiasNaFloresta",
    IntroEnabled = false,
    Icon = "rbxassetid://4483345998"
})

-- 📌 Aba Menu e Créditos
local TabMenu = Window:MakeTab({ Name = "Menu", Icon = "rbxassetid://4483345998" })
local SectionCreditos = TabMenu:AddSection({ Name = "Créditos" })
SectionCreditos:AddLabel("Desenvolvedor: GeladinhoPlayer")
SectionCreditos:AddLabel("Base: ScriptHub")

-- ⚙️ ESP
local TabESP = Window:MakeTab({ Name = "ESP", Icon = "rbxassetid://4483345998" })
local SectionESP = TabESP:AddSection({ Name = "Configurações de ESP" })

local ESPEnabled, BoxESP, NameESP, DistanceESP = false, false, false, false
local BoxColor = Color3.fromRGB(255, 0, 0)

SectionESP:AddToggle({ Name = "Ativar ESP", Default = false, Callback = function(v) ESPEnabled = v end })
SectionESP:AddToggle({ Name = "Box ESP", Default = false, Callback = function(v) BoxESP = v end })
SectionESP:AddToggle({ Name = "Name ESP", Default = false, Callback = function(v) NameESP = v end })
SectionESP:AddToggle({ Name = "Distância ESP", Default = false, Callback = function(v) DistanceESP = v end })
SectionESP:AddColorpicker({ Name = "Cor da ESP", Default = BoxColor, Callback = function(v) BoxColor = v end })

-- ⚔️ Auto Kill
local TabAutoKill = Window:MakeTab({ Name = "Auto Kill", Icon = "rbxassetid://4483345998" })
local SectionAutoKill = TabAutoKill:AddSection({ Name = "Auto Eliminação" })

local AutoKillEnabled, KillDistance = false, 10

SectionAutoKill:AddToggle({
    Name = "Ativar Auto Kill",
    Default = false,
    Callback = function(v) AutoKillEnabled = v end
})

SectionAutoKill:AddSlider({
    Name = "Distância de Ataque",
    Min = 5, Max = 50, Default = 10, Increment = 1,
    Suffix = " studs",
    Callback = function(v) KillDistance = v end
})

-- 🔧 Extras
local TabExtras = Window:MakeTab({ Name = "Extras", Icon = "rbxassetid://4483345998" })
local SectionExtras = TabExtras:AddSection({ Name = "Funcionalidades" })

SectionExtras:AddButton({ Name = "Super Velocidade", Callback = function() player.Character.Humanoid.WalkSpeed = 500 end })
SectionExtras:AddButton({ Name = "Super Pulo", Callback = function() player.Character.Humanoid.JumpPower = 100 end })
SectionExtras:AddButton({ Name = "Gravidade Baixa", Callback = function() game.Workspace.Gravity = 10 end })

-- ⚙️ Configurações
local TabConfig = Window:MakeTab({ Name = "Configurações", Icon = "rbxassetid://4483345998" })
local SectionConfig = TabConfig:AddSection({ Name = "Ajustes" })

SectionConfig:AddButton({ Name = "Salvar", Callback = function() OrionLib:SaveConfig() end })
SectionConfig:AddButton({ Name = "Carregar", Callback = function() OrionLib:LoadConfig() end })
SectionConfig:AddButton({ Name = "Resetar", Callback = function() OrionLib:ResetConfig() end })

-- ❓ Ajuda
local TabAjuda = Window:MakeTab({ Name = "Ajuda", Icon = "rbxassetid://4483345998" })
local SectionAjuda = TabAjuda:AddSection({ Name = "Instruções" })

SectionAjuda:AddLabel("1. Use o ESP para ver inimigos.")
SectionAjuda:AddLabel("2. Auto Kill ataca inimigos automaticamente.")
SectionAjuda:AddLabel("3. Extras melhoram sua movimentação.")
SectionAjuda:AddLabel("4. Configurações podem ser salvas.")

-- 👨‍💻 Desenvolvedor
local TabDev = Window:MakeTab({ Name = "Dev", Icon = "rbxassetid://4483345998" })
local SectionDev = TabDev:AddSection({ Name = "Execução" })

SectionDev:AddButton({
    Name = "Executar código manual",
    Callback = function()
        local success, code = pcall(function()
            return OrionLib:PromptInput({
                Title = "Executar Lua",
                Placeholder = "Digite o código aqui"
            })
        end)
        if success and code and code ~= "" then
            pcall(loadstring(code))
        end
    end
})

-- 🚨 Loop de Auto Kill
task.spawn(function()
    while task.wait(1) do
        if AutoKillEnabled then
            for _, enemy in pairs(workspace:GetDescendants()) do
                if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy ~= player.Character then
                    local humanoid = enemy:FindFirstChild("Humanoid")
                    if (enemy.PrimaryPart and player.Character.PrimaryPart and (enemy.PrimaryPart.Position - player.Character.PrimaryPart.Position).Magnitude <= KillDistance) then
                        humanoid:TakeDamage(100)
                    end
                end
            end
        end
    end
end)

-- ℹ️ Você pode adaptar esse loop para armas como machado ou ferramentas.
