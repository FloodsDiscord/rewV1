-- Gui to Lua
-- Version: 3.2

-- Instances:

local MyGui = Instance.new("ScreenGui")
local BackGround = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local Aimbot = Instance.new("TextButton")
local Esp = Instance.new("TextButton")
local FpsBoost = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
local Rewv1 = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")

--Properties:

MyGui.Name = "MyGui"
MyGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
MyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

BackGround.Name = "BackGround"
BackGround.Parent = MyGui
BackGround.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackGround.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackGround.BorderSizePixel = 0
BackGround.Position = UDim2.new(0.35744682, 0, 0.20524691, 0)
BackGround.Size = UDim2.new(0, 334, 0, 381)
BackGround.Image = "rbxassetid://70576729319114"

UICorner.Parent = BackGround

Aimbot.Name = "Aimbot"
Aimbot.Parent = BackGround
Aimbot.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
Aimbot.BorderColor3 = Color3.fromRGB(0, 0, 0)
Aimbot.BorderSizePixel = 0
Aimbot.Position = UDim2.new(0.0182767622, 0, 0.0662251636, 0)
Aimbot.Size = UDim2.new(0, 64, 0, 22)
Aimbot.Font = Enum.Font.SourceSans
Aimbot.Text = "Aimbot"
Aimbot.TextColor3 = Color3.fromRGB(255, 255, 255)
Aimbot.TextSize = 14.000

Esp.Name = "Esp"
Esp.Parent = BackGround
Esp.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
Esp.BorderColor3 = Color3.fromRGB(0, 0, 0)
Esp.BorderSizePixel = 0
Esp.Position = UDim2.new(0.404637128, 0, 0.0662251487, 0)
Esp.Size = UDim2.new(0, 64, 0, 22)
Esp.Font = Enum.Font.SourceSans
Esp.Text = "Esp"
Esp.TextColor3 = Color3.fromRGB(255, 255, 255)
Esp.TextSize = 14.000

FpsBoost.Name = "FpsBoost"
FpsBoost.Parent = BackGround
FpsBoost.BackgroundColor3 = Color3.fromRGB(81, 81, 81)
FpsBoost.BorderColor3 = Color3.fromRGB(0, 0, 0)
FpsBoost.BorderSizePixel = 0
FpsBoost.Position = UDim2.new(0.784626484, 0, 0.0662251487, 0)
FpsBoost.Size = UDim2.new(0, 64, 0, 22)
FpsBoost.Font = Enum.Font.SourceSans
FpsBoost.Text = "Hmm"
FpsBoost.TextColor3 = Color3.fromRGB(255, 255, 255)
FpsBoost.TextSize = 14.000

Frame.Parent = FpsBoost
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.250
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(-2.99938774, 0, 3.090909, 0)
Frame.Size = UDim2.new(0, 191, 0, 227)
Frame.Visible = false

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 0.550
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 0, 0.255506605, 0)
TextBox.Size = UDim2.new(0, 191, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Target Name:"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14.000

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.188481674, 0, 0.51541853, 0)
TextButton.Size = UDim2.new(0, 119, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Enable"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

Rewv1.Name = "Rewv1"
Rewv1.Parent = BackGround
Rewv1.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
Rewv1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Rewv1.BorderSizePixel = 0
Rewv1.Size = UDim2.new(0, 334, 0, 18)
Rewv1.Font = Enum.Font.SourceSans
Rewv1.Text = "Rew v1"
Rewv1.TextColor3 = Color3.fromRGB(255, 255, 255)
Rewv1.TextSize = 14.000

UICorner_2.Parent = Rewv1

-- Scripts:

local function FAQI_fake_script() -- BackGround.LocalScript 
	local script = Instance.new('LocalScript', BackGround)

	local player = game.Players.LocalPlayer
	local userInputService = game:GetService("UserInputService")
	local frame = script.Parent
	
	local isVisible = true -- Track visibility state
	
	-- Function to toggle GUI visibility
	local function toggleVisibility()
		isVisible = not isVisible
		frame.Visible = isVisible
	end
	
	-- Input handling for the Insert key
	local function onKeyPress(input)
		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Insert then
			toggleVisibility()
		end
	end
	
	-- Connect the input event
	userInputService.InputBegan:Connect(onKeyPress)
	
	-- Ensure the GUI stays visible after respawning
	local function onCharacterAdded(character)
		frame.Visible = isVisible -- Restore visibility state upon respawn
	end
	
	player.CharacterAdded:Connect(onCharacterAdded)
	
	-- If the player is already in-game, check the initial character
	if player.Character then
		onCharacterAdded(player.Character)
	end
end
coroutine.wrap(FAQI_fake_script)()
local function AIZM_fake_script() -- Aimbot.LocalScript 
	local script = Instance.new('LocalScript', Aimbot)

	-- Get the TextButton
	local textButton = script.Parent
	
	-- Variable to track whether the button is enabled
	local isEnabled = false
	
	-- Function to toggle button state
	local function toggleButton()
		if not isEnabled then
			textButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Change to green
			isEnabled = true -- Enable the button
			getgenv().prediction = 0.102
			getgenv().offset = 0.6
			getgenv().resolver = false
			getgenv().smoothness = 1
	
			local players = game:GetService("Players")
			local localplayer = players.LocalPlayer
			local mouse = localplayer:GetMouse()
			local userinputservice = game:GetService("UserInputService")
			local runservice = game:GetService("RunService")
			local currentCamera = workspace.CurrentCamera
	
			local victim = nil
			local targeting = false
	
			local function target()
				local target = nil
				local shortdistance = math.huge
	
				for _, v in next, workspace:GetDescendants() do
					if v.Parent and v:IsA("Model") and v ~= localplayer.Character then
						if v:FindFirstChildOfClass("Humanoid") then
							if v:FindFirstChildOfClass("Humanoid").Health > 0 then
	
								pcall(function()
									local worldtoviewportpoint, onscreen = currentCamera:WorldToViewportPoint(v:FindFirstChildOfClass("Humanoid").RootPart.Position or v.PrimaryPart.Position)
									local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(worldtoviewportpoint.X, worldtoviewportpoint.Y)).Magnitude
	
									if math.huge > distance and distance < shortdistance and onscreen then
										target = v
										shortdistance = distance
									end
								end)
							end
						end
					end
				end
				return target and (target.PrimaryPart or target:FindFirstChildOfClass("Humanoid").RootPart)
			end
	
			userinputservice.InputBegan:Connect(function(input, processed)
				if processed then
					return
				end
	
				if input.KeyCode == Enum.KeyCode.Q then
					targeting = not targeting
	
					if targeting then
						victim = target()
					else
						if victim ~= nil then
							victim = nil
						end
					end
				end
			end)
	
			local velocity = Vector3.new(0,0,0)
			local oldpos = Vector3.new(0,0,0)
	
			runservice.Heartbeat:Connect(function(deltaTime)
				if victim and victim.Parent then
					local currentpos = victim.Position
					local displacement = currentpos - oldpos
	
					local vector = displacement / deltaTime
	
					velocity = velocity:Lerp(Vector3.new(
						vector.X,
						vector.Y*0.94*getgenv().offset,
						vector.Z
						), 0.4)
	
					oldpos = currentpos
				end
			end)
	
			runservice.RenderStepped:Connect(function()
				local pos
	
				if targeting and victim and victim.Parent then
					if victim.Parent:FindFirstChildOfClass("Humanoid") then
						if victim.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
	
							if getgenv().usePrediction then
								if getgenv().resolver then
									pos = Vector3.new(
										victim.Position.X,
										victim.Position.Y,
										victim.Position.Z) + (velocity * getgenv().prediction)
								else
									pos = Vector3.new(
										victim.Position.X,
										victim.Position.Y,
										victim.Position.Z) + (victim.velocity * getgenv().prediction)
								end
							else
								pos = Vector3.new(victim.Position.X,
									victim.Position.Y,
									victim.Position.Z)
							end
	
							currentCamera.CFrame = currentCamera.CFrame:Lerp(CFrame.new(currentCamera.CFrame.Position, pos), getgenv().smoothness)
						end
					end
				end
			end)
		else
			textButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Change to red
			textButton.Text = "Disabled"
	
			-- Disable the script
			textButton.Active = false -- Makes the button non-interactable
			textButton.TextButton.MouseButton1Click:Disconnect() -- Disconnect the click event
		end
	end
	
	-- Connect the toggle function to the button click event
	textButton.MouseButton1Click:Connect(toggleButton)
end
coroutine.wrap(AIZM_fake_script)()
local function UVFL_fake_script() -- Esp.LocalScript 
	local script = Instance.new('LocalScript', Esp)

	local TextButton = script.Parent
	local isScriptEnabled = false -- Initial state of the script
	
	-- Function to run when the button is clicked
	local function toggleScript()
		isScriptEnabled = not isScriptEnabled -- Toggle the state
	
		if isScriptEnabled then
			print("The script is now enabled!")
			TextButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) 
	
			-- ESP Script
			local playerService = game:GetService("Players")
			local workspace = game:GetService("Workspace")
	
			-- Create a new instance of a highlight
			local function createESP(player)
				local highlight = Instance.new("Highlight")
				highlight.Parent = player.Character:WaitForChild("Humanoid")
				highlight.FillColor = Color3.new(1, 0, 0) -- Red fill color
				highlight.OutlineColor = Color3.new(1, 1, 1) -- White outline color
				highlight.DepthMode = Enum.HighlightDepthMode.Always
				return highlight
			end
	
			-- Function to update ESP for a specific player
			local function updateESPForPlayer(player)
				if player.Character then
					for _, child in pairs(player.Character:GetChildren()) do
						if child:IsA("Highlight") then
							child:Destroy()
						end
					end
					createESP(player)
				end
			end
	
			-- Update ESP for all players currently in the game
			for _, player in pairs(playerService:GetPlayers()) do
				updateESPForPlayer(player)
			end
	
			-- Connect to the PlayerAdded event
			playerService.PlayerAdded:Connect(function(player)
				player.CharacterAdded:Connect(function()
					updateESPForPlayer(player)
				end)
			end)
	
			-- Connect to the PlayerRemoving event
			playerService.PlayerRemoving:Connect(function(player)
				if player.Character then
					for _, child in pairs(player.Character:GetChildren()) do
						if child:IsA("Highlight") then
							child:Destroy()
						end
					end
				end
			end)
	
			-- Update ESP when the character respawns
			playerService.PlayerAdded:Connect(function(player)
				player.CharacterAdded:Connect(function(character)
					character:WaitForChild("Humanoid").Died:Connect(function()
						if player.Character then
							for _, child in pairs(player.Character:GetChildren()) do
								if child:IsA("Highlight") then
									child:Destroy()
								end
							end
						end
					end)
				end)
			end)
			
			
			
		else
			print("The script is now disabled!")
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Change color to red
			-- Place any code to run when the script is disabled here
			-- For example, you can remove the highlight from the player:
			local player = game.Players.LocalPlayer
			if player.Character then
				for _, child in pairs(player.Character:GetChildren()) do
					if child:IsA("Highlight") then
						child:Destroy()
					end
				end
			end
		end
	end
	
	-- Connect the toggle function to the button click event
	TextButton.MouseButton1Click:Connect(toggleScript)
	
end
coroutine.wrap(UVFL_fake_script)()
local function ZDDQM_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local player = game.Players.LocalPlayer
	local Players = game.Players
	local playerNameInput = script.Parent.Parent.PlayerNameInput
	local flyButton = script.Parent
	local flying = false -- Variable to keep track of flying state
	
	local function flyToPlayer(targetPlayer)
		if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
			local camera = game.Workspace.CurrentCamera
			camera.CameraType = Enum.CameraType.Scriptable
	
			local targetTorso = targetPlayer.Character.HumanoidRootPart
			local character = player.Character or player:WaitForChild("Character", 5)
	
			flying = true -- Set flying state to true
			while flying and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") do
				character:SetPrimaryPartCFrame(targetTorso.CFrame + Vector3.new(0, 5, 0)) -- Fly above the player
				camera.CFrame = CFrame.new(targetTorso.Position + Vector3.new(0, 10, 15), targetTorso.Position) -- Lock camera focus
				wait(0.1) -- Duration to wait before the next move
			end
		end
	end
	
	local function onFlyButtonClicked()
		local playerName = playerNameInput.Text
		local targetPlayer = Players:FindFirstChild(playerName)
	
		if targetPlayer then
			if not flying then -- If not already flying, start flying
				flyToPlayer(targetPlayer)
			else
				flying = false -- If already flying, stop flying
				local character = player.Character or player:WaitForChild("Character", 5)
				character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame) -- Reset the character's position to its current CFrame
				game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom -- Reset camera to normal
			end
		else
			warn("Player not found!")
		end
	end
	
	local function onPlayerNameInputChanged()
		if playerNameInput.Text == ".stop" then
			flying = false -- Stop flying
			local character = player.Character or player:WaitForChild("Character", 5)
			character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame) -- Reset the character's position to its current CFrame
			game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom -- Reset camera to normal
			playerNameInput.Text = "" -- Clear input field after stopping
		end
	end
	
	flyButton.MouseButton1Click:Connect(onFlyButtonClicked)
	playerNameInput.Changed:Connect(onPlayerNameInputChanged)
	
end
coroutine.wrap(ZDDQM_fake_script)()
local function PTYBOV_fake_script() -- FpsBoost.LocalScript 
	local script = Instance.new('LocalScript', FpsBoost)

	-- Assuming this script is placed inside the button (script.Parent)
	local button = script.Parent
	local frame = button.Parent.Frame -- Adjust the path if necessary
	
	button.MouseButton1Click:Connect(function()
		-- Toggle the visibility of the frame
		frame.Visible = not frame.Visible
	end)
end
coroutine.wrap(PTYBOV_fake_script)()
