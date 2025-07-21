-- loader.lua
local scriptUrl = "https://raw.githubusercontent.com/GeladinhoPlayer/Loader2/main/script99.lua"
local loaded, err = loadstring(game:HttpGet(scriptUrl, true))

if loaded then
    loaded()
else
    warn("Erro ao carregar o script:", err)
end
