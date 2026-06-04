-- =============================================
-- Brainrot Teleport Hub
-- Author: vivivilka
-- =============================================

local Players = game:GetService("Players")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

-- === TELEPORT LOCATIONS ===
local pos1 = Vector3.new(1, 3, -11)      -- Spawn
local pos2 = Vector3.new(40, 3, 9993)    -- Brain God Spawn
local pos3 = Vector3.new(40, 3, 6149)    -- Cosmic Zone
local pos4 = Vector3.new(40, 3, 4026)    -- Celestial Zone

local function TeleportTo(position, locationName)
    if root and root.Parent then
        root.CFrame = CFrame.new(position + Vector3.new(0, 5, 0))
        Rayfield:Notify({
            Title = "Teleport",
            Content = "Teleported to: " .. locationName,
            Duration = 3,
        })
    end
end

-- Update root on respawn
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    root = character:WaitForChild("HumanoidRootPart")
end)

-- ==================== GUI ====================
local Window = Rayfield:CreateWindow({
    Name = "Brainrot Teleport Hub",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by vivivilka",
    ConfigurationSaving = { Enabled = false },
})

local Tab = Window:CreateTab("Teleports", 4483362458)

Tab:CreateButton({
    Name = "→ Spawn",
    Callback = function() TeleportTo(pos1, "Spawn") end,
})

Tab:CreateButton({
    Name = "→ Brain God Spawn",
    Callback = function() TeleportTo(pos2, "Brain God Spawn") end,
})

Tab:CreateButton({
    Name = "→ Cosmic Zone",
    Callback = function() TeleportTo(pos3, "Cosmic Zone") end,
})

Tab:CreateButton({
    Name = "→ Celestial Zone",
    Callback = function() TeleportTo(pos4, "Celestial Zone") end,
})

print("✅ Brainrot Teleport Hub loaded successfully!")
