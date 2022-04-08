ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

print("^2BabyDrill on Top - https://github.com/BabyDrill^0")

ESX.RegisterServerCallback('babydrill_menuf5:dammestogruppo', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local gruppo = xPlayer.getGroup()

		if gruppo ~= nil then 
			cb(gruppo)
		else
			cb('user')
		end
	end
end)

RegisterNetEvent('babydrill_menuf5:givesoldi')
AddEventHandler('babydrill_menuf5:givesoldi', function(tiposoldi, importo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gruppo = xPlayer.getGroup()

	if gruppo ~= nil then
		if gruppo == 'admin' or gruppo == 'superadmin' then 
			if tiposoldi == 'sporchi' then
				xPlayer.addAccountMoney('black_money', tonumber(importo))
				TriggerClientEvent('esx:showNotification', source, 'Ti sei givvato ' .. importo .. '$ soldi sporchi')
				TriggerEvent("esx:log", Config.Webhook, "Give Soldi Contanti", "\n\n**Giocatore:** " .. GetPlayerName(source) .. "\n\n**Tipo di Soldi:** Sporchi\n\n**Importo:** " .. importo ..  "$\n\n"Config.NomeServer, 5897984)
			elseif tiposoldi == 'puliti' then
				xPlayer.addMoney(importo)
				TriggerClientEvent('esx:showNotification', source, 'Ti sei givvato ' .. importo .. '$')
				TriggerEvent("esx:log", Config.Webhook, "Give Soldi Contanti", "\n\n**Giocatore:** " .. GetPlayerName(source) .. "\n\n**Tipo di Soldi:** Puliti\n\n**Importo:** " .. importo ..  "$\n\n"Config.NomeServer, 5897984)
			end
		else
			TriggerClientEvent('esx:showNotification', source, 'Non hai il permesso!')
		end
	end
end)

RegisterNetEvent('babydrill_menuf5:riparaauto')
AddEventHandler('babydrill_menuf5:riparaauto', function(tiposoldi, importo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gruppo = xPlayer.getGroup()

	if gruppo ~= nil then
		if gruppo == 'mod' or gruppo == 'admin' or gruppo == 'superadmin' then 
			TriggerEvent("esx:log", Config.Webhook, "Riparazione Veicolo", "\n\n**Nome Giocatore:** " .. GetPlayerName(source) .. "\n\n"Config.NomeServer, 5897984)
		end
	end
end)