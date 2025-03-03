local Main = Instance.new("ScreenGui")
local bg = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Toggle = Instance.new("TextButton")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local Size = Instance.new("TextBox")
local TextLabel_3 = Instance.new("TextLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")

Main.Name = "Main"
Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

bg.Name = "bg"
bg.Parent = Main
bg.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
bg.BorderSizePixel = 0
bg.Position = UDim2.new(0.148112312, 0, 0.350746274, 0)
bg.Size = UDim2.new(0.19731921, 0, 0.323383093, 0)

Frame.Parent = bg
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.750
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0370373055, 0, 0.02734375, 0)
Frame.Size = UDim2.new(0.938461483, 0, 0.941798925, 0)

Toggle.Name = "Toggle"
Toggle.Parent = bg
Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.0985755697, 0, 0.148147941, 0)
Toggle.Size = UDim2.new(0.104619458, 0, 0.0855447203, 0)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = ""
Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
Toggle.TextSize = 14.000

Frame_2.Parent = bg
Frame_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.0307687148, 0, 0.100529097, 0)
Frame_2.Size = UDim2.new(0.96762687, 0, 0.0105820103, 0)

TextLabel.Parent = bg
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.27692309, 0, 0.02734375, 0)
TextLabel.Size = UDim2.new(0.360488445, 0, 0.0687830672, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "x.cc - hitbox expander"
TextLabel.TextColor3 = Color3.fromRGB(213, 213, 213)
TextLabel.TextSize = 12.000
TextLabel.TextStrokeTransparency = 0.790
TextLabel.TextWrapped = true

TextLabel_2.Parent = bg
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.146244168, 0, 0.162976667, 0)
TextLabel_2.Size = UDim2.new(0.360488445, 0, 0.0687830672, 0)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Enable"
TextLabel_2.TextColor3 = Color3.fromRGB(213, 213, 213)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextStrokeTransparency = 0.790
TextLabel_2.TextWrapped = true

Size.Name = "Size"
Size.Parent = bg
Size.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Size.BorderColor3 = Color3.fromRGB(0, 0, 0)
Size.Position = UDim2.new(0.0876541287, 0, 0.371706814, 0)
Size.Size = UDim2.new(0.549757361, 0, 0.0889703184, 0)
Size.Font = Enum.Font.SourceSans
Size.Text = ""
Size.TextColor3 = Color3.fromRGB(0, 0, 0)
Size.TextSize = 14.000

TextLabel_3.Parent = bg
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.177841634, 0, 0.302923709, 0)
TextLabel_3.Size = UDim2.new(0.360488445, 0, 0.0687830672, 0)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Size"
TextLabel_3.TextColor3 = Color3.fromRGB(213, 213, 213)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextStrokeTransparency = 0.790
TextLabel_3.TextWrapped = true

UIAspectRatioConstraint.Parent = bg
UIAspectRatioConstraint.AspectRatio = 0.837

local function ToggleScript()
	local script = Instance.new('LocalScript', Toggle)
	local HeadSize = 20
	local IsDisabled = true
	local IsTeamCheckEnabled = false
	local button = script.Parent
	local sizeTextBox = script.Parent.Parent:FindFirstChild("Size")
	
	button.MouseButton1Click:Connect(function()
		IsDisabled = not IsDisabled
		
		if IsDisabled then
			button.Text = "Enable Script"
			button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		else
			button.Text = "Disable Script"
			button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		end
	end)
	
	game:GetService('RunService').RenderStepped:Connect(function()
		if not IsDisabled then
			local localPlayer = game:GetService('Players').LocalPlayer
			if not localPlayer then return end
	
			local localPlayerTeam = localPlayer.Team
			local sizeInput = tonumber(sizeTextBox.Text)
			if sizeInput then
				HeadSize = sizeInput
			else
				HeadSize = 20
			end
	
			for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
				if player ~= localPlayer and (not IsTeamCheckEnabled or player.Team ~= localPlayerTeam) then
					local character = player.Character
					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if humanoidRootPart then
							humanoidRootPart.Size = Vector3.new(HeadSize, HeadSize, HeadSize)
							humanoidRootPart.Transparency = 0.7
							humanoidRootPart.BrickColor = BrickColor.new(Color3.fromRGB(255, 182, 193))
							humanoidRootPart.Material = Enum.Material.SmoothPlastic
							humanoidRootPart.CanCollide = false
						end
					end
				end
			end
		end
	end)
end
coroutine.wrap(ToggleScript)()

local function MainScript()
	local script = Instance.new('LocalScript', Main)
	local player = game.Players.LocalPlayer
	local screenGui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
	local frameName = "bg"
	
	local function createFrameIfNeeded()
		local frame = screenGui:FindFirstChild(frameName)
		if not frame then
			frame = Instance.new("Frame")
			frame.Name = frameName
			frame.Parent = screenGui
			frame.Size = UDim2.new(0, 200, 0, 200)
			frame.Position = UDim2.new(0.5, -100, 0.5, -100)
			frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			frame.Visible = true
		end
		return frame
	end
	
	local function keepFrameVisible()
		local frame = createFrameIfNeeded()
		frame.Visible = true
	end
	
	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("Humanoid").Died:Connect(function()
			wait(0.5)
			keepFrameVisible()
		end)
		keepFrameVisible()
	end)
	
	keepFrameVisible()
end
coroutine.wrap(MainScript)()
