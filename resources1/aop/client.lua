----------------------------------
-- Area of Patrol, Made by FAXES--
----------------------------------
AddEventHandler('playerSpawned', function()
    TriggerServerEvent('AOP:Sync')
end)

-- No longer in use....
RegisterNetEvent('AOP:List')
AddEventHandler('AOP:List', function()
	TriggerEvent("chatMessage", "AOP Script", {255, 0, 0}, "Blaine County [/aopbc], State Wide [/aopstate], Los Santos [/aopls], Vinewood [/aopvw], Mirror Park [/aopmp] Pillbox Hill / Downtown [aopdt], Davis [/aopdavis], Del Perro [/aopdp], Rockford Hills [/aoprh], Sandy Shores [/aopsandy], Harmony [/aopharm], GrapeSeed [/aopgrape], Paleto Bay [/aoppb], ^4Peace Time On [/pton], Peace Time Off [/ptoff], ^3RP Area Vote [/aopvote]")
end)


RegisterNetEvent('AOP:NoPerms')
AddEventHandler('AOP:NoPerms', function()
    TriggerEvent("chatMessage", "AOP Script", {255, 0, 0}, "Insufficient Permissions.")
end)
    
RegisterNetEvent('AOP:NoVote')
AddEventHandler('AOP:NoVote', function()
    TriggerEvent("chatMessage", "AOP Script", {255, 0, 0}, "AOP Vote Is Currently Not Active.")
end)


FaxCurAOP = "None"
FaxCurAOP2 = "Set"
peacetimeActive = false

RegisterNetEvent('AOP:SendAOP')
AddEventHandler('AOP:SendAOP', function(newCurAOP, newCurAOP2)
    FaxCurAOP = newCurAOP
	FaxCurAOP2 = newCurAOP2
end)

RegisterNetEvent('AOP:SendPeaceFalse')
AddEventHandler('AOP:SendPeaceFalse', function()
    peacetimeActive = false
end)

RegisterNetEvent('AOP:SendPeaceTrue')
AddEventHandler('AOP:SendPeaceTrue', function()
    peacetimeActive = true
end)
    
local year, month, day, hour, minute, second = GetLocalTime()

Citizen.CreateThread(function()
    while true do
    year, month, day, hour, minute, second = GetLocalTime()
        Citizen.Wait(1)
        if peacetimeActive == true then
            DrawText2(0.660, 1.430, 1.0,1.0,0.45, "~p~Time: ~w~" .. hour .. ":" .. minute .. " ~p~| Date: ~w~" .. day .. "~p~/~w~" .. month .. "~p~/~w~" .. year, 255, 255, 255, 255)
            DrawText2(0.660, 1.458, 1.0,1.0,0.45, "~w~Current ~r~AOP: ~w~" .. FaxCurAOP .. " " .. FaxCurAOP2 .. " ~p~| ~w~PeaceTime: ~g~Enabled", 255, 255, 255, 255)
        elseif peacetimeActive == false then 
            DrawText2(0.660, 1.430, 1.0,1.0,0.45, "~p~Time: ~w~" .. hour .. ":" .. minute .. " ~p~| Date: ~w~" .. day .. "~p~/~w~" .. month .. "~p~/~w~" .. year, 255, 255, 255, 255)
            DrawText2(0.660, 1.458, 1.0,1.0,0.45, "~w~Current ~r~AOP: ~w~" .. FaxCurAOP .. " " .. FaxCurAOP2 .. " ~p~| ~w~PeaceTime: ~r~Disabled", 255, 255, 255, 255)
        end
	end
end)

function DrawText2(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end