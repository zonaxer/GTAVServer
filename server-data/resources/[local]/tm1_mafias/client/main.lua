------------------------------
----------LLAMADAS------------
------------------------------
AddEventHandler('playerSpawned', function(spawn)
	TriggerServerEvent('tm1_mafias:groupcomprobate')
end)
TriggerServerEvent('tm1_mafias:groupcomprobate')

------------------------------
----------REGISTROS-----------
------------------------------
RegisterNetEvent('tm1_mafias:groupcomprobated')
RegisterNetEvent('tm1_mafias:refreshedMoney')
RegisterNetEvent('tm1_mafias:refreshedGroup')
RegisterNetEvent('tm1_mafias:refreshedSteam')
RegisterNetEvent('tm1_mafias:contador')
RegisterNetEvent('pop_university:setBussinesMan')
------------------------------
----------VARIABLES-----------
------------------------------
group = {
	name = "",
	money = nil,
	rank = nil,
	aprove = nil,
	groupid = nil,
	steam = nil,
	source = nil,
	enclosure = nil
}

ISMENUACTIVE = true

BUSSINESMAN = false
WEAPONLEVEL = 0
------------------------------
---------TRADUCCIONES---------
------------------------------
rankLabel = {
	[1] = "RECLUTA",
	[2] = "NOVATO",
	[3] = "GANSTER",
	[4] = "SUBJEFE",
	[5] = "JEFE"
}
grouplabel = {
	[1] = "BANDA",
	[2] = "MAFIA"
}
local forceStop = false
------------------------------
--------HILO PRINCIPAL--------
------------------------------

function HUD()
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if forceStop == false then
			if ISMENUACTIVE == true then
				drawTxt(group.name,1, 1, 0.92, 0.24, 0.65,255,0,0,255)
				drawTxt(group.money.." EUROS",2, 1,  0.92, 0.28, 0.45,0,255,0,255)
				drawTxt(rankLabel[group.rank],2, 1, 0.92, 0.30, 0.45,0,255,239,255)
				drawTxt(grouplabel[group.aprove],2, 1, 0.92, 0.32, 0.45,0,255,239,255)
			end
		else
			break
		end
	end
end)
end

function mysqlFinish()
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if forceStop == false then
		else
			break
		end
	end
end)
end 

------------------------------
-----------EVENTOS------------
------------------------------
AddEventHandler('tm1_mafias:groupcomprobated',function(isGroup,name,money,rank,aprove,id,steam,source,enclosure)
	isInAGroup = isGroup
	group.name = name
	group.money = money
	group.rank = rank
	group.groupid = id
	group.steam = steam
	group.source = source
	group.enclosure = enclosure
	if aprove == 1 then
		group.aprove = 2
	else
		group.aprove = 1
	end
	TriggerServerEvent('tm1_mafias:setGroup',group)
	HUD()
	mysqlFinish()
	TriggerEvent('tm1_mafias:setInfo',group)
end)

AddEventHandler('tm1_mafias:refreshedMoney',function(id,money)
	if id == group.groupid then
		group.money = money
		TriggerServerEvent('tm1_mafias:setGroup',group)
	end
end)

AddEventHandler('tm1_mafias:refreshedSteam',function(steam,source)
		group.steam = steam
		group.source = source
		TriggerServerEvent('tm1_mafias:setGroup',group)
end)
AddEventHandler('tm1_mafias:contador',function(groupid)
		if groupid == group.groupid then
			TriggerServerEvent('tm1_mafias:addUser',group.groupid)
		end
end)
AddEventHandler('tm1_mafias:contador',function(groupid)
		if groupid == group.groupid then
			TriggerServerEvent('tm1_mafias:addUser',group.groupid)
		end
end)
AddEventHandler('pop_university:setBussinesMan',function()
	BUSSINESMAN = true
end)

AddEventHandler('pop_university:setWeaponLicense',function()
	WEAPONLEVEL = WEAPONLEVEL + 1
end)
AddEventHandler('tm1_mafias:refreshedGroup',function(id,opc,steam,gr)
		TriggerServerEvent('tm1_mafias:groupcomprobate')
		if opc == "Fuck_This_Shit" and steam == group.steam or steam == "DFFDS54" then
			group.name = nil
			group.money = nil
			group.rank = nil
			group.groupid = nil
			group.aprove = nil
			group.enclosure = nil
			TriggerServerEvent('tm1_mafias:setGroup',group)
			BreakTheSystem()
			TriggerEvent('tm1_mafias:setInfo',group)
		end

end)
------------------------------
----------FUNCIONES-----------
------------------------------
function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(centre)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end

function BreakTheSystem()
	Citizen.CreateThread(function ()
		forceStop = true
		Citizen.Wait(1000)
		forceStop = false
	end)
end

local blips = {
	{title="Sociedades Anónimas", colour=2, id=496, x = 1275.0, y = -1721.51, z = 53.66},
}
------------------------------
------------BLIPS-------------
------------------------------
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
