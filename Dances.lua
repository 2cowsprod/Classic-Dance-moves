-- Thanks for using --
--   r6 only sorry	--
--      made by     --
--     dodoquack    --

local Dances = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Label = Instance.new("TextLabel")
local MonsterMashAnim_Btn = Instance.new("TextButton")
local MoonWalkAnim_Btn = Instance.new("TextButton")
local Stop_Btn = Instance.new("TextButton")

local human = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
local torso = game.Players.LocalPlayer.Character:WaitForChild("Torso")

Dances.Name = "Dances"
Dances.Parent = game.CoreGui
Frame.Parent = Dances
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.500
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0178988334, 0, 0.0236686394, 0)
Frame.Size = UDim2.new(0, 252, 0, 238)

Label.Name = "Label"
Label.Parent = Frame
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.Position = UDim2.new(0.103174604, 0, -0.000569716096, 0)
Label.Size = UDim2.new(0, 200, 0, 50)
Label.Font = Enum.Font.Cartoon
Label.Text = "Classic sick moves"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 20.000
Label.TextStrokeTransparency = 0.000

MonsterMashAnim_Btn.Name = "MonsterMashAnim_Btn"
MonsterMashAnim_Btn.Parent = Frame
MonsterMashAnim_Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MonsterMashAnim_Btn.BackgroundTransparency = 0.500
MonsterMashAnim_Btn.BorderSizePixel = 0
MonsterMashAnim_Btn.Position = UDim2.new(0.103174604, 0, 0.21468927, 0)
MonsterMashAnim_Btn.Size = UDim2.new(0, 200, 0, 50)
MonsterMashAnim_Btn.Font = Enum.Font.Cartoon
MonsterMashAnim_Btn.Text = "Monster mash"
MonsterMashAnim_Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
MonsterMashAnim_Btn.TextSize = 20.000

MoonWalkAnim_Btn.Name = "MoonWalkAnim_Btn"
MoonWalkAnim_Btn.Parent = Frame
MoonWalkAnim_Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MoonWalkAnim_Btn.BackgroundTransparency = 0.500
MoonWalkAnim_Btn.BorderSizePixel = 0
MoonWalkAnim_Btn.Position = UDim2.new(0.103174604, 0, 0.475145996, 0)
MoonWalkAnim_Btn.Size = UDim2.new(0, 200, 0, 50)
MoonWalkAnim_Btn.Font = Enum.Font.Cartoon
MoonWalkAnim_Btn.Text = "Moonwalk"
MoonWalkAnim_Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
MoonWalkAnim_Btn.TextSize = 20.000

Stop_Btn.Name = "Stop_Btn"
Stop_Btn.Parent = Frame
Stop_Btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Stop_Btn.BackgroundTransparency = 0.500
Stop_Btn.BorderSizePixel = 0
Stop_Btn.Position = UDim2.new(0.103174604, 0, 0.744053602, 0)
Stop_Btn.Size = UDim2.new(0, 200, 0, 50)
Stop_Btn.Font = Enum.Font.Cartoon
Stop_Btn.Text = "Stop [All]"
Stop_Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
Stop_Btn.TextSize = 20.000

MoonWalkAnim_Btn.MouseButton1Click:Connect(function()
    human = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    torso = game.Players.LocalPlayer.Character:WaitForChild("Torso")
    
    local moonwalk = Instance.new("Animation", game.Players.LocalPlayer.Character)
    moonwalk.Name = 'mw'
    moonwalk.AnimationId = 'http://www.roblox.com/Asset?ID=30196114'
    
    -- This part is ripped off the tool --
    
    local xLook = torso.CFrame.lookVector.x/(math.abs(torso.CFrame.lookVector.x) + math.abs(torso.CFrame.lookVector.z))
	local zLook = torso.CFrame.lookVector.z/(math.abs(torso.CFrame.lookVector.x) + math.abs(torso.CFrame.lookVector.z))
	local unitLook = Vector2.new(xLook,zLook).unit
	
	local dist = 60
    
    local bodyPos = Instance.new("BodyPosition")
	bodyPos.position = Vector3.new(torso.Position.x + (-unitLook.x * dist), torso.Position.y + 2,torso.Position.z + (-unitLook.y * dist))

	bodyPos.P = GetLift(game.Players.LocalPlayer.Character) * 6.7
	bodyPos.D = bodyPos.P / 2
	bodyPos.maxForce = Vector3.new(bodyPos.P,bodyPos.P,bodyPos.P)

	wait(0.9)
	bodyPos.Parent = torso
	
	game.Debris:AddItem(bodyPos, 12)
    
    for _, anim in pairs(human:GetPlayingAnimationTracks()) do
        anim:Stop()
    end
    
    animM = human:LoadAnimation(moonwalk)
    animM:Play()
end)

MonsterMashAnim_Btn.MouseButton1Click:Connect(function()
    
    human = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
    torso = game.Players.LocalPlayer.Character:WaitForChild("Torso")
    
    local theMash = Instance.new("Animation", game.Players.LocalPlayer.Character)
    theMash.Name = 'mmp'
    theMash.AnimationId = 'http://www.roblox.com/Asset?ID=35654637'
    
    for _, anim in pairs(human:GetPlayingAnimationTracks()) do
        anim:Stop()
    end
    
    animMM = human:LoadAnimation(theMash)
    animMM:Play()
end)

Stop_Btn.MouseButton1Click:Connect(function()
    
    torso = game.Players.LocalPlayer.Character:WaitForChild("Torso")
    
    if torso:FindFirstChild("BodyPosition") then
        torso.BodyPosition:Remove()
    end
    
    for _, anim in pairs(human:GetPlayingAnimationTracks()) do
        anim:Stop()
    end
end)

-- I ripped this from the tool and cleaned it up.
function GetLift(node)
    local mag = 0
    local head = node:FindFirstChild("Head")
    
    for i, child in pairs(node:GetChildren()) do
        if child:IsA("Part") then
            if head and (child.Position - head.Position).magnitude < 10 then
                if child.Name == "Handle" then
                    mag = mag + child:GetMass() * 236 / 1.2 * 1
                else 
                    mag = mag + child:GetMass() * 236 / 1.2 * .75
                end
            end
        end
        mag = mag + GetLift(child)
    end
    return mag
end
