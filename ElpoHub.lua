-- =========================
-- Elpo Hub with Whitelist & Key System
-- =========================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- =========================
-- Whitelist
-- =========================
local whitelist = {
    "Elposadi"
}

local function isWhitelisted(name)
    name = name:lower()
    for _, v in pairs(whitelist) do
        if name == v:lower() then
            return true
        end
    end
    return false
end

if not isWhitelisted(player.Name) then
    player:Kick("You are not whitelisted for Elpo Hub.")
    return
end

-- =========================
-- Key System
-- =========================
local correctKey = "ELPO-1"

local function promptKey()
    local input = player:PromptInput("Enter Elpo Hub Key", "")
    if input ~= correctKey then
        player:Kick("Wrong key entered.")
        return false
    end
    return true
end

if not promptKey() then
    return
end

-- =========================
-- GUI Creation
-- =========================
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ElpoHubGUI"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(255, 105, 180) -- Pink color
frame.BorderSizePixel = 0
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Welcome to Elpo Hub!"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame
