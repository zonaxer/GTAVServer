-------------------
-----VARIABLES-----
-------------------
ESX                           = nil
local HasAlreadyEnteredMarker = false
local isInAGroup = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local groupBank = {
	x = 1267.24,
	y = -1714.54,
	z = 53.66
}

-------------------
-------TEXTOS------
-------------------
local banklocal = {
	access = 'Presiona E para acceder al banco de grupo.',
	add = "Ingresar 100$",
	remove = "Retirar 100$",
	title = "Banco de grupos"
}

-------------------
------CITIZEN------
-------------------
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		
		DrawMarker(1,groupBank.x,groupBank.y,groupBank.z, 0, 0, 0, 0, 0, 0, 1.5001, 1.5001, 0.6001,100,96,99, 200, 0, 0, 0, 0)
		if(GetDistanceBetweenCoords(coords, groupBank.x,groupBank.y,groupBank.z, true) < 3) then
			DrawText3D(groupBank.x,groupBank.y,groupBank.z + 1, "Pulsa E para abrir el menu", 255,0,0)
			if IsControlJustReleased(0, 38) then
				OpenShopMenuc()
			end
		end
	end
end)

-------------------
-----FUNCIONES-----
-------------------
function OpenShopMenuc()

	local elements = {
		{label = banklocal.add ,value = "put_100",price = 100},
		{label = banklocal.remove ,value = "remove_100",price = 100}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'groups_bank',
		{
			title  = banklocal.title,
			align    = 'bottom-right',
			elements = elements
		},
		function(data, menu)
			TriggerServerEvent('tm1_mafias:refreshMoney', data.current.value,data.current.price)
		end,
		function(data, menu)
			menu.close()
		end
	)
end

function DrawText3D(x,y,z, text, r,g,b) -- some useful function, use it if you want!
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end