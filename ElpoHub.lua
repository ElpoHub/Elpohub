-- =========================
-- Elpo Hub – Key System (FIXED FOR REAL)
-- =========================

-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- =========================
-- CONFIG
-- =========================
local CORRECT_KEY = "Elpo-hub"

local WHITELIST = {
    ["elposadi"] = true
}

-- =========================
-- GUI CREATION
-- =========================
local ScreenGui = Instance
