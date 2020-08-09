ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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


ESX.RegisterServerCallback('sg_vip:comprar', function( source, cb, coronas) 
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  if xPlayer.getAccount('coronas').money >= coronas then
      xPlayer.removeAccountMoney('coronas', coronas)
			cb(true)
	else
		local missingMoney = coronas -  xPlayer.getAccount('coronas').money
    xPlayer.showNotification(_U('not_enough', ESX.Math.GroupDigits(missingMoney)))
    cb(false)
  end
end)







