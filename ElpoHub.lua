-- =========================
-- Elpo Hub (FIXED)
-- Whitelist + Key + GUI
-- =========================

-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- =========================
-- Whitelist
-- =========================
local Whitelist = {
    "Elposadi"
}

local function isWhitelisted(name)
    for _, v in ipairs(Whitelist) do
        if string.lower(name) == string.lower(v) then
            return true
        end
    end
    return false
end

-- Whitelist check
if not isWhitelisted(player.Name) and not isWhitelisted(player.DisplayName) then
    player:Kick("❌ You are not whitelisted for Elpo Hub")
    return
end

-- =========================
-- Key System
-- =========================
local CORRECT_KEY = "Elpo-1"

-- Remove old GUIs if re-execut
