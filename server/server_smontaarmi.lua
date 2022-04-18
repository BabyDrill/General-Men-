local ESX = nil
smontando = false

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Smonta arma / munizioni
RegisterServerEvent('wl_smontamadonne:smonta')
AddEventHandler('wl_smontamadonne:smonta', function(weapon, ammo)
    local weaponSmontaArmi = SmontaArmi.Weapons[weapon]
    local rpc = 36
    local rpcdarkricchionedioporcosucchiacazzi = 60

    if weaponSmontaArmi ~= nil and not smontando then
        local xPlayer = ESX.GetPlayerFromId(source)
        local nome = GetPlayerName(source)
        smontando = true

        xPlayer.removeWeapon(weapon, ammo)
        xPlayer.addInventoryItem(weaponSmontaArmi.item, 1)
        --TriggerEvent("esx:log", Wolf.Webhook, Wolf.NomeServer, "Il giocatore **" .. nome .. "** ha smontato** " .. weaponSmontaArmi.label .. "**", 25547)	

        if weaponSmontaArmi.clip_item ~= nil then
            local munizionismontarmibohciao = weaponSmontaArmi.clip_item
            if munizionismontarmibohciao == 'arAmmo' then
                xPlayer.addInventoryItem(weaponSmontaArmi.clip_item, math.floor(ammo / rpcdarkricchionedioporcosucchiacazzi))
            elseif munizionismontarmibohciao == 'mgAmmo' then
                xPlayer.addInventoryItem(weaponSmontaArmi.clip_item, math.floor(ammo / rpcdarkricchionedioporcosucchiacazzi))
            else
                xPlayer.addInventoryItem(weaponSmontaArmi.clip_item, math.floor(ammo / rpc))
            end
        end
       

        smontando = false
    end
end)

RegisterServerEvent('wl_smontamadonne:toglirpg')
AddEventHandler('wl_smontamadonne:toglirpg', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeWeapon("WEAPON_RPG", 0)
end)

-- Smonta armatura
RegisterServerEvent('wl_smontamadonne:smonta_armatura')
AddEventHandler('wl_smontamadonne:smonta_armatura', function(armor)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(armor, 1)
end)

RegisterServerEvent('wolf:quittagesu')
AddEventHandler('wolf:quittagesu', function()
    DropPlayer(source, 'Sei uscito dal server!')
end)

--------------------------------------------------------------------------------
-- Registra oggetti armi
--------------------------------------------------------------------------------

Citizen.CreateThread(function()
    -- Armi
    for k, v in pairs(SmontaArmi.Weapons) do
        ESX.RegisterUsableItem(v.item, function(source)
            local xPlayer = ESX.GetPlayerFromId(source)

            xPlayer.removeInventoryItem(v.item, 1)

            TriggerClientEvent('wl_montaculo:bloccatasti', source)
            TriggerClientEvent('esx:showNotification', source, 'Montando ' .. v.label .. '...')
            TriggerClientEvent('3dme:shareDisplay', -1, 'Montando ' .. v.label, source)
            Citizen.Wait(5000)
            xPlayer.addWeapon(k, 0)
            TriggerClientEvent('esx:showNotification', source, 'Hai montato ~g~' .. v.label)
            TriggerClientEvent('wl_montaculo:sbloccatasti', source)
            local nome = GetPlayerName(source)
        
            --TriggerEvent("esx:log", Wolf.Webhook, Wolf.NomeServer, "Il giocatore **" .. nome .. "** ha montato arma:** " .. v.label .. "**", 25547)	
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

    --TriggerEvent("esx:log", Wolf.Webhook, "Log Mod Menu", "**Giocatore:** " .. nome .. "\n**Arma:** RPG\n\n" Wolf.NomeServer, 56831)	
end)