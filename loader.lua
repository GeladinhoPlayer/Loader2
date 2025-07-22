-- Carrega a Orion Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/Source.lua"))()

-- Função para criar o painel de key
local function createKeyPanel()
    local Window = OrionLib:MakeWindow({
        Name = "LightScripts - Acesso Restrito",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "LightScripts"
    })

    -- Aba de entrada de chave
    local KeyTab = Window:MakeTab({
        Name = "Acesso",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Variável para armazenar a chave inserida
    local KeyInput = ""

    -- Caixa de texto para inserção da chave
    KeyTab:AddTextbox({
        Name = "Digite a chave de acesso",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
            KeyInput = Value
        end
    })

    -- Função para verificar a chave
    local function checkKey()
        if KeyInput == "LightIsPower" then
            OrionLib:MakeNotification({
                Name = "Acesso Concedido",
                Content = "Bem-vindo ao LightScripts!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            -- Carrega o painel principal
            loadstring(game:HttpGet("https://raw.githubusercontent.com/GeladinhoPlayer/Loader2/refs/heads/main/script99.lua"))()
            Window:Destroy()
        else
            OrionLib:MakeNotification({
                Name = "Acesso Negado",
                Content = "Chave inválida. Tente novamente.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end

    -- Botão para verificar a chave
    KeyTab:AddButton({
        Name = "Verificar Chave",
        Callback = function()
            checkKey()
        end
    })
end

-- Chama a função para criar o painel de key
createKeyPanel()

-- Inicializa a Orion Library
OrionLib:Init()
