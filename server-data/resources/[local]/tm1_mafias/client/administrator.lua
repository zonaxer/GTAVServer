-------------------
-----VARIABLES-----
-------------------
ESX                           = nil
local HasAlreadyEnteredMarker = false
local isInAGroup = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}

-------------------
------CITIZEN------
-------------------
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

local administratorLocal = {
	put = "Añadir personas al grupo",
	remove = "Expulsar personas al grupo",
	administrate = "Administrar miembros",
	titleSecondary = "Acciones de grupo",
	close = "Cerrar",
	title = "Administrador de grupo",
	accept = "Aceptar invitacion",
	unaccept = "Denegar invitacion",
	promoteTitle = "¿Que deseas hacer con ",
	promote = "Ascender",
	unpromote = "Degradar",
	removeGroup = "Eliminar grupo",
	yes = "Si",
	no = "No",
	removeGroupTitle = "¿Deseas eliminar el grupo ",
	errorRank = "No puedes expulsar a esa persona",
	exitGroup = "Salir del grupo",
	exitGroupQ = "¿Deseas salir del grupo?",
	noGroupSelected = "No estás en ningun grupo"
}


Citizen.CreateThread(function()
	local isOpen  = false
	while true do
		Citizen.Wait(0)
			if IsControlJustReleased(0, 246) and isOpen == false then
				CurrentAction     = 'principalAdministratorGroup'
				isOpen  = true
				OpenShopMenuB()
			elseif IsControlJustReleased(0, 166) then
				OpenShopMenuC()
			elseif IsControlJustReleased(0, 246) and isOpen == true then
				CurrentAction = nil
				isOpen  = false
				ESX.UI.Menu.CloseAll()
			end
	end
end)

function OpenShopMenuB()
	local elements = {}
	if group.rank == 4 then
	elements = {
		{label = administratorLocal.put ,value = "put_person"},
		{label = administratorLocal.remove ,value = "remove_person"},
		{label = administratorLocal.administrate ,value = "group_administrate"},
		{label = administratorLocal.exitGroup ,value = "exit_group"},
		{label = administratorLocal.close ,value = "close"}
	}
	elseif group.rank == 5 then
	elements = {
		{label = administratorLocal.put ,value = "put_person"},
		{label = administratorLocal.remove ,value = "remove_person"},
		{label = administratorLocal.administrate ,value = "group_administrate"},
		{label = administratorLocal.removeGroup ,value = "remove_group"},
		{label = administratorLocal.close ,value = "close"}
	}
	else
	elements = {
		{label = administratorLocal.exitGroup ,value = "exit_group"},
		{label = administratorLocal.close ,value = "close"}
	}
	end


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "put_person" then
				OpenAddPeopleMenu()
			elseif data.current.value == "remove_person" then
				OpenRemovePeopleMenu()
			elseif data.current.value == "group_administrate" then
				OpenAdministratePeopleMenu()
			elseif data.current.value == "remove_group" then
				OpenRemoveGroupMenu(group,"remove",group.enclosure)
			elseif data.current.value == "exit_group" then
				OpenRemoveGroupMenu(group,"exit")
			elseif data.current.value == "close" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenShopMenuC()
	local elements = {}

	--INFO
	if not(group.name == "") then
		table.insert(elements,{label = '<b><span style="color: red;">'..group.name..'</span></b>', value = 'title'})
	else
		table.insert(elements,{label = '<b><span style="color: red;">'..administratorLocal.noGroupSelected..'</span></b>', value = 'title'})
	end

	if not(group.money == nil) then
		table.insert(elements,{label = '<span style="color: green;">DINERO : '..group.money..'</span>', value = 'money'})
	end

	if not(group.rank == nil) then
		table.insert(elements,{label = '<span style="color: cyan;">RANGO : '..rankLabel[group.rank]..'</span>', value = 'rank'})
	end

	if not(group.aprove == nil) then
		table.insert(elements,{label = '<span style="color: yellow;">PRESTIGIO : '..grouplabel[group.aprove]..'</span>', value = 'aprove'})
	end

	--Acciones
	table.insert(elements,{label = '<b><span style="color: white;">'..'ACCIONES'..'</span></b>', value = 'title'})
	if not(group.name == "") then
		if ISMENUACTIVE == true then
			table.insert(elements,{label = '<b><span style="color: white;">INFORMACIÓN EN PANTALLA : <span style="color: green;">'..'ON'..'</span></span></b>', value = 'info'})
		else
			table.insert(elements,{label = '<b><span style="color: white;">INFORMACIÓN EN PANTALLA : <span style="color: red;">'..'OFF'..'</span></span></b>', value = 'info'})
		end
	end


	table.insert(elements,{label = '<b><span style="color: white;">'..'PRESTIGIO'..'</span></b>', value = 'title'})
	if not(group.name == "") then
		if group.aprove == 1 then
			table.insert(elements,{label = '<b><span style="color: white;">No tienes suficiente prestigio'..'</span></b>', value = 'nop'})
		else
			table.insert(elements,{label = '<b><span style="color: white;">Esposar / Desesposar'..'</span></b>', value = 'handCuff'})
			table.insert(elements,{label = '<b><span style="color: white;">Mover o dejar de mover'..'</span></b>', value = 'move'})
			table.insert(elements,{label = '<b><span style="color: white;">Meter en el coche'..'</span></b>', value = 'putOn'})
			table.insert(elements,{label = '<b><span style="color: white;">Sacar del coche'..'</span></b>', value = 'putOff'})
			table.insert(elements,{label = '<b><span style="color: white;">Sacar información'..'</span></b>', value = 'dni'})
		end
	end

	table.insert(elements,{label = '<b><span style="color: white;">'..'------------------'..'</span></b>', value = 'title'})
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'principalAdministratorGroup',
		{
			title  = administratorLocal.titleSecondary,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			local player, distance = ESX.Game.GetClosestPlayer()
			if data.current.value == "info" then
				ISMENUACTIVE = not ISMENUACTIVE
				menu.close()
			elseif data.current.value == "handCuff" then
				TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(player))
			elseif data.current.value == "move" then
				TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(player))
			elseif data.current.value == "putOn" then
				TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(player))
			elseif data.current.value == "putOff" then
				TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(player))
			elseif data.current.value == "dni" then
				OpenIdentityCardMenu(player)
			elseif data.current.value == "close" then
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenAcceptPendingMenu(ownerid)

	local elements = {
		{label = administratorLocal.accept ,value = "accept"},
		{label = administratorLocal.unaccept ,value = "unaccept"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'acceptgroup',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "accept" then
				TriggerServerEvent('tm1_mafias:groupAccepted',ownerid)
				menu.close()
			else
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenIdentityCardMenu(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local elements = {
			{label = ('Nombre %s'):format(data.name)},
			{label = ('Trabajo: %s - %s'):format(data.job, data.grade)}
		}

		
		table.insert(elements, {label = ('Sexo: %s'):format(data.sex)})
		table.insert(elements, {label = ('Fecha Nacimiento: %s'):format(data.dob)})
		table.insert(elements, {label = ('Altura: %s'):format(data.height)})


		if data.drunk then
			table.insert(elements, {label = ('Estado: %s'):format(data.drunk)})
		end

		if data.licenses then
			table.insert(elements, {label = 'Licencias'})

			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
			title    = 'Informacion',
			align    = 'top-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenAddPeopleMenu()

	ESX.TriggerServerCallback('tm1_mafias:requestPlayers', function(users)
		local elements = users
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'addPerson',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			TriggerServerEvent('tm1_mafias:pendingGroup',data.current.identifier,data.current.value)
			menu.close()
		end,
		function(data, menu)
			menu.close()
		end
		)
	end)
end

function OpenRemovePeopleMenu()
	ESX.TriggerServerCallback('tm1_mafias:requestGroupPlayers', function(users)
		local elements = users
		for a,b in pairs(elements) do
			if b.rango == 5 then
				b.label = b.label.." - ".."JEFE"
			elseif b.rango == 4 then
				b.label = b.label.." - ".."SUB-JEFE"
			elseif b.rango == 3 then
				b.label = b.label.." - ".."GANSTER"
			elseif b.rango == 2 then
				b.label = b.label.." - ".."NOVATO"
			elseif b.rango == 1 then
				b.label = b.label.." - ".."RECLUTA"
			end	
			
		end
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'removePerson',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if (group.rank == 4 or group.rank == 5) and data.current.rango == 5 then
				TriggerServerEvent('tm1_mafias:advert',administratorLocal.errorRank)
			else
			TriggerServerEvent('tm1_mafias:userRemoved',data.current.value,data.current.id)
			end
			ESX.UI.Menu.CloseAll()
		end,
		function(data, menu)
			menu.close()
		end
		)
	end)
end

function OpenAdministratePeopleMenu()
	ESX.TriggerServerCallback('tm1_mafias:requestGroupPlayers', function(users)
		local elements = users
		for a,b in pairs(elements) do
			if b.rango == 5 then
				b.label = b.label.." - ".."JEFE"
			elseif b.rango == 4 then
				b.label = b.label.." - ".."SUB-JEFE"
			elseif b.rango == 3 then
				b.label = b.label.." - ".."GANSTER"
			elseif b.rango == 2 then
				b.label = b.label.." - ".."NOVATO"
			elseif b.rango == 1 then
				b.label = b.label.." - ".."RECLUTA"
			end		
		end
		ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'removePerson',
		{
			title  = administratorLocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			
				OpenPromoteMenu(data.current.label,data.current.rango,data.current.value)		
		end,
		function(data, menu)
			menu.close()
		end
		)
	end)
end

function OpenPromoteMenu(name,rango,steamid)

	local elements = {
		{label = administratorLocal.promote ,value = "promote"},
		{label = administratorLocal.unpromote ,value = "unpromote"}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'promoteMenu',
		{
			title  = administratorLocal.promoteTitle..name.."?",
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			if data.current.value == "promote" then
				if group.rank == 4 and rango == 4 then
					TriggerServerEvent('tm1_mafias:advert',"No puedes autoascenderte a jefe.")
				else
					TriggerServerEvent('tm1_mafias:promotesSystem',group.groupid,rango,steamid,"promote")
				end
				menu.close()
			elseif data.current.value == "unpromote" then
				if group.rank == 4 and rango == 5 then
					TriggerServerEvent('tm1_mafias:advert',"No puedes degradar a un rango superior al tuyo.")
				else
				TriggerServerEvent('tm1_mafias:promotesSystem',group.groupid,rango,steamid,"unpromote")
				end
				menu.close()
			end
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function OpenRemoveGroupMenu(group,opc)

	local elements = {
		{label = administratorLocal.yes ,value = "accept"},
		{label = administratorLocal.no ,value = "unaccept"}
	}
	if opc == "remove" then
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'acceptgroup',
			{
				title  = administratorLocal.removeGroupTitle..group.name.."?",
				align    = 'bottom-right',
				elements = elements
			},
			function(data, menu)
				if data.current.value == "accept" then
					TriggerServerEvent("tm1_mafias:RemoveGroup",group.groupid)
					menu.close()
				else
					menu.close()
				end
			end,
			function(data, menu)
				menu.close()
			end
		)
	elseif opc == "exit" then
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'exitgroup',
			{
				title  = administratorLocal.exitGroupQ,
				align    = 'bottom-right',
				elements = elements
			},
			function(data, menu)
				if data.current.value == "accept" then
					TriggerServerEvent("tm1_mafias:exitGroup",group.groupid)
					menu.close()
				else
					menu.close()
				end
			end,
			function(data, menu)
				menu.close()
			end
		)
	end
end

RegisterNetEvent('tm1_mafias:acceptPending')
AddEventHandler('tm1_mafias:acceptPending',function(ownerid)
	OpenAcceptPendingMenu(ownerid)
end)