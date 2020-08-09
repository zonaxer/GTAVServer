ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
  MySQL.Async.fetchAll('SELECT * FROM sg_vip',{}, function(results)
    --print(('[SG_VIP] [^3WARNING^7] Ignoring invalid job for %s [job: %s, grade: %s]'):format(identifier, job, grade))
    print(#results)

    if #results > 0 then
      print('[SG_VIP] [^3WARNING^7] TENGO ALGUIEN')
      -- TODO: borrar vip si es mas de un mes.
    else
      print('[SG_VIP] [^3WARNING^7] No tengo ningun vip')
    end

	end)
end)

ESX.RegisterCommand('darCoronas', 'admin', function(xPlayer, args, showError)
  TriggerEvent('sg_vip:insertarCoronasVip', args.playerId, args.coronas)
  xPlayer.showNotification(_U('dar_coronas', args.coronas, args.playerId.name))
end, true, {help = _U('darCoronas'), validate = true, arguments = {
  {name = 'playerId', help = _U('playerId'), type = 'player'},
  {name = 'coronas', help = _U('numero_coronas'), type = 'number'}
}})

ESX.RegisterCommand('quitarCoronas', 'admin', function(xPlayer, args, showError)
  TriggerEvent('sg_vip:quitarCoronasVip', args.playerId, args.coronas)
  xPlayer.showNotification(_U('quitar_coronas', args.coronas, args.playerId.name))
end, true, {help = _U('quitarCoronas'), validate = true, arguments = {
  {name = 'playerId', help = _U('playerId'), type = 'player'},
  {name = 'coronas', help = _U('numero_coronas'), type = 'number'}
}})

ESX.RegisterCommand('coronas', 'user', function(xPlayer, args, showError)
  TriggerEvent('sg_vip:muestraCoronas', xPlayer)
end, true, {help = _U('mostrar_coronas'), validate = true, arguments = {}})



--[[

Citizen.CreateThread(function()
  --TriggerEvent('sg_vip:insertarCoronasVip', 'c56ec46dc93cd5f0c2821cbd3ec1911f05367b4c', 150)
end)

]]--


--- Muestra las coronas que tiene el ususario
-- @param source ID de la persona que lanza el evento
-- @param identifier identificador de la persona que hay que quitarle el dinero
RegisterServerEvent('sg_vip:muestraCoronas')
AddEventHandler('sg_vip:muestraCoronas', function(xPlayer)
  MySQL.Async.fetchAll('SELECT coronas FROM sg_vip WHERE identifier=@identifier', {
    ['@identifier'] = xPlayer.identifier
  }, function (result)
    if #result > 0 then
      xPlayer.showNotification(_U('ver_coronas', result[1].coronas))
      --TODO: mandar notificación de que se ha actualizado correctamente el vip
    else
      print(('[SG_VIP] [^1WARNING^7] Ha surgido un error actualizando el VIP con identificador %s'):format(xPlayer.identifier))
    end
  end)
end)


--- Añadimos Coronas a los VIP
-- @param source ID de la persona que lanza el evento
-- @param identifier identificador de la persona que hay que quitarle el dinero
-- @param coronas la cantidad de coronas a restar
RegisterServerEvent('sg_vip:insertarCoronasVip')
AddEventHandler('sg_vip:insertarCoronasVip', function( xPlayer, coronas)
  print(identifier)
  print(coronas)
  local result = MySQL.Sync.fetchAll('SELECT * FROM sg_vip WHERE identifier = @identifier', {
    ['@identifier'] = xPlayer.identifier,
  })
  if result[1] then
    -- La persona existe
    --print(ESX.DumpTable(result))
    local totalCoronas = result[1].coronas + coronas
    MySQL.Async.execute('UPDATE sg_vip SET vip = @vip, coronas = @coronas, fecha = @fecha WHERE identifier=@identifier', {
      ['@identifier'] = xPlayer.identifier,
      ['@vip'] = true,
      ['@coronas'] = totalCoronas,
      ['@fecha'] = os.date("%c")
    }, function (rowsChanged)
      if rowsChanged > 0 then
        --TODO: mandar notificación de que se ha actualizado correctamente el vip
        xPlayer.showNotification(_U('recivo_coronas', coronas, totalCoronas))
      else
        print(('[SG_VIP] [^1WARNING^7] Ha surgido un error actualizando el VIP con identificador %s'):format(identifier))
      end
    end)

  else
    -- la persona no existe
    MySQL.Async.execute('INSERT INTO sg_vip (identifier, vip, coronas, fecha) VALUES (@identifier, @vip, @coronas, @fecha)', {
      ['@identifier'] = xPlayer.identifier,
      ['@vip'] = true,
      ['@coronas'] = coronas,
      ['@fecha'] = os.date("%c")
    }, function (rowsChanged)
      if rowsChanged > 0 then 
        -- La persona vip se ha insertado correctamente.
        --TODO: mandar notificación al cliente de exito.
        xPlayer.showNotification(_U('recivo_coronas', coronas, totalCoronas))
      else
        print(('[SG_VIP] [^1WARNING^7] Ha surgido un error actualizando el VIP con identificador %s'):format(xPlayer.identifier))
      end
    end)
  end

  

  --[[
	local xPlayer = ESX.GetPlayerFromId(source)

  if xPlayer.getGroup() == 'admin' then

	else
    print(('[SG_VIP] [^3WARNING^7] El tipo con identificador %s esta intentando ponerse vip'):format(xPlayer.getIdentifier()))
  end
  ]]--
end)
  
--- Quitar Coronas a los VIP cuando compren algo
-- @param source ID de la persona que lanza el evento
-- @param identifier identificador de la persona que hay que quitarle el dinero
-- @param coronas la cantidad de coronas a restar
RegisterServerEvent('sg_vip:quitarCoronasVip')
AddEventHandler('sg_vip:quitarCoronasVip', function( xPlayer, coronas)
  MySQL.Async.fetchAll('SELECT coronas FROM sg_vip WHERE identifier=@identifier',{['@identifier'] = xPlayer.identifier}, function(results)
    if #results > 0 then
      local totalCoronas = results[1].coronas - coronas
      MySQL.Async.execute('UPDATE sg_vip SET coronas = @coronas WHERE identifier=@identifier', {
        ['@identifier'] = xPlayer.identifier,
        ['@coronas'] = totalCoronas
      }, function (rowsChanged)
        if rowsChanged > 0 then
          xPlayer.showNotification(_U('quito_coronas', coronas, totalCoronas))
          --TODO: mandar notificación de que se ha actualizado correctamente el vip
        else
          print(('[SG_VIP] [^1WARNING^7] Ha surgido un error borrando coronas en el VIP con identificador %s'):format(xPlayer.identifier))
        end
      end)
    else
      -- TODO: MANDAR NOTIFICACION DE QUE NO TENGO CORONAS 
      print('no tengo coronas')
    end
  end)
end)

--- Quitar VIP a una persona pero no borramos sus coronas
-- @param source ID de la persona que lanza el evento
-- @param identifier identificador de la persona que hay que quitarle el dinero
RegisterServerEvent('sg_vip:borrarVip')
AddEventHandler('sg_vip:borrarVip', function(identifier)
  MySQL.Async.execute('UPDATE sg_vip SET vip = @vip, fecha = @fecha WHERE identifier=@identifier', {
    ['@identifier'] = identifier,
    ['@vip'] = false,
    ['@fecha'] = nil
  }, function (rowsChanged)
    if rowsChanged > 0 then
      print('HE BORRADO EL VIP')
      --TODO: mandar notificación de que se ha actualizado correctamente el vip
    else
      print(('[SG_VIP] [^1WARNING^7] Ha surgido un error actualizando el VIP con identificador %s'):format(identifier))
    end
  end)
end)

--- Borrar VIP completo, borra todos los datos
-- Solo lo pueden usar los admins
-- @param source ID de la persona que lanza el evento
-- @param identifier identificador de la persona que hay que quitarle el dinero
RegisterServerEvent('sg_vip:borrarTodoVip')
AddEventHandler('sg_vip:borrarTodoVip', function(identifier)
  MySQL.Async.execute('DELETE FROM sg_vip WHERE identifier=@identifier', {
    ['@identifier'] = identifier
  }, function (rowsChanged)
    if rowsChanged > 0 then
      print('HE BORRADO EL VIP COMPLETO')
      --TODO: mandar notificación de que se ha actualizado correctamente el vip
    else
      print(('[SG_VIP] [^1WARNING^7] Ha surgido un error actualizando el VIP con identificador %s'):format(identifier))
    end
  end)
end)


--- Comprobar si eres VIP
-- comprueba si tienes el rango de vip
-- @param source ID de la persona que lanza el evento
-- @param identifier identificador de la persona que hay que quitarle el dinero
-- @param cb devuelve si soy bip

ESX.RegisterServerCallback('sg_vip:soyVip', function(source, cb)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll('SELECT vip FROM sg_vip WHERE identifier=@identifier',{['@identifier'] = xPlayer.identifier}, function(results)
    if #results > 0 then
      if results[1].vip > 0 then
        cb(true)
      else
        cb(false)
      end
    else
      cb(false)
    end
  end)
end)

ESX.RegisterServerCallback('sg_vip:pedirCoronas', function(source, cb) 
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll('SELECT coronas FROM sg_vip WHERE identifier=@identifier',{['@identifier'] = xPlayer.identifier}, function(results)
    if #results > 0 then
      cb(results[1].coronas)
    else
      cb(0)
    end
  end)
end)

ESX.RegisterServerCallback('sg_vip:comprar', function( source, cb, coronas) 
  print(coronas)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)
  MySQL.Async.fetchAll('SELECT coronas FROM sg_vip WHERE identifier=@identifier',{['@identifier'] = xPlayer.identifier}, function(results)
    if #results > 0 then
      if results[1].coronas > coronas then
        local totalCoronas = results[1].coronas - coronas
        MySQL.Async.execute('UPDATE sg_vip SET coronas = @coronas WHERE identifier=@identifier', {
          ['@identifier'] = xPlayer.identifier,
          ['@coronas'] = totalCoronas
        }, function (rowsChanged)
          if rowsChanged > 0 then
            cb(true)
          else
            print(('[SG_VIP] [^1WARNING^7] Ha surgido un error borrando coronas en el VIP con identificador %s'):format(xPlayer.identifier))
          end
        end)
      else
        cb(false)
      end
    else
      cb(false)
    end
  end)
end)
