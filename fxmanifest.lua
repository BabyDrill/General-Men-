fx_version 'adamant'

game 'gta5'

author 'BabyDrill'

version '3.0'

client_scripts {
	"config/config.lua",
	"client/client.lua"
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	"config/*.lua",
	"server/server.lua",
}