-- =========================
-- Elpo Hub with Whitelist & Key System
-- =========================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")
local hrp = char:WaitForChild("HumanoidRootPart")

-- =========================
-- Whitelist Check
-- =========================
local whitelist = {"Elposadi"} -- Only this player allowed

local function isWhitelisted(name)
    name = name:lower()
    for _, v in pairs(whitelist) do
        if name == v:lower() then return true end
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
local correctKey = "Elpo-1"

local keyGui = Instance.new("ScreenGui")
keyGui.Name = "ElpoKeyGUI"
keyGui.ResetOnSpawn = false
keyGui.Parent = player:WaitForChild("PlayerGui")

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 300, 0, 150)
keyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
keyFrame.BackgroundColor3 = Color3.fromRGB(255, 192, 203) -- Pink
keyFrame.BorderSizePixel = 0
keyFrame.Parent = keyGui

local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(1, 0, 0, 50)
keyLabel.Position = UDim2.new(0, 0, 0, 0)
keyLabel.BackgroundTransparency = 1
keyLabel.Text = "Enter Key:"
keyLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
keyLabel.Font = Enum.Font.SourceSansBold
keyLabel.TextSize = 24
keyLabel.Parent = keyFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.8, 0, 0, 40)
keyBox.Position = UDim2.new(0.1, 0, 0, 50)
keyBox.PlaceholderText = "Enter Key Here"
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(0,0,0)
keyBox.BackgroundColor3 = Color3.fromRGB(255,255,255)
keyBox.Parent = keyFrame

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.5, 0, 0, 40)
submitButton.Position = UDim2.new(0.25, 0, 0, 100)
submitButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
submitButton.TextColor3 = Color3.fromRGB(255,192,203)
submitButton.Text = "Submit"
submitButton.Font = Enum.Font.SourceSansBold
submitButton.TextSize = 20
submitButton.Parent = keyFrame

-- Key validation
submitButton.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        StarterGui:SetCore("SendNotification", {Title = "Elpo Hub", Text = "Key Accepted!", Duration = 3})
        keyGui:Destroy()
        -- Continue with main GUI
        spawn(function()
            -- =========================
            -- Main Elpo Hub GUI
            -- =========================
            local ScreenGui = Instance.new("ScreenGui", player.PlayerGui)
            ScreenGui.Name = "ElpoHub"
            ScreenGui.ResetOnSpawn = false

            local Frame = Instance.new("Frame", ScreenGui)
            Frame.Size = UDim2.new(0, 220, 0, 220)
            Frame.Position = UDim2.new(0.5, -110, 0.5, -110)
            Frame.BackgroundColor3 = Color3.fromRGB(2,2,2)
            Frame.Active = true
            Frame.Draggable = true
            Frame.BorderSizePixel = 0
            Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 15)

            local Stroke = Instance.new("UIStroke", Frame)
            Stroke.Color = Color3.fromRGB(255,255,255)
            Stroke.Thickness = 1

            local Title = Instance.new("TextLabel", Frame)
            Title.Size = UDim2.new(1, -20, 0, 35)
            Title.Position = UDim2.new(0, 10, 0, 10)
            Title.Text = "Elpo Hub"
            Title.TextColor3 = Color3.new(1,1,1)
            Title.Font = Enum.Font.GothamBold
            Title.TextSize = 18
            Title.BackgroundTransparency = 1
            Title.TextXAlignment = Enum.TextXAlignment.Center

            -- Teleport Button
            local TeleportButton = Instance.new("TextButton", Frame)
            TeleportButton.Size = UDim2.new(0, 180, 0, 50)
            TeleportButton.Position = UDim2.new(0, 20, 0, 60)
            TeleportButton.Text = "Teleport"
            TeleportButton.TextColor3 = Color3.fromRGB(0,0,0)
            TeleportButton.Font =
