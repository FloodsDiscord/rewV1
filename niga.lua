local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = game.Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local aimlockTarget = nil
local aimlockEnabled = false

local function isWhitelisted(player)
    for _, name in ipairs(config.targetWhitelist) do
        if player.Name == name then
            return true
        end
    end
    return false
end

local function getPlayerPing()
    local stats = LocalPlayer:FindFirstChild("Stats")
    if stats and stats:FindFirstChild("Ping") then
        return stats.Ping.Value / 1000
    end
    return 0.05
end

local lastPosition = nil

local function getVelocity(player)
    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart and lastPosition then
        local deltaPosition = humanoidRootPart.Position - lastPosition
        lastPosition = humanoidRootPart.Position
        return deltaPosition
    end
    lastPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position
    return Vector3.new(0, 0, 0)
end

local function getPrediction()
    if config.autoPrediction then
        local ping = getPlayerPing()
        local velocity = getVelocity(aimlockTarget)
        local prediction = velocity.Magnitude * config.predictionMultiplier + ping * config.pingAdjustment
        return prediction
    else
        return config.fallbackPrediction
    end
end

local function getClosestVisiblePlayer()
    local closestPlayer, shortestDistance = nil, math.huge
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and not isWhitelisted(player) then
            local targetPos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            local distance = (Vector2.new(targetPos.X, targetPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
            
            if onScreen and distance < shortestDistance then
                local ray = Ray.new(Camera.CFrame.Position, (player.Character.HumanoidRootPart.Position - Camera.CFrame.Position).unit * 1000)
                local hitPart = workspace:FindPartOnRay(ray, LocalPlayer.Character)
                if hitPart and hitPart:IsDescendantOf(player.Character) then
                    shortestDistance = distance
                    closestPlayer = player
                end
            end
        end
    end
    
    return closestPlayer
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == config.aimlockKey then
        aimlockEnabled = not aimlockEnabled
        aimlockTarget = aimlockEnabled and getClosestVisiblePlayer() or nil
    end
end)

RunService.RenderStepped:Connect(function()
    if aimlockEnabled and aimlockTarget and aimlockTarget.Character and aimlockTarget.Character:FindFirstChild("HumanoidRootPart") then
        local velocity = getVelocity(aimlockTarget)
        local prediction = getPrediction()
        local character = aimlockTarget.Character
        local humanoidRootPart = character.HumanoidRootPart
        local forwardDirection = humanoidRootPart.CFrame.LookVector
        local predictedPosition = humanoidRootPart.Position + forwardDirection * prediction + velocity * prediction
        
        if config.smoothCameraMovement then
            local direction = (predictedPosition - Camera.CFrame.Position).unit
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + direction), config.cameraSmoothFactor)
        else
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, predictedPosition)
        end
    end
end)

if config.useSilentAim then
    local mt = getrawmetatable(game)
    local oldIndex = mt.__index
    setreadonly(mt, false)
    
    mt.__index = newcclosure(function(self, key)
        if key == "Hit" and self:IsA("RayObject") then
            local closest = getClosestVisiblePlayer()
            if closest and closest.Character and closest.Character:FindFirstChild("HumanoidRootPart") then
                local velocity = getVelocity(closest)
                local prediction = getPrediction()
                local humanoidRootPart = closest.Character.HumanoidRootPart
                local forwardDirection = humanoidRootPart.CFrame.LookVector
                return humanoidRootPart.Position + forwardDirection * prediction + velocity * prediction
            end
        end
        return oldIndex(self, key)
    end)
    
    setreadonly(mt, true)
end
