-- Gui to Lua
-- Version: 3.2

-- Key validation elements
local validKeys = {
    "REW=A1B2C3D#=F$G&H*I",
    "REW=U*V#W@X=Y1Z2A#",
    "REW=Q%R^S&=T*U@V#W",
    "REW=L+M-N=O*P&Q#R",
    "REW=A#B$C%D=E^F&G*",
    "REW=H@J#K*L=M1N2O",
    "REW=O&P^Q=R1S#T*U",
    "REW=W@X#Y=Z*1A&BC",
    "REW=F5G7H=I*J^K#@",
    "REW=L*Z3X=C#D$E5F",
    "REW=A@B5C=D#E1F!G",
    "REW=H*I@J=K*L4M%N",
    "REW=A^B%3=C&D*F^G",
    "REW=1Q#R2S=T*3U@V",
    "REW=W#X%Y*Z=A^B@C",
    "REW=F!G#H=I*J9K@L",
    "REW=M*N-O=1P@Q#R",
    "REW=S%T&U=V*W@X#Y",
    "REW=Z1A#2B=C*D3E!",
    "REW=F%G@H=I*J7K$L",
    "REW=W@X%Y=Z#1A*B2",
    "REW=3C&D#E=F*G$H!",
    "REW=J(k7*L=M#N^O1",
    "REW=P!Q@R=S&T*U^V",
    "REW=Z@X5Y=1A$C*D&F",
    "REW=2Q*3M=T@R$S^U",
    "REW=H#I@L*Y=B1C$D",
    "REW=U^W2X=Y#Z1A&3B",
    "REW=5C*D%E8=G^H#I",
    "REW=L*4M@N=O+P^Q%",
    "REW=3T*U&V=Y@1W3#Z",
    "REW=6F&M2G=H^I6J*5",
    "REW=!K@L4*M=N1O@P",
    "REW=Q$R@T=S^U*2V&/",
    "REW=9W3#X=Y*Z^A1B%",
    "REW=C&5D=E+F#H*I7J",
    "REW=5K%2N=3O^P&Q*R",
    "REW=S1@T=2U*V3#W4!",
    "REW=V^B*Z@A=Y*1C#D",
    "REW=R%S&T=U^V$W#X!",
    "REW=F()G=H@J&K$L*M",
    "REW=#D@R1S=T*$2U^V",
    "REW=A%F&H=4J#K*L6!",
    "REW=Q5!R$T*U^V&J1*",
    "REW=L@1M=N*5O&9P$",
    "REW=W2!X$Y=3Z@A*B7",
    "REW=C#6D=7E*F@8G^J",
    "REW=T1*U^2=Q&3R(@",
    "REW=5I@T^4=C*6D$F",
    "REW=H9@K*M=Q5#2P*U",
    "REW=Y3!Z$A*T=Q8%R@",
    "REW=4Z#B=5*A^6C@D8",
    "REW=X7@Y6=5C&3B*M9",
    "REW=7N^M=8O!I@J*4K",
    "REW=1C%2V=Z&A^T3*C",
    "REW=3H#I2=2G*E&F0F",
    "REW=U=J$K!@L*E1#M&C",
    "REW=9A*J@P^2*Q5#V&r",
    "REW=r8S@3%W&4T*6U^D",
    "REW=#{G%$H(K&*F)N1@",
    "REW=E#Y$D3R=Q*X8*C",
    "REW=O%N*M+C8@B^T3:",
    "REW=J5V&2B$Y3=A9^1+",
    "REW=@P^F3*R=V1C&7$D",
}


-- Function to check if the entered key is valid
local function isValidKey(key)
    for _, validKey in ipairs(validKeys) do
        if key == validKey then
            return true
        end
    end
    return false
end

-- Create the key input GUI
local keyGui = Instance.new("ScreenGui")
local keyFrame = Instance.new("Frame")
local keyTextBox = Instance.new("TextBox")
local keyButton = Instance.new("TextButton")
local messageLabel = Instance.new("TextLabel")

-- Setting up the key input GUI
keyGui.Name = "KeyGui"
keyGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

keyFrame.Name = "KeyFrame"
keyFrame.Parent = keyGui
keyFrame.Size = UDim2.new(0, 300, 0, 150)
keyFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
keyFrame.BackgroundColor3 = Color3.new(1, 1, 1)

keyTextBox.Parent = keyFrame
keyTextBox.Size = UDim2.new(1, -20, 0, 40)
keyTextBox.Position = UDim2.new(0, 10, 0, 10)
keyTextBox.PlaceholderText = "Enter your key"
keyTextBox.TextColor3 = Color3.new(0, 0, 0)

keyButton.Parent = keyFrame
keyButton.Size = UDim2.new(1, -20, 0, 40)
keyButton.Position = UDim2.new(0, 10, 0, 60)
keyButton.Text = "Submit"
keyButton.BackgroundColor3 = Color3.new(0, 0.5, 0)

messageLabel.Parent = keyFrame
messageLabel.Size = UDim2.new(1, -20, 0, 30)
messageLabel.Position = UDim2.new(0, 10, 0, 110)
messageLabel.TextColor3 = Color3.new(1, 0, 0)
messageLabel.Text = ""

-- Function to handle key submission
local function onKeySubmit()
    local enteredKey = keyTextBox.Text
    if isValidKey(enteredKey) then
        keyGui:Destroy() -- Remove the key input GUI
    else
        messageLabel.Text = "Invalid key! Please try again."
    end
end

keyButton.MouseButton1Click:Connect(onKeySubmit)

-- Main GUI elements
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

-- Properties:

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

-- Functionality for hiding/showing the GUI and its elements continues here...

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
