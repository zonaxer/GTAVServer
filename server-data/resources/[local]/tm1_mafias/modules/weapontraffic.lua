local ped = {name = "El manda trabajo", x=954.72, y=-2180.38, z= 30.55 - 1,rotation = 84.77,NetworkSync = true}
local changed = {name = "El cambia trabajo", x = 802.19, y = -756.62,z = 26.8 - 1,rotation = 176.15,NetworkSync = true}
local seller = {name = "El vende trabajo", x = -539.98, y = -1638.05,z = 18.89,rotation = 69.68,NetworkSync = true}
local truckspawn = {x = 951.62, y = -2176.21,z = 30.36}
local cerrajero = {x = 958.83, y = -204.7,z = 72.75 - 1}
local truckDown = {x = 951.62, y = -2176.21,z = 30.36 - 1}
local priceScope = 600
local priceCanion = 600
local priceCulett = 500
local isInJob = false
local firstEtape = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		--ACTIVAR MISION
		if GetDistanceBetweenCoords(ped.x,ped.y,ped.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
			DrawText3D(ped.x,ped.y,ped.z + 2, "~y~[~w~E~y~]~b~ - Hablar con el señor", 255,255,255)
			if IsControlJustPressed(1,38) then
				OpenWeaponToMenu()
			end
		end
		if GetDistanceBetweenCoords(changed.x,changed.y,changed.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
			DrawText3D(changed.x,changed.y,changed.z + 2, "~y~[~w~E~y~]~b~ - Hablar con el señor", 255,255,255)
			if IsControlJustPressed(1,38) then
				OpenChangedToMenu()
			end
		end
		if GetDistanceBetweenCoords(seller.x,seller.y,seller.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
			DrawText3D(seller.x,seller.y,seller.z + 2, "~y~[~w~E~y~]~b~ - Hablar con el señor", 255,255,255)
			if IsControlJustPressed(1,38) then
				if BUSSINESMAN == true then
					OpenSellerToMenu()
				else
					TriggerEvent('exp:NotificateError',"¿Qué mierda quieres? Vete de aquí, morralla humana...")
				end
			end
		end
	end
end)

function createNPCCoke()
    --PRIMER NPC
	created_ped3 = CreatePed(5, modelHash , ped.x,ped.y,ped.z, ped.rotation, false, ped.NetworkSync)
	FreezeEntityPosition(created_ped3, true)
	SetEntityInvincible(created_ped3, true)
	SetBlockingOfNonTemporaryEvents(created_ped3, true)
	TaskStartScenarioInPlace(created_ped3, "WORLD_HUMAN_DRINKING", 0, true)
	--SEGUNDO NPC
	created_ped4 = CreatePed(5, modelHash , changed.x,changed.y,changed.z, changed.rotation, false, changed.NetworkSync)
	FreezeEntityPosition(created_ped4, true)
	SetEntityInvincible(created_ped4, true)
	SetBlockingOfNonTemporaryEvents(created_ped4, true)
	TaskStartScenarioInPlace(created_ped4, "WORLD_HUMAN_DRINKING", 0, true)
	--TERCER NPC
	created_ped5 = CreatePed(5, modelHash , seller.x,seller.y,seller.z, seller.rotation, false, seller.NetworkSync)
	FreezeEntityPosition(created_ped5, true)
	SetEntityInvincible(created_ped5, true)
	SetBlockingOfNonTemporaryEvents(created_ped5, true)
	TaskStartScenarioInPlace(created_ped5, "WORLD_HUMAN_DRINKING", 0, true)
end

Citizen.CreateThread(function()
    wanted_model= "G_M_Y_Lost_03"
    modelHash = GetHashKey(wanted_model)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
       	Wait(1)
    end
    createNPCCoke()   
end)

function spawn_truck()
	Citizen.Wait(0)

	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('barracks')

	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

	local plate = math.random(100, 900)
	local spawned_car = CreateVehicle(vehicle, truckspawn.x,truckspawn.y,truckspawn.z, 84.75, - 996.786, 25.1887, true, false)

	local plate = "CTZN"..math.random(100, 900)
    SetVehicleNumberPlateText(spawned_car, plate)
	SetVehicleOnGroundProperly(spawned_car)
	SetVehicleLivery(spawned_car, 2)
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
	TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(spawned_car), GetDisplayNameFromVehicleModel(GetEntityModel(spawned_car)))
end

function StartWeaponJob()
	Citizen.CreateThread(function ()
		TriggerEvent('esx:showNotification', 'Llevas armamento militar en el camion, cuidado que no te pille la pasma.')
		spawn_truck()
		Citizen.Wait(3000)
		TriggerEvent('esx:showNotification', 'Lleva el camion al cerrajero para abrir las cajas que hay detrás y obtener los componentes.')
		Citizen.Wait(3000)
		TriggerEvent('esx:showNotification', 'Se te acaba de injectar un codigo en el radar para marcar la posición del cerrajero.')
		blip = AddBlipForCoord(cerrajero.x,cerrajero.y,cerrajero.z)
		SetBlipRoute(blip, true)
		while true do
			Citizen.Wait(0)
			if firstEtape == true then
				if GetDistanceBetweenCoords(cerrajero.x,cerrajero.y,cerrajero.z,GetEntityCoords(GetPlayerPed(-1), true)) < 50 then
					DrawMarker(1, cerrajero.x,cerrajero.y,cerrajero.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,252,255,0, 200, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(cerrajero.x,cerrajero.y,cerrajero.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
						DrawText3D(cerrajero.x,cerrajero.y,cerrajero.z + 2, "Pulsa E para hacer que el cerrajero use sus trucos", 255,255,255)
						if IsControlJustPressed(1,38) then
							firstEtape = false
							TriggerEvent('esx:showNotification', 'Voy a abrirte esto y te doy las piezas.')
							local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
							SetEntityAsMissionEntity( vehicle, true, true )
							FreezeEntityPosition(vehicle,true)
							Citizen.Wait(5000)
							FreezeEntityPosition(vehicle,false)
							TriggerEvent('esx:showNotification', 'Dentro de las cajas solo había dinero. Devuelve el camión al dueño y te dará unos cachivaches.')
							RemoveBlip(blip)
							blip = AddBlipForCoord(truckDown.x,truckDown.y,truckDown.z)
							SetBlipRoute(blip, true)
						end
					end
				end
			elseif firstEtape == false then
				if GetDistanceBetweenCoords(truckDown.x,truckDown.y,truckDown.z,GetEntityCoords(GetPlayerPed(-1), true)) < 50 then
					DrawMarker(1, truckDown.x,truckDown.y,truckDown.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,252,255,0, 200, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(truckDown.x,truckDown.y,truckDown.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
						DrawText3D(truckDown.x,truckDown.y,truckDown.z + 2, "Pulsa E para dejar el camión.", 255,255,255)
						if IsControlJustPressed(1,38) then
							if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("barracks"))  then
								local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
								deleteCar( vehicle )
								TriggerEvent('esx:showNotification', 'Toma unas piezas, te servirán bastante.')
								TriggerServerEvent('tm1_mafias:addItem','weapon_shit',5)
								RemoveBlip(blip)
								isInJob = false
								break
							end
						end
					end
				end
			end
		end
	end)
end

function OpenWeaponToMenu()
	local elements = {
		{label = "Si",value = "yes"},
		{label = "No",value = "no"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'weapon_to',
		{
			title  = '¿Deseas hacer un trabajillo?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)	
			if data.current.value == 'yes' then
				Citizen.CreateThread(function ()
					TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
					Citizen.Wait(3000)
					TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)
					if isInJob == false then
						isInJob = true
						firstEtape = true
						StartWeaponJob()
					else 
						TriggerEvent('esx:showNotification', 'Primero completa este trabajo, después hablamos.')
					end
				end)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenChangedToMenu()
	local elements = {
		{label = "Si",value = "yes"},
		{label = "No",value = "no"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'change_to',
		{
			title  = '¿Tienes mercancia?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)	
			if data.current.value == 'yes' then
				Citizen.CreateThread(function ()
					TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_CLIPBOARD", 0, true)
					Citizen.Wait(3000)
					TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)
					TriggerServerEvent('tm1_mafias:givePiezes')
				end)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenSellerToMenu()
	local elements = {
		{label = "Vender Cañones",value = "canion"},
		{label = "Vender culatas",value = "culett"},
		{label = "Vender miras",value = "scope"},
		{label = "Cerrar",value = "no"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'seller_to',
		{
			title  = '¿Tienes mercancia?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)	
			if data.current.value == 'canion' then
				TriggerServerEvent('tm1_mafias:weaponSeller',data.current.value,priceCanion)
			end
			if data.current.value == 'culett' then
				TriggerServerEvent('tm1_mafias:weaponSeller',data.current.value,priceCulett)
			end
			if data.current.value == 'scope' then
				TriggerServerEvent('tm1_mafias:weaponSeller',data.current.value,priceScope)
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end