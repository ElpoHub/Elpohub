-- =========================
-- Elpo Hub with Whitelist & Key System
-- =========================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- =========================
-- Whitelist Check
-- =========================
local whitelist = {"Elposadi"}

local function isWhitelisted(name)
    name = name:lower()
    for _, v in pairs(whitelist) do
        if name == v:lower() then
            return true
        end
    end
    return false
end

if not isWhitelisted(player.Name) and not isWhitelisted(player.DisplayName) then
    player:Kick("❌ Not whitelisted for Elpo Hub")
    return
end

-- =========================
-- Key System
-- =========================
local correctKey = "Elpo-1"

-- ===== Key Entry GUI =====
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "ElpoKeyGUI"
keyGui.ResetOnSpawn = false
keyGui.Parent = player:WaitForChild("PlayerGui")

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 350, 0, 200)
keyFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
keyFrame.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
keyFrame.BorderSize
