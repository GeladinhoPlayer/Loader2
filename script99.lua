local player = game.Players.LocalPlayer
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
local Window = OrionLib:MakeWindow({
  Name = "99 Dias Na Floresta",
  HidePremium = false,
  SaveConfig = true,
  ConfigFolder = "OrionTest"
})

-- 📂 Aba ESP
local TabESP = Window:MakeTab({Name = "ESP", Icon = "rbxassetid://4483345998"})
local SecESP = TabESP:AddSection({Name = "Configurações de ESP"})

local ESPEnabled, BoxESP, NameESP, DistanceESP = false, false, false, false
local BoxColor = Color3.new(1, 0, 0)
local RunService = game:GetService("RunService")

-- Cria ESP para cada player
local function CreatePlayerESP(target)
  if target == player then return end
  local char = target.Character or target.CharacterAdded:Wait()
  local hrp = char:WaitForChild("HumanoidRootPart")

  local nameTxt = Drawing.new("Text")
  local box = Drawing.new("Square")
  local distTxt = Drawing.new("Text")

  RunService.RenderStepped:Connect(function()
    local cam = workspace.CurrentCamera
    local pos, onScreen = cam:WorldToViewportPoint(hrp.Position)
    if ESPEnabled and onScreen then
      -- Nome
      nameTxt.Visible = NameESP
      nameTxt.Text = target.Name
      nameTxt.Color = BoxColor
      nameTxt.Position = Vector2.new(pos.X, pos.Y - 40)

      -- Caixa
      box.Visible = BoxESP
      box.Color = BoxColor
      box.Thickness = 2
      local size = 2000 / pos.Z
      box.Size = Vector2.new(size, size)
      box.Position = Vector2.new(pos.X - size / 2, pos.Y - size / 2)

      -- Distância
      distTxt.Visible = DistanceESP
      distTxt.Text = math.floor((cam.CFrame.Position - hrp.Position).Magnitude).."m"
      distTxt.Color = BoxColor
      distTxt.Position = Vector2.new(pos.X, pos.Y + 40)
    else
      nameTxt.Visible = box.Visible and false
      box.Visible = box.Visible and false
      distTxt.Visible = distTxt.Visible and false
    end
  end)
end

for _, pl in ipairs(game.Players:GetPlayers()) do
  CreatePlayerESP(pl)
end
game.Players.PlayerAdded:Connect(CreatePlayerESP)

SecESP:AddToggle({Name = "Ativar ESP", Callback = function(v) ESPEnabled = v end})
SecESP:AddToggle({Name = "Box ESP", Callback = function(v) BoxESP = v end})
SecESP:AddToggle({Name = "Name ESP", Callback = function(v) NameESP = v end})
SecESP:AddToggle({Name = "Distância ESP", Callback = function(v) DistanceESP = v end})
SecESP:AddColorpicker({Name = "Cor da ESP", Default = BoxColor, Callback = function(c) BoxColor = c end})

-- 📂 Aba Auto-Kill com Machado
local TabKill = Window:MakeTab({Name = "Auto Kill", Icon = "rbxassetid://4483345998"})
local SecKill = TabKill:AddSection({Name = "Configurações Auto-Kill"})

local AutoKill = false
local maxDist = 10

SecKill:AddToggle({Name = "Ativar Auto-Kill", Default = false, Callback = function(v) AutoKill = v end})
SecKill:AddSlider({Name = "Alcance (studs)", Min = 5, Max = 50, Default = 10, Increment = 1, Suffix = " stud", Callback = function(v) maxDist = v end})

RunService.Heartbeat:Connect(function()
  if not (AutoKill and player.Character and player.Character:FindFirstChild("HumanoidRootPart")) then return end
  local root = player.Character.HumanoidRootPart
  for _, mob in ipairs(workspace:GetDescendants()) do
    if mob:IsA("Model") and mob:FindFirstChild("Humanoid") and mob:FindFirstChild("HumanoidRootPart") then
      local dist = (mob.HumanoidRootPart.Position - root.Position).Magnitude
      if dist <= maxDist then
        local cd = mob:FindFirstChildWhichIsA("ClickDetector")
        if cd then
          fireclickdetector(cd)
        else
          mob.Humanoid:TakeDamage(9999)
        end
      end
    end
  end
end)

-- Notificação de carregamento
OrionLib:MakeNotification({
  Name = "Carregado!",
  Content = "ESP e Auto-Kill ativos.",
  Image = "rbxassetid://4483345998",
  Time = 5
})
