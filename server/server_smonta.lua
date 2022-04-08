local ESX = nil
smontando = false

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Smonta arma / munizioni
RegisterServerEvent('wl_smontarmi:smonta')
AddEventHandler('wl_smontarmi:smonta', function(weapon, ammo)
    local weaponConfig = Config.Weapons[weapon]
    local rpc = 36
    local rpcdarkricchionedioporcosucchiacazzi = 60

    if weaponConfig ~= nil and not smontando then
        local xPlayer = ESX.GetPlayerFromId(source)
        local nome = GetPlayerName(source)
        smontando = true

        xPlayer.removeWeapon(weapon, ammo)
        xPlayer.addInventoryItem(weaponConfig.item, 1)
        TriggerEvent("esx:log", Config.Webhook, Config.NomeServer, "Il giocatore **" .. nome .. "** ha smontato** " .. weaponConfig.label .. "**", 25547)	

        if weaponConfig.clip_item ~= nil then
            local munizionismontarmibohciao = weaponConfig.clip_item
            if munizionismontarmibohciao == 'arAmmo' then
                xPlayer.addInventoryItem(weaponConfig.clip_item, math.floor(ammo / rpcdarkricchionedioporcosucchiacazzi))
            elseif munizionismontarmibohciao == 'mgAmmo' then
                xPlayer.addInventoryItem(weaponConfig.clip_item, math.floor(ammo / rpcdarkricchionedioporcosucchiacazzi))
            else
                xPlayer.addInventoryItem(weaponConfig.clip_item, math.floor(ammo / rpc))
            end
        end
       

        smontando = false
    end
end)

RegisterServerEvent('wl_smontarmi:toglirpg')
AddEventHandler('wl_smontarmi:toglirpg', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeWeapon("WEAPON_RPG", 0)
end)

-- Smonta armatura
RegisterServerEvent('wl_smontarmi:smonta_armatura')
AddEventHandler('wl_smontarmi:smonta_armatura', function(armor)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(armor, 1)
end)

RegisterServerEvent('wl:quitta')
AddEventHandler('wl:quitta', function()
    DropPlayer(source, 'Sei uscito dal server!')
end)

--------------------------------------------------------------------------------
-- Registra oggetti armi
--------------------------------------------------------------------------------

Citizen.CreateThread(function()
    -- Armi
    for k, v in pairs(Config.Weapons) do
        ESX.RegisterUsableItem(v.item, function(source)
            local xPlayer = ESX.GetPlayerFromId(source)

            xPlayer.removeInventoryItem(v.item, 1)

            --local rounds = 1
            --if v.rpc ~= nil then rounds = 0 end
            --if k == 'WEAPON_PETROLCAN' then rounds = 250 end

            TriggerClientEvent('wl_smonta:bloccatasti', source)
            TriggerClientEvent('esx:showNotification', source, 'Montando ' .. v.label .. '...')
            TriggerClientEvent('3dme:shareDisplay', -1, 'Montando ' .. v.label, source)
            Citizen.Wait(5000)
            xPlayer.addWeapon(k, 0)
            TriggerClientEvent('esx:showNotification', source, 'Hai montato ~g~' .. v.label)
            TriggerClientEvent('wl_smonta:sbloccatasti', source)
            local nome = GetPlayerName(source)
        
            TriggerEvent("esx:log", Config.Webhook, Config.NomeServer, "Il giocatore **" .. nome .. "** ha montato arma:** " .. v.label .. "**", 25547)	
        end)
       
    end

    
    -- Paracadute (va registrato a parte, NON SMONTABILE)
    ESX.RegisterUsableItem('paracadute', function(source)
        local xPlayer = ESX.GetPlayerFromId(source)

        xPlayer.removeInventoryItem('paracadute', 1)
        xPlayer.addWeapon('GADGET_PARACHUTE', 0)

        TriggerClientEvent('esx:showNotification', source, 'Hai equipaggiato un ~g~Paracadute')
    end)

end)

----------- MUNIZIONI

RegisterServerEvent('smontaarmi:munizionifix')
AddEventHandler('smontaarmi:munizionifix', function(item, numero)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.addInventoryItem(item, numero)
end)

ESX.RegisterUsableItem('pAmmo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('pAmmo', 1)
	TriggerClientEvent('montaammopistola', source, 36, 252)
end)

ESX.RegisterUsableItem('arAmmo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('arAmmo', 1)
	TriggerClientEvent('montaammoassalto', source, 60, 252)
end)

ESX.RegisterUsableItem('cecAmmo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('cecAmmo', 1)
	TriggerClientEvent('montaammocecchino', source, 36, 252)
end)

ESX.RegisterUsableItem('mgAmmo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('mgAmmo', 1)
	TriggerClientEvent('montaammoleggere', source, 60, 252)
end)

ESX.RegisterUsableItem('sgAmmo', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('sgAmmo', 1)
	TriggerClientEvent('montaammopompa', source, 36, 252)
end)

-- SMONTA COMPONENTI

RegisterServerEvent('smontaggio:rimborso')
AddEventHandler('smontaggio:rimborso', function(item)
	local player = source
	local xPlayer = ESX.GetPlayerFromId(player)
	xPlayer.addInventoryItem(item, 1)
end)

---- LOG MOD MENU

RegisterServerEvent('log:modmenu')
AddEventHandler('log:modmenu', function(arma)
    local _source = source
        
    local xPlayer = ESX.GetPlayerFromId(_source)
    local nome = GetPlayerName(source)

    TriggerEvent("esx:log", Config.Webhook, "Log Mod Menu", "**Giocatore:** " .. nome .. "\n**Arma:** RPG\n\n"Config.NomeServer, 56831)	
end)