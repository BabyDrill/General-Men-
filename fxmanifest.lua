fx_version 'adamant'

game 'gta5'

author 'BabyDrill'

description 'Menu f5'

client_scripts {
	'@es_extended/locale.lua',
	'locales/it.lua',
	'client/client.lua',
	'client/client_smonta.lua',
	'config.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/it.lua',
	'config.lua',
	'server/server.lua',
	'server/server_smonta.lua'
}


