local enclosures = {
	[1] = {
		name = "Los Bloods",
		weapon = {x= 1398.758, y= 1147.022, z= 115.333},
		garage = {x= 1398.303, y= 1118.317, z= 115.837},
		spawnCar = {x= 1407.55, y= 1118.62, z= 115.83},
		saveCar = {x= 1413.39, y= 1118.42, z= 115.83 },
		attack  = {x= -143.12, y= -1609.22, z= 35.12},
		spawnHeli = {x= 1440.38, y= 1111.59, z= 115.22},
		suprHeli = {x= 1450.17, y= 1110.30, z= 115.33},
		coordsH = {x = 1456.84, y = 1120.87, z = 115.33},
    	vestPoint = {x = -154.62, y = -1603.82, z = 35.04},
		inventoryPoint = {x = 1399.232, y= 1160.951, z= 114.333},
		society = "society_mafia1",
		vest = nil,
		owner = nil
	},
	[2] = { 
		name = "BlackPower",
		weapon = {x= -1141.145, y= 363.379, z= 71.318},
		garage = {x= -1098.368, y= 361.427, z= 69.564},
		spawnCar = {x= -1097.25, y= 368.21, z= 69.75},
		saveCar = {x= -1101.58, y= 368.47, z= 69.85 },
		attack = {x= 89.35, y= -1989.96, z= 20.42},
		spawnHeli = {x= 97.46, y= -1937.13, z= 20.8},
		suprHeli = {x= 70.85, y= -1911.68, z= 21.61},
		coordsH = {x = -160.56, y = -1573.06, z = 35.12},
    	vestPoint = {x = 116.94, y = -1961.65, z = 21.33},
		inventoryPoint = {x = -1145.071, y= 357.382, z= 72.319},
		society = "society_mafia2",
		vest = nil,
		owner = nil
	},
	[3] = {
		name = "LOSBALLAS",
		weapon = {x= -2601.434, y= 1905.886, z= 168.320},
		garage = {x= -3175.5, y= 3035.4, z= -32.6},
		spawnCar = {x= -3175.5, y= 3035.4, z= -32.6},
		saveCar = {x= -3175.5, y= 3035.4, z= -32.6},
		attack = {x= -3175.5, y= 3035.4, z= -32.6},
		spawnHeli = {x= -3175.5, y= 3035.4, z= -32.6},
		suprHeli = {x= -3175.5, y= 3035.4, z= -32.6},
		coordsH = {x = -3175.5, y= 3035.4, z= -32.6},
    	vestPoint = {x = -3175.5, y= 3035.4, z= -32.6},
		inventoryPoint = {x = -2602.355, y= 1913.601, z= 168.320},
		society = "society_mafia3",
		vest = nil,
		owner = nil
	},
	[4] = {
		name = "Los Zetas",
		weapon = {x= -94.480, y= 936.914, z= 234.028},
		garage = {x= -103.09, y= 1008.26, z=236.760},
		spawnHeli = {x= -3175.5, y= 3035.4, z= -32.6},
		suprHeli = {x= -3175.5, y= 3035.4, z= -32.6},
		coordsH = {x = -3175.5, y= 3035.4, z= -32.6},
		saveCar = {x= -122.80, y= 1001.26, z= 235.73},
		spawnCar = {x= -112.63, y= 1004.65, z= 236.77},
		attack = {x= -3175.5, y= 3035.4, z= -32.6},
    	vestPoint = {x = -3175.5, y= 3035.4, z= -32.6},
		inventoryPoint = {x = -93.033, y= 941.900, z= 234.028},
		society = "society_mafia4",
		vest = nil,
		owner = nil
	},
	[5] = {
		name = "Cosa Nosstra",
		weapon = {x= -1598.77, y= -36.40, z= 59.19},
		garage = {x= -1593.77, y= -58.63, z=56.48},
		spawnHeli = {x= -3175.5, y= 3035.4, z= -32.6},
		suprHeli = {x= -3175.5, y= 3035.4, z= -32.6},
		coordsH = {x = -3175.5, y= 3035.4, z= -32.6},
		saveCar = {x= -1572.91, y= -59.64, z= 56.49},
		spawnCar = {x= -1582.99, y= -59.44, z= 57.48},
		attack = {x= -3175.5, y= 3035.4, z= -32.6},
    	vestPoint = {x = -3175.5, y= 3035.4, z= -32.6},
		inventoryPoint = {x =  -1598.77, y= -31.95, z= 59.19},
		society = "society_mafia5",
		vest = nil,
		owner = nil
	}
}


local donationsfinish = false
local this_Garage             = {}
local prices = {
	[1] = 100000,
  	[2] = 100000,
	[3] = 40000,
	[4] = 15000,
	[5] = 13000,
	[6] = 10000,
  	[7] = 8000,
	[8] = 5000,
	[9] = 1500,
	[10] = 1000,
	[11] = 900,
	[12] = 500,
	[13] = 100,
	[14] = 10,
	[15] = 5,
	[16] = 100000,
	[17] = 170000,
	[18] = 250000,
	[18] = 85000,
	[19] = 85000,
	[20] = 200000,
	[21] = 500000
}

if donationsfinish == true then
	for i,c in pairs(prices) do
		TriggerServerEvent("tm1_mafias:print",c)
		c = c * 0.5
	end
end
function getShop()
	local shop = {
		{label = "Pistola de combate - "..prices[4].."$", value = "WEAPON_COMBATPISTOL", money = prices[4],whatItIs = "weapon"},
		{label = "Revolver - "..prices[3].."$", value = "WEAPON_REVOLVER", money = prices[3],whatItIs = "weapon"},
		{label = "Calibre 50 - "..prices[3].."$", value = "WEAPON_PISTOL50", money = prices[3],whatItIs = "weapon"},
		{label = "Revolver de doble acción - "..prices[3].."$", value = "WEAPON_DOUBLEACTION", money = prices[3],whatItIs = "weapon"},
		{label = "Pistola Vintage - "..prices[3].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[3],whatItIs = "weapon"},
		{label = "Micro SMG - "..prices[16].."$", value = "WEAPON_MICROSMG", money = prices[16],whatItIs = "weapon"},
		{label = "Rifle Compacto - "..prices[17].."$", value = "WEAPON_COMPACTRIFLE", money = prices[17],whatItIs = "weapon"},
		{label = "Escopeta - "..prices[3].."$", value = "WEAPON_PUMPSHOTGUN", money = prices[3],whatItIs = "weapon"},
		{label = "Francotirador - "..prices[18].."$", value = "WEAPON_SNIPERRIFLE", money = prices[18],whatItIs = "weapon"},
		{label = "Cuchillo - "..prices[9].."$", value = "WEAPON_KNIFE", money = prices[9],whatItIs = "weapon"},
		{label = "Bate - "..prices[9].."$", value = "WEAPON_BAT", money = prices[9],whatItIs = "weapon"},
		{label = "Mini SMG - "..prices[19].."$", value = "WEAPON_MINISMG", money = prices[19],whatItIs = "weapon"},
		{label = "Fusil de asalto - "..prices[16].."$", value = "WEAPON_ASSAULTSMG", money = prices[16],whatItIs = "weapon"},
		{label = "Fusil pesado - "..prices[2].."$", value = "WEAPON_MG", money = prices[2],whatItIs = "weapon"},
		{label = "Arma Pesada - "..prices[20].."$", value = "WEAPON_COMBATMG", money = prices[20],whatItIs = "weapon"},
		{label = "Subfusil de Tambor - "..prices[1].."$", value = "WEAPON_GUSENBERG", money = prices[1],whatItIs = "weapon"},
		{label = "Rifle de asalto - "..prices[1].."$", value = "WEAPON_ASSAULTRIFLE", money = prices[1],whatItIs = "weapon"},
		{label = "Carabina - "..prices[1].."$", value = "WEAPON_CARBINERIFLE", money = prices[1],whatItIs = "weapon"},
		{label = "Escopeta de asalto - "..prices[18].."$", value = "WEAPON_ASSAULTSHOTGUN", money = prices[18],whatItIs = "weapon"},
		{label = "Francotirador pesado - "..prices[21].."$", value = "WEAPON_HEAVYSNIPER", money = prices[21],whatItIs = "weapon"},
		{label = "Carabina especial - "..prices[20].."$", value = "WEAPON_SPECIALCARBINE", money = prices[20],whatItIs = "weapon"},
		{label = "Machete - "..prices[9].."$", value = "WEAPON_MACHETE", money = prices[9],whatItIs = "weapon"},
		{label = "Mosquete - "..prices[18].."$", value = "WEAPON_MUSKET", money = prices[18],whatItIs = "weapon"},
		{label = "Daga - "..prices[9].."$", value = "WEAPON_DAGGER", money = prices[9],whatItIs = "weapon"},
		{label = "Palo de golf - "..prices[9].."$", value = "WEAPON_GOLFCLUB", money = prices[9],whatItIs = "weapon"},
		{label = "Paracaidas - "..prices[10].."$", value = "GADGET_PARACHUTE", money = prices[10],whatItIs = "weapon"},
		{label = "Pan - "..prices[14].."$", value = "bread", money = prices[14],whatItIs = "item"},
		{label = "Agua - "..prices[15].."$", value = "water", money = prices[15],whatItIs = "item"},
		{label = "Salir", whatItIs = "exit"}
	}
	--[[if WEAPONLEVEL == 0 then
		shop = {
			{label = "Esposas - "..prices[5].."$", value = "grilletes", money = prices[5],whatItIs = "item"},
			{label = "Llaves de esposas - "..prices[6].."$", value = "keys", money = prices[6],whatItIs = "item"},
			{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
			{label = "Pan - "..prices[7].."$", value = "bread", money = prices[7],whatItIs = "item"},
			{label = "Agua - "..prices[8].."$", value = "water", money = prices[8],whatItIs = "item"},
			{label = "Salir", whatItIs = "exit"}
		}
	elseif WEAPONLEVEL == 1 then
		shop = {
			{label = "Pistola de combate - "..prices[4].."$", value = "WEAPON_COMBATPISTOL", money = prices[4],whatItIs = "weapon"},
			{label = "Pistola vintage - "..prices[10].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[10],whatItIs = "weapon"},
			{label = "Tec 9 - "..prices[11].."$", value="WEAPON_MACHINEPISTOL", money = prices[11], whatItIs = "weapon"},
			{label = "Molotov - "..prices[15].."$", value="WEAPON_MOLOTOV", money = prices[15], whatItIs = "weapon"},
			{label = "C4 - "..prices[16].."$", value="WEAPON_STICKYBOMB", money = prices[16], whatItIs = "weapon"},
			{label = "Navaja - "..prices[12].."$", value="WEAPON_SWITCHBLADE",money = prices[12], whatItIs = "weapon"},
			{label = "Bate - "..prices[9].."$", value = "WEAPON_BAT", money = prices[9], whatItIs = "weapon"},
			{label = "Esposas - "..prices[5].."$", value = "grilletes", money = prices[5],whatItIs = "item"},
			{label = "Llaves de esposas - "..prices[6].."$", value = "keys", money = prices[6],whatItIs = "item"},
			{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
			{label = "Pan - "..prices[7].."$", value = "bread", money = prices[7],whatItIs = "item"},
			{label = "Agua - "..prices[8].."$", value = "water", money = prices[8],whatItIs = "item"},
			{label = "Salir", whatItIs = "exit"}
		}
	elseif WEAPONLEVEL == 2 then
		shop = {
			{label = "Subfusil - "..prices[2].."$", value = "WEAPON_SMG", money = prices[2],whatItIs = "weapon"},
			{label = "Rifle Avanzado - "..prices[13].."$", value = "WEAPON_ADVANCEDRIFLE", money = prices[13],whatItIs = "weapon"},
			{label = "Pistola de combate - "..prices[4].."$", value = "WEAPON_COMBATPISTOL", money = prices[4],whatItIs = "weapon"},
			{label = "Pistola vintage - "..prices[10].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[10],whatItIs = "weapon"},
			{label = "Tec 9 - "..prices[11].."$", value="WEAPON_MACHINEPISTOL", money = prices[11], whatItIs = "weapon"},
			{label = "Molotov - "..prices[15].."$", value="WEAPON_MOLOTOV", money = prices[15], whatItIs = "weapon"},
			{label = "C4 - "..prices[16].."$", value="WEAPON_STICKYBOMB", money = prices[16], whatItIs = "weapon"},
			{label = "Navaja - "..prices[12].."$", value="WEAPON_SWITCHBLADE",money = prices[12], whatItIs = "weapon"},
			{label = "Bate - "..prices[9].."$", value = "WEAPON_BAT", money = prices[9], whatItIs = "weapon"},
			{label = "Esposas - "..prices[5].."$", value = "grilletes", money = prices[5],whatItIs = "item"},
			{label = "Llaves de esposas - "..prices[6].."$", value = "keys", money = prices[6],whatItIs = "item"},
			{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
			{label = "Pan - "..prices[7].."$", value = "bread", money = prices[7],whatItIs = "item"},
			{label = "Agua - "..prices[8].."$", value = "water", money = prices[8],whatItIs = "item"},
			{label = "Salir", whatItIs = "exit"}
		}
	elseif WEAPONLEVEL == 3 then
		shop = {
			{label = "Francotirador - "..prices[1].."$", value = "WEAPON_SNIPERRIFLE", money = prices[1],whatItIs = "weapon"},
			{label = "Subfusil - "..prices[2].."$", value = "WEAPON_SMG", money = prices[2],whatItIs = "weapon"},
			{label = "AK47 - "..prices[3].."$", value = "WEAPON_ASSAULTRIFLE", money = prices[3],whatItIs = "weapon"},
			{label = "Rifle Avanzado - "..prices[13].."$", value = "WEAPON_ADVANCEDRIFLE", money = prices[13],whatItIs = "weapon"},
			{label = "Pistola de combate - "..prices[4].."$", value = "WEAPON_COMBATPISTOL", money = prices[4],whatItIs = "weapon"},
			{label = "Pistola vintage - "..prices[10].."$", value = "WEAPON_VINTAGEPISTOL", money = prices[10],whatItIs = "weapon"},
			{label = "Tec 9 - "..prices[11].."$", value="WEAPON_MACHINEPISTOL", money = prices[11], whatItIs = "weapon"},
			{label = "Molotov - "..prices[15].."$", value="WEAPON_MOLOTOV", money = prices[15], whatItIs = "weapon"},
			{label = "C4 - "..prices[16].."$", value="WEAPON_STICKYBOMB", money = prices[16], whatItIs = "weapon"},
			{label = "Navaja - "..prices[12].."$", value="WEAPON_SWITCHBLADE",money = prices[12], whatItIs = "weapon"},
			{label = "Bate - "..prices[9].."$", value = "WEAPON_BAT", money = prices[9], whatItIs = "weapon"},
			{label = "Esposas - "..prices[5].."$", value = "grilletes", money = prices[5],whatItIs = "item"},
			{label = "Llaves de esposas - "..prices[6].."$", value = "keys", money = prices[6],whatItIs = "item"},
			{label = "Paracaidas - "..prices[14].."$", value = "GADGET_PARACHUTE", money = prices[14],whatItIs = "weapon"},
			{label = "Pan - "..prices[7].."$", value = "bread", money = prices[7],whatItIs = "item"},
			{label = "Agua - "..prices[8].."$", value = "water", money = prices[8],whatItIs = "item"},
			{label = "Salir", whatItIs = "exit"}
		}
	end]]
	return shop
end

local state = true
local seconds = 0
local isStarted = 0
local isIn = false
local isPosible = true
--===========
-- BLIPS
--===========
--[[
Citizen.CreateThread(function()
	for _, info in pairs(enclosures) do
      info.blip = AddBlipForCoord(info.attack.x, info.attack.y, info.attack.z)
      SetBlipSprite(info.blip, 374)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, 47)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.name)
      EndTextCommandSetBlipName(info.blip)
    end
end)
]]--

--===========
-- RECUPERAR DATOS SOBRE RECINTOS
--===========
AddEventHandler('playerSpawned', function(spawn)
	local enclosuresa = {}
	for _, info in pairs(enclosures) do
	    enclosuresa[_] = info.name      	
	end
	TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)
end)
local enclosuresa = {}
	for _, info in pairs(enclosures) do
	    enclosuresa[_] = info.name      	
	end
TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)

RegisterNetEvent('tm1_mafias:puttedGroupsInEnclosures')
AddEventHandler('tm1_mafias:puttedGroupsInEnclosures',function()
	Citizen.CreateThread(function()
		local enclosuresa = {}
		for _, info in pairs(enclosures) do
	      	enclosuresa[_] = info.name      	
	    end
	    TriggerServerEvent('tm1_mafias:enclosureComprobate',enclosuresa)
	end)
end)

--===========
-- AÑADIENDO DATOS A EL ENCLOUSERS
--===========
RegisterNetEvent('tm1_mafias:putGroupsInEnclosures')
AddEventHandler('tm1_mafias:putGroupsInEnclosures',function(enclosuresInfo)
	for i,v in pairs(enclosuresInfo) do
		for a,b in pairs(enclosures) do
			if v.name == b.name then
				b.owner = v.groupid
			end
		end
	end
	if isStarted == 1 then

	else
		varReady()
		isStarted = 1
	end
	
end)

RegisterNetEvent('tm1_mafias:changeIsPosible')
AddEventHandler('tm1_mafias:changeIsPosible',function(isPosiblea)
	isPosible = isPosiblea
end)

RegisterNetEvent('tm1_mafias:activeAttack')
AddEventHandler('tm1_mafias:activeAttack',function(x1,x2,x3,name,gr,gr1,groupToGroup)
	if groupToGroup then
		backOperation(5,"attackWithIn1",name,x1,x2,x3,gr,gr1)
	else
		backOperation(5,"attackWithIn",name,x1,x2,x3,gr,gr1)
	end
	TriggerServerEvent('tm1_mafias:advert',"Has empezado el ataque, ten cuidado y no te alejes mas de 15 metros.")
	TriggerServerEvent('tm1_mafias:refreshIsPosible',false)
	state = false
end)
--===========
-- BORRAR VEHÍCULO
--===========
RegisterNetEvent('tm1_mafias:clearV')
AddEventHandler('tm1_mafias:clearV',function(x,y,z)
	local vehicleu = GetClosestVehicle(x,y,z, 6.5, 0, 70)
	SetEntityAsMissionEntity( vehicleu, true, true )
	Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( vehicleu ) )
end)

--===========
-- HILO PRINCIPAL
--===========



function varReady()
	Citizen.CreateThread(function ()
		while true do
			Citizen.Wait(0)
			local coords = GetEntityCoords(GetPlayerPed(-1))
			if not(group.enclosure == nil) then
				for i,v in pairs(enclosures) do
					if v.name == group.enclosure then
						DrawMarker(1,v.garage.x,v.garage.y,v.garage.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,13, 200, 0, 0, 0, 0)
						DrawMarker(36,v.spawnCar.x,v.spawnCar.y,v.spawnCar.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,13, 200, 0, 0, 0, 0)
						DrawMarker(1,v.saveCar.x,v.saveCar.y,v.saveCar.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,255,13, 200, 0, 0, 0, 0)
						DrawMarker(22,v.weapon.x,v.weapon.y,v.weapon.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						DrawMarker(21,v.vestPoint.x,v.vestPoint.y,v.vestPoint.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,0,0, 200, 0, 0, 0, 0)
						DrawMarker(20,v.inventoryPoint.x,v.inventoryPoint.y,v.inventoryPoint.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,251,255,0, 200, 0, 0, 0, 0)
						DrawMarker(34,v.spawnHeli.x,v.spawnHeli.y,v.spawnHeli.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,98,255, 200, 0, 0, 0, 0)
						DrawMarker(24,v.suprHeli.x,v.suprHeli.y,v.suprHeli.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,0,98,255, 200, 0, 0, 0, 0)
						if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.garage.x,v.garage.y,v.garage.z, true) < 1.5 then
							drawTxt("PULSA E PARA ABRIR EL GARAJE",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								ListOwnedCarsMenu()
								local coords = {x = v.spawnCar.x,y = v.spawnCar.y,z = v.spawnCar.z}
								this_Garage = v
								local coords1 = {x = v.saveCar.x,y = v.saveCar.y,z = v.saveCar.z}
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.spawnCar.x,v.spawnCar.y,v.spawnCar.z, true) < 1.5 then
							drawTxt("EN ESTE SITIO EL MAYORDOMO TE TRAERA EL COCHE",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.spawnHeli.x,v.spawnHeli.y,v.spawnHeli.z, true) < 1.5 then
							drawTxt("PULSA E PARA SACAR EL HELICÓPTERO",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								Citizen.Wait(0)
								local myPed = GetPlayerPed(-1)
								local player = PlayerId()
								local vehicle = GetHashKey('buzzard2')
							
								RequestModel(vehicle)
							
								while not HasModelLoaded(vehicle) do
									Wait(1)
								end
								
								local plate = math.random(100, 900)
								local heliSpawned = CreateVehicle(vehicle, v.coordsH.x,v.coordsH.y,v.coordsH.z, - 996.786, 25.1887, true, false)
								SetVehicleLivery(heliSpawned, 2)
								SetModelAsNoLongerNeeded(vehicle)
								Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(heliSpawned))
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.suprHeli.x,v.suprHeli.y,v.suprHeli.z, true) < 1.5 then
							drawTxt("PULSA E PARA GUARDAR EL HELICÓPTERO",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey("buzzard2")) then
								local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
								SetEntityAsMissionEntity( vehicle, true, true )
								Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( vehicle ) )
						end
					end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.vestPoint.x,v.vestPoint.y,v.vestPoint.z, true) < 1.5 then
							drawTxt("PULSA E PARA PONERTE TU CHALECO DE MAFIA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								if v.vest then
									ESX.TriggerServerCallback('tm1_mafias:hasEnoughMoney', function(bool)
										if bool == true then
											ESX.ShowNotification("Te has puesto tu chaleco")
											ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
											if skin.sex == 0 then
												TriggerEvent('skinchanger:change', 'bproof_1', v.vest.male['bproof_1'])
												TriggerEvent('skinchanger:change', 'bproof_2', v.vest.male['bproof_2'])
											else
												TriggerEvent('skinchanger:change', 'bproof_1', v.vest.female['bproof_1'])
												TriggerEvent('skinchanger:change', 'bproof_2', v.vest.female['bproof_2'])
											end
											end)
											SetPedArmour(GetPlayerPed(-1), 100)
										end
									end, 5000)
								else
									ESX.TriggerServerCallback('tm1_mafias:hasEnoughMoney', function(bool)
										if bool == true then
											ESX.ShowNotification("Te has puesto tu chaleco")
											SetPedArmour(GetPlayerPed(-1), 100)
										end
									end, 50000)
								end
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.inventoryPoint.x,v.inventoryPoint.y,v.inventoryPoint.z, true) < 1.5 then
							drawTxt("PULSA E PARA ABRIR EL INVENTARIO DE LA MAFIA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafia_inventory', {
									title    = "Inventario de mafia",
									align    = 'top-right',
									elements = {
										{label = "Depositar objetos",    value = 'deposit'},
										{label = "Retirar objetos", value = 'withdraw'}
								}}, function(data, menu)
									if data.current.value == 'deposit' then
										OpenPutStocksMenu(v)
									elseif data.current.value == 'withdraw' then
										OpenGetStocksMenu(v)
									end
								end, function(data, menu)
									menu.close()
								end)
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.saveCar.x,v.saveCar.y,v.saveCar.z, true) < 1.5 then
							drawTxt("PON EL COCHE AQUÍ Y AVISA AL MAYORDOMO QUE LO RECOJA EN EL MÚSCULO E",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
									StoreOwnedCarsMenu()
								else
									TriggerEvent('esx:showNotification', "No hay ningun coche para meter")
								end
							end
						elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.weapon.x,v.weapon.y,v.weapon.z, true) < 1.5 then
							drawTxt("PULSA E PARA ABRIR EL MENÚ DE COMPRAS DE MAFIA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							if IsControlJustReleased(0, 38) then
								OpenShopMenub()
							end
						end
					else
						DrawMarker(1,v.attack.x,v.attack.y,v.attack.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.attack.x,v.attack.y,v.attack.z, true) < 1.5 then
							if state then
								drawTxt("PULSA E PARA INTENTAR ATACAR LA ZONA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
								if v.owner == nil then
									if IsControlJustReleased(0, 38) then
										if isPosible then
											backOperation(15,"attackWithout1",v.name,v.attack.x,v.attack.y,v.attack.z)
											TriggerServerEvent('tm1_mafias:advert',"Has empezado el ataque, ten cuidado y no te alejes mas de 15 metros.")
											TriggerServerEvent('tm1_mafias:refreshIsPosible',false)
											state = false
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									end
								else
									if IsControlJustReleased(0, 38) then
										if isPosible then
											TriggerServerEvent('tm1_mafias:getZoneWithin',v.owner,v.attack.x,v.attack.y,v.attack.z,v.name,group.groupid,true)
											TriggerServerEvent('tm1_mafias:advert',"Procesando información, no toques nada")
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									end
								end
							else
								drawTxt("QUEDAN "..seconds.." SEGUNDOS",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
							end
						end
					end
				end
			else
				if group.aprove == 2 then
					for i,v in pairs(enclosures) do
						--DrawMarker(1,v.attack.x,v.attack.y,v.attack.z - 1, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,255,0,0, 200, 0, 0, 0, 0)
						if state then
							if GetDistanceBetweenCoords(coords, v.attack.x,v.attack.y,v.attack.z, true) < 1.5 then
								--drawTxt("PULSA E PARA INTENTAR ATACAR LA ZONA",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
								if IsControlJustReleased(0, 38) then
									if v.owner == nil then
										if isPosible then
											backOperation(15,"attackWithout",v.name,v.attack.x,v.attack.y,v.attack.z)
											TriggerServerEvent('tm1_mafias:advert',"Has empezado el ataque, ten cuidado y no te alejes mas de 15 metros.")
											TriggerServerEvent('tm1_mafias:refreshIsPosible',false)
											state = false
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									else
										if isPosible then
											TriggerServerEvent('tm1_mafias:getZoneWithin',v.owner,v.attack.x,v.attack.y,v.attack.z,v.name,group.groupid)
											TriggerServerEvent('tm1_mafias:advert',"Procesando información, no toques nada")
										else
											TriggerServerEvent('tm1_mafias:advert',"No es posible hacer el robo ahora mismo")
										end
									end
								end
							end
						else
							drawTxt("QUEDAN "..seconds.." SEGUNDOS",1, 1, 0.5, 0.9, 0.75,255,0,0,255)
						end
					end
				end
			end
		end
	end)
end

function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function backOperation(s,operation,encl,x,y,z,gr,gr1)
	Citizen.CreateThread(function ()
	seconds = s
	while true do
		Citizen.Wait(1000)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), x,y,z, true) < 15 then
			isIn = true
		else
			isIn = false
		end
		if isIn == false then
			TriggerServerEvent('tm1_mafias:advert',"Se ha suspendido el ataque por alejarte demasiado")
			state = 1
			break
		end
		if IsEntityDead(GetPlayerPed(-1)) then
			TriggerServerEvent('tm1_mafias:advert',"Ataque suspendido.")
			state = 1
			break
		end
		if seconds == 0 then
			if operation == "attackWithout" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,group.groupid,operation)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			elseif operation == "attackWithout1" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,group.groupid,operation)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			elseif operation == "attackWithIn" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,gr1,operation,gr)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			elseif operation == "attackWithIn1" then
				state = 1
				TriggerServerEvent('tm1_mafias:advert',"La zona ya es tuya")
				TriggerServerEvent('tm1_mafias:getZoneFinished',encl,gr1,operation,gr)
				Citizen.Wait(1000)
				TriggerServerEvent('tm1_mafias:refreshIsPosible',true)
			end
			break
		else
			seconds = seconds - 1
		end
	end
	end)
end

function OpenShopMenub()

	local elements = getShop()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'promoteMenu',
		{
			title  = "Tienda de Mafia",
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.whatItIs == "weapon" then
				TriggerServerEvent('tm1_mafias:buyWeapon',data.current.value,data.current.money)
			elseif data.current.whatItIs == "item" then
				TriggerServerEvent('esx_shop:comprarItemPop',data.current.value,1,data.current.money)
			elseif data.current.whatItIs == "exit" then
				menu.close()
			end
			
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function IsInVehicle()
  local ply = GetPlayerPed(-1)
  if IsPedSittingInAnyVehicle(ply) then
    return true
  else
    return false
  end
end 

RegisterNetEvent('tm1_mafias:esposar')
AddEventHandler('tm1_mafias:esposar',function(option)
	local player, distance = ESX.Game.GetClosestPlayer()
	if distance ~= -1 and distance <= 3.0 then	
		TriggerServerEvent('tm1_mafias:toClientEsposar',GetPlayerServerId(player),option)
	end
end)

RegisterNetEvent('tm1_mafias:changeEsposar')
AddEventHandler('tm1_mafias:changeEsposar',function(option)
  IsHandcuffed    = option
  local playerPed = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    if IsHandcuffed == true then

      RequestAnimDict('mp_arresting')

      while not HasAnimDictLoaded('mp_arresting') do
        Wait(100)
      end

      TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
      SetEnableHandcuffs(playerPed, true)
      SetPedCanPlayGestureAnims(playerPed, false)
      FreezeEntityPosition(playerPed,  true)

    elseif IsHandcuffed == false then

      ClearPedSecondaryTask(playerPed)
      SetEnableHandcuffs(playerPed, false)
      SetPedCanPlayGestureAnims(playerPed,  true)
      FreezeEntityPosition(playerPed, false)

    end

  end)
end)

function OpenPutStocksMenu(enclosure)
	ESX.TriggerServerCallback('tm1_mafias:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Inventario",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = "Cantidad"
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification("Cantidad invalida")
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('tm1_mafias:putStockItems', itemName, count, enclosure.society)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenGetStocksMenu(enclosure)
	ESX.TriggerServerCallback('tm1_mafias:getMafiasInventory', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = "Inventario de la mafia",
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title ="Cantidad"
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification("Cantidad inválida")
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('tm1_mafias:getStockItem', itemName, count, enclosure.society)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, enclosure.society)
end

-- List Owned Cars Menu
function ListOwnedCarsMenu()
	local UseVehicleNamesLua = true
	local elements = {
		
	}
	
	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedCars', function(ownedCars)
		if #ownedCars == 0 then
			ESX.ShowNotification('No tienes coches')
		else
			for _,v in pairs(ownedCars) do
				if UseVehicleNamesLua == true then
					local hashVehicule = v.vehicle.model
					local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
					local vehicleName  = GetLabelText(aheadVehName)
					local labelvehicle
					local plate = v.plate
					if v.stored then
						labelvehicle = '| '..plate..' | '..vehicleName..' | '.. 'Guardado'..' |'
					else
						labelvehicle = '| '..plate..' | '..vehicleName..' | '.. 'Secuestrado'..' |'
					end
					table.insert(elements, {label = labelvehicle, value = v})
			end
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
			title    = 'Tus coches',
			align    = 'top-right',
			elements = elements
		}, function(data, menu)
			if data.current.value.stored then
				menu.close()
				SpawnVehicle(data.current.value.vehicle, data.current.value.plate)
			else
				ESX.ShowNotification('Tu coche está secuestrado')
			end
		end, function(data, menu)
			menu.close()
		end)
	end
end) end

function SpawnVehicle(vehicle, plate)
	ESX.Game.SpawnVehicle(vehicle.model, {
		x = this_Garage.spawnCar.x,
		y = this_Garage.spawnCar.y,
		z = this_Garage.spawnCar.z + 1
	}, this_Garage.spawnCar.h, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "OFF")
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
	end)
end

function StoreOwnedCarsMenu()
	local playerPed  = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed,  false) then
		local playerPed     = GetPlayerPed(-1)
		local coords        = GetEntityCoords(playerPed)
		local vehicle       = GetVehiclePedIsIn(playerPed, false)
		local vehicleProps  = ESX.Game.GetVehicleProperties(vehicle)
		local current 	    = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth  = GetVehicleEngineHealth(current)
		local plate = vehicleProps.plate
		local UseDamageMult = true
		ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
			if valid then
				if engineHealth < 990 then
					if UseDamageMult == true then
						local apprasial = math.floor((1000 - engineHealth)/1000*500*5)
						reparation(apprasial, vehicle, vehicleProps)
					else
						local apprasial = math.floor((1000 - engineHealth)/1000*500)
						reparation(apprasial, vehicle, vehicleProps)
					end
				else
					putaway(vehicle, vehicleProps)
				end	
			else
				ESX.ShowNotification('No se puede guardar este coche')
			end
		end, vehicleProps)
	else
		ESX.ShowNotification('No hay coche para guardar')
	end
end



function putaway(vehicle, vehicleProps)
	ESX.Game.DeleteVehicle(vehicle)
	TriggerServerEvent('esx_advancedgarage:setVehicleState', vehicleProps.plate, true)
	ESX.ShowNotification('Vehículo guardado en el garage')
end


function reparation(apprasial, vehicle, vehicleProps)
	ESX.UI.Menu.CloseAll()
	
	local elements = {
		{label = 'Guardar vehículo'.." ($"..apprasial..")", value = 'yes'},
		{label = 'Visita mecánico', value = 'no'}
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'delete_menu', {
		title    = 'Daño del vehículo',
		align    = 'top-right',
		elements = elements
	}, function(data, menu)
		menu.close()
		
		if data.current.value == 'yes' then
			TriggerServerEvent('esx_advancedgarage:payhealth', apprasial)
			putaway(vehicle, vehicleProps)
		elseif data.current.value == 'no' then
			ESX.ShowNotification('Visita al mecánico')
		end
	end, function(data, menu)
		menu.close()
	end)
end