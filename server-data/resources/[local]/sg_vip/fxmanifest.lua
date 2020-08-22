fx_version 'bodacious'

game 'gta5'

author 'Zonaxer'
description 'VIP Script for Server'
version '0.1 beta'

ui_page 'client/html/index.html'

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
		'server/sv_main.lua',

}

files {
	'client/html/app.js',
	'client/html/index.css',
	'client/html/index.html',
	'client/html/font/Bariol_Regular.otf',
	'client/html/font/Vision-Black.otf',
	'client/html/font/Vision-Bold.otf',
	'client/html/font/Vision-Heavy.otf',
	'client/html/img/bg.png',
	'client/html/img/circle.png',
	'client/html/img/curve.png',
	'client/html/img/fingerprint.jpg',
	'client/html/img/graph.png',
	'client/html/img/logo-big.png',
	'client/html/img/logo-top.png',

}