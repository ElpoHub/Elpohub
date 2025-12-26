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

-- Create GUI
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "ElpoKeyGUI"
keyGui.ResetOnSpawn = false
keyGui.Parent = player:WaitForChild("PlayerGui")

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 350, 0, 200)
keyFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
keyFrame.BackgroundColor3 = Color3.fromRGB(255, 105, 180) -- pink
keyFrame.BorderSizePixel = 0
keyFrame.Parent = keyGui

local corner = Instance.new("UICorner", keyFrame)
corner.CornerRadius = UDim.new(0, 16)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.25, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "🌸 Elpo Hub"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)
title.Parent = keyFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8, 0, 0.2, 0)
keyBox.Position = UDim2.new(0.1, 0, 0.35, 0)
keyBox.PlaceholderText = "Enter Key"
keyBox.Text = ""
keyBox.TextScaled = true
keyBox.Font = Enum.Font.Gotham
keyBox.BackgroundColor3 = Color3.fromRGB(255, 182, 193)
keyBox.TextColor3 = Color3.new(0,0,0)
keyBox.Parent = keyFrame

local btn = Instance.new("TextButton")
btn.Size = UDim2.new(0.8, 0, 0.2, 0)
btn.Position = UDim2.new(0.1, 0, 0.65, 0)
btn.Text = "Unlock"
btn.TextScaled = true
btn.Font = Enum.Font.GothamBold
btn.BackgroundColor3 = Color3.fromRGB(255, 20, 147)
btn.TextColor3 = Color3.new(1,1,1)
btn.Parent = keyFrame

-- =========================
-- KEY CHECK
-- =========================
btn.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        keyFrame:Destroy()
        warn("✅ Elpo Hub Loaded!")
        -- Place your main hub code here
    else
        player:Kick("❌ Wrong Key")
    end
end)
