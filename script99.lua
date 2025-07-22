-- Carregar OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()

-- Criar janela principal
local Window = OrionLib:MakeWindow({
    Name = "99 Dias na Floresta",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "99DiasNaFloresta",
    IntroEnabled = false, -- Desativar introdução
    Icon = "rbxassetid://4483345998"
})

-- Aba "Menu"
local TabMenu = Window:MakeTab({
    Name = "Menu",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Seção "Créditos"
local SectionCreditos = TabMenu:AddSection({
    Name = "Créditos"
})

SectionCreditos:AddLabel("Desenvolvedor: GeladinhoPlayer")
SectionCreditos:AddLabel("Base: ScriptHub")

-- Aba "ESP"
local TabESP = Window:MakeTab({
    Name = "ESP",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SectionESP = TabESP:AddSection({
    Name = "Configurações de ESP"
})

local ESPEnabled = false
local BoxESP = false
local NameESP = false
local DistanceESP = false
local BoxColor = Color3.fromRGB(255, 0, 0)

SectionESP:AddToggle({
    Name = "Ativar ESP",
    Default = false,
    Callback = function(Value)
        ESPEnabled = Value
    end
})

SectionESP:AddToggle({
    Name = "Box ESP",
    Default = false,
    Callback = function(Value)
        BoxESP = Value
    end
})

SectionESP:AddToggle({
    Name = "Name ESP",
    Default = false,
    Callback = function(Value)
        NameESP = Value
    end
})

SectionESP:AddToggle({
    Name = "Distância ESP",
    Default = false,
    Callback = function(Value)
        DistanceESP = Value
    end
})

SectionESP:AddColorpicker({
    Name = "Cor da ESP",
    Default = BoxColor,
    Callback = function(Value)
        BoxColor = Value
    end
})

-- Aba "Auto Kill"
local TabAutoKill = Window:MakeTab({
    Name = "Auto Kill",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SectionAutoKill = TabAutoKill:AddSection({
    Name = "Configurações de Auto Kill"
})

local AutoKillEnabled = false
local KillDistance = 10

SectionAutoKill:AddToggle({
    Name = "Ativar Auto Kill",
    Default = false,
    Callback = function(Value)
        AutoKillEnabled = Value
    end
})

SectionAutoKill:AddSlider({
    Name = "Distância de Ataque",
    Min = 5,
    Max = 50,
    Default = 10,
    Increment = 1,
    Suffix = " studs",
    Callback = function(Value)
        KillDistance = Value
    end
})

-- Aba "Extras"
local TabExtras = Window:MakeTab({
    Name = "Extras",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SectionExtras = TabExtras:AddSection({
    Name = "Funcionalidades Adicionais"
})

SectionExtras:AddButton({
    Name = "Ativar Super Velocidade",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 500
    end
})

SectionExtras:AddButton({
    Name = "Ativar Super Pulo",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
    end
})

SectionExtras:AddButton({
    Name = "Ativar Gravidade Baixa",
    Callback = function()
        game.Workspace.Gravity = 10
    end
})

-- Aba "Configurações"
local TabConfig = Window:MakeTab({
    Name = "Configurações",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SectionConfig = TabConfig:AddSection({
    Name = "Configurações Gerais"
})

SectionConfig:AddButton({
    Name = "Salvar Configurações",
    Callback = function()
        OrionLib:SaveConfig()
    end
})

SectionConfig:AddButton({
    Name = "Carregar Configurações",
    Callback = function()
        OrionLib:LoadConfig()
    end
})

SectionConfig:AddButton({
    Name = "Resetar Configurações",
    Callback = function()
        OrionLib:ResetConfig()
    end
})

-- Aba "Ajuda"
local TabAjuda = Window:MakeTab({
    Name = "Ajuda",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SectionAjuda = TabAjuda:AddSection({
    Name = "Instruções"
})

SectionAjuda:AddLabel("1. Ative o ESP para visualizar jogadores, mobs e itens.")
SectionAjuda:AddLabel("2. Use o Auto Kill para eliminar mobs automaticamente.")
SectionAjuda:AddLabel("3. Ajuste as configurações conforme necessário.")
SectionAjuda:AddLabel("4. Consulte os créditos para mais informações.")

-- Aba "Desenvolvedor"
local TabDesenvolvedor = Window:MakeTab({
    Name = "Desenvolvedor",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SectionDesenvolvedor = TabDesenvolvedor:AddSection({
    Name = "Ferramentas do Desenvolvedor"
})

SectionDesenvolvedor:AddButton({
    Name = "Executar Código Personalizado",
    Callback = function()
        local código = OrionLib:PromptInput({
            Title = "Código Lua",
            Default = "",
            Placeholder = "Digite seu código Lua aqui"
        })
        if código then
            loadstring(código)()
        end
    end
})

-- Função para atualizar o ESP
local function AtualizarESP()
    -- Código para atualizar o ESP com base nas configurações
end

-- Função para ativar o Auto Kill
local function AtivarAutoKill()
    -- Código para ativar o Auto Kill com base nas configurações
end

-- Função para atualizar as funcionalidades extras
local function AtualizarExtras()
    -- Código para atualizar as funcionalidades extras com base nas configurações
end

-- Atualizar o ESP, Auto Kill e Extras sempre que as configurações forem alteradas
OrionLib:OnConfigChanged(function()
    AtualizarESP()
    AtivarAutoKill()
    AtualizarExtras()
end)

-- Inicializar as funcionalidades
AtualizarESP()
AtivarAutoKill()
AtualizarExtras()
