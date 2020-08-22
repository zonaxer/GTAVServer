ESX = nil
local vehicles = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(_categories)
		categories = _categories

		MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(_vehicles)
			vehicles = _vehicles

			for k,v in ipairs(vehicles) do
				for k2,v2 in ipairs(categories) do
					if v2.name == v.category then
						vehicles[k].categoryLabel = v2.label
						break
					end
				end
      end
      
		end)
	end)
end)

ESX.RegisterCommand('darCoronas', 'admin', function(xPlayer, args, showError)
  
  args.playerId.addAccountMoney('coronas', args.coronas)
  xPlayer.showNotification(_U('dar_coronas', args.coronas, args.playerId.name))

end, true, {help = _U('darCoronas'), validate = true, arguments = {
  {name = 'playerId', help = _U('playerId'), type = 'player'},
  {name = 'coronas', help = _U('numero_coronas'), type = 'number'}
}})

ESX.RegisterCommand('quitarCoronas', 'admin', function(xPlayer, args, showError)

  args.playerId.removeAccountMoney('coronas', args.coronas)
  xPlayer.showNotification(_U('quitar_coronas', args.coronas, args.playerId.name))

end, true, {help = _U('quitarCoronas'), validate = true, arguments = {
  {name = 'playerId', help = _U('playerId'), type = 'player'},
  {name = 'coronas', help = _U('numero_coronas'), type = 'number'}
}})

ESX.RegisterCommand('coronas', 'user', function(xPlayer, args, showError)
  xPlayer.showNotification(_U('ver_coronas', xPlayer.getAccount('coronas').money))
end, true, {help = _U('mostrar_coronas'), validate = true, arguments = {}})


ESX.RegisterServerCallback('sg_vip:comprarVehiculo', function( source, cb, modelo, matricula) 
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  local precioModelo

  for k,v in ipairs(vehicles) do
    if modelo == v.model then
      precioModelo = v.price
      break
    end
  end
  
  if precioModelo and xPlayer.getAccount('coronas').money >= precioModelo then
    xPlayer.removeAccountMoney('coronas', precioModelo)

    MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
      ['@owner']   = xPlayer.identifier,
      ['@plate']   = matricula,
      ['@vehicle'] = json.encode({model = GetHashKey(modelo), plate = matricula})
    }, function(rowsChanged)
      xPlayer.showNotification(_U('vehicle_belongs', matricula))
      cb(true)
    end)
	else
		local missingMoney = precioModelo -  xPlayer.getAccount('coronas').money
    xPlayer.showNotification(_U('not_enough', ESX.Math.GroupDigits(missingMoney)))
    cb(false)
  end
end)

RegisterServerEvent('sg_vip:balance')
AddEventHandler('sg_vip:balance', function()
  local balance = {}
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  balance.coronas = xPlayer.getAccount('coronas').money
  balance.valorCorona = Config.DineroPorCoronas
  

    TriggerClientEvent('sg_vip:showBalance', _source, balance)

end)


RegisterServerEvent('sg_vip:cambiaCoronas')
AddEventHandler('sg_vip:cambiaCoronas', function(data)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  if tonumber(data.cantidad) <= xPlayer.getAccount('coronas').money then
    xPlayer.removeAccountMoney('coronas', tonumber(data.cantidad))
    local totalBanco = tonumber(data.cantidad) * tonumber(data.valorCorona)
    xPlayer.addAccountMoney('bank', totalBanco)
    xPlayer.showNotification('El cambio de coronas se ha efectuado con exito. Acercate a un cajero para recoger tu dinero.')

  else
    local missingMoney = tonumber(data.cantidad) -  xPlayer.getAccount('coronas').money
    xPlayer.showNotification(_U('not_enough', ESX.Math.GroupDigits(missingMoney)))
  end

end)