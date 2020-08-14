fx_version 'bodacious'

game 'gta5'

author 'Zonaxer'
description 'VIP Script for Server'
version '0.1 beta'


client_script {
		'@es_extended/locale.lua', 
		'locales/es.lua',
		'config.lua', 
		'client/cl_main.lua',
    
}

server_script {
		'@es_extended/locale.lua', 
		'locales/es.lua',
		'@mysql-async/lib/MySQL.lua',
		'config.lua',
		"server/sv_main.lua",
		
}
