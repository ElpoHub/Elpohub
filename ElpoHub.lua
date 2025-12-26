-- =========================
-- ELPO HUB
-- =========================
warn("ELPO HUB STARTED")

-- =========================
-- Services
-- =========================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- =========================
-- Whitelist
-- =========================
local Whitelist = {
    "Elposadi"
}

local function isWhitelisted(username)
    for _, name in ipairs(Whitelist) do
        if username:lower() == name:lower() then
            return true
        end
    end
    return false
end

if not isWhitelisted(player.Name) then
    player:Kick("You are not whitelisted")
    return
end

-- =========================
-- Character
-- =========================
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

-- =========================
-- GUI
-- =========================
local gui = Instance.new("Screen
