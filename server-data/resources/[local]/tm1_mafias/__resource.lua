description 'Mafia´s System'
version 'a0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server/main.lua',
}

client_scripts {
	'client/main.lua',
	'client/bankgroup.lua',
	'client/administrator.lua',
	'client/register.lua',
	'client/enclosures.lua',
	'modules/weed.lua',
	--'modules/weapon_license.lua',
	--'modules/weapontraffic.lua',
	--'modules/coke.lua',
	--'modules/cargojob.lua',
	--'modules/consumo.lua',
	--'modules/nevaditos.lua'
}

ui_page('html/index.html')

files({
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/cursor.png',
})

server_exports {
	'getPlayerFromId',
}