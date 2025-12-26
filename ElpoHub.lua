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
keyFrame.BackgroundColor3 = Color3.fromRGB(255, 105, 180) -- pink
keyFrame.BorderSizePixel = 0
keyFrame.Parent = keyGui

-- Key TextBox
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 250, 0, 50)
keyBox.Position = UDim2.new(0.5, -125, 0.3, 0)
keyBox.PlaceholderText = "Enter Key Here"
keyBox.ClearTextOnFocus = true
keyBox.TextScaled = true
keyBox.Parent = keyFrame

-- Submit Button
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0, 150, 0, 50)
submitBtn.Position = UDim2.new(0.5, -75, 0.65, 0)
submitBtn.Text = "Submit"
submitBtn.TextScaled = true
submitBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.Parent = keyFrame

-- Key Validation
submitBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        keyGui:Destroy()
        -- ✅ Key correct, load main Elpo Hub here
        print("Key accepted! Elpo Hub loading
