local ped = {name = "Cargobob", x=51.35, y=-2571.28, z= 5.97 - 1,rotation = 2.26,NetworkSync = true}
local heli = {x = 478.63,y = -3370.6,z = 6.53, h = 0.66}
local car = {x = -1708.16,y = -907.72,z = 7.28, h = 318.31}
local entrega = {x = -107.72,y = -2536.03,z = 6.0 - 1}
local delivery = {x = 478.63,y = -3370.6,z = 6.53 - 1}
local isDeliveried = false
local playerPed = GetPlayerPed(-1)
local money = 250
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		--ACTIVAR MISION
		if GetDistanceBetweenCoords(ped.x,ped.y,ped.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
			DrawText3D(ped.x,ped.y,ped.z + 2, "~y~[~w~E~y~]~b~ - Hablar con el señor", 255,255,255)
			if IsControlJustPressed(1,38) then
				OpenJobMenu()
			end
		end
	end
end)

------------------------------
------------CREAR NPC---------
------------------------------

function createNPC()
    --PRIMER NPC
	created_ped = CreatePed(5, modelHash , ped.x,ped.y,ped.z, ped.rotation, false, ped.NetworkSync)
	FreezeEntityPosition(created_ped, true)
	SetEntityInvincible(created_ped, true)
	SetBlockingOfNonTemporaryEvents(created_ped, true)
	TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)
end

function spawnHeli()
	Citizen.Wait(0)

	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('cargobob')

	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

	local plate = math.random(100, 900)
	local spawned_cargo = CreateVehicle(vehicle, heli.x,heli.y,heli.z, heli.h, - 996.786, 25.1887, true, false)

	local plate = "CTZN"..math.random(100, 900)
    SetVehicleNumberPlateText(spawned_cargo, plate)
	SetVehicleOnGroundProperly(spawned_cargo)
	SetVehicleLivery(spawned_cargo, 2)
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_cargo))
	TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(spawned_cargo), GetDisplayNameFromVehicleModel(GetEntityModel(spawned_cargo)))
end

function spawnCar()
	Citizen.Wait(0)

	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('zentorno')

	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

	local plate = math.random(100, 900)
	local spawned_car = CreateVehicle(vehicle, car.x,car.y,car.z, car.h, - 996.786, 25.1887, true, false)

	local plate = "CTZN"..math.random(100, 900)
    SetVehicleNumberPlateText(spawned_car, plate)
	SetVehicleOnGroundProperly(spawned_car)
	SetVehicleLivery(spawned_car, 2)
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
	TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(spawned_car), GetDisplayNameFromVehicleModel(GetEntityModel(spawned_car)))
end

function toHeli()
	blip = AddBlipForCoord(heli.x,heli.y,heli.z)
	SetBlipRoute(blip, true)
	TriggerEvent('esx:showNotification', 'Te he marcado una unicación en el GPS, ve allí.')
	Citizen.CreateThread(function ()
		while true do
			Citizen.Wait(0)

			if GetDistanceBetweenCoords(heli.x,heli.y,heli.z,GetEntityCoords(GetPlayerPed(-1), true)) < 100 then
				spawnHeli()
				TriggerEvent('esx:showNotification', 'Debes subir a ese Cargobob para continuar el trabajo.')
				break
			end
		end
		while true do
			Citizen.Wait(0)
			if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("cargobob")) then
				RemoveBlip(blip)
				TriggerEvent('esx:showNotification', 'Te he marcado otra ubicación en el GPS, allí encontrarás un vehículo, tendrás que recogerlo.')
				break
			end
		end
		RemoveBlip(blip)
		blip = AddBlipForCoord(car.x,car.y,car.z)
		SetBlipRoute(blip, true)
		while true do
			Citizen.Wait(0)
			if GetDistanceBetweenCoords(car.x,car.y,car.z,GetEntityCoords(GetPlayerPed(-1), true)) < 2000 then
				TriggerServerEvent('tm1_mafias:policeAvise')
				TriggerEvent('esx:showNotification', 'Mierda, nos han descubierto. Tendrás que lidiar con la policía en el punto.')
				break
			end
		end
		while true do
			Citizen.Wait(0)
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true), car.x,car.y,car.z) < 100 then
				TriggerEvent('esx:showNotification', 'Recoje el coche [E para sacar el gancho].')
				spawnCar()
				break
			end
		end
		while true do
			Citizen.Wait(0)
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1), true), car.x,car.y,car.z) < 5 then
				TriggerEvent('esx:showNotification', 'Lleva el coche al punto de entrega.')
				RemoveBlip(blip)
				blip = AddBlipForCoord(entrega.x,entrega.y,entrega.z)
				SetBlipRoute(blip, true)
				break
			end
		end
		while true do
			Citizen.Wait(0)
			DrawMarker(1, entrega.x, entrega.y, entrega.z, 0, 0, 0, 0, 0, 0, 3.5001, 3.5001, 0.8001,252,0,0, 200, 0, 0, 0, 0)
			local vehicle = GetClosestVehicle(entrega.x, entrega.y, entrega.z, 3.5, 0, 70)
			if IsVehicleModel(vehicle, GetHashKey("zentorno")) then
				TriggerEvent('esx:showNotification', 'Entrega realizada.')
				RemoveBlip(blip)
				blip = AddBlipForCoord(delivery.x,delivery.y,delivery.z)
				SetBlipRoute(blip, true)
				TriggerEvent('esx:showNotification', 'Deja el Cargobob en la ubicación marcada en el GPS.')
				SetEntityAsMissionEntity( vehicle, true, true )
				Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( vehicle ) )
				isDeliveried = true
				break
			end
		end
		while true do
			Citizen.Wait(0)
			DrawMarker(1, delivery.x, delivery.y, delivery.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,252,255,0, 200, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(delivery.x, delivery.y, delivery.z,GetEntityCoords(GetPlayerPed(-1), true)) < 5 then
				DrawText3D(delivery.x, delivery.y, delivery.z, "~y~[~w~E~y~]~b~ - Dejar el Cargobob", 255,255,255)
				if IsControlJustPressed(1,38) then
					if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("cargobob")) then
						RemoveBlip(blip)
						TriggerEvent('esx:showNotification', 'Buen trabajo, puedes volver a visitarme cuando quieras. Aquí tienes tu dinero: '..money..'€')
						local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
						SetEntityAsMissionEntity( vehicle, true, true )
						Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( vehicle ) )
						TriggerServerEvent('tm1_mafias:addMoney',money)
						break
					end
				end
			end
		end
	end)
end

function OpenJobMenu()

	local elements = {
		{label = "Si",value = "yes"},
		{label = "No",value = "no"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'get_job',
		{
			title  = '¿Quieres hacer un trabajillo?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)	
			if data.current.value == 'yes' then
				toHeli()
			end
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
	)
end

RegisterNetEvent('tm1_mafias:addObj')
AddEventHandler('tm1_mafias:addObj', function()
	RemoveBlip(blip)
	blip = AddBlipForCoord(car.x,car.y,car.z)
	TriggerEvent('esx:showNotification', 'Van a recoger un coche ilegal mediante un Cargobob en el Parking del Del Perro Pier, intervengan.')
	while true do
		Citizen.Wait(0)
		if GetDistanceBetweenCoords(car.x,car.y,car.z,GetEntityCoords(GetPlayerPed(-1), true)) < 5 then
			RemoveBlip(blip)
			break
		end
	end
end)