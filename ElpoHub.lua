-- =========================
-- Key System
-- =========================
local correctKey = "Elpo-1"

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Prompt the player to enter the key
local playerKey
repeat
    playerKey = player:PromptInput("Enter the key to access the hub:", "")
    if playerKey == nil then
        -- If they cancel, keep asking
        warn("Key entry canceled. Please enter the key.")
    elseif playerKey ~= correctKey then
        -- Wrong key
        warn("Wrong key! Try again.")
    end
until playerKey == correctKey

print("Key accepted! Access granted.")
