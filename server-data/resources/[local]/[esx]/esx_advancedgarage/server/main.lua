ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Make sure all Vehicles are Stored on restart
MySQL.ready(function()
	--ParkVehicles() -- Guarda todos los vehiculos que hayan quedado fuera
end)

function ParkVehicles()
	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE `stored` = @stored', {
		['@stored'] = false
	}, function(rowsChanged)
		if rowsChanged > 0 then
			print(('esx_advancedgarage: %s vehicle(s) have been stored!'):format(rowsChanged))
		end
	end)
end

-- Get Owned Properties
ESX.RegisterServerCallback('esx_advancedgarage:getOwnedProperties', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local properties = {}

	MySQL.Async.fetchAll('SELECT * FROM owned_properties WHERE owner = @owner', {
		['@owner'] = xPlayer.identifier
	}, function(data)
		for _,v in pairs(data) do
			table.insert(properties, v.name)
		end
		cb(properties)
	end)
end)

-- Fetch Owned Aircrafts
ESX.RegisterServerCallback('esx_advancedgarage:getOwnedAircrafts', function(source, cb)
	local ownedAircrafts = {}
	local xPlayer = ESX.GetPlayerFromId(source)
		MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND Type = @Type', {
			['@owner']  = xPlayer.identifier,
			['@Type']   = 'aircraft'
		}, function(data)
			for _,v in pairs(data) do
				local vehicle = json.decode(v.vehicle)
				table.insert(ownedAircrafts, {vehicle = vehicle, stored = v.stored, plate = v.plate, vehiclename = v.vehiclename, impounded = v.impounded, fuel=v.fuel})
			end
			cb(ownedAircrafts)
		end)
end)

-- Fetch Owned Boats
ESX.RegisterServerCallback('esx_advancedgarage:getOwnedBoats', function(source, cb)
	local ownedBoats = {}
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND Type = @Type', {
		['@owner']  = xPlayer.identifier,
		['@Type']   = 'boat'
	}, function(data)
		for _,v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedBoats, {vehicle = vehicle, stored = v.stored, plate = v.plate, vehiclename = v.vehiclename, impounded = v.impounded, fuel=v.fuel})
		end
		cb(ownedBoats)
	end)

end)

-- Fetch Owned Cars
ESX.RegisterServerCallback('esx_advancedgarage:getOwnedCars', function(source, cb)
	local ownedCars = {}
	local xPlayer = ESX.GetPlayerFromId(source)
		MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND Type = @Type', {
			['@owner']  = xPlayer.identifier,
			['@Type']   = 'car'
		}, function(data)
			for _,v in pairs(data) do
				local vehicle = json.decode(v.vehicle)
				table.insert(ownedCars, {vehicle = vehicle, stored = v.stored, plate = v.plate, vehiclename = v.vehiclename, impounded = v.impounded, fuel=v.fuel})
			end
			cb(ownedCars)
		end)
end)

-- Store Vehicles
ESX.RegisterServerCallback('esx_advancedgarage:storeVehicle', function (source, cb, vehicleProps, fuel)
	local ownedCars = {}
	local vehplate = vehicleProps.plate:match("^%s*(.-)%s*$")
	local vehiclemodel = vehicleProps.model
	local xPlayer = ESX.GetPlayerFromId(source)
	
	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = xPlayer.identifier,
		['@plate'] = vehicleProps.plate
	}, function (result)
		if result[1] ~= nil then
			local originalvehprops = json.decode(result[1].vehicle)
			if originalvehprops.model == vehiclemodel then
				MySQL.Async.execute('UPDATE owned_vehicles SET vehicle = @vehicle, fuel=@fuel WHERE owner = @owner AND plate = @plate', {
					['@owner']  = xPlayer.identifier,
					['@vehicle'] = json.encode(vehicleProps),
					['@fuel'] = fuel,
					['@plate']  = vehicleProps.plate
				}, function (rowsChanged)
					if rowsChanged == 0 then
						print(('esx_advancedgarage: %s attempted to store an vehicle they don\'t own!'):format(GetPlayerIdentifiers(source)[1]))
					end
					cb(true)
				end)
			else
				if Config.KickPossibleCheaters == true then
					if Config.UseCustomKickMessage == true then
						print(('esx_advancedgarage: %s attempted to Cheat! Tried Storing: '..vehiclemodel..'. Original Vehicle: '..originalvehprops.model):format(GetPlayerIdentifiers(source)[1]))
						DropPlayer(source, _U('custom_kick'))
						cb(false)
					else
						print(('esx_advancedgarage: %s attempted to Cheat! Tried Storing: '..vehiclemodel..'. Original Vehicle: '..originalvehprops.model):format(GetPlayerIdentifiers(source)[1]))
						DropPlayer(source, 'You have been Kicked from the Server for Possible Garage Cheating!!!')
						cb(false)
					end
				else
					print(('esx_advancedgarage: %s attempted to Cheat! Tried Storing: '..vehiclemodel..'. Original Vehicle: '..originalvehprops.model):format(GetPlayerIdentifiers(source)[1]))
					cb(false)
				end
			end
		else
			print(('esx_advancedgarage: %s attempted to store an vehicle they don\'t own!'):format(GetPlayerIdentifiers(source)[1]))
			cb(false)
		end
	end)
end)

-- Fetch Pounded Aircrafts
ESX.RegisterServerCallback('esx_advancedgarage:getOutOwnedAircrafts', function(source, cb)
	local ownedAircrafts = {}
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND Type = @Type AND `stored` = @stored', {
		['@owner'] = xPlayer.identifier,
		['@Type']   = 'aircraft',
		['@stored'] = false
	}, function(data) 
		for _,v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedAircrafts, {vehicle=vehicle, plate = v.plate, vehiclename = v.vehiclename, impounded = v.impounded, fuel=v.fuel})
		end
		cb(ownedAircrafts)
	end)
end)

-- Fetch Pounded Boats
ESX.RegisterServerCallback('esx_advancedgarage:getOutOwnedBoats', function(source, cb)
	local ownedBoats = {}
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND Type = @Type AND `stored` = @stored', {
		['@owner'] = xPlayer.identifier,
		['@Type']   = 'boat',
		['@stored'] = false
	}, function(data) 
		for _,v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedBoats, {vehicle=vehicle, plate = v.plate, vehiclename = v.vehiclename, impounded = v.impounded, fuel=v.fuel})
		end
		cb(ownedBoats)
	end)
end)

-- Fetch Pounded Cars
ESX.RegisterServerCallback('esx_advancedgarage:getOutOwnedCars', function(source, cb)
	local ownedCars = {}
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND Type = @Type AND `stored` = @stored', {
		['@owner'] = xPlayer.identifier,
		['@Type']   = 'car',
		['@stored'] = false
	}, function(data) 
		for _,v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedCars, {vehicle=vehicle, plate = v.plate, vehiclename = v.vehiclename, impounded = v.impounded, fuel=v.fuel})
		end
		cb(ownedCars)
	end)
end)

-- Fetch Pounded Policing Vehicles
ESX.RegisterServerCallback('esx_advancedgarage:getOutOwnedPolicingCars', function(source, cb)
	local ownedPolicingCars = {}
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND job = @job AND `stored` = @stored', {
		['@owner'] = xPlayer.identifier,
		['@job']    = 'police',
		['@stored'] = false
	}, function(data) 
		for _,v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedPolicingCars, vehicle)
		end
		cb(ownedPolicingCars)
	end)
end)

-- Fetch Pounded Ambulance Vehicles
ESX.RegisterServerCallback('esx_advancedgarage:getOutOwnedAmbulanceCars', function(source, cb)
	local ownedAmbulanceCars = {}
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND job = @job AND `stored` = @stored', {
		['@owner'] = xPlayer.identifier,
		['@job']    = 'ambulance',
		['@stored'] = false
	}, function(data) 
		for _,v in pairs(data) do
			local vehicle = json.decode(v.vehicle)
			table.insert(ownedAmbulanceCars, vehicle)
		end
		cb(ownedAmbulanceCars)
	end)
end)

-- Check Money for Pounded Aircrafts
ESX.RegisterServerCallback('esx_advancedgarage:checkMoneyAircrafts', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= Config.AircraftPoundPrice then
		cb(true)
	else
		cb(false)
	end
end)

-- Check Money for Pounded Boats
ESX.RegisterServerCallback('esx_advancedgarage:checkMoneyBoats', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= Config.BoatPoundPrice then
		cb(true)
	else
		cb(false)
	end
end)

-- Check Money for Pounded Cars
ESX.RegisterServerCallback('esx_advancedgarage:checkMoneyCars', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= Config.CarPoundPrice then
		cb(true)
	else
		cb(false)
	end
end)

-- Check Money for Pounded Policing
ESX.RegisterServerCallback('esx_advancedgarage:checkMoneyPolicing', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= Config.PolicingPoundPrice then
		cb(true)
	else
		cb(false)
	end
end)

-- Check Money for Pounded Ambulance
ESX.RegisterServerCallback('esx_advancedgarage:checkMoneyAmbulance', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getMoney() >= Config.AmbulancePoundPrice then
		cb(true)
	else
		cb(false)
	end
end)

-- Pay for Pounded Aircrafts
RegisterServerEvent('esx_advancedgarage:payAircraft')
AddEventHandler('esx_advancedgarage:payAircraft', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(Config.AircraftPoundPrice)
	TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.AircraftPoundPrice)
end)

-- Pay for Pounded Boats
RegisterServerEvent('esx_advancedgarage:payBoat')
AddEventHandler('esx_advancedgarage:payBoat', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(Config.BoatPoundPrice)
	TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.BoatPoundPrice)
end)

-- Pay for Pounded Cars
RegisterServerEvent('esx_advancedgarage:payCar')
AddEventHandler('esx_advancedgarage:payCar', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(Config.CarPoundPrice)
	TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.CarPoundPrice)
end)

-- Pay for Pounded Policing
RegisterServerEvent('esx_advancedgarage:payPolicing')
AddEventHandler('esx_advancedgarage:payPolicing', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(Config.PolicingPoundPrice)
	TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.PolicingPoundPrice)
end)

-- Pay for Pounded Ambulance
RegisterServerEvent('esx_advancedgarage:payAmbulance')
AddEventHandler('esx_advancedgarage:payAmbulance', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(Config.AmbulancePoundPrice)
	TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. Config.AmbulancePoundPrice)
end)

-- Pay to Return Broken Vehicles
RegisterServerEvent('esx_advancedgarage:payhealth')
AddEventHandler('esx_advancedgarage:payhealth', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(price)
	TriggerClientEvent('esx:showNotification', source, _U('you_paid') .. price)
end)

-- Modify State of Vehicles
RegisterServerEvent('esx_advancedgarage:setVehicleState')
AddEventHandler('esx_advancedgarage:setVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate', {
		['@stored'] = state,
		['@plate'] = plate
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('esx_advancedgarage: %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

-- Rename Vehicle
RegisterServerEvent('esx_advancedgarage:renamevehicle')
AddEventHandler('esx_advancedgarage:renamevehicle', function(vehicleplate, name)
	MySQL.Sync.execute("UPDATE owned_vehicles SET vehiclename =@vehiclename WHERE plate=@plate",{['@vehiclename'] = name , ['@plate'] = vehicleplate:match("^%s*(.-)%s*$")})
end)

-- Update pound time
-- Modify State of Vehicles
RegisterServerEvent('esx_advancedgarage:updatePoundTime')
AddEventHandler('esx_advancedgarage:updatePoundTime', function(plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	local time = os.time()
	MySQL.Async.execute('UPDATE owned_vehicles SET last_pound = @time WHERE plate = @plate', {
		['@time'] = time,
		['@plate'] = plate
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('esx_advancedgarage: %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

-- Check Time if possible get out impounded car
ESX.RegisterServerCallback('esx_advancedgarage:getImpoundedCar', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT last_pound FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(data) 
		local pound = false
		local time = os.time()
		
		for _,v in pairs(data) do
			--print(tostring(time-v.last_pound))
			
			if v.last_pound == nil then
				pound = true
			else
				if time - v.last_pound > Config.TimePound then
					pound = true
				end
			end
		end
		cb(pound)
	end)
end)

--Modify Impound State
ESX.RegisterServerCallback('esx_advancedgarage:setImpoundedState', function(source, cb, plate, state)
	MySQL.Async.execute('UPDATE owned_vehicles SET `impounded` = @state, `last_pound` = 0 WHERE plate = @plate', {
		['@state'] = state,
		['@plate'] = plate
	}, function(rowsChanged)
		local changed =false
		if rowsChanged == 1 then
			changed = true
		end
		cb(changed)
	end)
end)


--[[
date_n = {year=2019, month=06, day=20, hour=16, min=17, sec=00}
local time = nil

Citizen.CreateThread(function()
	while true do
		
		time = os.time()
		print(tostring(time))
		Wait(60*1000)
		local result = os.time()-time
		print(tostring(result))
		
		--print(tostring(os.time()))
	end
end)
]]--