if _G.GUIExecuted then return end
_G.GUIExecuted = true

if game.PlaceId ~= 70876832253163 then
	game.StarterGui:SetCore("SendNotification", {
		Title = "Error",
		Text = "Game not supported!",
		Duration = 5
	})
	return
end

local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

-- Frame setup
local main = Instance.new("Frame", gui)
main.Size = UIS.TouchEnabled and UDim2.new(0, 320, 0, 280) or UDim2.new(0, 450, 0, 340)
main.Position = UDim2.new(0.5, -main.Size.X.Offset/2, 0.5, -main.Size.Y.Offset/2)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true

-- Top bar
local topBar = Instance.new("Frame", main)
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local title = Instance.new("TextLabel", topBar)
title.Text = "Spiggfield"
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundTransparency = 1

local close = Instance.new("TextButton", topBar)
close.Size = UDim2.new(0, 25, 1, 0)
close.Position = UDim2.new(1, -30, 0, 0)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
close.MouseButton1Click:Connect(function()
	if UIS.TouchEnabled then
		local confirm = Instance.new("TextLabel", main)
		confirm.Size = UDim2.new(1, 0, 0, 40)
		confirm.Position = UDim2.new(0, 0, 0.5, -20)
		confirm.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		confirm.TextColor3 = Color3.fromRGB(255,255,255)
		confirm.Text = "Are you sure you want to close this interface? Tap again to confirm"
		wait(3)
		confirm:Destroy()
	else
		main.Visible = false
		game.StarterGui:SetCore("SendNotification", {
			Title = "UI Hidden",
			Text = "Press K to reopen the interface",
			Duration = 5
		})
	end
end)

-- Minimize
local minimize = Instance.new("TextButton", topBar)
minimize.Size = UDim2.new(0, 25, 1, 0)
minimize.Position = UDim2.new(1, -60, 0, 0)
minimize.Text = "-"
minimize.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimize.MouseButton1Click:Connect(function()
	for _, f in pairs(main:GetChildren()) do
		if f ~= topBar then f.Visible = not f.Visible end
	end
end)

UIS.InputBegan:Connect(function(i)
	if i.KeyCode == Enum.KeyCode.K then
		main.Visible = true
	end
end)

-- Tab buttons
local tabNames = {"Info", "Main", "Aim Assist", "Others"}
local tabs = {}
local frames = {}

for i, name in ipairs(tabNames) do
	local btn = Instance.new("TextButton", main)
	btn.Size = UDim2.new(0, 100, 0, 25)
	btn.Position = UDim2.new(0, (i-1)*100, 0, 30)
	btn.Text = name
	btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	tabs[name] = btn

	local frame = Instance.new("Frame", main)
	frame.Size = UDim2.new(1, -10, 1, -70)
	frame.Position = UDim2.new(0, 5, 0, 60)
	frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	frame.Visible = (i == 1)
	frames[name] = frame

	btn.MouseButton1Click:Connect(function()
		for n, f in pairs(frames) do
			f.Visible = (n == name)
		end
	end)
end

-- Info Tab
do
	local label1 = Instance.new("TextButton", frames["Info"])
	label1.Text = "My Discord: alchemist_gaming2.0"
	label1.Size = UDim2.new(1, -20, 0, 30)
	label1.Position = UDim2.new(0, 10, 0, 10)
	label1.MouseButton1Click:Connect(function()
		setclipboard("alchemist_gaming2.0")
	end)

	local label2 = Instance.new("TextButton", frames["Info"])
	label2.Text = "My Discord Server: discord.gg/7UPrQXQhR9"
	label2.Size = UDim2.new(1, -20, 0, 30)
	label2.Position = UDim2.new(0, 10, 0, 50)
	label2.MouseButton1Click:Connect(function()
		setclipboard("https://discord.gg/7UPrQXQhR9")
	end)

	local jobId = Instance.new("TextLabel", frames["Info"])
	jobId.Text = "Job ID: " .. tostring(game.JobId)
	jobId.Size = UDim2.new(1, -20, 0, 30)
	jobId.Position = UDim2.new(0, 10, 0, 90)
	jobId.TextColor3 = Color3.fromRGB(255, 255, 255)
	jobId.BackgroundTransparency = 1
end

-- Main Tab
do
	local mainTab = frames["Main"]

	local teleLabel = Instance.new("TextLabel", mainTab)
	teleLabel.Text = "Teleports"
	teleLabel.Position = UDim2.new(0, 10, 0, 5)
	teleLabel.Size = UDim2.new(1, 0, 0, 20)
	teleLabel.TextColor3 = Color3.fromRGB(255,255,255)
	teleLabel.BackgroundTransparency = 1

	local teleports = {
		{"Teleport to Sterling", "https://raw.githubusercontent.com/ringtaa/Tptostearling.github.io/refs/heads/main/Stearlingtown.lua"},
		{"Teleport to StillwaterPrison", "https://raw.githubusercontent.com/ringtaa/StillwaterPrisontp.github.io/refs/heads/main/ringta.lua"},
		{"Teleport to Castle", "https://raw.githubusercontent.com/ringtaa/castletpfast.github.io/refs/heads/main/FASTCASTLE.lua"},
		{"Teleport to Fort", "https://raw.githubusercontent.com/ringtaa/Tpfort.github.io/refs/heads/main/Tpfort.lua"},
		{"Teleport to TeslaLab", "https://raw.githubusercontent.com/ringtaa/tptotesla.github.io/refs/heads/main/Tptotesla.lua"},
		{"Teleport to End", "https://raw.githubusercontent.com/ringtaa/tpendwallhide.github.io/refs/heads/main/faraway.lua"},
	}

	for i, data in pairs(teleports) do
		local b = Instance.new("TextButton", mainTab)
		b.Text = data[1]
		b.Size = UDim2.new(0, 200, 0, 30)
		b.Position = UDim2.new(0, 10, 0, 30 + (i*35))
		b.MouseButton1Click:Connect(function()
			game.StarterGui:SetCore("SendNotification", {
				Title = "Teleporting...",
				Text = "Please wait.",
				Duration = 2
			})
			loadstring(game:HttpGet(data[2]))()
			game.StarterGui:SetCore("SendNotification", {
				Title = "Teleported!",
				Text = "Try again if it doesn't work.",
				Duration = 4
			})
		end)
	end

	-- Visual section
	local fullBrightToggle = Instance.new("TextButton", mainTab)
	fullBrightToggle.Text = "☐ Full Bright"
	fullBrightToggle.Size = UDim2.new(0, 200, 0, 30)
	fullBrightToggle.Position = UDim2.new(0, 240, 0, 30)
	fullBrightToggle.MouseButton1Click:Connect(function()
		if fullBrightToggle.Text == "☐ Full Bright" then
			fullBrightToggle.Text = "✓ Full Bright"
			local lighting = game:GetService("Lighting")
			lighting.FogStart = 1e10
			lighting.FogEnd = 1e10
			lighting.FogColor = Color3.fromRGB(255, 255, 255)
			lighting.Brightness = 20
			lighting.ExposureCompensation = 0
			lighting.GlobalShadows = false
		else
			fullBrightToggle.Text = "☐ Full Bright"
			game.Lighting.FogStart = 0
			game.Lighting.FogEnd = 100
			game.Lighting.Brightness = 1
		end
	end)
end

-- Aim Assist
do
	local frame = frames["Aim Assist"]
	local killAuraToggle = Instance.new("TextButton", frame)
	killAuraToggle.Text = "☐ Kill Aura"
	killAuraToggle.Size = UDim2.new(0, 200, 0, 30)
	killAuraToggle.Position = UDim2.new(0, 10, 0, 10)

	local partInput = Instance.new("TextBox", frame)
	partInput.PlaceholderText = "Part to hit (e.g., Head)"
	partInput.Text = "Head"
	partInput.Size = UDim2.new(0, 200, 0, 30)
	partInput.Position = UDim2.new(0, 10, 0, 50)

	local sliderLabel = Instance.new("TextLabel", frame)
	sliderLabel.Text = "Range: 10"
	sliderLabel.Position = UDim2.new(0, 10, 0, 90)
	sliderLabel.Size = UDim2.new(0, 200, 0, 20)
	sliderLabel.TextColor3 = Color3.fromRGB(255,255,255)
	sliderLabel.BackgroundTransparency = 1

	local rangeSlider = Instance.new("TextButton", frame)
	rangeSlider.Size = UDim2.new(0, 200, 0, 10)
	rangeSlider.Position = UDim2.new(0, 10, 0, 115)
	rangeSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

	local killAuraOn = false
	local range = 10

	killAuraToggle.MouseButton1Click:Connect(function()
		killAuraOn = not killAuraOn
		killAuraToggle.Text = killAuraOn and "✓ Kill Aura" or "☐ Kill Aura"
	end)

	rangeSlider.MouseButton1Down:Connect(function()
		local moveConn
		moveConn = UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				local pos = math.clamp((input.Position.X - rangeSlider.AbsolutePosition.X)/rangeSlider.AbsoluteSize.X, 0, 1)
				range = math.floor(pos * 50)
				sliderLabel.Text = "Range: " .. tostring(range)
			end
		end)
		UIS.InputEnded:Connect(function()
			moveConn:Disconnect()
		end)
	end)

	task.spawn(function()
		while task.wait(0.15) do
			if killAuraOn then
				local char = player.Character or player.CharacterAdded:Wait()
				for _, npc in pairs(workspace:GetDescendants()) do
					if npc:IsA("Model") and npc ~= char and npc:FindFirstChild("Humanoid") then
						local part = npc:FindFirstChild(partInput.Text)
						if part and (part.Position - char.HumanoidRootPart.Position).Magnitude <= range and npc.Humanoid.Health > 0 then
							local tool = char:FindFirstChildOfClass("Tool")
							if tool and tool:FindFirstChild("Handle") then
								tool:Activate()
							end
						end
					end
				end
			end
		end
	end)
end
