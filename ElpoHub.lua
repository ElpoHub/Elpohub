-- =========================
-- Elpo Hub – Key System (WORKING)
-- =========================

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local CORRECT_KEY = "ELPO-1"

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "ElpoKeyGui"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.35, 0.25)
frame.Position = UDim2.fromScale(0.325, 0.35)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1,0.25)
title.BackgroundTransparency = 1
title.Text = "Elpo Hub Key System"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local box = Instance.new("TextBox", frame)
box.PlaceholderText = "Enter Key"
box.Size = UDim2.fromScale(0.8,0.25)
box.Position = UDim2.fromScale(0.1,0.35)
box.TextScaled = true
box.Font = Enum.Font.Gotham
box.BackgroundColor3 = Color3.fromRGB(40,40,40)
box.TextColor3 = Color3.new(1,1,1)

local boxCorner = Instance.new("UICorner", box)
boxCorner.CornerRadius = UDim.new(0,8)

local button = Instance.new("TextButton", frame)
button.Text = "Submit"
button.Size = UDim2.fromScale(0.5,0.22)
button.Position = UDim2.fromScale(0.25,0.68)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.BackgroundColor3 = Color3.fromRGB(70,70,70)
button.TextColor3 = Color3.new(1,1,1)

local btnCorner = Instance.new("UICorner", button)
btnCorner.CornerRadius = UDim.new(0,8)

-- Key check
button.MouseButton1Click:Connect(function()
	if box.Text == CORRECT_KEY then
		gui:Destroy()
		print("Key accepted – load hub here")
	else
		box.Text = ""
		box.PlaceholderText = "Wrong key"
	end
end)
