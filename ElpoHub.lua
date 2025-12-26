-- =========================
-- Elpo Hub – Key & Whitelist
-- =========================

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- =========================
-- Whitelist
-- =========================
local Whitelist = {
    "Elposadi"
}

local function isWhitelisted(name)
    name = name:lower()
    for _, v in ipairs(Whitelist) do
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
-- Key System
-- =========================
local correctKey = "Elpo-hub"  -- updated key

local function requestKey()
    local success, input = pcall(function()
        return player:PromptInput("Enter Elpo Hub Key:", "")
    end)
    if not success or input ~= correctKey then
        player:Kick("Wrong key!")
        return false
    end
    return true
end

if not requestKey() then return end

-- =========================
-- Character Refs
-- =========================
local function getChar()
    local char = player.Character or player.CharacterAdded:Wait()
    return char,
           char:WaitForChild("Humanoid"),
           char:WaitForChild("HumanoidRootPart")
end

local char, humanoid, hrp = getChar()
player.CharacterAdded:Connect(function()
    char, humanoid, hrp = getChar()
end)

-- =========================
-- GUI Setup
-- =========================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ElpoHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 240)
Frame.Position = UDim2.new(0.5, -110, 0.5, -120)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 14)
local Stroke = Instance.new("UIStroke", Frame)
Stroke.Color = Color3.fromRGB(255, 255, 0)
Stroke.Thickness = 1.5

-- Title
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, -20, 0, 35)
Title.Position = UDim2.new(0, 10, 0, 8)
Title.Text = "Elpo Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Center

-- Watermark
local Watermark = Instance.new("TextLabel", ScreenGui)
Watermark.Position = UDim2.new(0, 10, 0, 10)
Watermark.Size = UDim2.new(0, 200, 0, 30)
Watermark.Text = "Elpo Hub v1.0"
Watermark.TextColor3 = Color3
