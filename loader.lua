-- loader.lua

-- Créditos
game.StarterGui:SetCore("SendNotification", {
    Title = "🧠 Executor por GeladinhoPlayer";
    Text = "Criador do script: GeladinhoPlayer";
    Duration = 5;
})

print("✅ Script Executor por: GeladinhoPlayer")
print("⏳ Carregando o menu...")

-- Aguarda 3 segundos antes de carregar o menu
task.wait(3)

-- Carrega o menu/script principal
local scriptUrl = "https://raw.githubusercontent.com/GeladinhoPlayer/Loader2/main/script99.lua"
local loaded, err = loadstring(game:HttpGet(scriptUrl, true))

if loaded then
    loaded()
else
    warn("Erro ao carregar o script:", err)
end
