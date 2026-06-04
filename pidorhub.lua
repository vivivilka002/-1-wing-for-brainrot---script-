local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- Точки телепорта
local pos1 = Vector3.new(1, 3, -11)
local pos2 = Vector3.new(40, 3, 9993)
local pos3 = Vector3.new(40, 3, 6149)
local pos4 = Vector3.new(40, 3, 4026)

local function TeleportTo(position)
    if root and root.Parent then
        root.CFrame = CFrame.new(position + Vector3.new(0, 5, 0))
        print("✅ Телепорт →", position)
    else
        print("❌ RootPart не найден")
    end
end

-- Обновление root при респавне
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    root = character:WaitForChild("HumanoidRootPart")
end)

local Window = Rayfield:CreateWindow({
    Name = "pidarasy228",
    LoadingTitle = "wait pls",
    LoadingSubtitle = "by vivivilka-zar1fcik",
})

local Tab = Window:CreateTab("Телепорты", 4483362458)  

Tab:CreateButton({
    Name = "teleport to spawn",
    Callback = function()
        TeleportTo(pos1)
    end,
})

Tab:CreateButton({
    Name = "teleport to brain god spawn loction",
    Callback = function()
        TeleportTo(pos2)
    end,
})
Tab:CreateButton({
    Name = "teleport to cosmic zone",
    Callback = function()
        TeleportTo(pos3)
    end,
})
Tab:CreateButton({
    Name = "teleport to celestial zone",
    Callback = function()
        TeleportTo(pos4)
    end,
})
