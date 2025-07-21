# Roblox Script Executor - Loader

Este projeto é um loader simples para executar scripts personalizados no Roblox, carregando arquivos diretamente do GitHub usando `loadstring` e `HttpGet`.

---

## Sobre o Projeto

Este loader facilita o carregamento de scripts para Roblox sem a necessidade de copiar e colar códigos longos manualmente. Basta executar o comando e o script será baixado e rodado automaticamente.

O foco aqui é criar uma plataforma simples para você carregar seus scripts favoritos com facilidade e atualizar sempre que quiser, mantendo tudo no GitHub.

---

## Como Usar

1. Abra seu executor de scripts no Roblox (como Synapse, Krnl, Fluxus, etc).

2. Cole o comando abaixo no executor e execute:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/GeladinhoPlayer/Loader2/main/loader.lua?nocache=" .. tostring(tick()), true))()
