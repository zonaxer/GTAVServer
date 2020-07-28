--===============================================
--==                 VARIABLES                 ==
--===============================================

local creatorCoords = {x = 1275.0, y = -1721.51, z = 53.66}
local guiEnabled = false
local group = {}
--===============================================
--==           REGISTERS AND EVENTS            ==
--===============================================
RegisterNetEvent('tm1_mafias:openCreator')
AddEventHandler('tm1_mafias:openCreator',function()
	EnableGui(true)
end)
RegisterNUICallback('escape', function(data, cb)
    EnableGui(false)
end)
RegisterNUICallback('register', function(data, cb)
  group = data
  TriggerServerEvent('tm1_mafias:createGroup', data.groupName)
  EnableGui(false)
  Wait (500)
end)
--===============================================
--==                 THREADING                 ==
--===============================================

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DrawMarker(1,creatorCoords.x,creatorCoords.y,creatorCoords.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,100,96,99, 200, 0, 0, 0, 0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		if(GetDistanceBetweenCoords(coords, creatorCoords.x,creatorCoords.y,creatorCoords.z, true) <= 1.5) and guiEnabled == false then
			drawTxt("PULSA E PARA CREAR UN GRUPO",2, 1, 0.5, 0.8, 0.45,0,255,0,255)
            if IsControlJustReleased(0, 38) and guiEnabled == false then
				TriggerServerEvent('tm1_mafias:verifyGroup')
			end
		elseif(GetDistanceBetweenCoords(coords, creatorCoords.x,creatorCoords.y,creatorCoords.z, true) > 1.5) and guiEnabled == true then
			EnableGui(false)
		end
	end
end)
Citizen.CreateThread(function()
    while true do
        if guiEnabled then
            DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            DisableControlAction(0, 2, guiEnabled) -- LookUpDown

            DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate

            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride

            if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                SendNUIMessage({
                    type = "click"
                })
            end
        end
        Citizen.Wait(0)
    end
end)

--===============================================
--==                 FUNCTIONS                 ==
--===============================================
function EnableGui(enable)
    SetNuiFocus(enable)
    guiEnabled = enable

    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
end