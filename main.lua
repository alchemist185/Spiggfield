-- Go fuck yourself (This file was protected By Alchemist obfuscateor V3 --
local a=loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local b=a:CreateWindow({Name="Spiggfield",LoadingTitle="Loading assets...",LoadingSubtitle="by Alchemist",ConfigurationSaving={Enabled=false,},Discord={Enabled=false,},KeySystem=false})
local c,d,e=b:CreateTab("\x49\x6e\x66\x6f",nil),b:CreateTab("\x4d\x61\x69\x6e",nil),b:CreateTab("\x4f\x74\x68\x65\x72\x73",nil)
local f=identifyexecutor and identifyexecutor()or"\x55\x6e\x6b\x6e\x6f\x77\x6e"
local g="1.0"
local h=game.JobId or"\x55\x6e\x61\x76\x61\x69\x6c\x61\x62\x6c\x65"
local i=tostring(game.PrivateServerId)~=""and game.PrivateServerId or"\x55\x6e\x61\x76\x61\x69\x6c\x61\x62\x6c\x65"
local j=getexecutorversion and getexecutorversion()or"\x4e\x2f\x41"
c:CreateLabel("\x45\x78\x65\x63\x75\x74\x6f\x72\x3a "..f)
c:CreateLabel("\x45\x78\x65\x63\x75\x74\x6f\x72\x20\x56\x65\x72\x73\x69\x6f\x6e\x3a "..j)
c:CreateLabel("\x53\x63\x72\x69\x70\x74\x20\x56\x65\x72\x73\x69\x6f\x6e\x3a "..g)
c:CreateButton({Name="Copy Job ID",Callback=function()setclipboard(h)a:Notify({Title="Copied",Content="Job ID copied",Duration=4})end})
c:CreateButton({Name="Copy Server ID",Callback=function()setclipboard(i)a:Notify({Title="Copied",Content="Server ID copied",Duration=4})end})
local function k()a:Notify({Title="Teleporting",Content="Please wait...",Duration=4})end
local function l(u)k()loadstring(game:HttpGet(u))()end
d:CreateSection("Teleports")
d:CreateButton({Name="To Train",Callback=function()l("https://raw.githubusercontent.com/ringtaa/NEWTPTRAIN.github.io/refs/heads/main/TRAIN.LUA")end})
d:CreateButton({Name="To Sterling",Callback=function()l("https://raw.githubusercontent.com/ringtaa/sterlingnotifcation.github.io/refs/heads/main/Sterling.lua")end})
d:CreateButton({Name="To Tesla",Callback=function()l("https://raw.githubusercontent.com/ringtaa/tptotesla.github.io/refs/heads/main/Tptotesla.lua")end})
d:CreateButton({Name="To Castle",Callback=function()l("https://raw.githubusercontent.com/ringtaa/castletpfast.github.io/refs/heads/main/FASTCASTLE.lua")end})
d:CreateButton({Name="To Fort",Callback=function()l("https://raw.githubusercontent.com/ringtaa/Tpfort.github.io/refs/heads/main/Tpfort.lua")end})
d:CreateButton({Name="To Stillwater",Callback=function()
	k()
	local m=game.Players.LocalPlayer
	game:GetService("RunService").Stepped:Connect(function()
		if m.Character then
			for _,n in pairs(m.Character:GetDescendants())do
				if n:IsA("BasePart")and n.CanCollide then n.CanCollide=false end
			end
		end
	end)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtaa/StillwaterPrisontp.github.io/refs/heads/main/ringta.lua"))()
	a:Notify({Title="Teleported",Content="Try again if it fails",Duration=2})
end})
d:CreateSection("Aim Assist")
local o,p,q=false,"Head",1000
d:CreateToggle({Name="Enable NPC Kill Aura",CurrentValue=false,Callback=function(r)o=r end})
d:CreateDropdown({Name="Target Part",Options={"Head","Torso","HumanoidRootPart"},CurrentOption="Head",Callback=function(r)p=r end})
d:CreateSlider({Name="Range",Range={100,2000},Increment=50,Suffix="studs",CurrentValue=1000,Callback=function(r)q=r end})
task.spawn(function()
	while true do
		task.wait(1)
		if not o then continue end
		local s=game.Players.LocalPlayer
		local t=s.Character or s.CharacterAdded:Wait()
		local u=t:FindFirstChildOfClass("Tool")
		if not u or not u:FindFirstChild("Handle")then continue end
		for _,v in pairs(workspace:GetDescendants())do
			if v:IsA("Model")and v:FindFirstChild("Humanoid")and v:FindFirstChild("HumanoidRootPart")then
				if not game.Players:GetPlayerFromCharacter(v)and v.Humanoid.Health>0 then
					local w=(t.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude
					if w<=q and v:FindFirstChild(p)then
						t:SetPrimaryPartCFrame(CFrame.new(t.PrimaryPart.Position,v[p].Position))
						u:Activate()
						task.wait(0.1)
					end
				end
			end
		end
	end
end)
e:CreateButton({Name="Bypass AC",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/hbjrev/bypass.github.io/refs/heads/main/anticheat.lua"))()
	a:Notify({Title="Bypassed",Content="Anti-Cheat removed",Duration=4})
end})
e:CreateButton({Name="Do Pacifist",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtaa/newpacifisct/refs/heads/main/newpacifisct.lua"))()
	a:Notify({Title="Teleporting...",Content="Don't jump much",Duration=4})
end})
e:CreateSlider({Name="Speed",Range={0,500},Increment=5,Suffix="WS",CurrentValue=16,Callback=function(r)
	local s=game.Players.LocalPlayer
	if s.Character and s.Character:FindFirstChild("Humanoid")then s.Character.Humanoid.WalkSpeed=r end
end})
e:CreateSlider({Name="Jump",Range={0,100},Increment=2,Suffix="JP",CurrentValue=50,Callback=function(r)
	local s=game.Players.LocalPlayer
	if s.Character and s.Character:FindFirstChild("Humanoid")then s.Character.Humanoid.JumpPower=r end
end})
e:CreateSlider({Name="Fly Speed",Range={0,250},Increment=5,Suffix="Fly",CurrentValue=0,Callback=function(r)_G.FlySpeed=r end})
e:CreateButton({Name="Air Weld",Callback=function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Beru1337/DeadRails/refs/heads/main/betterweld.lua"))()
	a:Notify({Title="Welded",Content="In-air weld activated",Duration=3})
end})
