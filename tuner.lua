--[[
    
    ___                    __ _          ______                     
   /   | ____ ____  ____  / /( )_____   /_  __/_  ______  ___  _____
  / /| |/ __ `/ _ \/ __ \/ __/// ___/    / / / / / / __ \/ _ \/ ___/
 / ___ / /_/ /  __/ / / / /_  (__  )    / / / /_/ / / / /  __/ /    
/_/  |_\__, /\___/_/ /_/\__/ /____/    /_/  \__,_/_/ /_/\___/_/     
      /____/                                                        

  Agent's Tuner - A script to modify your car's tuning in GreenVille
  Created by:
    - Agent ( Agent#0762)
  Tested by:
    - Joa ( joa#9999 )

  License:
    - MIT License

]]


warn([[

        ___                    __ _          ______                     
       /   | ____ ____  ____  / /( )_____   /_  __/_  ______  ___  _____
      / /| |/ __ `/ _ \/ __ \/ __/// ___/    / / / / / / __ \/ _ \/ ___/
     / ___ / /_/ /  __/ / / / /_  (__  )    / / / /_/ / / / /  __/ /
    /_/  |_\__, /\___/_/ /_/\__/ /____/    /_/  \__,_/_/ /_/\___/_/
          /____/
   
          Starting Agent's Tuner...
]])





if game.CoreGui:FindFirstChild("Notify") then game.CoreGui.Notify:Destroy() end
if game.CoreGui:FindFirstChild("notification") then game.CoreGui.notification:Destroy() end
-- ^^ fixes errors with the notification gui
local a,b="serpent","0.303"local c,d="Paul Kulchenko","Lua serializer and pretty printer"local e={[tostring(1/0)]='1/0 --[[math.huge]]',[tostring(-1/0)]='-1/0 --[[-math.huge]]',[tostring(0/0)]='0/0'}local f={thread=true,userdata=true,cdata=true}local g=debug and debug.getmetatable or getmetatable;local h=function(a)return next,a end;local i,j,k={},{},(_G or _ENV)for a,a in ipairs({'and','break','do','else','elseif','end','false','for','function','goto','if','in','local','nil','not','or','repeat','return','then','true','until','while'})do i[a]=true end;for a,b in h(k)do j[b]=a end;for a,a in ipairs({'coroutine','debug','io','math','string','table','os'})do for b,c in h(type(k[a])=='table'and k[a]or{})do j[c]=a..'.'..b end end;local function l(a,b)local c,d,k,l=b.name,b.indent,b.fatal,b.maxnum;local m,n,o=b.sparse,b.custom,not b.nohuge;local p,q=(b.compact and''or' '),(b.maxlevel or math.huge)local r,s=tonumber(b.maxlength),b.metatostring;local t,u='_'..(c or''),b.comment and(tonumber(b.comment)or math.huge)local v=b.numformat or"%.17g"local w,x,y,z={},{'local '..t..'={}'},{},0;local function A(a)return'_'..(tostring(tostring(a)):gsub("[^%w]",""):gsub("(%d%w+)",function(a)if not y[a]then z=z+1;y[a]=z end;return tostring(y[a])end))end;local function y(a)return type(a)=="number"and(o and e[tostring(a)]or v:format(a))or type(a)~="string"and tostring(a)or("%q"):format(a):gsub("\010","n"):gsub("\026","\\026")end;if b.fixradix and(".1f"):format(1.2)~="1.2"then local a=y;y=function(b)return type(b)=="number"and(nohuge and e[tostring(b)]or v:format(b):gsub(",","."))or a(b)end end;local function e(a,b)return u and(b or 0)<u and' --[['..select(2,pcall(tostring,a))..']]'or''end;local function o(a,b)return j[a]and j[a]..e(a,b)or not k and y(select(2,pcall(tostring,a)))or error("Can't serialize "..tostring(a))end;local function k(a,b)local b=b==nil and''or b;local c=type(b)=="string"and b:match("^[%l%u_][%w_]*$")and not i[b]local b=c and b or'['..y(b)..']'return(a or'')..(c and a and'.'or'')..b,b end;local i=type(b.sortkeys)=='function'and b.sortkeys or function(a,b,b)local b,c=tonumber(b)or 12,{number='a',string='b'}local function d(a)return("%0"..tostring(b).."d"):format(tonumber(a))end;table.sort(a,function(b,e)return(a[b]~=nil and 0 or c[type(b)]or'z')..(tostring(b):gsub("%d+",d))<(a[e]~=nil and 0 or c[type(e)]or'z')..(tostring(e):gsub("%d+",d))end)end;local function u(a,c,d,v,z,B,C)local g,C,D=type(a),(C or 0),g(a)local z,E=k(z,c)local c=B and((type(c)=="number")and''or c..p..'='..p)or(c~=nil and E..p..'='..p or'')if w[a]then x[#x+1]=z..p..'='..p..w[a]return c..'nil'..e('ref',C)end;if type(D)=='table'and s~=false then local b,c=pcall(function()return D.__tostring(a)end)local d,e=pcall(function()return D.__serialize(a)end)if(b or d)then w[a]=v or z;a=d and e or c;g=type(a)end end;if g=="table"then if C>=q then return c..'{}'..e('maxlvl',C)end;w[a]=v or z;if next(a)==nil then return c..'{}'..e(a,C)end;if r and r<0 then return c..'{}'..e('maxlen',C)end;local g,o,q=math.min(#a,l or#a),{},{}for a=1,g do o[a]=a end;if not l or#o<l then local b=#o;for a in h(a)do if o[a]~=a then b=b+1;o[b]=a end end end;if l and#o>l then o[l+1]=nil end;if b.sortkeys and#o>g then i(o,a,b.sortkeys)end;local h=m and#o>g;for c,e in ipairs(o)do local c,g,i=a[e],type(e),c<=g and not h;if b.valignore and b.valignore[c]or b.keyallow and not b.keyallow[e]or b.keyignore and b.keyignore[e]or b.valtypeignore and b.valtypeignore[type(c)]or h and c==nil then elseif g=='table'or g=='function'or f[g]then if not w[e]and not j[e]then x[#x+1]='placeholder'local a=k(t,A(e))x[#x]=u(e,a,d,a,t,true)end;x[#x+1]='placeholder'local a=w[a]..'['..tostring(w[e]or j[e]or A(e))..']'x[#x]=a..p..'='..p..tostring(w[c]or u(c,nil,d,a))else q[#q+1]=u(c,e,d,nil,w[a],i,C+1)if r then r=r-#q[#q]if r<0 then break end end end end;local b=string.rep(d or'',C)local f=d and'{\n'..b..d or'{'local g=table.concat(q,','..(d and'\n'..b..d or p))local b=d and"\n"..b..'}'or'}'return(n and n(c,f,g,b,C)or c..f..g..b)..e(a,C)elseif f[g]then w[a]=v or z;return c..o(a,C)elseif g=='function'then w[a]=v or z;if b.nocode then return c.."function() --[[..skipped..]] end"..e(a,C)end;local b,d=pcall(string.dump,a)local b=b and"((loadstring or load)("..y(d)..",'@serialized'))"..e(a,C)return c..(b or o(a,C))else return c..y(a)end end;local e=d and"\n"or";"..p;local a=u(a,c,d)local d=#x>1 and table.concat(x,e)..e or''local b=b.comment and#x>1 and p.."--[[incomplete output with shared/self-references skipped]]"or''return not c and a..b or"do local "..a..e..d.."return "..c..e.."end"end;local function e(a,b)local b=(b and b.safe==false)and k or setmetatable({},{__index=function(a,b)return a end,__call=function(a,...)error("cannot call functions")end})local c,d=(loadstring or load)('return '..a,nil,nil,b)if not c then c,d=(loadstring or load)(a,nil,nil,b)end;if not c then return c,d end;if setfenv then setfenv(c,b)end;return pcall(c)end;local function f(a,b)if b then for b,c in h(b)do a[b]=c end end;return a end;_NAME=a;_COPYRIGHT=c;_DESCRIPTION=d;_VERSION=b;serialize=l;load=e;dump=function(a,b)return l(a,f({name='_',compact=true,sparse=true},b))end;line=function(a,b)return l(a,f({sortkeys=true,comment=true},b))end;block=function(a,b)return l(a,f({indent='  ',sortkeys=true,comment=true},b))end
local CoreGui=game:GetService('CoreGui')local TweenService=game:GetService('TweenService')local UserInputService=game:GetService('UserInputService')local RunService=game:GetService('RunService')local TextService=game:GetService('TextService')local Players=game:GetService('Players')local UIName='Notify'local Amount=0;local Utility={}local Library={}do function Utility:DestroyUI()if CoreGui:FindFirstChild(UIName)~=nil then CoreGui:FindFirstChild(UIName):Destroy()end end;function Utility:ToggleUI()if CoreGui:FindFirstChild(UIName)~=nil then CoreGui:FindFirstChild(UIName).Enabled=not CoreGui:FindFirstChild(UIName).Enabled end end;function Utility:EnableDragging(Frame)local Dragging,DraggingInput,DragStart,StartPosition;local function Update(Input)local Delta=Input.Position-DragStart;Frame.Position=UDim2.new(StartPosition.X.Scale,StartPosition.X.Offset+Delta.X,StartPosition.Y.Scale,StartPosition.Y.Offset+Delta.Y)end;Frame.InputBegan:Connect(function(Input)if Input.UserInputType==Enum.UserInputType.MouseButton1 then Dragging=true;DragStart=Input.Position;StartPosition=Frame.Position;Input.Changed:Connect(function()if Input.UserInputState==Enum.UserInputState.End then Dragging=false end end)end end)Frame.InputChanged:Connect(function(Input)if Input.UserInputType==Enum.UserInputType.MouseMovement then DraggingInput=Input end end)UserInputService.InputChanged:Connect(function(Input)if Input==DraggingInput and Dragging then Update(Input)end end)end;function Utility:Create(_Instance,Properties,Children)local Object=Instance.new(_Instance)local Properties=Properties or{}local Children=Children or{}for Index,Property in next,Properties do Object[Index]=Property end;for _,Child in next,Children do Child.Parent=Object end;return Object end;function Utility:Tween(Instance,Properties,Duration,...)local TweenInfo=TweenInfo.new(Duration,...)TweenService:Create(Instance,TweenInfo,Properties):Play()end end;do Utility:DestroyUI()end;function Library:DestroyUI()Utility:DestroyUI()end;function Library:ToggleUI()Utility:ToggleUI()end;function Library:CreateNotification(Title,Text,Duration)task.spawn(function()local Title=Title or'Title'local Text=Text or'Text'local Duration=Duration or 5;if not CoreGui:FindFirstChild('notification')then Utility:Create('ScreenGui',{Name='notification',Parent=CoreGui})else Utility:Create('Frame',{Parent=CoreGui:FindFirstChild('notification'),Name='Notification'..tostring(Amount+1),BackgroundColor3=Color3.fromRGB(25,25,25),BorderSizePixel=0,Position=UDim2.new(1,300,1,-30),Size=UDim2.new(0,300,0,50),AnchorPoint=Vector2.new(1,1)},{Utility:Create('UICorner',{CornerRadius=UDim.new(0,5),Name='NotificationCorner'}),Utility:Create('UIStroke',{Name='NotificationStroke',ApplyStrokeMode='Contextual',Color=Color3.fromRGB(125,125,125),LineJoinMode='Round',Thickness=1}),Utility:Create('TextLabel',{Name='NotificationTitle',BackgroundTransparency=1,Position=UDim2.new(0,0,0,-1),Size=UDim2.new(0,300,0,30),Font=Enum.Font.Gotham,Text=Title,TextColor3=Color3.fromRGB(255,255,255),TextSize=16,TextXAlignment=Enum.TextXAlignment.Left},{Utility:Create('UIPadding',{Name='NotificationTitlePadding',PaddingLeft=UDim.new(0,7)})}),Utility:Create('TextLabel',{Name='NotificationText',BackgroundTransparency=1,Position=UDim2.new(0,0,0,25),Size=UDim2.new(0,300,0,30),Font=Enum.Font.Gotham,Text=Text,TextWrapped=true,TextColor3=Color3.fromRGB(135,135,135),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left},{Utility:Create('UIPadding',{Name='NotificationTextPadding',PaddingLeft=UDim.new(0,7)})})})Amount=Amount+1;local Holder=CoreGui:FindFirstChild('notification')['Notification'..tostring(Amount)]local TitleObj=Holder['NotificationTitle']local TextObj=Holder['NotificationText']local TextSize=TextService:GetTextSize(Text,14,Enum.Font.Gotham,Vector2.new(300,math.huge))Holder.Size=UDim2.new(0,300,0,TextSize.Y+30)TextObj.Size=UDim2.new(0,300,0,TextSize.Y)if Amount>1 then local PreviousSizes=0;for _,Notification in next,Holder.Parent:GetChildren()do if Notification~=Holder.Parent['Notification'..tostring(Amount)]then local AbsoluteY=Notification.AbsoluteSize.Y+5;PreviousSizes=PreviousSizes+AbsoluteY end end;Holder.Position=UDim2.new(1,300,1,-30-PreviousSizes)Utility:Tween(Holder,{Position=UDim2.new(1,-30,1,-30-PreviousSizes)},0.5)else Utility:Tween(Holder,{Position=UDim2.new(1,-30,1,-30)},0.5)end;task.wait(Duration-1)Utility:Tween(Holder,{BackgroundTransparency=0.5},0.25)Utility:Tween(TitleObj,{TextTransparency=0.5},0.25)Utility:Tween(TextObj,{TextTransparency=0.5},0.25)task.wait(0.5)Utility:Tween(Holder,{Position=UDim2.new(1,300,1,Holder.Position.Y.Offset)},0.5)task.wait(0.5)Holder:Destroy()Amount=Amount-1 end end)end
-- ^^ Libraries    

local players = game:GetService("Players");
local lp = players.LocalPlayer;

local sv = workspace:WaitForChild("SessionVehicles", 5);
assert(sv, "error, no car found :(");
function d(ini) -- shorthand name 
	Library:CreateNotification("Agent's Tuner", ini, 5)
end
spawn(function()
	local car = sv:WaitForChild(lp.Name .. "-Car");
	d("Found car, name: " .. car.Name)
	assert(sv, "error, no car found :(");
	local act = car:FindFirstChild("A-Chassis Tune");
	d("Found module to edit.")
	assert(act, "car doesnt have achassis tuner");
	local _act = require(act)
        --// speeeeed
	wait(.2)
	_act.E_Horsepower = 1000; --// set horsepower to 1000
	_act.Horsepower = 1000; --// set electric vehicle horsepower to 1000
	_act.Ratios = {
		3.7,
		0,
		2.84,
		1.55,
		1,
		0.65
	};
	_act.FinalDrive = 2.5; -- final drive stands for the ratio of the engine's power to the power of the wheels.
	_act.ClutchTol = 10000; --// set clutch tolerance to 10000
	_act.Redline = 10000; 
	_act.TurboEnabled = true; --// enable turbo
	_act.Turbochargers = 4;
	_act.Superchargers = 2;
	d("Changed speed. Changing breaks.")
	wait(1)
        --// brake best yes
	_act.Weight = 430; 
	_act.BrakeForce = 10000000000000; 
	_act.PBrakeForce = 10000000000000;
	print("Changed", block(_act)) --// print the new values
	d("Please exit and re-enter car to apply tuning")
	spawn(function()
		repeat
			wait()
		until iswindowactive()
		wait(.1)
		keypress(32)
		wait(.1)
		keyrelease(32)
		d("Your exploit supported vehicle exiting, so I did it for you <3")
	end)
end)
wait(3)
d("Enabling 'press k to refuel'")
rs = game:GetService("ReplicatedStorage");
local origcar = sv:WaitForChild(lp.Name .. "-Car", 5);
Instance.new("LocalScript", origcar).Name = "tuned"
iskilled = false
game:GetService("UserInputService").InputBegan:Connect(function(key, gp)
	if key.UserInputType == Enum.UserInputType.Keyboard then
		if key.KeyCode == Enum.KeyCode.K then
			if iskilled then
				return error("Severed") --// if you press k again, it will sever the connection 
			end
			rs.Remote.Refuel:FireServer(1, os.time());
			d("Refueled, security key: " .. os.time())
		end
	end
end)

repeat
	wait()
until origcar.Parent == nil or not origcar
d("Killing tuning and fuel hook as car has been destroyed.")
iskilled = true --// kill the hook
