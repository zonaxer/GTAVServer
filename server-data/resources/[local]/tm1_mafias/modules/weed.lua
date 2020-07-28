local ped = {name = "El vende palas", x=-1858.57, y=2087.84, z= 140.62 - 1,rotation = 7.34,NetworkSync = false}
local ped1 =	{name = "El procesa maria", x=-284.81, y=-2209.69, z= 10.05 - 1,rotation = 60.01,NetworkSync = false}
local ped2 =	{name = "El compra maria", x=-539.86, y=-2212.09, z= 6.39 - 1,rotation = 90.01,NetworkSync = false}
local treatweed =	{ x=-1874.06, y=2070.36, z= 141}
local shovelPrice = 20
local isGetting = false
local secondsOfRecolect = 5
local weeds = {
	{x = -1872.07, y = 2107.18, z = 136.62},
	{x = -1819.29, y = 2136.19, z = 123.47},
	{x = -1843.08, y = 2198.25, z = 96.65},
}
local wanted_model= "G_M_Y_Lost_03"
local modelHash = GetHashKey(wanted_model)
local BUSSINESMAN = true
	  
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		--ACTIVAR MISION
		if GetDistanceBetweenCoords(ped.x,ped.y,ped.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
			DrawText3D(ped.x,ped.y,ped.z + 2, "Pulsa E para hablar con el señor", 255,255,255)
			if IsControlJustPressed(1,38) then
				OpenShovelMenu()
			end
		end
		if GetDistanceBetweenCoords(ped1.x,ped1.y,ped1.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
			DrawText3D(ped1.x,ped1.y,ped1.z + 2, "Pulsa E para hablar con el señor", 255,255,255)
			if IsControlJustPressed(1,38) then
				OpenTreatmentWeedMenu()
			end
		end
		if GetDistanceBetweenCoords(ped2.x,ped2.y,ped2.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
			DrawText3D(ped2.x,ped2.y,ped2.z + 2, "Pulsa E para hablar con el señor", 255,255,255)
			if IsControlJustPressed(1,38) then
				if BUSSINESMAN == true then
					OpenSellWeedMenu()
				else
					TriggerEvent('exp:NotificateError',"¿Que mierda quieres?, vete de aquí, morralla humana...")
				end
			end
		end
		if isGetting == true then
			drawTxt("RECOLECTANDO...",1, 1, 0.5, 0.5, 0.75,35,172,72,255)
		end
		for k,v in pairs(weeds) do
			if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1), true)) < 1.5 then
				DrawText3D(v.x,v.y,v.z, "Tiene pinta de que aquí hay material para recolectar...", 35,172,72)
			end
		end
	end
end)

RegisterNetEvent('tm1_mafias:isInWeed')
AddEventHandler('tm1_mafias:isInWeed', function()
	for k,v in pairs(weeds) do
		if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1), true)) < 1.5 then
			if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
				isGetting = true
				local seconds = secondsOfRecolect * 1000
				Citizen.CreateThread(function()
					while true do
						Citizen.Wait(100)
						ESX.UI.Menu.CloseAll()
						seconds = seconds - 100
						if seconds <= 0  then
							break
						end		
					end
					isGetting = false
					local cant = math.random(1,3)
					TriggerServerEvent('tm1_mafias:addItem',"weed",cant)
					TriggerServerEvent('tm1_mafias:breakShovel')
				end)
				
			end
		end
	end
end)

RegisterNetEvent('tm1_mafias:getTreatmentWeed')
AddEventHandler('tm1_mafias:getTreatmentWeed', function(number)
	blip = AddBlipForCoord(treatweed.x,treatweed.y,treatweed.z)
	SetBlipRoute(blip, true)
	createTreatMentWeed(number,treatweed.x,treatweed.y,treatweed.z)
end)

------------------------------
------------CREAR NPC---------
------------------------------
Citizen.CreateThread(function()
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
       	Wait(1)
    end
	created_ped = CreatePed(5, modelHash , ped.x,ped.y,ped.z, ped.rotation, false, ped.NetworkSync)
	FreezeEntityPosition(created_ped, true)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)

	--SEGUNDO NPC
	created_ped1 = CreatePed(5, modelHash , ped1.x,ped1.y,ped1.z, ped1.rotation, false, ped1.NetworkSync)
	FreezeEntityPosition(created_ped1, true)
	SetEntityInvincible(created_ped1, true)
	SetBlockingOfNonTemporaryEvents(created_ped1, true)
	TaskStartScenarioInPlace(created_ped1, "WORLD_HUMAN_DRINKING", 0, true)

	--TERCER NPC
	created_ped2 = CreatePed(5, modelHash , ped2.x,ped2.y,ped2.z, ped2.rotation, false, ped2.NetworkSync)
	FreezeEntityPosition(created_ped2, true)
	SetEntityInvincible(created_ped2, true)
	SetBlockingOfNonTemporaryEvents(created_ped2, true)
	TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_DRINKING", 0, true)  
end)

function createNPC()
	Citizen.Trace("hola")
    --PRIMER NPC
	created_ped = CreatePed(5, modelHash , ped.x,ped.y,ped.z, ped.rotation, false, ped.NetworkSync)
	FreezeEntityPosition(created_ped, true)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)

	--SEGUNDO NPC
	created_ped1 = CreatePed(5, modelHash , ped1.x,ped1.y,ped1.z, ped1.rotation, false, ped1.NetworkSync)
	FreezeEntityPosition(created_ped1, true)
	SetEntityInvincible(created_ped1, true)
	SetBlockingOfNonTemporaryEvents(created_ped1, true)
	TaskStartScenarioInPlace(created_ped1, "WORLD_HUMAN_DRINKING", 0, true)

	--TERCER NPC
	created_ped2 = CreatePed(5, modelHash , ped2.x,ped2.y,ped2.z, ped2.rotation, false, ped2.NetworkSync)
	FreezeEntityPosition(created_ped2, true)
	SetEntityInvincible(created_ped2, true)
	SetBlockingOfNonTemporaryEvents(created_ped2, true)
	TaskStartScenarioInPlace(created_ped2, "WORLD_HUMAN_DRINKING", 0, true)
end
function OpenShovelMenu()

	local elements = {
		{label = "Si",value = "yes"},
		{label = "No",value = "no"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'shovel_buy',
		{
			title  = '¿Quieres comprar una pala?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)	
			if data.current.value == 'yes' then
				TriggerServerEvent('tm1_mafias:addShovel',shovelPrice)
				Citizen.CreateThread(function ()
					TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
					Citizen.Wait(3000)
					TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)
				end)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function createTreatMentWeed(quantity,x,y,z)
	Citizen.CreateThread(function ()
		while true do
			Citizen.Wait(0)
			if GetDistanceBetweenCoords(x,y,z,GetEntityCoords(GetPlayerPed(-1), true)) < 1.5 then
				DrawText3D(x,y,z, "Pulsa E para recoger tu mercancia", 255,255,255)
				if IsControlJustPressed(1,38) then
					TriggerServerEvent('tm1_mafias:addItem',"weed_pooch",quantity)
					RemoveBlip(blip)
					break
				end
			end
		end
	end)
end

function OpenTreatmentWeedMenu()

	local elements = {
		{label = "Si",value = "yes"},
		{label = "No",value = "no"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'treatmentweed_menu',
		{
			title  = '¿Quieres que me haga cargo de esa mercancia?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)	
			if data.current.value == 'yes' then
				TriggerServerEvent('tm1_mafias:treatWeed')
				Citizen.CreateThread(function ()
					TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
					Citizen.Wait(3000)
					TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)
				end)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenSellWeedMenu()

	local elements = {
		{label = "Si",value = "yes"},
		{label = "No",value = "no"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'treatmentweed_menu',
		{
			title  = '¿Quieres venderme marihuana?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)	
			if data.current.value == 'yes' then
				TriggerServerEvent('tm1_mafias:sellWeed')
				Citizen.CreateThread(function ()
					TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
					Citizen.Wait(3000)
					TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)
				end)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

