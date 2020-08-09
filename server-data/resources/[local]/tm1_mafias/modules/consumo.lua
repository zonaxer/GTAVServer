
--CADA PASTILLA DURA X TIEMPO
-- SI SE DROGA MIENTRAS ESTÁ DROGADO QUE SE SUME EL TIEMPO
-- SI SE DROGA MUCHO QUE MUERA
local drogado = false
local addicted = 0
local pastillas = 0 --pastillas que llevan hasta quedar adictos
local tiempo = 0 
local efectodroga = 120 --tiempo en segundos que hace efecto la droga
local shake = 0.8--cada vez que tomo droga este efecto incrementa 
local timer = 1000*60*10
----- POR CHAINI | ZUCKERBERG -----
RegisterNetEvent('tm1_mafias:meDrogo')
AddEventHandler('tm1_mafias:meDrogo',function(maxcant)
	AbroMenu(maxcant)
end)

AddEventHandler('playerSpawned',function()
	ESX.TriggerServerCallback('tm1_mafias:addiction', function(callback)
		addicted = callback
	end)

end)

function AbroMenu(maxcant)

	ESX.UI.Menu.Open(
		'dialog', GetCurrentResourceName(), 'numero_pastillas',
		{
		  title = '¿Cuántas rayas te quieres meter?'
		},
		function(data, menu)
	
		  local count = tonumber(data.value)
	
		  if count == nil or count <= 0 then
				ESX.ShowNotification('Eres un blando tío')
				menu.close()
		  elseif count > maxcant then
				ESX.ShowNotification('¡No tienes tanto!')
				menu.close()
		  else
				ESX.ShowNotification('Esto va a molar')
				menu.close()
				ESX.UI.Menu.CloseAll()
				MeDrogo(count)
			end
		end,
		function(data2, menu2)
		  menu2.close()
		end
	) 
end

function MeDrogo(count)
	Citizen.CreateThread(function()

			RequestAnimDict("missfbi3_party")--RESET_PED_MOVEMENT_CLIPSET
			
			while not HasAnimDictLoaded( "missfbi3_party") do
				Citizen.Wait(0)
			end
			-- b_male3
			TaskPlayAnim(GetPlayerPed(-1), "missfbi3_party" ,"snort_coke_b_male3" ,8.0, -8.0, -1, 0, 0, false, false, false )

	end)
	Wait(5000)
	if shake <= 3.0 then
		shake = shake + 0.1*count
	end
	ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", shake)
	StartScreenEffect("DrugsTrevorClownsFight",0,true)
	SetPedIsDrunk(GetPlayerPed(-1),true)
	SetPedMovementClipset(GetPlayerPed(-1),"move_m@drunk@verydrunk",0x3E800000)
	drogado = true
	tiempo = tiempo + (efectodroga*count)
	pastillas = pastillas + count
	timer = 1000*60*10
	if pastillas > 50 then
		addicted = 1
		TriggerServerEvent('tm1_mafias:vuelvoadicto')
	end
	TriggerServerEvent('tm1_mafias:retiroCoca',count)
end

Citizen.CreateThread(function()
	while true do
		if drogado == true then
			if tiempo <= 0 then
				drogado = false
				StopGameplayCamShaking(true)
				SetPedIsDrunk(GetPlayerPed(-1),false)
				ResetPedMovementClipset(GetPlayerPed(-1),0.0)
				StopScreenEffect("DrugsTrevorClownsFight")
			else
				local vida = GetEntityHealth(GetPlayerPed(-1))
				local armour = GetPedArmour(GetPlayerPed(-1))

				if vida < 140 then
					SetEntityHealth(GetPlayerPed(-1),vida+2)
				end
				
				if armour < 10 then
					AddArmourToPed(GetPlayerPed(-1),2)
				end
			end
			Citizen.Wait(1000)
			tiempo = tiempo -1
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		if addicted == 1 then
			if timer <= 0 then
				SetEntityHealth(GetPlayerPed(-1),GetEntityHealth(GetPlayerPed(-1))-15)
				ESX.ShowNotification('Necesito mi dosis de cocaína.')
				timer = 1000*60*10
			end
			Citizen.Wait(1000)
			timer = timer-1
		end
		Citizen.Wait(0)
	end
end)

