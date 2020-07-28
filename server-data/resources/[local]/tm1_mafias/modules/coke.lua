local coords = {
	{
	name = "plantSeller",
	x = -1909.41, 
	y = 2082.59,
	z = 140.38,
	rotation = 50.59,
	msg = "[VENDEDOR DE SEMILLAS] Pulsa E para hablar",
	r = 0,
	g = 255,
	b = 0},
  
	{
	name = "plantProcesser",
	x= 369.56, 
	y = -1195.15, 
	z = 31.32,
	rotation = 253.07,
	msg = "[El Richard] Pulsa E para hablar",
	r = 0,
	g = 255,
	b = 0},

	{
	name = "aditivesMission",
	x = 247.68, 
	y = -3315.84, 
	z = 5.79,
	rotation = 180.57,
	msg = "[El Jhony] Pulsa E para hablar",
	r = 0,
	g = 255,
	b = 0},

	{
	name = "combinateDrug",
	x = 360.58, 
	y = -1829.36, 
	z = 28.89,
	rotation = 228.66,
	msg = "[Doctor Tilla] Pulsa E para hablar",
	r = 0,
	g = 255,
	b = 0},

	{
	name = "sellerDrug",
	x = 16.11, 
	y = -651.1, 
	z = 10.77,
	rotation = 244.48,
	msg = "[John Rockafort] Pulsa E para hablar",
	r = 0,
	g = 255,
	b = 0},
	{
	name = "nevaditosMaker",
	x = 2164.77, 
	y = -614.27,
	z = 96.3,
	rotation = 223.74,
	msg = "~w~[~r~Creador de nevaditos~w~] Pulsa E para hablar",
	r = 0,
	g = 255,
	b = 0},
	{
	name = "nevaditosSeller",
	x = 1515.6, 
	y = -2137.78,
	z = 76.75,
	rotation = 180.71,
	msg = "~w~[~r~Comprador de nevaditos~w~] Pulsa E para hablar",
	r = 0,
	g = 255,
	b = 0}
}


local destino = {x = 1234.62, y = -3201.8, z = 5.53}
local destinoFinal = {x = 227.7, y = -3315.09, z = 5.6}
local carSpawn = {x = 236.62, y = -3315.18, z = 5.61}
local processMoney = 500
local isInJob = false
local firstEtape = false
local plate = ""
local cocaDialog = {
	titleshop = "¿Que tipo de semillas deseas comprar?",
	cokeseed = "Semillas de Cocaina",
	close = "Cerrar",
	titleproc = "¿Deseas que mire eso que tienes ahí? Te costará "..processMoney.."€",
	missionTitle = "¿Quieres conseguir aditivos a cambio de un favor?",
	titleMezcler = "¿Quieres que te mezcle eso?",
	seller = "¿Quieres vender ese perico?",
	yes = "Si",
	no = "No",
	close = "Cerrar",
}
Citizen.CreateThread(function()
    wanted_model= "G_M_Y_Lost_03"
    modelHash = GetHashKey(wanted_model)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
       	Wait(1)
    end
    createNPCA()   
end)

function teleport()
	Citizen.CreateThread( function()
		local x = 1029.79
		local y = 2461.680
		local z = 45.96
		local entity = GetPlayerPed(-1)
		SetEntityCoords(entity, x, y, z, 1, 0, 0, 1)
	end)
end
--teleport()	


function createNPCA()
	for i,v in pairs(coords) do
		created_ped = CreatePed(5, GetHashKey("G_M_Y_Lost_03") , v.x,v.y,v.z - 1, v.rotation, false, true)
		FreezeEntityPosition(created_ped, true)
		SetEntityInvincible(created_ped, true)
		SetBlockingOfNonTemporaryEvents(created_ped, true)
		TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_DRINKING", 0, true)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i,v in pairs(coords) do
			if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(GetPlayerPed(-1),true)) <= 2.5 then
				DrawText3D(v.x,v.y,v.z + 1, v.msg, v.r,v.g,v.b)
				if v.name == "plantSeller" then
					if IsControlJustReleased(0, 38) then
						if BUSSINESMAN == true then
							OpenSeedShop()
						else
							TriggerEvent('exp:NotificateError',"¿Que mierda quieres?, vete de aquí, morralla humana...")
						end
					end
				end
				if v.name == "plantProcesser" then
					if IsControlJustReleased(0, 38) then
						OpenSeedProcesser()
					end
				end
				if v.name == "aditivesMission" then
					if IsControlJustReleased(0, 38) then
						OpenMission()
					end
				end
				if v.name == "combinateDrug" then
					if IsControlJustReleased(0, 38) then
						OpenCombinate()
					end
				end
				if v.name == "nevaditosMaker" then
					if IsControlJustReleased(0, 38) then
						OpenNevaditosMaker()
					end
				end
				if v.name == "nevaditosSeller" then
					if IsControlJustReleased(0, 38) then
						OpenNevaditosSeller()
					end
				end
				if v.name == "sellerDrug" then
					if IsControlJustReleased(0, 38) then
						if BUSSINESMAN == true then
							OpenSeller()
						else
							errormsg("Lo siento desparpajo humano pero no te voy a comprar nah.")
						end
					end
				end
			end
		end
	end
end)

function OpenSeller()
	local elements = {
		{label = cocaDialog.yes ,value = "yes"},
		{label = cocaDialog.no ,value = "no"}
	}

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'seed_shop',
		{
			title  = cocaDialog.seller,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "yes" then
				TriggerServerEvent('tm1_mafias:sellCoke')
				menu.close()
			elseif data.current.value == "no" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenCombinate()
	local elements = {
		{label = cocaDialog.yes ,value = "yes"},
		{label = cocaDialog.no ,value = "no"}
	}

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'seed_shop',
		{
			title  = cocaDialog.titleMezcler,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "yes" then
				TriggerServerEvent('tm1_mafias:combinateCoke')
				menu.close()
			elseif data.current.value == "no" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenNevaditosMaker()
	local elements = {
		{label = cocaDialog.yes ,value = "yes"},
		{label = cocaDialog.no ,value = "no"}
	}

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'seed_shop',
		{
			title  = '¿Quieres unos nevaditos?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "yes" then
				TriggerServerEvent('tm1_mafias:combinateWeedCoke')
				menu.close()
			elseif data.current.value == "no" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenNevaditosSeller()
	local elements = {
		{label = cocaDialog.yes ,value = "yes"},
		{label = cocaDialog.no ,value = "no"}
	}

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'seed_shop',
		{
			title  = '¿Quieres vender tus nevaditos?',
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "yes" then
				TriggerServerEvent('tm1_mafias:sellWeedCoke')
				menu.close()
			elseif data.current.value == "no" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenMission()
	local elements = {
		{label = cocaDialog.yes ,value = "yes"},
		{label = cocaDialog.no ,value = "no"}
	}

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'seed_shop',
		{
			title  = cocaDialog.missionTitle,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "yes" then
				if isInJob == false then
					successmsg("Lleva esta furgoneta a el punto del gps que te he marcado")
					isInJob = true
					firstEtape = true
					startJobMission()
					menu.close()
				else
					errormsg("Primero encargaté de lo que te he mandado")
				end
			elseif data.current.value == "no" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function startJobMission()
	Citizen.CreateThread(function ()
		spawn_car()
		blip = AddBlipForCoord(destino.x,destino.y,destino.z)
		SetBlipRoute(blip, true)
		while true do
			Citizen.Wait(0)
			if firstEtape == true then
				if GetDistanceBetweenCoords(destino.x,destino.y,destino.z,GetEntityCoords(GetPlayerPed(-1), true)) < 50 then
					DrawMarker(1, destino.x,destino.y,destino.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,252,255,0, 200, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(destino.x,destino.y,destino.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
						DrawText3D(destino.x,destino.y,destino.z + 2, "Pulsa E para descargar el paquete", 255,255,255)
						if IsControlJustPressed(1,38) then
							if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("Burrito"))  then
								local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
								SetEntityAsMissionEntity(vehicle, true, true)		
								local platecaissei = GetVehicleNumberPlateText(vehicle)
								Citizen.Trace(plate.."m")
								Citizen.Trace(platecaissei.."m")
								if platecaissei == plate.." " then
									firstEtape = false
									TriggerEvent('esx:showNotification', 'Voy a descargar esto...')
									FreezeEntityPosition(vehicle,true)
									Citizen.Wait(5000)
									FreezeEntityPosition(vehicle,false)
									TriggerEvent('esx:showNotification', 'Ya puedes ir a devolver esta mierda.')
									RemoveBlip(blip)
									blip = AddBlipForCoord(destinoFinal.x,destinoFinal.y,destinoFinal.z)
									SetBlipRoute(blip, true)
								else
									TriggerEvent('esx:showNotification', 'Ese no es tu vehículo.')
								end
							else
								TriggerEvent('esx:showNotification', 'Ese vehículo no me interesa.')
							end
						end
					end
				end
			elseif firstEtape == false then
				if GetDistanceBetweenCoords(destinoFinal.x,destinoFinal.y,destinoFinal.z,GetEntityCoords(GetPlayerPed(-1), true)) < 50 then
					DrawMarker(1, destinoFinal.x,destinoFinal.y,destinoFinal.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,252,255,0, 200, 0, 0, 0, 0)
					if GetDistanceBetweenCoords(destinoFinal.x,destinoFinal.y,destinoFinal.z,GetEntityCoords(GetPlayerPed(-1), true)) < 3 then
						DrawText3D(destinoFinal.x,destinoFinal.y,destinoFinal.z + 2, "Pulsa E para dejar la furgoneta.", 255,255,255)
						if IsControlJustPressed(1,38) then
							if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("Burrito"))  then
								local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
								deleteCar( vehicle )
								TriggerEvent('esx:showNotification', 'Toma unos aditivos.')
								TriggerServerEvent('tm1_mafias:addItem','aditives',2)
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

function spawn_car()
	Citizen.Wait(0)

	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey('Burrito')

	RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end
	local spawned_car = CreateVehicle(vehicle, carSpawn.x,carSpawn.y,carSpawn.z, 180.4, - 996.786, 25.1887, true, false)

	plate = "CTZN"..math.random(100, 900)
	Citizen.Trace(plate)
    SetVehicleNumberPlateText(spawned_car, plate)
	SetVehicleOnGroundProperly(spawned_car)
	SetVehicleLivery(spawned_car, 2)
	SetModelAsNoLongerNeeded(vehicle)
	Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
	TriggerEvent("advancedFuel:setEssence", 100, GetVehicleNumberPlateText(spawned_car), GetDisplayNameFromVehicleModel(GetEntityModel(spawned_car)))
	Citizen.Trace(plate)
end

function OpenSeedProcesser()
	local elements = {
		{label = cocaDialog.yes ,value = "yes"},
		{label = cocaDialog.no ,value = "no"}
	}

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'seed_shop',
		{
			title  = cocaDialog.titleproc,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "yes" then
				TriggerServerEvent('tm1_mafias:moneyComprobate',processMoney)
			elseif data.current.value == "no" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function errormsg(msg)
	TriggerEvent("pNotify:SetQueueMax", "center", 2)
    TriggerEvent("pNotify:SendNotification", {
        text = msg,
        type = "error",
        timeout = 3000,
        layout = "centerRight",
        queue = "center"
    })
end
function successmsg(msg)
	TriggerEvent("pNotify:SetQueueMax", "center", 2)
    TriggerEvent("pNotify:SendNotification", {
        text = msg,
        type = "success",
        timeout = 3000,
        layout = "centerRight",
        queue = "center"
    })
end

function OpenSeedShop()
	local elements = {
		{label = cocaDialog.cokeseed ,value = "cocaseed", price = 100},
		{label = cocaDialog.close ,value = "close"}
	}

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'seed_shop',
		{
			title  = cocaDialog.titleshop,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "cocaseed" then
				openQuantityMenu(data.current.value, data.current.price)
			elseif data.current.value == "close" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function openQuantityMenu(object, price)
    ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'quantity_menu',
        {
          title = "¿Que cantidad quieres comprar?"
        },
        function(data, menu)
          local quantity = data.value
          if tonumber(quantity) >= 0 then
         		TriggerServerEvent('tm1_mafias:buySeed', object, quantity, price)
          else
          	TriggerEvent('esx:showNotification', 'No puedes comprar esta cantidad, tontoh')
          end
          ESX.UI.Menu.CloseAll()
        end,
      function(data, menu)
        menu.close()
      end)
end