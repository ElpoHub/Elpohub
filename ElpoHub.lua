-- Main Elpo Hub GUI
            local mainGui = Instance.new("ScreenGui")
            mainGui.Name = "ElpoHubGUI"
            mainGui.Parent = playerGui
            mainGui.ResetOnSpawn = false

            local mainFrame = Instance.new("Frame")
            mainFrame.Size = UDim2.new(0, 400, 0, 300)
            mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
            mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            mainFrame.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
            mainFrame.BorderSizePixel = 0
            mainFrame.Parent = mainGui

            local mainTitle = Instance.new("TextLabel")
            mainTitle.Size = UDim2.new(1, 0, 0, 50)
            mainTitle.Position = UDim2.new(0, 0, 0, 0)
            mainTitle.BackgroundTransparency = 1
            mainTitle.Text = "Welcome to Elpo Hub!"
            mainTitle.Font = Enum.Font.SourceSansBold
            mainTitle.TextSize = 24
            mainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            mainTitle.Parent = mainFrame

            -- You can add more buttons and features here for your hub
        end)

    else
        player:Kick("Wrong key entered.")
    end
end)
