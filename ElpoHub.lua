-- Script Header
-- =========================
-- Whitelist Check
-- =========================
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Whitelist = {
    "17xkxk",
}

local function isWhitelisted(name)
    name = name:lower()
    for _, v in pairs(Whitelist) do
        if name == v:lower() then
            return true
        end
    end
    return false
end

if not isWhitelisted(player.Name) and not isWhitelisted(player.DisplayName) then
    player:Kick("Not whitelisted")
    return
end

-- =========================
-- Teleport + Auto Block System
-- =========================
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local backpack = player:WaitForChild("Backpack")
