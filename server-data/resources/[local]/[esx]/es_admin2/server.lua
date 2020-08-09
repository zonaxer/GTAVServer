ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent("es:addGroup", "mod", "user", function(group) end)

-- Modify if you want, btw the _admin_ needs to be able to target the group and it will work
local groupsRequired = {
	slay = "mod",
	noclip = "admin",
	crash = "superadmin",
	freeze = "mod",
	bring = "mod",
	["goto"] = "mod",
	slap = "mod",
	slay = "mod",
	kick = "mod",
	ban = "admin"
}

local reports = ""
local reportsTable = {}

function loadReports()
	reports = LoadResourceFile(GetCurrentResourceName(), "reports.json") or ""
	if reports ~= "" then
		reportsTable = json.decode(reports)
	else
		reportsTable = {}
	end
end

RegisterCommand("refresh_reports", function()
	loadReports()
end, true)

RegisterServerEvent('es_admin:getReports')
AddEventHandler('es_admin:getReports', function(cb)
	loadReports()
	TriggerClientEvent('es_admin:openUI', source, reports)
end)


function loadExistingPlayers()
	TriggerEvent("es:getPlayers", function(curPlayers)
		for k,v in pairs(curPlayers)do
			TriggerClientEvent("es_admin:setGroup", v.get('source'), v.get('group'))
		end
	end)
end

loadExistingPlayers()

function removeBan(id)
	bannedTable[id] = nil
	SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(bannedTable), -1)
end


function permBanUser(bannedBy, id)
	bannedTable[id] = {
		banner = bannedBy,
		reason = "Permanently banned from this server",
		expire = 0
	}

	SaveResourceFile(GetCurrentResourceName(), "reports.json", json.encode(bannedTable), -1)
end

function addReport(id, playerName, report)
	table.insert(reportsTable, {fecha = (os.date("%c")), playerName = playerName, message = report})

	SaveResourceFile(GetCurrentResourceName(), "reports.json", json.encode(reportsTable), -1)
end


AddEventHandler('es:incorrectAmountOfArguments', function(source, wantedArguments, passedArguments, user, command)
	if(source == 0)then
		print("Argument count mismatch (passed " .. passedArguments .. ", wanted " .. wantedArguments .. ")")
	else
		TriggerClientEvent('chat:addMessage', source, {
			args = {"^1SYSTEM", "Incorrect amount of arguments! (" .. passedArguments .. " passed, " .. requiredArguments .. " wanted)"}
		})
	end
end)

RegisterServerEvent('es_admin:all')
AddEventHandler('es_admin:all', function(type)
	local _source = source
	local user = ESX.GetPlayerFromId(_source)

	if user.getGroup() == 'admin' then
		if type == "slay_all" then TriggerClientEvent('es_admin:quick', -1, 'slay') end
		if type == "bring_all" then TriggerClientEvent('es_admin:quick', -1, 'bring', _source) end
		if type == "slap_all" then TriggerClientEvent('es_admin:quick', -1, 'slap') end
	else
		TriggerClientEvent('chat:addMessage', Source, {
			args = {"^1SYSTEM", "You do not have permission to do this"}
		})
	end
	
	
end)

RegisterServerEvent('es_admin:quick')
AddEventHandler('es_admin:quick', function(id, type)
	local src = source
	local user = ESX.GetPlayerFromId(src)
	--local target = ESX.getPlayerFromId(id)

	if user.getGroup() == 'admin' then
		if type == "slay" then TriggerClientEvent('es_admin:quick', id, type) end
		if type == "noclip" then TriggerClientEvent('es_admin:quick', id, type) end
		if type == "freeze" then TriggerClientEvent('es_admin:quick', id, type) end
		if type == "crash" then TriggerClientEvent('es_admin:quick', id, type) end
		if type == "bring" then TriggerClientEvent('es_admin:quick', id, type, src) end
		if type == "goto" then TriggerClientEvent('es_admin:quick', src, type, id) end
		if type == "slap" then TriggerClientEvent('es_admin:quick', id, type) end
		if type == "slay" then TriggerClientEvent('es_admin:quick', id, type) end
		if type == "kick" then DropPlayer(id, 'Kicked by es_admin GUI') end
	else
		TriggerClientEvent('chat:addMessage', Source, {
			args = {"^1SYSTEM", "You do not have permission to do this"}
		})
	end
	
end)

AddEventHandler('esx:playerLoaded', function(Source, user)
	TriggerClientEvent('es_admin:setGroup', Source, user.getGroup())
end)

AddEventHandler('onResourceStart', function(resourceName)
	for _, playerId in ipairs(GetPlayers()) do
		TriggerClientEvent('es_admin:setGroup', playerId, ESX.GetPlayerFromId(playerId).getGroup())
	end
end)

RegisterServerEvent('es_admin:set')
AddEventHandler('es_admin:set', function(t, USER, GROUP)
	local src = source
	local user = ESX.GetPlayerFromId(src)
	local group = user.getGroup()
	
	if group == "admin" or group == "superadmin" or group == "mod" then
			if t == "group" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', src, {
						args = {"^1SYSTEM", "Jugador no encontrado"}
					})
				else
					local user = ESX.GetPlayerFromId(USER)
					user.setGroup(GROUP)
					TriggerClientEvent('es_admin:setGroup', USER, GROUP)
					TriggerClientEvent('chat:addMessage', -1, {
						args = {"^1CONSOLE", "Group of ^2^*" .. GetPlayerName(tonumber(USER)) .. "^r^0 has been set to ^2^*" .. GROUP}
					})

				end
			elseif t == "addmoney" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', src, {
						args = {"^1SYSTEM", "Jugador no encontrado"}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						local user = ESX.GetPlayerFromId(USER)
						user.addMoney(GROUP)
					else
						TriggerClientEvent('chat:addMessage', src, {
							args = {"^1SYSTEM", "Valor no adminitido."}
						})
					end
				end
			elseif t == "removemoney" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', src, {
						args = {"^1SYSTEM", "Jugador no encontrado"}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						local user = ESX.GetPlayerFromId(USER)
						user.removeMoney(GROUP)
					else
						TriggerClientEvent('chat:addMessage', src, {
							args = {"^1SYSTEM", "Valor no adminitido."}
						})
					end
				end
			elseif t == "addbank" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', src, {
						args = {"^1SYSTEM", "Jugador no encontrado"}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						local user = ESX.GetPlayerFromId(USER)
						user.addAccountMoney('bank', GROUP)
					else
						TriggerClientEvent('chat:addMessage', src, {
							args = {"^1SYSTEM", "Invalid integer entered"}
						})
					end
				end
			elseif t == "removebank" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', src, {
						args = {"^1SYSTEM", "Jugador no encontrado"}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						local user = ESX.GetPlayerFromId(USER)
						user.removeAccountMoney('bank', GROUP)
					else
						TriggerClientEvent('chat:addMessage', src, {
							args = {"^1SYSTEM", "Invalid integer entered"}
						})
					end
				end
			elseif t == "addblack_money" then

				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', src, {
						args = {"^1SYSTEM", "Jugador no encontrado"}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						local user = ESX.GetPlayerFromId(USER)
						user.addAccountMoney('black_money', GROUP)
					else
						TriggerClientEvent('chat:addMessage', src, {
							args = {"^1SYSTEM", "Invalid integer entered"}
						})
					end
				end
			elseif t == "removeblack_money" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', src, {
						args = {"^1SYSTEM", "Jugador no encontrado"}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						local user = ESX.GetPlayerFromId(USER)
						user.removeAccountMoney('black_money', GROUP)
					else
						TriggerClientEvent('chat:addMessage', src, {
							args = {"^1SYSTEM", "Invalid integer entered"}
						})
					end
				end
			elseif t == "addcoronas" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', src, {
						args = {"^1SYSTEM", "Jugador no encontrado"}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						local user = ESX.GetPlayerFromId(USER)
						user.addAccountMoney('coronas', GROUP)
					else
						TriggerClientEvent('chat:addMessage', src, {
							args = {"^1SYSTEM", "Invalid integer entered"}
						})
					end
				end
			elseif t == "removecoronas" then
				if(GetPlayerName(USER) == nil)then
					TriggerClientEvent('chat:addMessage', src, {
						args = {"^1SYSTEM", "Jugador no encontrado"}
					})
				else
					GROUP = tonumber(GROUP)
					if(GROUP ~= nil and GROUP > -1)then
						local user = ESX.GetPlayerFromId(USER)
						user.removeAccountMoney('coronas', GROUP)
					else
						TriggerClientEvent('chat:addMessage', src, {
							args = {"^1SYSTEM", "Invalid integer entered"}
						})
					end
				end
		end
	end
end)


-- Ban a person
TriggerEvent("es:addGroupCommand", 'ban', "admin", function(source, args, user)
	local Source = source
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)
				TriggerEvent('es:canGroupTarget', user.getGroup(), target.getGroup(), function(canTarget)
					if canTarget then
						local reason = args
						table.remove(reason, 1)
						local time = args[1]
						table.remove(reason, 1)
						if(#reason == 0)then
							reason = "You have been banned from the server"
						else
							reason = "" .. table.concat(reason, " ")
						end

						-- Awful shit logic but eh, it works?
						-- Days
						if string.find(time, "m")then
							time = math.floor(time:gsub("%m", "") * 60)
						elseif string.find(time, "h") then
							time = math.floor(time:gsub("%h", "") * 60 * 60)
						elseif string.find(time, "d") then
							time = math.floor(time:gsub("%d", "") * 60 * 60 * 24)
						elseif string.find(time, "y") then
							time = math.floor(time:gsub("%y", "") * 60 * 60 * 24 * 365)
						end

						TriggerClientEvent('chat:addMessage', -1, {
							args = {"^1SYSTEM", "Player ^2" .. GetPlayerName(player) .. "^0 has been kicked(^2" .. reason .. "^0)"}
						})
						banUser(time, user.getIdentifier(), target.getIdentifier(), reason)
						DropPlayer(player, "Banned for: " .. reason .. "\nExpires: " .. (os.date("%c", os.time() + time)))
					else
						TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "You can not target this person"}})
					end
				end)
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
	end
end)

-- Report to admins
ESX.RegisterCommand('report', 'user', function(xPlayer, args, showError)
	local source = xPlayer.source
	local messageReport = table.concat(args, " ")
	TriggerClientEvent('chat:addMessage', source, {
		args = {"^1REPORT",('(^2%s | %s^0) %s '):format(GetPlayerName(source), source, messageReport) }
	})
	addReport(source,GetPlayerName(source), messageReport)
	for _, playerId in ipairs(GetPlayers()) do
		local player = ESX.GetPlayerFromId(playerId)

		if (player.getGroup() == "admin" and player.source ~= source) then
			TriggerClientEvent('chat:addMessage', player.source, {
				args = {"^1REPORT", " (^2" .. GetPlayerName(source) .." | "..source.."^0) " .. messageReport}
			})
		end
	end

end, true, {help = "Reporta un jugador o un bug", validate = false, rawArgs=true, arguments = {{name = 'report', help = "Que quieres reportar", type = 'string'}}}
)

-- Noclip
TriggerEvent('es:addGroupCommand', 'noclip', "admin", function(source, args, user)
	TriggerClientEvent("es_admin:noclip", source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Enable or disable noclip"})

-- Kicking
TriggerEvent('es:addGroupCommand', 'kick', "mod", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				local reason = args
				table.remove(reason, 1)
				if(#reason == 0)then
					reason = "Kicked: You have been kicked from the server"
				else
					reason = "Kicked: " .. table.concat(reason, " ")
				end

				TriggerClientEvent('chat:addMessage', -1, {
					args = {"^1SYSTEM", "Player ^2" .. GetPlayerName(player) .. "^0 has been kicked(^2" .. reason .. "^0)"}
				})
				DropPlayer(player, reason)
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Kick a user with the specified reason or no reason", params = {{name = "userid", help = "The ID of the player"}, {name = "reason", help = "The reason as to why you kick this player"}}})

-- Announcing
TriggerEvent('es:addGroupCommand', 'announce', "admin", function(source, args, user)
	TriggerClientEvent('chat:addMessage', -1, {
		args = {"^1ANNOUNCEMENT", table.concat(args, " ")}
	})
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Announce a message to the entire server", params = {{name = "announcement", help = "The message to announce"}}})

-- Freezing
local frozen = {}
TriggerEvent('es:addGroupCommand', 'freeze', "mod", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				if(frozen[player])then
					frozen[player] = false
				else
					frozen[player] = true
				end

				TriggerClientEvent('es_admin:freezePlayer', player, frozen[player])

				local state = "unfrozen"
				if(frozen[player])then
					state = "frozen"
				end

				TriggerClientEvent('chat:addMessage', player, { args = {"^1SYSTEM", "You have been " .. state .. " by ^2" .. GetPlayerName(source)} })
				TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Player ^2" .. GetPlayerName(player) .. "^0 has been " .. state} })
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Freeze or unfreeze a user", params = {{name = "userid", help = "The ID of the player"}}})

-- Bring
TriggerEvent('es:addGroupCommand', 'bring', "mod", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:teleportUser', target.get('source'), user.getCoords().x, user.getCoords().y, user.getCoords().z)

				TriggerClientEvent('chat:addMessage', player, { args = {"^1SYSTEM", "You have brought by ^2" .. GetPlayerName(source)} })
				TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Player ^2" .. GetPlayerName(player) .. "^0 has been brought"} })
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Teleport a user to you", params = {{name = "userid", help = "The ID of the player"}}})

-- Slap
TriggerEvent('es:addGroupCommand', 'slap', "admin", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:slap', player)

				TriggerClientEvent('chat:addMessage', player, { args = {"^1SYSTEM", "You have slapped by ^2" .. GetPlayerName(source)} })
				TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Player ^2" .. GetPlayerName(player) .. "^0 has been slapped"} })
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Slap a user", params = {{name = "userid", help = "The ID of the player"}}})

-- Goto
TriggerEvent('es:addGroupCommand', 'goto', "mod", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)
				if(target)then

					TriggerClientEvent('es_admin:teleportUser', source, target.getCoords().x, target.getCoords().y, target.getCoords().z)

					TriggerClientEvent('chat:addMessage', player, { args = {"^1SYSTEM", "You have been teleported to by ^2" .. GetPlayerName(source)} })
					TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Teleported to player ^2" .. GetPlayerName(player) .. ""} })
				end
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Teleport to a user", params = {{name = "userid", help = "The ID of the player"}}})

-- Kill yourself
TriggerEvent('es:addCommand', 'die', function(source, args, user)
	TriggerClientEvent('es_admin:kill', source)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "You killed yourself"} })
end, {help = "Suicide"})

-- Slay a player
TriggerEvent('es:addGroupCommand', 'slay', "admin", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:kill', player)

				TriggerClientEvent('chat:addMessage', player, { args = {"^1SYSTEM", "You have been killed by ^2" .. GetPlayerName(source)} })
				TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Player ^2" .. GetPlayerName(player) .. "^0 has been killed."} })
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Slay a user", params = {{name = "userid", help = "The ID of the player"}}})

-- Crashing
TriggerEvent('es:addGroupCommand', 'crash', "superadmin", function(source, args, user)
	if args[1] then
		if(tonumber(args[1]) and GetPlayerName(tonumber(args[1])))then
			local player = tonumber(args[1])

			-- User permission check
			TriggerEvent("es:getPlayerFromId", player, function(target)

				TriggerClientEvent('es_admin:crash', player)

				TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Player ^2" .. GetPlayerName(player) .. "^0 has been crashed."} })
			end)
		else
			TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Incorrect player ID"}})
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = {"^1SYSTEM", "Insufficienct permissions!"} })
end, {help = "Crash a user, no idea why this still exists", params = {{name = "userid", help = "The ID of the player"}}})

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

loadReports()
