fx_version 'adamant'

game 'gta5'

name 'wl_menu_f5'

description 'Un semplice menù f5 per academy o rp da configurare!!'

client_scripts {
	"@es_extended/locale.lua",
	"locales/it.lua",
	"client/client.lua",
	"client/client_smontaarmi.lua",
	"config/config_client.lua",
	"config/config_smontaarmi.lua"
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"@es_extended/locale.lua",
	"locales/it.lua",
	"server/server.lua",
	"server/server_smontaarmi.lua",
	"config/config_smontaarmi.lua"
}

dependencies {
    'es_extended',
    'mysql-async',
	'jsfour-idcard',
	'esx_billing',
	'esx_ambulancejob'
}