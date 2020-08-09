fx_version 'bodacious'

game 'gta5'

author 'Zonaxer'
description 'VIP Script for Server'
version '0.1 beta'


client_script {
		'@es_extended/locale.lua', 
		'config.lua', 
		'client/cl_main.lua',
    'locales/es.lua',
}

server_script {
		'@es_extended/locale.lua', 
		'@mysql-async/lib/MySQL.lua',
		'config.lua',
		"server/sv_main.lua",
		'locales/es.lua',
}
