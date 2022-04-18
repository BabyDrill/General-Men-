ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('wolf:porcodiolaido', function(source, cb)
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

RegisterNetEvent('wolf:daccestisoldi')
AddEventHandler('wolf:daccestisoldi', function(tiposoldi, importo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gruppo = xPlayer.getGroup()

	if gruppo ~= nil then
		if gruppo == 'admin' or gruppo == 'superadmin' then 
			if tiposoldi == 'sporchi' then
				xPlayer.addAccountMoney('black_money', tonumber(importo))
				TriggerClientEvent('esx:showNotification', source, 'Ti sei givvato ' .. importo .. '$ soldi sporchi')
				--TriggerEvent("esx:log", Wolf.Webhook, "Give Soldi Contanti", "\n\n**Giocatore:** " .. GetPlayerName(source) .. "\n\n**Tipo di Soldi:** Sporchi\n\n**Importo:** " .. importo ..  "$\n\n" Wolf.NomeServer, 5897984)
			elseif tiposoldi == 'puliti' then
				xPlayer.addMoney(importo)
				TriggerClientEvent('esx:showNotification', source, 'Ti sei givvato ' .. importo .. '$')
				--TriggerEvent("esx:log", Wolf.Webhook, "Give Soldi Contanti", "\n\n**Giocatore:** " .. GetPlayerName(source) .. "\n\n**Tipo di Soldi:** Puliti\n\n**Importo:** " .. importo ..  "$\n\n" Wolf.NomeServer, 5897984)
			end
		else
			TriggerClientEvent('esx:showNotification', source, 'Non hai il permesso!')
		end
	end
end)

RegisterNetEvent('wolf:riparasfaccimma')
AddEventHandler('wolf:riparasfaccimma', function(tiposoldi, importo)
	local xPlayer = ESX.GetPlayerFromId(source)
	local gruppo = xPlayer.getGroup()

	if gruppo ~= nil then
		if gruppo == 'mod' or gruppo == 'admin' or gruppo == 'superadmin' then 
			--TriggerEvent("esx:log", Wolf.Webhook, "Riparazione Veicolo", "\n\n**Nome Giocatore:** " .. GetPlayerName(source) .. "\n\n" Wolf.NomeServer, 5897984)
		end
	end
end)