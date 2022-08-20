local CoreGui=game:GetService('CoreGui')local TweenService=game:GetService('TweenService')local UserInputService=game:GetService('UserInputService')local RunService=game:GetService('RunService')local TextService=game:GetService('TextService')local Players=game:GetService('Players')local UIName='Notify'local Amount=0;local Utility={}local Library={}do function Utility:DestroyUI()if CoreGui:FindFirstChild(UIName)~=nil then CoreGui:FindFirstChild(UIName):Destroy()end end;function Utility:ToggleUI()if CoreGui:FindFirstChild(UIName)~=nil then CoreGui:FindFirstChild(UIName).Enabled=not CoreGui:FindFirstChild(UIName).Enabled end end;function Utility:EnableDragging(Frame)local Dragging,DraggingInput,DragStart,StartPosition;local function Update(Input)local Delta=Input.Position-DragStart;Frame.Position=UDim2.new(StartPosition.X.Scale,StartPosition.X.Offset+Delta.X,StartPosition.Y.Scale,StartPosition.Y.Offset+Delta.Y)end;Frame.InputBegan:Connect(function(Input)if Input.UserInputType==Enum.UserInputType.MouseButton1 then Dragging=true;DragStart=Input.Position;StartPosition=Frame.Position;Input.Changed:Connect(function()if Input.UserInputState==Enum.UserInputState.End then Dragging=false end end)end end)Frame.InputChanged:Connect(function(Input)if Input.UserInputType==Enum.UserInputType.MouseMovement then DraggingInput=Input end end)UserInputService.InputChanged:Connect(function(Input)if Input==DraggingInput and Dragging then Update(Input)end end)end;function Utility:Create(_Instance,Properties,Children)local Object=Instance.new(_Instance)local Properties=Properties or{}local Children=Children or{}for Index,Property in next,Properties do Object[Index]=Property end;for _,Child in next,Children do Child.Parent=Object end;return Object end;function Utility:Tween(Instance,Properties,Duration,...)local TweenInfo=TweenInfo.new(Duration,...)TweenService:Create(Instance,TweenInfo,Properties):Play()end end;do Utility:DestroyUI()end;function Library:DestroyUI()Utility:DestroyUI()end;function Library:ToggleUI()Utility:ToggleUI()end;function Library:CreateNotification(Title,Text,Duration)task.spawn(function()local Title=Title or'Title'local Text=Text or'Text'local Duration=Duration or 5;if not CoreGui:FindFirstChild('notification')then Utility:Create('ScreenGui',{Name='notification',Parent=CoreGui})else Utility:Create('Frame',{Parent=CoreGui:FindFirstChild('notification'),Name='Notification'..tostring(Amount+1),BackgroundColor3=Color3.fromRGB(25,25,25),BorderSizePixel=0,Position=UDim2.new(1,300,1,-30),Size=UDim2.new(0,300,0,50),AnchorPoint=Vector2.new(1,1)},{Utility:Create('UICorner',{CornerRadius=UDim.new(0,5),Name='NotificationCorner'}),Utility:Create('UIStroke',{Name='NotificationStroke',ApplyStrokeMode='Contextual',Color=Color3.fromRGB(125,125,125),LineJoinMode='Round',Thickness=1}),Utility:Create('TextLabel',{Name='NotificationTitle',BackgroundTransparency=1,Position=UDim2.new(0,0,0,-1),Size=UDim2.new(0,300,0,30),Font=Enum.Font.Gotham,Text=Title,TextColor3=Color3.fromRGB(255,255,255),TextSize=16,TextXAlignment=Enum.TextXAlignment.Left},{Utility:Create('UIPadding',{Name='NotificationTitlePadding',PaddingLeft=UDim.new(0,7)})}),Utility:Create('TextLabel',{Name='NotificationText',BackgroundTransparency=1,Position=UDim2.new(0,0,0,25),Size=UDim2.new(0,300,0,30),Font=Enum.Font.Gotham,Text=Text,TextWrapped=true,TextColor3=Color3.fromRGB(135,135,135),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left},{Utility:Create('UIPadding',{Name='NotificationTextPadding',PaddingLeft=UDim.new(0,7)})})})Amount=Amount+1;local Holder=CoreGui:FindFirstChild('notification')['Notification'..tostring(Amount)]local TitleObj=Holder['NotificationTitle']local TextObj=Holder['NotificationText']local TextSize=TextService:GetTextSize(Text,14,Enum.Font.Gotham,Vector2.new(300,math.huge))Holder.Size=UDim2.new(0,300,0,TextSize.Y+30)TextObj.Size=UDim2.new(0,300,0,TextSize.Y)if Amount>1 then local PreviousSizes=0;for _,Notification in next,Holder.Parent:GetChildren()do if Notification~=Holder.Parent['Notification'..tostring(Amount)]then local AbsoluteY=Notification.AbsoluteSize.Y+5;PreviousSizes=PreviousSizes+AbsoluteY end end;Holder.Position=UDim2.new(1,300,1,-30-PreviousSizes)Utility:Tween(Holder,{Position=UDim2.new(1,-30,1,-30-PreviousSizes)},0.5)else Utility:Tween(Holder,{Position=UDim2.new(1,-30,1,-30)},0.5)end;task.wait(Duration-1)Utility:Tween(Holder,{BackgroundTransparency=0.5},0.25)Utility:Tween(TitleObj,{TextTransparency=0.5},0.25)Utility:Tween(TextObj,{TextTransparency=0.5},0.25)task.wait(0.5)Utility:Tween(Holder,{Position=UDim2.new(1,300,1,Holder.Position.Y.Offset)},0.5)task.wait(0.5)Holder:Destroy()Amount=Amount-1 end end)end
    
Library:CreateNotification("Agents Auto", "Starting Autofarm", 5)

function GetCurrentVehicle()
	return game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart and game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart.Parent
end
function antiafk()
	local GC = getconnections or get_signal_cons
	if GC then
		for i, v in pairs(GC(game.Players.LocalPlayer.Idled)) do
			if v["Disable"] then
			    
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
		Library:CreateNotification("Agents Auto", "AntiAFK enabled", 3)
	else
		game.Players.LocalPlayer.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
		Library:CreateNotification("Agents Auto", "AntiAFK enabled (GC access disabled)", 3)
	end
end
antiafk()
function movecar(cframe)
	for _ = 1, 4 do
		GetCurrentVehicle():SetPrimaryPartCFrame(cframe)
		wait(.05)
	end
end
local angle = CFrame.Angles(math.rad(-1), math.rad(-174), math.rad(1.25))


movecar(CFrame.new(-146.22262573242188, -88.52694702148438, -5851.5478515625) * angle)

local ui = game.Players.LocalPlayer.PlayerGui:WaitForChild("A-Chassis Interface", 5);
if not ui then
	Library:CreateNotification("Agents Auto", "Error, UI not found. Please spawn and enter your car.", 3)
end
assert(ui, "Error, UI not found. Please spawn and enter your car.");

local values = ui:WaitForChild("Values", 5);
if not values then
	Library:CreateNotification("Agents Auto", "Error, values not found. What", 3)
end 
assert(values, "Error, values not found. What");

local speed = ui.Gauges:WaitForChild("SpeedDisp", 5);
if not speed then
	Library:CreateNotification("Agents Auto", "Error, speed not found what", 3)
end
assert(speed, "Error, speed not found what");

local spv = 0;
speed:GetPropertyChangedSignal("Text"):Connect(function(val)
	spv = tonumber(speed.Text);
end);
kill = false;kill_s = false;kill_f = false;fc = 0;rs = game:GetService("ReplicatedStorage");
rs.Remote.Refuel:FireServer(1, os.time());
spawn(function()
	while wait(1) do
		fc = fc + 1
		if kill_f then
			return error("kill_f")
		end
		if not game.Players.LocalPlayer.PlayerGui:FindFirstChild('A-Chassis Interface') then
			kill_f = true
			Library:CreateNotification("Agents Auto", "Killing AutoFuel", 4)
			error("ui gone -> fuel loop")
		end
		if fc >= 120 then
			fc = 0
			print('refueled lol')
			Library:CreateNotification("Agents Auto", "Refueled car", 3)
			rs.Remote.Refuel:FireServer(1, os.time());
		end
	end
end)
spawn(function()
	while wait(30) do
		if kill then
			error("killed");
			kill_s = true;
			return
		end
		if not game.Players.LocalPlayer.PlayerGui:FindFirstChild('A-Chassis Interface') then
			kill_s = true
			error("ui gone")
		end
		if kill_s then
			return error("kill_s triggered")
		end
		print("resetting");
		Library:CreateNotification("Agents Auto", "Reset position.", 3)
		movecar(CFrame.new(-146.22262573242188, -88.52694702148438, -5851.5478515625) * angle)
	end
end)
spvc = 0
while wait() do
	if not game.Players.LocalPlayer.PlayerGui:FindFirstChild('A-Chassis Interface') then
		kill = true
		Library:CreateNotification("Agents Auto", "Killing AutoFarm", 4)
		error("ui gone")
	end
	if kill then
		return
	end
	if spv >= 45 then
		spawn(function()
			keypress(83);
			wait();
			keyrelease(83);
		end)
	end
	if spv <= 40 then
		keypress(87)
	end
	if spv >= 35 and spv <= 45 then
		keyrelease(87)
	end
	if spv <= 15 and spvc >= 100 then
		print("reset due to possible collision")
		Library:CreateNotification("Agents Auto", "Reset position (possible collision).", 3)
		spvc = 0
		movecar(CFrame.new(-146.22262573242188, -88.52694702148438, -5851.5478515625) * angle)
	end
	if spv <= 15 and spvc <= 100 then
		spvc = spvc + 1
	end
end

-- antiafk stolen from iy
-- makes abt 50-70k / hr
-- drives at around 40mph (maximizes profit)
