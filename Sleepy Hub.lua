wait(0.5)local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,370,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="Anti Afk"ca.TextColor3=Color3.new(0,1,1)
ca.TextSize=22;da.Parent=ca
da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
da.Size=UDim2.new(0,370,0,107)_b.Parent=da
_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
_b.Size=UDim2.new(0,370,0,21)_b.Font=Enum.Font.Arial;_b.Text="Made by luca#5432"
_b.TextColor3=Color3.new(0,1,1)_b.TextSize=20;ab.Parent=da
ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377,0)
ab.Size=UDim2.new(0,370,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="Status: Active"
ab.TextColor3=Color3.new(0,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
ab.Text="Roblox tried kicking you buy I didnt let them!"wait(2)ab.Text="Status : Active"end)

ca.Visible = false

-- todo

-- add tp aura

-- instamine on all blocks


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()


local custompos = 0,0,0


getgenv().automining = instaminetoggle

getgenv().posing = false

getgenv().killauramode = false

getgenv().instaminemode = false

getgenv().godmodon = false

getgenv().auratoggled = false

getgenv().flinging = false

getgenv().bhopping = false

getgenv().postping = false


getgenv().tpauring = false


getgenv().custommove = false


getgenv().bringplr = false

local rangeslider = 0
local Window = Library.CreateLib("Sleepy Hub", "DarkTheme")

	local customcoords = nil

local main = Window:NewTab('Minerscave')


local Player = main:NewSection('Player')

local Combat = main:NewSection("Combat")

local binds = main:NewSection('KeyBinds')



binds:NewKeybind("Toggle Gui", "Toggles the gui", Enum.KeyCode.RightControl, function()
	Library:ToggleUI()
end)

local GodMode = Player:NewButton('Godmode','Removes fall dmg and suffocation dmg',function()

	for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
		if v.Name == 'Demo' then
			v.Parent = game.CoreGui
		end
	end

end)



local automine = Player:NewToggle('InstaMine','instamine weak stuff',function(instaminetoggle)


getgenv().automining = instaminetoggle


if automining == true then

repeat wait()


game:GetService("ReplicatedStorage").GameRemotes.AcceptBreakBlock:InvokeServer()


until automining == false

end
end)


local bhop = Player:NewToggle('BunnyHop','Gotta Go fast',function(bhopp)

getgenv().bhopping = bhopp


if bhopping == true then


local lastspeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed 


local lastjump = game.Players.LocalPlayer.Character.Humanoid.JumpPower
repeat wait()

				local VirtualInputManager = game:GetService('VirtualInputManager')
				VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
				game.Players.LocalPlayer.Character.Humanoid.JumpPower = 10
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 60

until bhopping == false


				game.Players.LocalPlayer.Character.Humanoid.JumpPower = lastjump
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = lastspeed

end


end)





Player:NewSlider("Speed", "SliderInfo", 200, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)



Player:NewSlider("JumpPower", "SliderInfo", 100, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)


local targetHUD = main:NewSection('TargetHUD')

local targethp = targetHUD:NewLabel('Name: ')

local targetname = targetHUD:NewLabel('Health :')

local targetdist = targetHUD:NewLabel('Distance:' )

local theaura = Combat:NewToggle('KillAura', 'Activates Op Kill Aura',function(killaurastate)
	getgenv().killauramode = killaurastate
	if killauramode then

		repeat wait()
			if killauramode == true then
						for i,v in pairs(game.Workspace:GetChildren()) do
					if v:FindFirstChild('HumanoidRootPart') then
						if v.Name == game.Players.LocalPlayer.Name then
							wait()
						elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < rangeslider then

							game:GetService("ReplicatedStorage").GameRemotes.Attack:InvokeServer(workspace[v.Name])




								local targetdistance = math.round((v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) 


							-- important stuff here 

							-- game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

								targethp:UpdateLabel("Health : "..math.round(v.Humanoid.Health))


								targetname:UpdateLabel("Name : "..v.Name)

								targetdist:UpdateLabel("Distance : "..targetdistance)




							wait(math.random(0.3,0.4))
						elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 15  then
						
						end
					end
					end
				end





		until killauramode == false

	else
		print('disabled killaura')

	end
end)

Combat:NewSlider('Killaura Range', 'The Range Of the killaura',20,0,function(range)

rangeslider = range

end)









binds:NewKeybind("Toggle Killaura", "Set Keybind for kIllaura", Enum.KeyCode.R, function()
if killauramode == false then
killauramode = true
repeat wait()

						for i,v in pairs(game.Workspace:GetChildren()) do
					if v:FindFirstChild('HumanoidRootPart') then
						if v.Name == game.Players.LocalPlayer.Name then
						elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < rangeslider then

							game:GetService("ReplicatedStorage").GameRemotes.Attack:InvokeServer(workspace[v.Name])


								local targetdistance = math.round((v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) 


							-- important stuff here 

							-- game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

								targethp:UpdateLabel("Health : "..math.round(v.Humanoid.Health))


								targetname:UpdateLabel("Name : "..v.Name)

								targetdist:UpdateLabel("Distance : "..targetdistance)


							wait(math.random(0.3,0.4))
						elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude > 15  then
						
						end
					end
					
end

until killauramode == false
elseif killauramode == true then
killauramode = false
end
end)

for i,v in pairs(game.Workspace:GetChildren()) do


if v.Name == game.Players.LocalPlayer.Name then

wait()

elseif v:FindFirstChild('HumanoidRootPart') then
-- This sc

end

end

local infrange = 0

local latpos = 0

local tprange = Combat:NewSlider("Tp-Aura range", "How big the aura must be", 100, 0, function(dababus) -- 500 (MaxValue) | 0 (MinValue)
    infrange = dababus
end)

local tpaura = Combat:NewToggle('Tp-Aura','KillAura but inf',function(susser)
    getgenv().tpauring = susser

    
    if tpauring == true then
        repeat wait()
            
            
            for i,v in pairs(game.workspace:GetChildren()) do
                if v:FindFirstChild('HumanoidRootPart') then
                    if v.Name == game.Players.LocalPlayer.Name then
                        
                    elseif (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude < infrange then
                        local lastseen = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0,0,0)
                        game:GetService("ReplicatedStorage").GameRemotes.Attack:InvokeServer(workspace[v.Name])
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lastseen
                        
                        wait(math.random(0.3,0.4))
                         

                        end
                    end


                    end
                
                
                
        

        until tpauring == false
        
    end
    
    
    end)






































local main2 = Window:NewTab('FlingPeople/Things')


local flingstuff = main2:NewSection('Fling and teleport people + Range stuff')

flingstuff:NewToggle('Inf Range',' Yep inf range',function(flin)
getgenv().flinging = flin

if flinging == false then


elseif flinging == true then
repeat wait()
if game.Workspace:FindFirstChild('GrabParts') then
for i,v in pairs(game.Workspace.GrabParts:GetChildren()) do
if v.Name == 'Owner' then
wait()
else

for i = 1,100 do



local mouse = game.Players.LocalPlayer:GetMouse()

local pos = mouse.Hit+Vector3.new(0,2.5,0)

pos = CFrame.new(pos.X,pos.Y,pos.Z)




local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local part = v
local goal = {CFrame = pos}
local tween = tweenService:Create(part, tweenInfo, goal)
tween:Play()

end
end
end

end
until flinging == false
end

end)

local cuspos = flingstuff:NewLabel('Custom set player is : ')



local peopl = game.Players:GetPlayers()
local playerlist = flingstuff:NewDropdown("Select player", "DropdownInf", {"Option 1", "Option 2", "Option 3",peopl.Name      }, function(currentOption)
    print(currentOption)
end)




flingstuff:NewTextBox("Setplayer", "TextboxInfo", function(txt)
	custompos = txt
	
	
	customcoords = custompos
	
	
	

	
end)


flingstuff:NewToggle('Teleport to player','teleports object to given player',function(tppos)
getgenv().postping = tppos


if postping == true then

repeat wait()


if workspace:FindFirstChild('GrabParts') then




for i,v in pairs(workspace.GrabParts:GetChildren()) do

if v.Name == 'Owner' then

wait()

else
for i = 1,100 do
    print(customcoords)


local cooords = customcoords


cuspos:UpdateLabel('Custom player pos is : '..customcoords)


local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
local part = v
local goal = {CFrame = CFrame.new(game.workspace[customcoords].HumanoidRootPart.Position)}
local tween = tweenService:Create(part, tweenInfo, goal)
tween:Play()

end

end

end


end













until postping == false

end
end)



local player = main2:NewSection('Player')



player:NewButton('Godmode','become god',function()

for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do


if v.Name == 'RagdollCharacter' then


v:Destroy()



end


end

end)





getgenv().gettingpos = false


































local main3 = Window:NewTab('Break In')


local player = main3:NewSection('Player')


local stuff = main3:NewSection('Items')

local roles = main3:NewSection('roles')




stuff:NewButton('Give 100 Apples','give you apples',function()
    for i = 1,100 do


local string_1 = "Apple";
local Target = game:GetService("ReplicatedStorage").RemoteEvents.GiveTool;
Target:FireServer(string_1);


end
end)



stuff:NewButton('Give Pizza','',function()

local string_1 = "Pizza3";
local Target = game:GetService("ReplicatedStorage").RemoteEvents.GiveTool;
Target:FireServer(string_1);

    end)


getgenv().givingplanks = false

stuff:NewToggle('Give Planks','',function(state)
getgenv().givingplanks = state

if givingplanks == true then
    
    
    repeat wait()
        
      local Target = game:GetService("ReplicatedStorage").RemoteEvents.RefreshPlanks;
      Target:FireServer();
  
        
    until givingplanks == false
    
    end

    

    end)


stuff:NewButton('Collect Pinlock','',function()
    

local userdata_1 = game:GetService("Players").JustNormalLama;
local Target = game:GetService("ReplicatedStorage").RemoteEvents.PadlockDetector;
Target:FireServer(userdata_1);


end)


getgenv().iskilling = false

player:NewToggle('Kill All Bad guys','...',function(killingbad)
    
    
getgenv().iskilling = killingbad


if iskilling == true then
    
    repeat wait()
        
     for i,v in pairs(game.workspace:GetChildren()) do
        for i = 1,5 do
        
     if v.Name == 'BadGuys' then
         
         for n,m in pairs(v:GetChildren()) do
             
             print(m.Humanoid.Health)
             
             
            local userdata_1 = m
            local number_1 = 10;
            local Target = game:GetService("ReplicatedStorage").RemoteEvents.HitBadguy;
            Target:FireServer(userdata_1, number_1);

             
             
             
             end
         
         end
        
        
        end
    end   
        
    until iskilling == false
    
    end
    

    
end)


stuff:NewButton('Give 100 Cookies','...',function()
    
    
    
    for i = 1,100 do
        
        
        
local string_1 = "Cookie";
local Target = game:GetService("ReplicatedStorage").RemoteEvents.GiveTool;
Target:FireServer(string_1);

        
        end
    
    end)





player:NewButton('Heal Everyone','OP',function()
    
    
    for i,v in pairs(game.Players:GetPlayers()) do
        
        
        
local userdata_1 = game:GetService("Players")[v.Name];
local Target = game:GetService("ReplicatedStorage").RemoteEvents.HealPlayer;
Target:FireServer(userdata_1);

        
        end
    
end)


player:NewButton('Complete hack cameras instantly','',function()
    for i = 1,100 do
        wait()
        
        
local number_1 = 3;
local string_1 = "Completed";
local Target = game:GetService("ReplicatedStorage").RemoteEvents.PCCamera;
Target:FireServer(number_1, string_1);

        end
    
    
    end)


stuff:NewButton('GetKey','',function()
    
local string_1 = "Key";
local Target = game:GetService("ReplicatedStorage").RemoteEvents.GiveTool;
Target:FireServer(string_1);

end)

player:NewButton('Unlock Basement','',function()
   

local Target = game:GetService("ReplicatedStorage").RemoteEvents.UnlockDoor;
Target:FireServer();

 
end)



stuff:NewButton('GetLadder','',function()
   
local number_1 = 1;
local Target = game:GetService("ReplicatedStorage").RemoteEvents.Ladder;
Target:FireServer(number_1);
 
end)


player:NewToggle('godmode','',function(godstate)
  getgenv().godmodon = godstate
  
  if godmodon == true then
      
      repeat wait()
          local string_1 = "Apple";
            local Target = game:GetService("ReplicatedStorage").RemoteEvents.GiveTool;
            Target:FireServer(string_1);
          
            local number_1 = 15;
            local string_1 = "Apple";
            local Target = game:GetService("ReplicatedStorage").RemoteEvents.Energy;
            Target:FireServer(number_1, string_1);

          
          
          
         until godmodon == false
      
      end
    
    
    
end)



stuff:NewButton('Give 100 Blox cola','',function()
   
for i = 1,100 do
local string_1 = "BloxyCola";
local Target = game:GetService("ReplicatedStorage").RemoteEvents.GiveTool;
Target:FireServer(string_1);
end
 
end)

player:NewButton('SkipLoadingscreen','',function()
    
   local Target = game:GetService("ReplicatedStorage").RemoteEvents.LoadingScreen;
Target:FireServer(); 
end)

player:NewButton('Skip Tele','',function()


for i = 1,100 do
local Target = game:GetService("ReplicatedStorage").RemoteEvents.SkipTele;
Target:FireServer();
end
    
end)



roles:NewButton('Role Swat','',function()
    
    local A_1 = "SwatGun"
local A_2 = true
local Event = game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole
Event:FireServer(A_1, A_2)
    
end)

roles:NewButton('Role Police','',function()
    
    -- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "Gun"
local ohBoolean2 = true

game:GetService("ReplicatedStorage").RemoteEvents.OutsideRole:FireServer(ohString1, ohBoolean2)
    
end)



roles:NewButton('Bat','',function()
    
    
    -- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "Bat"
local ohBoolean2 = false
local ohBoolean3 = false

game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer(ohString1, ohBoolean2, ohBoolean3)
    
end)



roles:NewButton('MedKit','',function()
    
-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohString1 = "MedKit"
local ohBoolean2 = false
local ohBoolean3 = false

game:GetService("ReplicatedStorage").RemoteEvents.MakeRole:FireServer(ohString1, ohBoolean2, ohBoolean3)
    
    end)


stuff:NewButton('give sword','lmao',function()
    
    game.ReplicatedStorage.RemoteEvents.GiveTool:FireServer("LinkedSword")
    end)


player:NewButton('Collect All money','',function()
for i,v in pairs(game.Workspace:GetChildren()) do


if v.Name == 'Money' or 'Money1' or 'Money2' or 'Money3' or 'Money4' then
local ohInstance1 = v

game:GetService("ReplicatedStorage").RemoteEvents.FoundMoney:FireServer(ohInstance1)

end


end




    
    
    end)


stuff:NewButton('Get cola pie','',function()
    -- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide

local ohNumber1 = 1
local ohNumber2 = 743
local ohInstance3 = game:GetService("Players").LocalPlayer.Backpack.Pie

game:GetService("ReplicatedStorage").RemoteFunctions.PieInfo:InvokeServer(ohNumber1, ohNumber2, ohInstance3)
    
    end)


local gun = main3:NewSection('Weapon')

getgenv().infammoing = false
gun:NewToggle('Inf swat ammmo','',function(infammo)
    getgenv()infammoing = infammo
    
    if infammoing == true then
        
        repeat wait(0.2)
            
            -- Generated by Hydroxide's Upvalue Scanner: https://github.com/Upbolt/Hydroxide

local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()

local scriptPath = workspace[game.Players.LocalPlayer.Name].SwatGun.LocalScript
local closureName = "shoot"
local upvalueIndex = 1
local closureConstants = {
	[1] = "Character",
	[2] = "Humanoid",
	[3] = "FindFirstChild",
	[4] = "workspace",
	[5] = workspace,
	[6] = "Sounds"
}

local closure = aux.searchClosure(scriptPath, closureName, upvalueIndex, closureConstants)
local value = 35


-- DO NOT RELY ON THIS FEATURE TO PRODUCE 100% FUNCTIONAL SCRIPTS
debug.setupvalue(closure, upvalueIndex, value)
            
            
            until infammoing == false
        
        end
    
    
    
    end)





local tps = main3:NewSection('Teleports')


tps:NewButton('House','',function()
    
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-27, 4, -220)
    
end)


tps:NewButton('Market','',function()
    
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-423, 12, -116)
    
    end)


getgenv().fuckinghouse = false
player:NewToggle('Destroy House like fuck','',function(sushouse)
    
    getgenv().fuckinghouse = sushouse
    
    if fuckinghouse == true then
        repeat wait()
            
            
local userdata_1 = game:GetService("Workspace").LarrysHouse.Destructable.Chandelier;
local Target = game:GetService("ReplicatedStorage").RemoteEvents.MansionHit;
Target:FireServer(userdata_1);



local userdata_1 = game:GetService("Workspace").LarrysHouse.Destructable.DiningChair;
local Target = game:GetService("ReplicatedStorage").RemoteEvents.MansionHit;
Target:FireServer(userdata_1);



local userdata_1 = game:GetService("Workspace").LarrysHouse.Destructable.Plantpot;
local Target = game:GetService("ReplicatedStorage").RemoteEvents.MansionHit;
Target:FireServer(userdata_1);



local userdata_1 = game:GetService("Workspace").LarrysHouse.Destructable.SmallTable;
local Target = game:GetService("ReplicatedStorage").RemoteEvents.MansionHit;
Target:FireServer(userdata_1);



local userdata_1 = game:GetService("Workspace").LarrysHouse.Destructable.Rose;
local Target = game:GetService("ReplicatedStorage").RemoteEvents.MansionHit;
Target:FireServer(userdata_1);

print('fucking house!')


            
            until fuckinghouse == false
        
        
        end
    
    end)

player:NewButton('Befriend Cat','',function()
    
    
local Target = game:GetService("ReplicatedStorage").RemoteEvents.Cattery;
Target:FireServer();

    
    
    end)

stuff:NewButton('get car key','',function()
    
    
    
    
local Target = game:GetService("ReplicatedStorage").RemoteEvents.GetKeys;
Target:FireServer();

    
end)

getgenv().bringingcat = false
player:NewToggle('Bring cat','help with follow plr',function(bringcat)
    getgenv().bringingcat = bringcat
    
    if bringingcat == true then
        
        local boost = Instance.new('BodyPosition')
        
        repeat wait() 
            
       

local cat = game:GetService("Workspace").TheHouse.SmallCat



cat.PrimaryPart = cat.Torso





boost.P = 100000


boost.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,5,0)


boost.Parent = game:GetService("Workspace").TheHouse.SmallCat.Torso


fireclickdetector(cat.ClickDetector)





            
            
            
            
            until bringingcat == false
        
        boost:Destroy()
        
        
        end
    
    end)

player:NewButton('Onehit Eggboss','',function()
    
    
for i = 1,200 do
    
    
    
    local Target = game:GetService("ReplicatedStorage").RemoteEvents.HitEggBoss;
Target:FireServer();
end

    
    
    end)

stuff:NewButton('glitch game and then click collect all money aggain','',function()
    
    
for i = 1,100 do
    local Target = game:GetService("ReplicatedStorage").RemoteEvents.GetKeys;
Target:FireServer();
    
end
wait(5)

for i,v in pairs(game.Workspace:GetChildren()) do


if v.Name == 'Money' or 'Money1' or 'Money2' or 'Money3' or 'Money4' then
local ohInstance1 = v

game:GetService("ReplicatedStorage").RemoteEvents.FoundMoney:FireServer(ohInstance1)

end


end

    
    end)


























































local main4 = Window:NewTab('Camping 1')


local player = main4:NewSection('Player')






player:NewButton('Pick up all tools','',function()
   
   for i,v in pairs(game.workspace:GetChildren()) do
       
       if v.Name == 'gear2' or 'gear1' or 'gear3' or 'gear4' or 'gear5' or 'gear6' or 'gear7' then
           
           if v:FindFirstChild('Item') then
              
                            
            firetouchinterest(game.Players.LocalPlayer.Character.Head,v.Item,0) -- = true
            
            wait(0.01)
            
            firetouchinterest(game.Players.LocalPlayer.Character.Head,v.Item,1) -- 1 = false
               
               end
              

           
          end
       
       
       
       end
       
       



end)



player:NewButton('Goto Camp','',function()
   
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-54.3840027, 4.00001287, -53.2068443, 0.806315064, 0, -0.591486275, 0, 1, 0, 0.591486275, 0, 0.806315064)
    
end)


player:NewButton('Goto Cave','',function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-235.151764, 9.80001831, 158.287079, 1, 0, 0, 0, 1, 0, 0, 0, 1) 
end)


player:NewButton('Get PicnicBasket','',function()
    
    for i,v in pairs(game.workspace:GetChildren()) do
        
        if v:FindFirstChild('Food') then
            
            local coords = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Food.CFrame
            
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = coords
            
            end
        
        end
    
    end)









player:NewButton('SkipBearLevel','',function()
    

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-608, -47, 172)
    end)








player:NewButton('Anti kick on death','Disables that you get kicked on death',function()
    game.workspace.HackerKick:Destroy()
    game.workspace.Game:GetChildren():Destroy()
    game.Players.LocalPlayer.PlayerScripts.ReviveCount.ForceReturn:Destroy()
end)
































local main5 = Window:NewTab('Raise A floppa')


local player = main5:NewSection('Floppa')

getgenv().flopping = false
player:NewToggle('Auto farm','',function(floppastate)
    getgenv().flopping = floppastate
    
    
    if flopping == true then
        
        repeat wait()
            
            for i,v in pairs(game.workspace:GetChildren()) do
                
                if v.Name == 'Money' then
                    
                    firetouchinterest(game.Players.LocalPlayer.Character.Head,v,1)
                    wait()
                    firetouchinterest(game.Players.LocalPlayer.Character.Head,v,0)
                    
                    

                    
                end
                
                 if v.Name == 'Floppa' then
                    
                    fireclickdetector(v.ClickDetector,1)
                    
                    
                 end
                
                

                
            
                
                
                
            end
            

            
            
            
            until flopping == false
        
        end
    
    
end)

getgenv().bagfarming = false
player:NewToggle('Auto Farm Bag','',function(bagfarm)
getgenv().bagfarming = bagfarm


if bagfarming == true then
    
    repeat wait()
        
        for i,v in pairs(game.Workspace:GetChildren()) do
            
                   if v.Name == 'Money Bag' then
            
                firetouchinterest(v)
            
                end 
            
            end
        

        
        until bagfarming == false
    
    end
    
    
    
end)

getgenv().nopoo = false
player:NewToggle('auto clear poo','',function(ispoo)
    getgenv().nopoo = ispoo
    
    
    if nopoo == true then
        repeat wait()
            for i,v in pairs(game.Workspace['Litter Box']:GetDescendants()) do
                if v.Name == 'Poop' then
    
                    fireproximityprompt(v.ProximityPrompt)
                    
                    end
                end
            
            
            until ispoo == false
        end
    
    
    end)

player:NewButton('goto Darkweb seller','',function()
    
    for i,v in pairs(game.Workspace:GetDescendants()) do
        
        if v.Name == 'Backrooms Merchant' then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v:FindFirstChild('Part').CFrame
            
            end
        
        end
    
    
    
    end)

getgenv().fertify = false
player:NewToggle('Auto get Fertilizer','',function(fert)
    getgenv().fertify = fert
    
    if fertify == true then
        
        repeat wait()
            
            for i,v in pairs(game.Workspace:GetChildren()) do
                
                if v.Name == 'Fertilizer' then
                    
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    
                    end
                
                
                
                end
            
            
            
            until fertify == false
        
        
        end
    
    
    end)







local main6 = Window:NewTab('SCP 3008')


local player = main6:NewSection('Player')



local stuff = main6:NewSection('Vip server')









stuff:NewButton('Spawn Tool Gun','',function()
    
    
local table_1 = {
	["CommandName"] = 'SpawnItem',
	["Anchored"] = true,
	["ItemName"] = 'Tool Gun',
	["Category"] = 'Tool_ItemModels'
};
local Target = game:GetService("ReplicatedStorage").Command;
Target:FireServer(table_1);

    
    
end)


stuff:NewButton('godmode','',function()
    
  
    
    end)







































































































































































































































local Universal = Window:NewTab('Universal')


local FE = Universal:NewSection('FE')



FE:NewButton('Aimbot works on any game','',function()
    
  local function simpleaimbot()
local Area = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local MyCharacter = LocalPlayer.Character
local MyRoot = MyCharacter:FindFirstChild("HumanoidRootPart")
local MyHumanoid = MyCharacter:FindFirstChild("Humanoid")
local Mouse = LocalPlayer:GetMouse()
local MyView = Area.CurrentCamera
local MyTeamColor = LocalPlayer.TeamColor
local HoldingM2 = false
local Active = false
local Lock = false
local Epitaph = 0 ---Note: The Bigger The Number, The More Prediction.
local HeadOffset = Vector3.new(0, .1, 0)

_G.TeamCheck = false
_G.AimPart = "HumanoidRootPart"
_G.Sensitivity = 0
_G.CircleSides = 64
_G.CircleColor = Color3.fromRGB(255, 0, 130)
_G.CircleTransparency = 0
_G.CircleRadius = 200
_G.CircleFilled = false
_G.CircleVisible = true
_G.CircleThickness = 1

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(MyView.ViewportSize.X / 2, MyView.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local function CursorLock()
	UIS.MouseBehavior = Enum.MouseBehavior.LockCenter
end
local function UnLockCursor()
	HoldingM2 = false Active = false Lock = false 
	UIS.MouseBehavior = Enum.MouseBehavior.Default
end
function FindNearestPlayer()
	local dist = math.huge
	local Target = nil
	for _, v in pairs(Players:GetPlayers()) do
		if v ~= LocalPlayer and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") and v then
			local TheirCharacter = v.Character
			local CharacterRoot, Visible = MyView:WorldToViewportPoint(TheirCharacter[_G.AimPart].Position)
			if Visible then
				local RealMag = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(CharacterRoot.X, CharacterRoot.Y)).Magnitude
				if RealMag < dist and RealMag < FOVCircle.Radius then
					dist = RealMag
					Target = TheirCharacter
				end
			end
		end
	end
	return Target
end

UIS.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		HoldingM2 = true
		Active = true
		Lock = true
		if Active then
        	local The_Enemy = FindNearestPlayer()
			while HoldingM2 do task.wait(.000001)
				if Lock and The_Enemy ~= nil then
					local Future = The_Enemy.HumanoidRootPart.CFrame + (The_Enemy.HumanoidRootPart.Velocity * Epitaph + HeadOffset)
					MyView.CFrame = CFrame.lookAt(MyView.CFrame.Position, Future.Position)
					CursorLock()
				end
			end
		end
	end
end)
UIS.InputEnded:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton2 then
		UnLockCursor()
	end
end)
game.StarterGui:SetCore("SendNotification", {Title = "Working.", Text = "Success, Script Loaded.", Duration = 4,})    
    
    
    end

simpleaimbot()  
    
    end)


