-- =========================
-- Elpo Hub – Key & Whitelist (FIXED)
-- =========================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- =========================
-- Whitelist
-- =========================
local Whitelist = {
    ["Elposadi"] = true
}

local isWhitelisted =
    Whitelist[player.Name] or
    Whitelist[player.DisplayName]

-- =========================
-- Key System (ONLY for non-whitelisted)
-- =========================
local CORRECT_KEY = "Elpo-hub"

if not isWhitelisted then
    -- Simple key input GUI
    local keyGui = Instance.new("ScreenGui")
    keyGui.Name = "ElpoKeyGui"
    keyGui.ResetOnSpawn = false
    keyGui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame", keyGui)
    frame.Size = UDim2.new(0, 260, 0, 140)
    frame.Position = UDim2.new(0.5, -130, 0.5, -70)
    frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1,0,0,35)
    title.Text = "Enter Elpo Hub Key"
    title.TextColor3 = Color3.fromRGB(255,255,0)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 16
    title.BackgroundTransparency = 1

    local box = Instance.new("TextBox", frame)
    box.Position = UDim2.new(0.1,0,0.35,0)
    box.Size = UDim2.new(0.8,0,0,35)
    box.PlaceholderText = "Key here..."
    box.Text = ""
    box.TextColor3 = Color3.new(1,1,1)
    box.BackgroundColor3 = Color3.fromRGB(30,30,30)
    box.ClearTextOnFocus = false
    Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)

    local submit = Instance.new("TextButton", frame)
    submit.Position = UDim2.new(0.25,0,0.7,0)
    submit.Size = UDim2.new(0.5,0,0,30)
    submit.Text = "Submit"
    submit.Font = Enum.Font.GothamBold
    submit.TextSize = 14
    submit.TextColor3 = Color3.fromRGB(0,0,0)
    submit.BackgroundColor3 = Color3.fromRGB(255,255,0)
    Instance.new("UICorner", submit).CornerRadius = UDim.new(0,8)

    submit.MouseButton1Click:Connect(function()
        if box.Text == CORRECT_KEY then
            keyGui:Destroy()
        else
            player:Kick("Wrong key")
        end
    end)

    -- STOP SCRIPT until key is correct
    repeat task.wait() until not keyGui.Parent
end

-- =========================
-- HUB GUI (Runs for ALL allowed users)
-- =========================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ElpoHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 220, 0, 240)
Frame
