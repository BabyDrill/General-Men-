local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local ESX = nil
smontando = false

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('wl_smontarmi:aprismontacomponenti')
AddEventHandler('wl_smontarmi:aprismontacomponenti', function()
    ApriMenuSmontaComponenti()
end)

function ApriMenuSmontaComponenti()
    -- lista armi per il menu
    local elements = {}

    for k, v in pairs(Config.Weapons) do
        if HasPedGotWeapon(PlayerPedId(), GetHashKey(k), false) then
            table.insert(elements, {label = 'Smonta ' .. v.label, value = k})
        end
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'id_card_menu', {
        title = 'Smonta Componenti',
        posizione = 'destra-basso-f5',
        elements = elements
    }, function(data, menu)
        menu.close()

        local playerPed = PlayerPedId()

        if data.current.value == 'SmallArmor' then
        else
            
            if data.current.value == 'WEAPON_PISTOL' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_PISTOL_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP_02')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_PISTOL_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_PISTOL_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('component_at_pi_supp_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_PISTOL_MK2' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey('COMPONENT_AT_PI_FLSH_02')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey('COMPONENT_AT_PI_RAIL')) then
                    table.insert(elements, {label = 'Smonta Mirino', value = 'mirino'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey('COMPONENT_AT_PI_FLSH_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey('COMPONENT_AT_PI_FLSH_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'mirino' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey('COMPONENT_AT_PI_RAIL')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey('COMPONENT_AT_PI_RAIL'))
                            TriggerServerEvent('smontaggio:rimborso', 'mirino')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_VINTAGEPISTOL' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_COMBATPISTOL' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorcia'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorcia' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_PISTOL50' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_PISTOL50_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_AT_PI_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_PISTOL50_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_PISTOL50_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PISTOL50"), GetHashKey('COMPONENT_AT_AR_SUPP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_APPISTOL' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_APPISTOL_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_APPISTOL_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_APPISTOL_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_SNSPISTOL' then
                local elements = {
                    {label = 'Smonta Skin', value = 'skinarmi'},
                    {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'},
                }

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey('COMPONENT_SNSPISTOL_VARMOD_LOWRIDER')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey('COMPONENT_SNSPISTOL_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()if data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey('COMPONENT_SNSPISTOL_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey('COMPONENT_SNSPISTOL_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey('COMPONENT_SNSPISTOL_VARMOD_LOWRIDER')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey('COMPONENT_SNSPISTOL_VARMOD_LOWRIDER'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_HEAVYPISTOL' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_AT_PI_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey('COMPONENT_AT_PI_SUPP'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_MICROSMG' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_MICROSMG_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_AT_PI_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_AT_PI_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_MICROSMG_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_MICROSMG_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_MICROSMG"), GetHashKey('COMPONENT_AT_AR_SUPP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_SMG' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_SMG_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_SMG_VARMOD_LUXE')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_AT_AR_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_SMG_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_SMG_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_SMG_VARMOD_LUXE')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_SMG_VARMOD_LUXE'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_SMG"), GetHashKey('COMPONENT_AT_PI_SUPP'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_ASSAULTSMG' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_AT_AR_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_AT_AR_SUPP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_COMBATPDW' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey('COMPONENT_COMBATPDW_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_COMBATPDW"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPDW"), GetHashKey('COMPONENT_AT_AR_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_COMBATPDW"), GetHashKey('COMPONENT_COMBATPDW_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_COMBATPDW"), GetHashKey('COMPONENT_COMBATPDW_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_PUMPSHOTGUN' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey('COMPONENT_AT_AR_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_ASSAULTRIFLE' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_SCOPE_MACRO')) then
                    table.insert(elements, {label = 'Smonta Mirino', value = 'mirino'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
                    table.insert(elements, {label = 'Smonta Impugnatura', value = 'impugnaturaarma'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_SMG_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_SMG_VARMOD_LUXE')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        elseif data2.current.value == 'impugnaturaarma' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_AR_AFGRIP'))
                            TriggerServerEvent('smontaggio:rimborso', 'impugnaturaarma')
                        elseif data2.current.value == 'mirino' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_PI_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey('COMPONENT_AT_SCOPE_MACRO'))
                            TriggerServerEvent('smontaggio:rimborso', 'mirino')
                        end
                    end, function(data2, menu2) menu2.close() end) 
            elseif data.current.value == 'WEAPON_CARBINERIFLE' then
                local elements = {}

                
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')) then
                    table.insert(elements, {label = 'Smonta Mirino', value = 'mirino'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
                    table.insert(elements, {label = 'Smonta Impugnatura', value = 'impugnatura'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        elseif data2.current.value == 'mirino' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'))
                            TriggerServerEvent('smontaggio:rimborso', 'mirino')
                        elseif data2.current.value == 'impugnatura' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey('COMPONENT_AT_AR_AFGRIP'))
                            TriggerServerEvent('smontaggio:rimborso', 'impugnatura')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_COMPACTRIFLE' then
                local elements = {}

                
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_ADVANCEDRIFLE' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_SPECIALCARBINE' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER')) then
                    table.insert(elements, {label = 'Smonta Skin', value = 'skinarmi'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_AT_AR_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'skinarmi' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER'))
                            TriggerServerEvent('smontaggio:rimborso', 'skin')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey('COMPONENT_AT_AR_SUPP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            elseif data.current.value == 'WEAPON_BULLPUPRIFLE' then
                local elements = {}

                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                    table.insert(elements, {label = 'Smonta Torcia', value = 'smontatorica'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_02')) then
                    table.insert(elements, {label = 'Smonta Caricatore Esteso', value = 'smontacaricatoreesteso'})
                end
                if HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP')) then
                    table.insert(elements, {label = 'Smonta Silenziatore', value = 'silenziatore'})
                end

                ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smoff', {
                    title = 'Smonta Componenti',
                    posizione = 'destra-basso-f5',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                        if data2.current.value == 'smontatorica' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey('COMPONENT_AT_AR_FLSH'))
                            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        elseif data2.current.value == 'smontacaricatoreesteso' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_02')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_02'))
                            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        elseif data2.current.value == 'silenziatore' and HasPedGotWeaponComponent(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP')) then
                            RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey('COMPONENT_AT_AR_SUPP'))
                            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        end
                    end, function(data2, menu2) menu2.close() end)
            end
        end

    end, function(data, menu) menu.close() end)
end

function ApriMenuSmontaArmiSubMenu()
    -- lista armi per il menu
    local elements = {}

    for k, v in pairs(Config.Weapons) do
        if HasPedGotWeapon(PlayerPedId(), GetHashKey(k), false) then
            table.insert(elements, {label = 'Smonta ' .. v.label, value = k})
        end
    end

    -- Gestione armature
    --[[if (GetPedArmour(GetPlayerPed(-1)) <= 25 and GetPedArmour(GetPlayerPed(-1)) >
        0) then
        table.insert(elements, {label = 'Smonta Armatura Leggera', value = 'SmallArmor'})
    end

    if (GetPedArmour(GetPlayerPed(-1)) <= 50 and GetPedArmour(GetPlayerPed(-1)) >
        25) then
        table.insert(elements, {label = 'Smonta Armatura Media', value = 'MedArmor'})
    end

    if (GetPedArmour(GetPlayerPed(-1)) <= 75 and GetPedArmour(GetPlayerPed(-1)) >
        50) then
        table.insert(elements, { label = 'Smonta Armatura Pesante', value = 'HeavyArmor' })
    end--]]

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'id_card_menu', {
        title = 'Smonta Armi',
        posizione = 'destra-basso-f5',
        elements = elements
    }, function(data, menu)
        menu.close()

        local playerPed = PlayerPedId()

        if data.current.value == 'SmallArmor' or data.current.value == 'MedArmor' or data.current.value == 'HeavyArmor' then
            -- Smonta armatura
            SetPedArmour(GetPlayerPed(-1), 0)
            TriggerServerEvent('wl_smontarmi:smonta_armatura', data.current.value)
        else
            -- Smonta arma
            menu.close()
            ESX.UI.Menu.CloseAll()
            smontando = true
            disabilitatasti = true
            local rounds = GetAmmoInPedWeapon(playerPed, GetHashKey(data.current.value))
            exports['progressBars']:avviaProg(7000, "Smontando Arma...")
            --ESX.ShowNotification('Smontando ' .. data.item.label .. '')

                if data.current.value == 'WEAPON_PISTOL' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Pistola')
                elseif data.current.value == 'WEAPON_VINTAGEPISTOL' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Pistola Vintage')
                elseif data.current.value == 'WEAPON_PISTOL_MK2' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Pistola MK2')
                elseif data.current.value == 'WEAPON_COMBATPISTOL' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Pistola da Combattimento')
                elseif data.current.value == 'WEAPON_PISTOL50' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Pistola Cal. 50')
                elseif data.current.value == 'WEAPON_APPISTOL' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Pistola AP')
                elseif data.current.value == 'WEAPON_STUNGUN' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Storditore')
                elseif data.current.value == 'WEAPON_SNSPISTOL' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Pistola SNS')
                elseif data.current.value == 'WEAPON_HEAVYPISTOL' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Pistola Pesante')
                elseif data.current.value == 'WEAPON_REVOLVER' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Revolver')
                elseif data.current.value == 'WEAPON_DOUBLEACTION' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Revolver a Doppia Azione')
                elseif data.current.value == 'WEAPON_MICROSMG' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Micro SMG')
                elseif data.current.value == 'WEAPON_SMG' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando SMG')
                elseif data.current.value == 'WEAPON_ASSAULTSMG' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando P90')
                elseif data.current.value == 'WEAPON_COMBATPDW' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando PDW da Combattimento')
                elseif data.current.value == 'WEAPON_MACHINEPISTOL' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Machine Pistol')
                elseif data.current.value == 'WEAPON_MINISMG' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Mini SMG')
                elseif data.current.value == 'WEAPON_PUMPSHOTGUN' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Fucile a Pompa')
                elseif data.current.value == 'WEAPON_SAWNOFFSHOTGUN' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Sawn Off')
                elseif data.current.value == 'WEAPON_DBSHOTGUN' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Fucile a Canne Mozze')
                elseif data.current.value == 'WEAPON_ASSAULTRIFLE' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando AK-47')
                elseif data.current.value == 'WEAPON_CARBINERIFLE' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Carabina')
                elseif data.current.value == 'WEAPON_CARBINERIFLE_MK2' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Carabina MK2')
                elseif data.current.value == 'WEAPON_ADVANCEDRIFLE' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Fucile Avanzato')
                elseif data.current.value == 'WEAPON_SPECIALCARBINE' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Scar-H')
                elseif data.current.value == 'WEAPON_BULLPUPRIFLE' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Famas')
                elseif data.current.value == 'WEAPON_COMPACTRIFLE' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Fucile Compatto')
                elseif data.current.value == 'WEAPON_GUSENBERG' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Thompson')
                elseif data.current.value == 'WEAPON_SNIPERRIFLE' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Fucile da Cecchino')
                elseif data.current.value == 'WEAPON_MARKSMANRIFLE' then
                    TriggerServerEvent('tdme:displaytext', 'Smontando Fucile da Cecchino Pesante')
                end

            Citizen.Wait(7000)
            
            if data.current.value == 'WEAPON_PISTOL' then
                if HasPedGotWeapon(PlayerPedId(), 0x1B06D571, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_AT_PI_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_AT_PI_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x1B06D571, GetHashKey('component_at_pi_supp_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x1B06D571, GetHashKey('component_at_pi_supp_02'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE')) then
                        TriggerServerEvent('smontaggio:rimborso', 'skin')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_PISTOL_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_PISTOL_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_PISTOL_MK2' then
                if HasPedGotWeapon(PlayerPedId(), 0xBFE256D4, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_AT_PI_FLSH_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_AT_PI_FLSH_02'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_AT_PI_RAIL')) then
                        TriggerServerEvent('smontaggio:rimborso', 'mirino')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_AT_PI_RAIL'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_COMBATPISTOL' then
                if HasPedGotWeapon(PlayerPedId(), 0x5EF9FEC4, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_AT_PI_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_AT_PI_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_AT_PI_SUPP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_AT_PI_SUPP'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02'))
                    end
                end 
            elseif data.current.value == 'WEAPON_PISTOL50' then
                if HasPedGotWeapon(PlayerPedId(), 0x99AEEB3B, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_AT_PI_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_AT_PI_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE')) then
                        TriggerServerEvent('smontaggio:rimborso', 'skin')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_PISTOL50_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_PISTOL50_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_VINTAGEPISTOL' then
                if HasPedGotWeapon(PlayerPedId(), 0x83839C4, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x83839C4, GetHashKey('COMPONENT_AT_PI_SUPP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x83839C4, GetHashKey('COMPONENT_AT_PI_SUPP'))
                    end
                end
            elseif data.current.value == 'WEAPON_APPISTOL' then
                if HasPedGotWeapon(PlayerPedId(), 0x22D8FE39, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_AT_PI_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_AT_PI_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_AT_PI_SUPP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_AT_PI_SUPP'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE')) then
                        TriggerServerEvent('smontaggio:rimborso', 'skin')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_APPISTOL_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_APPISTOL_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_SNSPISTOL' then
                if HasPedGotWeapon(PlayerPedId(), 0xBFD21232, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFD21232, GetHashKey('COMPONENT_SNSPISTOL_VARMOD_LOWRIDER')) then
                        TriggerServerEvent('smontaggio:rimborso', 'skin')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFD21232, GetHashKey('COMPONENT_SNSPISTOL_VARMOD_LOWRIDER'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFD21232, GetHashKey('COMPONENT_SNSPISTOL_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFD21232, GetHashKey('COMPONENT_SNSPISTOL_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_HEAVYPISTOL' then
                if HasPedGotWeapon(PlayerPedId(), 0xD205520E, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_AT_PI_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_AT_PI_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_AT_PI_SUPP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_AT_PI_SUPP'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE')) then
                        TriggerServerEvent('smontaggio:rimborso', 'skin')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_MICROSMG' then
                if HasPedGotWeapon(PlayerPedId(), 0x13532244, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_AT_PI_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_AT_PI_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE')) then
                        TriggerServerEvent('smontaggio:rimborso', 'skin')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_MICROSMG_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_MICROSMG_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_SMG' then
                if HasPedGotWeapon(PlayerPedId(), 0x2BE6766B, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_AT_AR_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_AT_AR_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_AT_PI_SUPP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_AT_PI_SUPP'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_SMG_VARMOD_LUXE')) then
                        TriggerServerEvent('smontaggio:rimborso', 'skin')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_SMG_VARMOD_LUXE'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_SMG_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_SMG_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_ASSAULTSMG' then
                if HasPedGotWeapon(PlayerPedId(), 0xEFE7E2DF, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_AT_AR_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_AT_AR_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_COMBATPDW' then
                if HasPedGotWeapon(PlayerPedId(), 0x0A3D4D34, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x0A3D4D34, GetHashKey('COMPONENT_AT_AR_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x0A3D4D34, GetHashKey('COMPONENT_AT_AR_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x0A3D4D34, GetHashKey('COMPONENT_COMBATPDW_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x0A3D4D34, GetHashKey('COMPONENT_COMBATPDW_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_PUMPSHOTGUN' then
                if HasPedGotWeapon(PlayerPedId(), 0x1D073A89, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x1D073A89, GetHashKey('COMPONENT_AT_AR_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x1D073A89, GetHashKey('COMPONENT_AT_AR_FLSH'))
                    end
                end
            elseif data.current.value == 'WEAPON_ASSAULTRIFLE' then
                if HasPedGotWeapon(PlayerPedId(), 0xBFEFFF6D, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'impugnatura')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_AFGRIP'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE')) then
                        TriggerServerEvent('smontaggio:rimborso', 'skin')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')) then
                        TriggerServerEvent('smontaggio:rimborso', 'mirino')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_CARBINERIFLE' then
                if HasPedGotWeapon(PlayerPedId(), 0x83BF0278, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_SUPP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_SUPP'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'impugnatura')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_AFGRIP'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE')) then
                        TriggerServerEvent('smontaggio:rimborso', 'skin')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')) then
                        TriggerServerEvent('smontaggio:rimborso', 'mirino')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'))
                    end
                end
            elseif data.current.value == 'WEAPON_COMPACTRIFLE' then
                if HasPedGotWeapon(PlayerPedId(), 0x624FE830, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x624FE830, GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x624FE830, GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_ADVANCEDRIFLE' then
                if HasPedGotWeapon(PlayerPedId(), 0xAF113F99, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_AT_AR_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_AT_AR_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_AT_AR_SUPP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_AT_AR_SUPP'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE')) then
                        TriggerServerEvent('smontaggio:rimborso', 'skin')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_SPECIALCARBINE' then
                if HasPedGotWeapon(PlayerPedId(), 0xC0A3098D, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'impugnatura')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_AFGRIP'))
                    end 
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')) then
                        TriggerServerEvent('smontaggio:rimborso', 'mirino')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_02'))
                    end
                end
            elseif data.current.value == 'WEAPON_BULLPUPRIFLE' then
                if HasPedGotWeapon(PlayerPedId(), 0x7F229F94, false) then
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_FLSH')) then
                        TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_FLSH'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_SUPP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_SUPP'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
                        TriggerServerEvent('smontaggio:rimborso', 'impugnatura')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_AFGRIP'))
                    end
                    if HasPedGotWeaponComponent(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_02')) then
                        TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
                        RemoveWeaponComponentFromPed(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_02'))
                    end
                end
            end
            
            if HasPedGotWeapon(PlayerPedId(), GetHashKey(data.current.value), false) and smontando then
                TriggerServerEvent('wl_smontarmi:smonta', data.current.value, rounds)
            else
                ESX.ShowNotification('L\'arma che stavi smontando non è più nel tuo inventario, per cui non riceverai l\'item!')
            end
            
            Citizen.Wait(500)
            smontando = false
            disabilitatasti = false
        end

    end, function(data, menu) menu.close() end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if disabilitatasti then
            DisableControlAction(1, Keys['F2'], true) 
            DisableControlAction(1, Keys['F3'], true) 
            DisableControlAction(1, Keys['TAB'], true) 
            DisableControlAction(1, Keys['L'], true) 
            DisableControlAction(1, Keys['E'], true) 
		end
	end
end)

--------------------------------------------------------------------------------
-- EVENTI BELLI
--------------------------------------------------------------------------------

-- Smonta tutte le armi
RegisterNetEvent('wl_smontarmi:disarm')
AddEventHandler('wl_smontarmi:disarm', function()
    local playerPed = PlayerPedId()

    for k, v in pairs(Config.Weapons) do
        local weaponHash = GetHashKey(k)
        if HasPedGotWeapon(playerPed, weaponHash, false) then
            local rounds = GetAmmoInPedWeapon(playerPed, weaponHash)
            TriggerServerEvent('wl_smontarmi:smonta', k, rounds)
            RemoveWeaponFromPed(playerPed, weaponHash)
        end
    end

end)

--------------------------------------------------------------------------------
-- REGISTER NET EVENT PER SMONTARE LE ARMI
--------------------------------------------------------------------------------

RegisterNetEvent('montaammopistola')
AddEventHandler('montaammopistola', function(munizioni, maxy)

	local playerPed  = PlayerPedId()
    local weaponHash = GetSelectedPedWeapon(playerPed)
    local pedAmmo = GetAmmoInPedWeapon(playerPed, weaponHash) 

	local somma = math.floor(pedAmmo + munizioni)
    
    if weaponHash == GetHashKey("WEAPON_PISTOL") or weaponHash == GetHashKey("WEAPON_PISTOL") or weaponHash == GetHashKey("WEAPON_PISTOL50") or weaponHash == GetHashKey("WEAPON_COMBATPISTOL") or weaponHash == GetHashKey("WEAPON_APPISTOL") or weaponHash == GetHashKey("WEAPON_SNSPISTOL") or weaponHash == GetHashKey("WEAPON_HEAVYPISTOL") or weaponHash == GetHashKey("WEAPON_REVOLVER") or weaponHash == GetHashKey("WEAPON_DOUBLEACTION") or weaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") or weaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
    
        if (HasPedGotWeapon(PlayerPedId(), 0x1B06D571, false) and GetCurrentPedWeapon(PlayerPedId(), 0x1B06D571)) --[[PISTOLA]]
        or (HasPedGotWeapon(PlayerPedId(), 0x99AEEB3B, false) and GetCurrentPedWeapon(PlayerPedId(), 0x99AEEB3B)) --[[PISTOLA CAL.50]]
        or (HasPedGotWeapon(PlayerPedId(), 0x5EF9FEC4, false) and GetCurrentPedWeapon(PlayerPedId(), 0x5EF9FEC4)) --[[PISTOLA DA COMBATT]]
        or (HasPedGotWeapon(PlayerPedId(), 0x22D8FE39, false) and GetCurrentPedWeapon(PlayerPedId(), 0x22D8FE39)) --[[PISTOLA AP]]
        or (HasPedGotWeapon(PlayerPedId(), 0xBFD21232, false) and GetCurrentPedWeapon(PlayerPedId(), 0xBFD21232)) --[[SNS PISTOL]]
        or (HasPedGotWeapon(PlayerPedId(), 0xD205520E, false) and GetCurrentPedWeapon(PlayerPedId(), 0xD205520E)) --[[HEAVY PISTOL]]
        or (HasPedGotWeapon(PlayerPedId(), 0xC1B3C3D1, false) and GetCurrentPedWeapon(PlayerPedId(), 0xC1B3C3D1)) --[[REVOLVER]]
        or (HasPedGotWeapon(PlayerPedId(), 0x97EA20B8, false) and GetCurrentPedWeapon(PlayerPedId(), 0x97EA20B8)) --[[ROPPIA AZIONE]]
        or (HasPedGotWeapon(PlayerPedId(), 0x83839C4, false) and GetCurrentPedWeapon(PlayerPedId(), 0x83839C4)) --[[PISTOLA VINTAGE]]
        or (HasPedGotWeapon(PlayerPedId(), 0xBFE256D4, false) and GetCurrentPedWeapon(PlayerPedId(), 0xBFE256D4)) --[[PISTOLA MK2]]		then 
            if somma <= 252 then
                if weaponHash == GetHashKey("WEAPON_PISTOL") then
                SetPedAmmo(playerPed, 0x1B06D571, somma)
                elseif weaponHash == GetHashKey("WEAPON_PISTOL50") then
                SetPedAmmo(playerPed, 0x99AEEB3B, somma)
                elseif weaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
                SetPedAmmo(playerPed, 0x5EF9FEC4, somma)
                elseif weaponHash == GetHashKey("WEAPON_APPISTOL") then
                SetPedAmmo(playerPed, 0x22D8FE39, somma)
                elseif weaponHash == GetHashKey("WEAPON_SNSPISTOL") then
                SetPedAmmo(playerPed, 0xBFD21232, somma)
                elseif weaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
                SetPedAmmo(playerPed, 0xD205520E, somma)
                elseif weaponHash == GetHashKey("WEAPON_REVOLVER") then
                SetPedAmmo(playerPed, 0xC1B3C3D1, somma)
                elseif weaponHash == GetHashKey("WEAPON_DOUBLEACTION") then
                SetPedAmmo(playerPed, 0x97EA20B8, somma)
				elseif weaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
                SetPedAmmo(playerPed, 0x83839C4, somma)
                elseif weaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
                SetPedAmmo(playerPed, 0xBFE256D4, somma)
                end
            else
                local differenza = math.floor(somma - maxy) 
                if weaponHash == GetHashKey("WEAPON_PISTOL") then
                SetPedAmmo(playerPed, 0x1B06D571, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_PISTOL50") then
                SetPedAmmo(playerPed, 0x99AEEB3B, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
                SetPedAmmo(playerPed, 0x5EF9FEC4, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_APPISTOL") then
                SetPedAmmo(playerPed, 0x22D8FE39, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)                
                elseif weaponHash == GetHashKey("WEAPON_SNSPISTOL") then
                SetPedAmmo(playerPed, 0xBFD21232, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
                SetPedAmmo(playerPed, 0xD205520E, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_REVOLVER") then
                SetPedAmmo(playerPed, 0xC1B3C3D1, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_DOUBLEACTION") then
                SetPedAmmo(playerPed, 0x97EA20B8, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
				elseif weaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
                SetPedAmmo(playerPed, 0x83839C4, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
                SetPedAmmo(playerPed, 0xBFE256D4, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
                end
            end
        else
            ESX.ShowNotification('Devi avere una pistola in mano per poterla ricaricare!')
            TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
        end
    else
        ESX.ShowNotification('Queste munizioni non sono adatte a quest\'arma')
        TriggerServerEvent('smontaarmi:munizionifix', 'pAmmo', 1)
    end
	
end)

RegisterNetEvent('montaammoleggere')
AddEventHandler('montaammoleggere', function(munizioni, maxy)

	local playerPed  = PlayerPedId()
    local weaponHash = GetSelectedPedWeapon(playerPed)
    local pedAmmo = GetAmmoInPedWeapon(playerPed, weaponHash) 

	local somma = math.floor(pedAmmo + munizioni)
    
    if weaponHash == GetHashKey("WEAPON_MICROSMG") or weaponHash == GetHashKey("WEAPON_SMG") or weaponHash == GetHashKey("WEAPON_ASSAULTSMG") or weaponHash == GetHashKey("WEAPON_COMBATPDW") or weaponHash == GetHashKey("WEAPON_MACHINEPISTOL") or weaponHash == GetHashKey("WEAPON_MINISMG") then
    
        if (HasPedGotWeapon(PlayerPedId(), 0x13532244, false) and GetCurrentPedWeapon(PlayerPedId(), 0x13532244)) --[[MICRO SMG]]
        or (HasPedGotWeapon(PlayerPedId(), 0x2BE6766B, false) and GetCurrentPedWeapon(PlayerPedId(), 0x2BE6766B)) --[[SMG]]
        or (HasPedGotWeapon(PlayerPedId(), 0xEFE7E2DF, false) and GetCurrentPedWeapon(PlayerPedId(), 0xEFE7E2DF)) --[[SMG DI ASSALTO]]
        or (HasPedGotWeapon(PlayerPedId(), 0x0A3D4D34, false) and GetCurrentPedWeapon(PlayerPedId(), 0x0A3D4D34)) --[[PDW DA COMBATTIMENTO]]
        or (HasPedGotWeapon(PlayerPedId(), 0xDB1AA450, false) and GetCurrentPedWeapon(PlayerPedId(), 0xDB1AA450)) --[[MACHINE PISTOL]]
        or (HasPedGotWeapon(PlayerPedId(), 0xBD248B55, false) and GetCurrentPedWeapon(PlayerPedId(), 0xBD248B55)) --[[MINI SMG]] then 
            if somma <= 252 then
                if weaponHash == GetHashKey("WEAPON_MICROSMG") then
                SetPedAmmo(playerPed, 0x13532244, somma)
                elseif weaponHash == GetHashKey("WEAPON_SMG") then
                SetPedAmmo(playerPed, 0x2BE6766B, somma)
                elseif weaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
                SetPedAmmo(playerPed, 0xEFE7E2DF, somma)
                elseif weaponHash == GetHashKey("WEAPON_COMBATPDW") then
                SetPedAmmo(playerPed, 0x0A3D4D34, somma)
                elseif weaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
                SetPedAmmo(playerPed, 0xDB1AA450, somma)
                elseif weaponHash == GetHashKey("WEAPON_MINISMG") then
                SetPedAmmo(playerPed, 0xBD248B55, somma)
                end
            else
                local differenza = math.floor(somma - maxy) 
                if weaponHash == GetHashKey("WEAPON_MICROSMG") then
                SetPedAmmo(playerPed, 0x13532244, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'mgAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_SMG") then
                SetPedAmmo(playerPed, 0x2BE6766B, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'mgAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
                SetPedAmmo(playerPed, 0xEFE7E2DF, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'mgAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_COMBATPDW") then
                SetPedAmmo(playerPed, 0x0A3D4D34, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'mgAmmo', 1)                
                elseif weaponHash == GetHashKey("WEAPON_MACHINEPISTOL") then
                SetPedAmmo(playerPed, 0xDB1AA450, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'mgAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_MINISMG") then
                SetPedAmmo(playerPed, 0xBD248B55, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'mgAmmo', 1)
                end
            end
        else
            ESX.ShowNotification('Devi avere un\'arma automatica leggera in mano per poterla ricaricare!')
            TriggerServerEvent('smontaarmi:munizionifix', 'mgAmmo', 1)
        end
    else
        ESX.ShowNotification('Queste munizioni non sono adatte a quest\'arma')
        TriggerServerEvent('smontaarmi:munizionifix', 'mgAmmo', 1)
    end
	
end)

RegisterNetEvent('montaammopompa')
AddEventHandler('montaammopompa', function(munizioni, maxy)

	local playerPed  = PlayerPedId()
    local weaponHash = GetSelectedPedWeapon(playerPed)
    local pedAmmo = GetAmmoInPedWeapon(playerPed, weaponHash) 

	local somma = math.floor(pedAmmo + munizioni)
    
    if weaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") or weaponHash == GetHashKey("WEAPON_SAWNOFFSHOTGUN") or weaponHash == GetHashKey("WEAPON_DBSHOTGUN") then
    
        if (HasPedGotWeapon(PlayerPedId(), 0x1D073A89, false) and GetCurrentPedWeapon(PlayerPedId(), 0x1D073A89)) --[[FUCILE A POMPA]]
        or (HasPedGotWeapon(PlayerPedId(), 0x7846A318, false) and GetCurrentPedWeapon(PlayerPedId(), 0x7846A318)) --[[SAWN OFF]]
        or (HasPedGotWeapon(PlayerPedId(), 0xEF951FBB, false) and GetCurrentPedWeapon(PlayerPedId(), 0xEF951FBB)) --[[FUCILE A CANNE MOZZE]] then 
            if somma <= 252 then
                if weaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
                SetPedAmmo(playerPed, 0x1D073A89, somma)
                elseif weaponHash == GetHashKey("WEAPON_SAWNOFFSHOTGUN") then
                SetPedAmmo(playerPed, 0x7846A318, somma)
                elseif weaponHash == GetHashKey("WEAPON_DBSHOTGUN") then
                SetPedAmmo(playerPed, 0xEF951FBB, somma)
                end
            else
                local differenza = math.floor(somma - maxy) 
                if weaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
                SetPedAmmo(playerPed, 0x1D073A89, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'sgAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_SAWNOFFSHOTGUN") then
                SetPedAmmo(playerPed, 0x7846A318, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'sgAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_DBSHOTGUN") then
                SetPedAmmo(playerPed, 0xEF951FBB, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'sgAmmo', 1)
                end
            end
        else
            ESX.ShowNotification('Devi avere un fucile a pompa in mano per poterla ricaricare!')
            TriggerServerEvent('smontaarmi:munizionifix', 'sgAmmo', 1)
        end
    else
        ESX.ShowNotification('Queste munizioni non sono adatte a quest\'arma')
        TriggerServerEvent('smontaarmi:munizionifix', 'sgAmmo', 1)
    end
	
end)

RegisterNetEvent('montaammoassalto')
AddEventHandler('montaammoassalto', function(munizioni, maxy)

	local playerPed  = PlayerPedId()
    local weaponHash = GetSelectedPedWeapon(playerPed)
    local pedAmmo = GetAmmoInPedWeapon(playerPed, weaponHash) 

	local somma = math.floor(pedAmmo + munizioni)
    
    if weaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") or weaponHash == GetHashKey("WEAPON_CARBINERIFLE") or weaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") or weaponHash == GetHashKey("WEAPON_SPECIALCARBINE") or weaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") or weaponHash == GetHashKey("WEAPON_COMPACTRIFLE") or weaponHash == GetHashKey("WEAPON_GUSENBERG") or weaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
    
        if (HasPedGotWeapon(PlayerPedId(), 0xBFEFFF6D, false) and GetCurrentPedWeapon(PlayerPedId(), 0xBFEFFF6D)) --[[ASSAULT RIFLE]]
        or (HasPedGotWeapon(PlayerPedId(), 0x83BF0278, false) and GetCurrentPedWeapon(PlayerPedId(), 0x83BF0278)) --[[CARABINA]]
        or (HasPedGotWeapon(PlayerPedId(), 0xAF113F99, false) and GetCurrentPedWeapon(PlayerPedId(), 0xAF113F99)) --[[FUCILE AVANZATO]]
        or (HasPedGotWeapon(PlayerPedId(), 0xC0A3098D, false) and GetCurrentPedWeapon(PlayerPedId(), 0xC0A3098D)) --[[CARABINA SPECIALE]] 
        or (HasPedGotWeapon(PlayerPedId(), 0x7F229F94, false) and GetCurrentPedWeapon(PlayerPedId(), 0x7F229F94)) --[[FUCILE BULLPUP]]
        or (HasPedGotWeapon(PlayerPedId(), 0x624FE830, false) and GetCurrentPedWeapon(PlayerPedId(), 0x624FE830)) --[[FUCILE COMPATTO]]
        or (HasPedGotWeapon(PlayerPedId(), 0x61012683, false) and GetCurrentPedWeapon(PlayerPedId(), 0x61012683)) --[[THOMPSON]]
        or (HasPedGotWeapon(PlayerPedId(), 0xFAD1F1C9, false) and GetCurrentPedWeapon(PlayerPedId(), 0xFAD1F1C9)) --[[CARABINA MK2]] then 
            if somma <= 252 then
                if weaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
                SetPedAmmo(playerPed, 0xBFEFFF6D, somma)
                elseif weaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
                SetPedAmmo(playerPed, 0x83BF0278, somma)
                elseif weaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
                SetPedAmmo(playerPed, 0xFAD1F1C9, somma)
                elseif weaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
                SetPedAmmo(playerPed, 0xAF113F99, somma)
                elseif weaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
                SetPedAmmo(playerPed, 0xC0A3098D, somma)
                elseif weaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
                SetPedAmmo(playerPed, 0x7F229F94, somma)
                elseif weaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
                SetPedAmmo(playerPed, 0x624FE830, somma)
                elseif weaponHash == GetHashKey("WEAPON_GUSENBERG") then
                SetPedAmmo(playerPed, 0x61012683, somma)
                end
            else
                local differenza = math.floor(somma - maxy) 
                if weaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
                SetPedAmmo(playerPed, 0xBFEFFF6D, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'arAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
                SetPedAmmo(playerPed, 0x83BF0278, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'arAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
                SetPedAmmo(playerPed, 0xFAD1F1C9, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'arAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
                SetPedAmmo(playerPed, 0xAF113F99, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'arAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
                SetPedAmmo(playerPed, 0xC0A3098D, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'arAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
                SetPedAmmo(playerPed, 0x7F229F94, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'arAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
                SetPedAmmo(playerPed, 0x624FE830, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'arAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_GUSENBERG") then
                SetPedAmmo(playerPed, 0x61012683, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'arAmmo', 1)
                end
            end
        else
            ESX.ShowNotification('Devi avere un fucile a pompa in mano per poterla ricaricare!')
            TriggerServerEvent('smontaarmi:munizionifix', 'arAmmo', 1)
            end
        else
            ESX.ShowNotification('Queste munizioni non sono adatte a quest\'arma')
            TriggerServerEvent('smontaarmi:munizionifix', 'arAmmo', 1)
        end
        
end)

RegisterNetEvent('montaammocecchino')
AddEventHandler('montaammocecchino', function(munizioni, maxy)

	local playerPed  = PlayerPedId()
    local weaponHash = GetSelectedPedWeapon(playerPed)
    local pedAmmo = GetAmmoInPedWeapon(playerPed, weaponHash) 

	local somma = math.floor(pedAmmo + munizioni)
    
    if weaponHash == GetHashKey("WEAPON_SNIPERRIFLE") or weaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
    
        if (HasPedGotWeapon(PlayerPedId(), 0x05FC3C11, false) and GetCurrentPedWeapon(PlayerPedId(), 0x05FC3C11)) --[[CECCHINO LEGGERO]]
        or (HasPedGotWeapon(PlayerPedId(), 0xC734385, false) and GetCurrentPedWeapon(PlayerPedId(), 0xC734385)) --[[CECCHINO PESANTE]] then 
            if somma <= 252 then
                if weaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
                SetPedAmmo(playerPed, 0x05FC3C11, somma)
                elseif weaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
                SetPedAmmo(playerPed, 0xC734385, somma)
                end
            else
                local differenza = math.floor(somma - maxy) 
                if weaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
                SetPedAmmo(playerPed, 0x05FC3C11, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'cecAmmo', 1)
                elseif weaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
                SetPedAmmo(playerPed, 0xC734385, maxy)
                TriggerServerEvent('smontaarmi:munizionifix', 'cecAmmo', 1)
                end
            end
        else
            ESX.ShowNotification('Devi avere un cecchino in mano per poterla ricaricare!')
            TriggerServerEvent('smontaarmi:munizionifix', 'cecAmmo', 1)
            end
        else
            ESX.ShowNotification('Queste munizioni non sono adatte a quest\'arma')
            TriggerServerEvent('smontaarmi:munizionifix', 'cecAmmo', 1)
        end
        
end)

--------------------------------------------------------------------------------
-- TASTO PER APRIRE IL MENU
--------------------------------------------------------------------------------

RegisterNetEvent('wl_smontarmi:aprimenu')
AddEventHandler('wl_smontarmi:aprimenu', function()

    if not smontando then 
        ApriMenuSmontaArmiSubMenu()
    else
        ESX.ShowNotification('Non puoi aprire il menu se stai smontando un arma!')
    end

end)

RegisterNetEvent('ff:componenti')
AddEventHandler('ff:componenti', function()

    if HasPedGotWeapon(PlayerPedId(), 0x1B06D571, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_AT_PI_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_AT_PI_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x1B06D571, GetHashKey('component_at_pi_supp_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x1B06D571, GetHashKey('component_at_pi_supp_02'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE')) then
            TriggerServerEvent('smontaggio:rimborso', 'skin')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_PISTOL_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x1B06D571, GetHashKey('COMPONENT_PISTOL_CLIP_02'))
        end
    end 

    if HasPedGotWeapon(PlayerPedId(), 0x83839C4, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x83839C4, GetHashKey('COMPONENT_AT_PI_SUPP')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x83839C4, GetHashKey('COMPONENT_AT_PI_SUPP'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0x5EF9FEC4, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_AT_PI_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_AT_PI_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_AT_PI_SUPP')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_AT_PI_SUPP'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x5EF9FEC4, GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0x99AEEB3B, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_AT_PI_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_AT_PI_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE')) then
            TriggerServerEvent('smontaggio:rimborso', 'skin')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_PISTOL50_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x99AEEB3B, GetHashKey('COMPONENT_PISTOL50_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0x22D8FE39, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_AT_PI_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_AT_PI_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_AT_PI_SUPP')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_AT_PI_SUPP'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE')) then
            TriggerServerEvent('smontaggio:rimborso', 'skin')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_APPISTOL_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x22D8FE39, GetHashKey('COMPONENT_APPISTOL_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0xBFD21232, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFD21232, GetHashKey('COMPONENT_SNSPISTOL_VARMOD_LOWRIDER')) then
            TriggerServerEvent('smontaggio:rimborso', 'skin')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFD21232, GetHashKey('COMPONENT_SNSPISTOL_VARMOD_LOWRIDER'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFD21232, GetHashKey('COMPONENT_SNSPISTOL_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFD21232, GetHashKey('COMPONENT_SNSPISTOL_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0xD205520E, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_AT_PI_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_AT_PI_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_AT_PI_SUPP')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_AT_PI_SUPP'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE')) then
            TriggerServerEvent('smontaggio:rimborso', 'skin')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xD205520E, GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0x13532244, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_AT_PI_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_AT_PI_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE')) then
            TriggerServerEvent('smontaggio:rimborso', 'skin')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_MICROSMG_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x13532244, GetHashKey('COMPONENT_MICROSMG_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0x2BE6766B, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_AT_AR_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_AT_AR_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_AT_PI_SUPP')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_AT_PI_SUPP'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_SMG_VARMOD_LUXE')) then
            TriggerServerEvent('smontaggio:rimborso', 'skin')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_SMG_VARMOD_LUXE'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_SMG_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x2BE6766B, GetHashKey('COMPONENT_SMG_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0xEFE7E2DF, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_AT_AR_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_AT_AR_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xEFE7E2DF, GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0x0A3D4D34, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x0A3D4D34, GetHashKey('COMPONENT_AT_AR_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x0A3D4D34, GetHashKey('COMPONENT_AT_AR_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x0A3D4D34, GetHashKey('COMPONENT_COMBATPDW_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x0A3D4D34, GetHashKey('COMPONENT_COMBATPDW_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0x1D073A89, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x1D073A89, GetHashKey('COMPONENT_AT_AR_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x1D073A89, GetHashKey('COMPONENT_AT_AR_FLSH'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0xBFEFFF6D, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
            TriggerServerEvent('smontaggio:rimborso', 'impugnatura')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_AR_AFGRIP'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE')) then
            TriggerServerEvent('smontaggio:rimborso', 'skin')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')) then
            TriggerServerEvent('smontaggio:rimborso', 'mirino')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFEFFF6D, GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0x83BF0278, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_SUPP')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_SUPP'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
            TriggerServerEvent('smontaggio:rimborso', 'impugnatura')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_AR_AFGRIP'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE')) then
            TriggerServerEvent('smontaggio:rimborso', 'skin')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')) then
            TriggerServerEvent('smontaggio:rimborso', 'mirino')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x83BF0278, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0xAF113F99, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_AT_AR_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_AT_AR_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_AT_AR_SUPP')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_AT_AR_SUPP'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE')) then
            TriggerServerEvent('smontaggio:rimborso', 'skin')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xAF113F99, GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0xC0A3098D, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_SUPP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_SUPP_02'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
            TriggerServerEvent('smontaggio:rimborso', 'impugnatura')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_AR_AFGRIP'))
        end 
        if HasPedGotWeaponComponent(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')) then
            TriggerServerEvent('smontaggio:rimborso', 'mirino')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xC0A3098D, GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_02'))
        end
    end
    
    if HasPedGotWeapon(PlayerPedId(), 0x7F229F94, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_FLSH')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_FLSH'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_SUPP')) then
            TriggerServerEvent('smontaggio:rimborso', 'silenziatore')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_SUPP'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_AFGRIP')) then
            TriggerServerEvent('smontaggio:rimborso', 'impugnatura')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_AT_AR_AFGRIP'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0x7F229F94, GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_02'))
        end
    end

    if HasPedGotWeapon(PlayerPedId(), 0xBFE256D4, false) then
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_AT_PI_FLSH_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'torciaarma')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_AT_PI_FLSH_02'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_AT_PI_RAIL')) then
            TriggerServerEvent('smontaggio:rimborso', 'mirino')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_AT_PI_RAIL'))
        end
        if HasPedGotWeaponComponent(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02')) then
            TriggerServerEvent('smontaggio:rimborso', 'caricatoreesteso')
            RemoveWeaponComponentFromPed(PlayerPedId(), 0xBFE256D4, GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02'))
        end
    end

end)

-- Smonta tutte le armi alla morte

AddEventHandler('esx:onPlayerDeath', function(data, componente)

    TriggerEvent('wl:componenti')
    TriggerEvent('wl_smontarmi:disarm')

end)

RegisterCommand('esci', function(data, componente)
    TriggerEvent('wl:componenti')
    TriggerEvent('wl_smontarmi:disarm')

    Citizen.Wait(2000)

    TriggerServerEvent('wl:quitta')
end)

----- LOG MOD MENU


RegisterNetEvent('wl_smonta:bloccatasti')
AddEventHandler('wl_smonta:bloccatasti', function()

    disabilitatasti = true

end)

RegisterNetEvent('wl_smonta:sbloccatasti')
AddEventHandler('wl_smonta:sbloccatasti', function()

    disabilitatasti = false

end)