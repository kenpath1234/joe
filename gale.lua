print("Made with synapse and krnl in mind.")

local _Target = nil
local _DoShit = false

local VirtualInput = game:GetService("VirtualInputManager")
local UIS = game:GetService("UserInputService")

function StopSwitch()
	if not workspace:FindFirstChild("StopSwitch") then
		local Stop = Instance.new("BoolValue", workspace)
		Stop.Name = "StopSwitch"
	end
end

function GetMobsNum()
	local Mobs = game:GetService("Workspace").Entities.Ecosystem:GetChildren()

	if Mobs ~= 0 then
		return #Mobs
	end
end

StopSwitch()

UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.E then
		wait(3)
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Tobias020108Back/YBA-AUT/main/PJ-Godmode"))()

		for _, v in pairs(game.Lighting:GetChildren()) do
			v:Destroy()
		end

		_DoShit = true

		while wait(0.5) do
			if workspace.StopSwitch.Value == false and _DoShit == true then

				if _Target == nil then
					if GetMobsNum() == 0 then
						workspace.StopSwitch.Value = true
						for i = 1, 20 do
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(163.631, 19.5709, 373.378))
							wait(1)
							VirtualInput:SendKeyEvent(true, Enum.KeyCode.E, false, nil)
							wait(1)
						end
						wait(3)
						VirtualInput:SendKeyEvent(true, Enum.KeyCode.E, false, nil)
						VirtualInput:SendKeyEvent(true, Enum.KeyCode.E, false, nil)
						workspace.StopSwitch.Value = false
					else
						for _, v in pairs(game:GetService("Workspace").Entities.Ecosystem:GetChildren()) do
							_Target = v
						end
					end
				else if _Target then
						if _Target:FindFirstChild("Humanoid").Health ~= 0 then
							game.Players.LocalPlayer.Character.HumanoidRootPart.Position = _Target:FindFirstChild("Head").Position + Vector3.new(0,2,0)
						else
							_Target = nil
						end
					end
				end
			end
		end


	end
end)
