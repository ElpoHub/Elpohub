-- =========================
-- Elpo Hub with Whitelist & Key System
-- =========================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- =========================
-- Whitelist Check
-- =========================
local Whitelist = {
    "Elposadi",  -- add more names if needed
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

-- Kick if not whitelisted
if not isWhitelisted(player.Name) then
    player:Kick("You are not whitelisted!")
    return
end

-- =========================
-- Key System
-- =========================
local correctKey = "Elpo-1"

local success, playerKey = pcall(function()
    return player:PromptInput("Enter Key:")
end)

-- Validate key
if not success or not playerKey or playerKey:lower() ~= correctKey:lower() then
    player:Kick("Wrong key entered!")
    return
end

-- =========================
-- GUI or main script code here
-- =========================
print("Welcome! Key accepted and whitelisted.")
-- Place your GUI code below this line
