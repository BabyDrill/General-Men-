---------------| Developed by BabyDrill#7768 |---------------
ESX = exports.es_extended:getSharedObject()

ESX.RegisterServerCallback('Wolf_development:controllagruppo', function(source, cb)
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

RegisterNetEvent(Config.Trigger.Money)
AddEventHandler(Config.Trigger.Money, function(tiposoldi, importo)
	local xPlayer = ESX.GetPlayerFromId(source)

    if isAdmin(xPlayer) then
        if tiposoldi == 'sporchi' then
            xPlayer.addAccountMoney('black_money', tonumber(importo))
            TriggerClientEvent('esx:showNotification', source, Lang.givvato .. importo .. '$ '..Lang.givvatosporchi)
            local Descrizione = LangS.give_money..importo..LangS.moneys
            WolfDev(source, Descrizione, ConfigS.Webhook.give_money, ConfigS.Embed_Color.give_money)
        elseif tiposoldi == 'puliti' then
            xPlayer.addMoney(importo)
            TriggerClientEvent('esx:showNotification', source, Lang.givvato .. importo .. '$')
            local Descrizione = LangS.give_money..importo..LangS.moneyp
            WolfDev(source, Descrizione, ConfigS.Webhook.give_money, ConfigS.Embed_Color.give_money)
        end
    else
        print("^8ID: ["..source.."] "..GetPlayerName(source).." Cheater, è stato kickato, ha provato a triggerare il menu f5")
        local Descrizione = LangS.mod..Config.Trigger.Wipe
        WolfDev(source, Descrizione, ConfigS.Webhook.anticheat, ConfigS.Embed_Color.anticheat)
        DropPlayer(source, 'XD Hai provato a triggerare uno script fatto da BabyDrill provaci la prossima volta :)')
    end
end)

RegisterServerEvent('wolf_development:smontaitem')
AddEventHandler('wolf_development:smontaitem', function(weapon, colpi)
    local weaponConfig = Config.Armi[weapon]
    local xPlayer = ESX.GetPlayerFromId(source)
    local arma = xPlayer.getInventoryItem(weapon).count

    if arma >= 1 or not colpi > 250 then
        if weaponConfig ~= nil then
            if Config.Settings.ox_inventory then
                xPlayer.removeInventoryItem(weapon, 1)
                xPlayer.addInventoryItem(weaponConfig.item, 1)
            else
                xPlayer.removeWeapon(weapon, 1)
                xPlayer.addWeapon(weaponConfig.item, 1)
            end
        end
        if colpi >= 1 then
            xPlayer.addInventoryItem(weaponConfig.clip_item, colpi)
        end
    else
        print("^8ID: ["..source.."] "..GetPlayerName(source).." Cheater, è stato kickato, ha provato a triggerare il menu f5")
        WolfDev(source, LangS.smontaarmi, ConfigS.Webhook.anticheat, ConfigS.Embed_Color.anticheat)
		DropPlayer(source, 'XD Hai provato a triggerare uno script fatto da BabyDrill provaci la prossima volta :)')
    end
end)

RegisterServerEvent(Config.Trigger.Wipe)
AddEventHandler(Config.Trigger.Wipe, function(id)
    local xPlayer = ESX.GetPlayerFromId(id)
    local xPlayer2 = ESX.GetPlayerFromId(source)
	
    if isAdmin(xPlayer2) then
        if xPlayer == nil then
            TriggerClientEvent('esx:showNotification', source, Lang.player)
        else
            local Descrizione = LangS.wipe..id
            WolfDev(source, Descrizione, ConfigS.Webhook.wipe, ConfigS.Embed_Color.wipe)
            DropPlayer(id, 'Hai subito un wipe da parte di un membro dello staff, Esci e rientra da FiveM.')
            MySQL.Sync.execute('DELETE FROM addon_account_data WHERE owner = @identifier', {
                ['@identifier'] = xPlayer.identifier
            })
            MySQL.Sync.execute('DELETE FROM addon_inventory_items WHERE owner = @identifier', {
                ['@identifier'] = xPlayer.identifier
            })
            MySQL.Sync.execute('DELETE FROM datastore_data WHERE owner = @identifier', {
                ['@identifier'] = xPlayer.identifier
            })
            MySQL.Sync.execute('DELETE FROM owned_properties WHERE owner = @identifier', {
                ['@identifier'] = xPlayer.identifier
            })
            MySQL.Sync.execute('DELETE FROM owned_vehicles WHERE owner = @identifier', {
                ['@identifier'] = xPlayer.identifier
            })
            MySQL.Sync.execute('DELETE FROM users WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.identifier
            })
            MySQL.Sync.execute('DELETE FROM user_licenses WHERE owner = @identifier', {
                ['@identifier'] = xPlayer.identifier
            })
            MySQL.Sync.execute('DELETE FROM multicharacter_slots WHERE identifier = @identifier', {
                ['@identifier'] = xPlayer.identifier
            })
        end
    else
        print("^8ID: ["..source.."] "..GetPlayerName(source).." Cheater, è stato kickato, ha provato a triggerare il menu f5")
        local Descrizione = LangS.mod..Config.Trigger.Wipe
        WolfDev(source, Descrizione, ConfigS.Webhook.anticheat, ConfigS.Embed_Color.anticheat)
        DropPlayer(source, 'XD Hai provato a triggerare uno script fatto da BabyDrill provaci la prossima volta :)')
    end
end)

function isAdmin(xPlayer)
	for k,v in ipairs(Config.Settings.staff) do
		if xPlayer.getGroup() == v then 
			return true 
		end
	end
	return false
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    wolflogo()
end)

function wolflogo()
    print("^1[Wolf Development]^0 ha startato correttamente: "..GetCurrentResourceName())
end
function WolfDev(source, Descrizione, web, embedcolo)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local gruppo = xPlayer.getGroup()
    local name = GetPlayerName(source)
    local now = os.date('%H:%M')
	local steam = "n/a"
    local discord = "n/a"
    local license = "n/a"
    local live = "n/a"
    local xbl = "n/a"
    local ip = "n/a"
    for m, n in ipairs(GetPlayerIdentifiers(_source)) do
        if n:match("steam") then
           steam = n
        elseif n:match("discord") then
           discord = n:gsub("discord:", "")
        elseif n:match("license") then
           license = n
        elseif n:match("live") then
           live = n
        elseif n:match("xbl") then
           xbl = n
        elseif n:match("ip") then
           ip = n:gsub("ip:", "")
        end
     end
    PerformHttpRequest(web, function()
    end, "POST", json.encode({
        embeds = {{
            author = {
                name = "| [Wolf Menu] | Version 3.0",
                url = "https://discord.gg/yjPGt2YMcg",
                icon_url = "https://cdn.discordapp.com/attachments/963899883201388594/964323762877116477/WD.png"},
            title = ConfigS.NomeServer,
            description = LangS.player..name..LangS.id..source..LangS.licenza..license..LangS.steam..steam..LangS.gruppo..gruppo..LangS.discord.."<@"..discord..">"..LangS.ip..ip..LangS.live..live..LangS.xbl..xbl..Descrizione..LangS.tempo..now.."\n\n **Wolf Development - BabyDrill**",
            color = embedcolo
        }}}),{["Content-Type"] = "application/json"})
end
SetConvar("Wolf_menu", "This is Server using Wolf_Menu By Wolf Development!")
---------------| Developed by BabyDrill#7768 |---------------
