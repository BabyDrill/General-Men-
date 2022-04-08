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

ESX = nil

local IsAnimated = false
local boostabilitato = false
local hud = false
local chat = false
local minimappa = false
local nomiabilitati  = false
local coordinate = false
local gamerTags = {}


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

end)

local societymoney, societymoney2 = nil, nil

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


Citizen.CreateThread(function()
	while true do
		playerPed = PlayerPedId()
		Wait(1)
		if IsControlPressed(0,Keys['F5'])  then			
			ApriMenu()
		end
	end
end)

Player = {
	isDead = false,
	inAnim = false,
	crouched = false,
	handsup = false,
	pointing = false,
	noclip = false,
	godmode = false,
	ghostmode = false,
	showCoords = false,
	showName = false,
	gamerTags = {},
	group = 'user'
}

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(GetPlayerPed(-1), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
		RemoveAnimDict(lib)
	end)
end

function Vestiti(value, plyPed)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:getSkin', function(skina)
			if value == 'torso' then
				startAnim("clothingtie", "try_tie_neutral_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.torso_1 ~= skina.torso_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = skin.torso_1, ['torso_2'] = skin.torso_2, ['tshirt_1'] = skin.tshirt_1, ['tshirt_2'] = skin.tshirt_2, ['arms'] = skin.arms})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['torso_1'] = 15, ['torso_2'] = 0, ['tshirt_1'] = 15, ['tshirt_2'] = 0, ['arms'] = 15})
				end
			elseif value == 'pantaloni' then
				startAnim("re@construction", "out_of_breath")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.pants_1 ~= skina.pants_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = skin.pants_1, ['pants_2'] = skin.pants_2})
				else
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 61, ['pants_2'] = 1})
					else
						TriggerEvent('skinchanger:loadClothes', skina, {['pants_1'] = 15, ['pants_2'] = 0})
					end
				end
			elseif value == 'scarpe' then
				startAnim("random@domestic", "pickup_low")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.shoes_1 ~= skina.shoes_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = skin.shoes_1, ['shoes_2'] = skin.shoes_2})
				else
					if skin.sex == 0 then
						TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 34, ['shoes_2'] = 0})
					else
						TriggerEvent('skinchanger:loadClothes', skina, {['shoes_1'] = 35, ['shoes_2'] = 0})
					end
				end
			elseif value == 'zaino' then
				startAnim("clothingtie", "try_tie_neutral_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)
				
				if skin.bags_1 ~= skina.bags_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = skin.bags_1, ['bags_2'] = skin.bags_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bags_1'] = 0, ['bags_2'] = 0})
				end
			elseif value == 'giubbo' then
				startAnim("clothingtie", "try_tie_neutral_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.bproof_1 ~= skina.bproof_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = skin.bproof_1, ['bproof_2'] = skin.bproof_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['bproof_1'] = 0, ['bproof_2'] = 0})
				end
			elseif value == 'glasses' then
				startAnim("clothingspecs", "try_glasses_positive_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.glasses_1 ~= skina.glasses_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['glasses_1'] = skin.glasses_1, ['glasses_2'] = skin.glasses_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['glasses_1'] = 0, ['glasses_2'] = 0})
				end
			elseif value == 'ears' then
				startAnim("clothingspecs", "try_glasses_positive_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.ears_1 ~= skina.ears_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['ears_1'] = skin.ears_1, ['ears_2'] = skin.ears_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['ears_1'] = 0, ['ears_2'] = 0})
				end
			elseif value == 'helmet' then
				startAnim("clothingspecs", "try_glasses_positive_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.helmet_1 ~= skina.helmet_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['helmet_1'] = skin.helmet_1, ['helmet_2'] = skin.helmet_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['helmet_1'] = -1, ['helmet_2'] = 0})
				end
			elseif value == 'mask' then
				startAnim("clothingspecs", "try_glasses_positive_a")
				Citizen.Wait(1000)
				ClearPedTasks(plyPed)

				if skin.mask_1 ~= skina.mask_1 then
					TriggerEvent('skinchanger:loadClothes', skina, {['mask_1'] = skin.mask_1, ['mask_2'] = skin.mask_2})
				else
					TriggerEvent('skinchanger:loadClothes', skina, {['mask_1'] = 0, ['mask_2'] = 0})
				end
			end
		end)
	end)
end

function AbilitaNomi()
	nomiabilitati = not nomiabilitati

	if nomiabilitati then
		ESX.ShowNotification('Nomi abilitati')
	else
		ESX.ShowNotification('Nomi disabilitati')
	end
end

function MostraCoordinate()
	coordinate = not coordinate

	if coordinate then
		ESX.ShowNotification('Coordinate abilitate')
	else
		ESX.ShowNotification('Coordinate disabilitate')
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)

		if nomiabilitati then
            for _, v in ipairs(ESX.Game.GetPlayersInArea(GetEntityCoords(GetPlayerPed(-1)), 100.0)) do
                local giocatore = GetPlayerPed(v)
                
                if giocatore ~= plyPed then

					if #(GetEntityCoords(plyPed, false) - GetEntityCoords(giocatore, false)) < 5000.0 then
						gamerTags[v] = CreateFakeMpGamerTag(giocatore, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
						SetMpGamerTagVisibility(gamerTags[v], 2, true)
                    	SetMpGamerTagAlpha(gamerTags[v], 2, 255)
                    	SetMpGamerTagColour(gamerTags[v], 1, 10)
					else
						RemoveMpGamerTag(gamerTags[v])
						gamerTags[v] = nil
					end
                end
                
            end
        end

		if coordinate then
			local playerPos = GetEntityCoords(PlayerPedId())
			local playerHeading = GetEntityHeading(PlayerPedId())
			ScrittaTestoMenuF5("~r~X~s~: " .. playerPos.x .. " ~b~Y~s~: " .. playerPos.y .. " ~g~Z~s~: " .. playerPos.z .. " ~y~H~s~: " .. playerHeading)
		end


function ApriMenu()
	ESX.UI.Menu.CloseAll()


	local elements = {
		{label = '📑Documenti', value = 'portafoglio'},
		{label = '📋Fatture', value = 'fatture'},
		{label = '👕Vestiti', value = 'vestiti'},
		{label = '🧤Accessori', value = 'accessori'},
		{label = '🔞Animazioni', value = 'animazioni'},
		{label = '🔫Smonta Armi', value = 'smonta'},
		{label = '🔧Gestione FPS', value = 'fps'},
		{label = '🔒Amministrazione', value = 'admin'},
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'babydrill_f5', {
		title    = GetPlayerName(PlayerId())..' [' .. GetPlayerServerId(PlayerId()).. ']',
		align    = 'top-left',
		elements = elements

	}, function(data, menu)
		local val = data.current.value
		
		if val == 'portafoglio' then
			elementidocumenti = {} 

			table.insert(elementidocumenti, {label = 'Lavoro: ' .. ESX.PlayerData.job.label .. ' - ' .. ESX.PlayerData.job.grade_label, value = 'lavoro'})
			table.insert(elementidocumenti, {label = 'Mostra Carta di Identità', value = 'mostracart'})
			table.insert(elementidocumenti, {label = 'Guarda Carta di Identità', value = 'guardacart'})
			table.insert(elementidocumenti, {label = 'Mostra Patente di Guida', value = 'mostrapat'})
			table.insert(elementidocumenti, {label = 'Guarda Patente di Guida', value = 'guardapat'})
			table.insert(elementidocumenti, {label = 'Mostra Porto d\'Armi', value = 'mostraport'})
			table.insert(elementidocumenti, {label = 'Guarda Porto d\'Armi', value = 'guardaport'})

			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'portafoglio',
				{
					title    = 'Documenti',
					posizione = 'destra-basso-f5',
					elements = elementidocumenti
				},
				function(datamenudocumenti, menudocumenti)
					local val = datamenudocumenti.current.value
					
					if val == 'mostracart' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

								if closestDistance ~= -1 and closestDistance <= 3.0 then
									TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
								else
									ESX.ShowNotification('Nessun cittadino nelle vicinanze!')
								end
							else
								ESX.ShowNotification('Non hai i documenti!')
							end
						end, 'documenti')
					elseif val == 'guardacart' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
							else
								ESX.ShowNotification('Non hai i documenti!')
							end
						end, 'documenti')
					elseif val == 'mostrapat' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	
								if closestDistance ~= -1 and closestDistance <= 3.0 then
									TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
								else
									ESX.ShowNotification('Nessun cittadino nelle vicinanze!')
								end
							else
								ESX.ShowNotification('Non hai i documenti!')
							end
						end, 'documenti')
					elseif val == 'guardapat' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
							else
								ESX.ShowNotification('Non hai i documenti!')
							end
						end, 'documenti')
					elseif val == 'guardaport' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapons')
							else
								ESX.ShowNotification('Non hai i documenti!')
							end
						end, 'documenti')
					elseif val == 'mostraport' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	
								if closestDistance ~= -1 and closestDistance <= 3.0 then
									TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapons')
								else
									ESX.ShowNotification('Nessun cittadino nelle vicinanze!')
								end
							else
								ESX.ShowNotification('Non hai i documenti!')
							end
						end, 'documenti')
					end
				end,
			function(datamenudocumenti, menudocumenti)
				menudocumenti.close()
			end)
		elseif val == 'fatture' then
			ESX.TriggerServerCallback('esx_billing:getBills', function(fatture)
				if #fatture > 0 then
					local elements = {}
		
					for k,v in ipairs(fatture) do
						table.insert(elements, {
							label  = ('%s - <span style="color:red;">%s</span>'):format(v.label, '$' .. ESX.Math.GroupDigits(v.amount)),
							billId = v.id
						})
					end
		
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
						title    = 'Fatture',
						posizione    = 'destra-basso-f5',
						elements = elements
					}, function(datafatture, menufatture)
						menufatture.close()
		
						ESX.TriggerServerCallback('esx_billing:payBill', function()
						end, datafatture.current.billId)
					end, function(datafatture, menufatture)
						menufatture.close()
					end)
				else
					ESX.ShowNotification('Non hai nessuna fattura da pagare')
				end
			end)
        elseif val == 'smonta' then
			ementi3 = {} 

			table.insert(ementi3, {label = 'Smonta Armi', value = 'smontaarmi'})
			table.insert(ementi3, {label = 'Smonta Componenti', value = 'smontacomponenti'})
			table.insert(ementi3, {label = 'Smonta tutte le Armi', value = 'smontatuttelearmi'})

			ESX.UI.Menu.Open(
				'default', GetCurrentResourceName(), 'portafoglio',
				{
					title    = 'Smonta Armi',
					posizione = 'destra-basso',
					elements = ementi3
				},
				function(data2, menu2)
					local val = data2.current.value
					
					if val == 'smontaarmi' then
						ESX.UI.Menu.CloseAll()
						Citizen.Wait(200)
						TriggerEvent('ffsmontaarmi:aprimenu')
					elseif val == 'smontacomponenti' then
						ESX.UI.Menu.CloseAll()
						Citizen.Wait(200)
						TriggerEvent('ffsmontaarmi:aprismontacomponenti')
					elseif val == 'smontatuttelearmi' then
						ESX.UI.Menu.CloseAll()
						Citizen.Wait(200)
						TriggerEvent('ff:componenti')
						TriggerEvent('ffsmontaarmi:disarm')
					elseif val == 'guardapat' then
						ESX.UI.Menu.CloseAll()
						Citizen.Wait(200)
						TriggerEvent('ff_simcard:aprimenuSim')
					end
				end,				
			function(data2, menu2)
				menu2.close()
			end)
		elseif val == 'vestiti' then
			elementivestiti = {{label = 'Torso', value = 'torso'}, {label = 'Pantaloni', value = 'pantaloni'}, {label = 'Scarpe', value = 'scarpe'}, {label = 'Zaino', value = 'zaino'}, {label = 'Giubbotto Antiproiettile', value = 'antiproiettile'}}

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu_vestiti_f5',
				{
					title    = 'Menù Vestiti',
					posizione = 'destra-basso-f5',
					elements = elementivestiti
				},
				function(datavestiti, menuvestiti)
					local val = datavestiti.current.value
					local Giocatore = PlayerPedId()
					
					if val == 'torso' then
						Vestiti('torso', Giocatore)
					elseif val == 'pantaloni' then
						Vestiti('pantaloni', Giocatore)
					elseif val == 'scarpe' then
						Vestiti('scarpe', Giocatore)
					elseif val == 'zaino' then
						Vestiti('zaino', Giocatore)
					elseif val == 'antiproiettile' then
						Vestiti('giubbo', Giocatore)
					end
				end,
			function(datavestiti, menuvestiti)
				menuvestiti.close()
			end)
		elseif val == 'accessori' then
			elementiaccessori = {{label = 'Occhiali', value = 'occhiali'}, {label = 'Accessori per Orecchie', value = 'accorecc'}, {label = 'Casco', value = 'casco'}, {label = 'Maschera', value = 'maschera'}}

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu_accessori_f5',
				{
					title    = 'Menù Accessori',
					posizione = 'destra-basso-f5',
					elements = elementiaccessori
				},
				function(dataaccessori, menuaccessori)
					local val = dataaccessori.current.value
					local Giocatore = PlayerPedId()
					
					if val == 'occhiali' then
						Vestiti('glasses', Giocatore)
					elseif val == 'accorecc' then
						Vestiti('ears', Giocatore)
					elseif val == 'casco' then
						Vestiti('helmet', Giocatore)
					elseif val == 'maschera' then
						Vestiti('mask', Giocatore)
					end
				end,
			function(dataaccessori, menuaccessori)
				menuaccessori.close()
			end)
	    elseif data.current.value == 'fps' then
			local fixfps = {}

			table.insert(fixfps, {label = "Colore", value = 'colore'})
			table.insert(fixfps, {label = "Distanza Bassa", value = 0.5})
			table.insert(fixfps, {label = "Distanza Media", value = 1.0})
			table.insert(fixfps, {label = "Distanza Alta", value = 75.0})
	
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fps', {
				title    = "Gestione FPS",
				align    = 'top-left',
				elements = fixfps
			}, function(data, menu)
				
				if data.current.value == 'colore' then
					if not boostabilitato then
						SetTimecycleModifier("cinema")
						SetForceVehicleTrails(false)
						SetForcePedFootstepsTracks(false)
						boostabilitato = true
						TriggerEvent('esx:showNotification', "Hai cambiato i colori")
					elseif boostabilitato then
						SetTimecycleModifier("default")
						boostabilitato = false
						TriggerEvent('esx:showNotification', "Hai reimpostato i colori")
					end
				else
					if data.current.value == 0.5 then
						OverrideLodscaleThisFrame(0.5)
						SetLightsCutoffDistanceTweak(0.5)
						CascadeShadowsSetCascadeBoundsScale(0.0)	

						RopeDrawShadowEnabled(false)

						CascadeShadowsClearShadowSampleType()
						CascadeShadowsSetAircraftMode(false)
						CascadeShadowsEnableEntityTracker(true)
						CascadeShadowsSetDynamicDepthMode(false)
						CascadeShadowsSetEntityTrackerScale(0.0)
						CascadeShadowsSetDynamicDepthValue(0.0)
						CascadeShadowsSetCascadeBoundsScale(0.0)

						SetFlashLightFadeDistance(0.0)
						SetLightsCutoffDistanceTweak(0.0)
						DistantCopCarSirens(false)
						TriggerEvent('esx:showNotification', "Hai attivato la distanza bassa")
					elseif data.current.value == 1.0 then
						OverrideLodscaleThisFrame(1.0)
						SetLightsCutoffDistanceTweak(1.0)
						CascadeShadowsSetCascadeBoundsScale(0.5)	

						RopeDrawShadowEnabled(false)

						CascadeShadowsClearShadowSampleType()
						CascadeShadowsSetAircraftMode(false)
						CascadeShadowsEnableEntityTracker(true)
						CascadeShadowsSetDynamicDepthMode(false)
						CascadeShadowsSetEntityTrackerScale(0.0)
						CascadeShadowsSetDynamicDepthValue(0.0)
						CascadeShadowsSetCascadeBoundsScale(0.0)

						SetFlashLightFadeDistance(5.0)
						SetLightsCutoffDistanceTweak(5.0)
						DistantCopCarSirens(false)
						TriggerEvent('esx:showNotification', "Hai attivato la distanza media")
						
					elseif data.current.value == 75.0 then
						OverrideLodscaleThisFrame(75.0)
						SetLightsCutoffDistanceTweak(75.0)
						CascadeShadowsSetCascadeBoundsScale(1.0)	

						RopeDrawShadowEnabled(true)
						CascadeShadowsClearShadowSampleType()
						CascadeShadowsSetAircraftMode(false)
						CascadeShadowsEnableEntityTracker(true)
						CascadeShadowsSetDynamicDepthMode(false)
						CascadeShadowsSetEntityTrackerScale(5.0)
						CascadeShadowsSetDynamicDepthValue(3.0)
						CascadeShadowsSetCascadeBoundsScale(3.0)

						SetFlashLightFadeDistance(3.0)
						SetLightsCutoffDistanceTweak(3.0)
						DistantCopCarSirens(false)
						SetArtificialLightsState(false)
						TriggerEvent('esx:showNotification', "Hai attivato la distanza alta")

					
					end
				
				end


			end, function(data, menu)
				menu.close()
			end)
					elseif val == 'animazioni' then
						elementianimazioni = {} 

						table.insert(elementianimazioni, {label = 'B*cchino in macchina', value = 'boccauto'})
						table.insert(elementianimazioni, {label = 'Fa b*cchino', value = 'faboccauto'})
						table.insert(elementianimazioni, {label = 'S*sso in macchina', value = 'sessoauto'})
						table.insert(elementianimazioni, {label = 'S*sso in macchina', value = 'sessoauto2'})
						table.insert(elementianimazioni, {label = 'Si tocca le palle', value = 'toccapalle'})
						table.insert(elementianimazioni, {label = 'Movimenti sensuali', value = 'movsensuali'})
						table.insert(elementianimazioni, {label = 'Mostra T*tte', value = 'mostrtette'})
						table.insert(elementianimazioni, {label = 'Posa Sexy 1', value = 'possexy1'})
						table.insert(elementianimazioni, {label = 'Posa Sexy 2', value = 'possexy2'})
						table.insert(elementianimazioni, {label = 'Posa Sexy 3', value = 'possexy3'})

						ESX.UI.Menu.Open(
							'default', GetCurrentResourceName(), 'animpegi21',
							{
								title    = 'Animazioni PEGI21',
								posizione = 'destra-basso',
								elements = elementianimazioni
							},
							function(dataanimazioni, menuanimazioni)
								local val = dataanimazioni.current.value
								
								if val == 'boccauto' then
									startAnim("oddjobs@towing", "m_blow_job_loop")
								elseif val == 'faboccauto' then
									startAnim("oddjobs@towing", "f_blow_job_loop")
								elseif val == 'sessoauto' then
									startAnim("mini@prostitutes@sexlow_veh", "low_car_sex_loop_player")
								elseif val == 'sessoauto2' then
									startAnim("mini@prostitutes@sexlow_veh", "low_car_sex_loop_female")
								elseif val == 'toccapalle' then
									startAnim("mp_player_int_uppergrab_crotch", "mp_player_int_grab_crotch")
								elseif val == 'movsensuali' then
									startAnim("mini@strip_club@idles@stripper", "stripper_idle_02")
								elseif val == 'mostrtette' then
									startAnim("mini@strip_club@backroom@", "stripper_b_backroom_idle_b")
								elseif val == 'possexy1' then
									startAnim("mini@strip_club@lap_dance@ld_girl_a_song_a_p1", "ld_girl_a_song_a_p1_f")
								elseif val == 'possexy2' then
									startAnim("mini@strip_club@private_dance@part2", "priv_dance_p2")
								elseif val == 'possexy3' then
									startAnim("mini@strip_club@private_dance@part3", "priv_dance_p3")
								end
							end,				
						function(dataanimazioni, menuanimazioni)
							menuanimazioni.close()
						end)
				elseif val == 'admin' then
						ESX.TriggerServerCallback("babydrill_menuf5:dammestogruppo", function(RankGiocatore)
							if RankGiocatore == "superadmin" or RankGiocatore == "admin" or RankGiocatore == "mod" or RankGiocatore == "helper" then
								elementiamministrazione = {} 

								table.insert(elementiamministrazione, {label = 'Mostra/Nascondi Nomi Giocatori', value = 'nomi'})
								table.insert(elementiamministrazione, {label = 'Give Soldi', value = 'soldipuliti'})
								table.insert(elementiamministrazione, {label = 'Give Soldi Sporchi', value = 'soldisporchi'})
								table.insert(elementiamministrazione, {label = 'Coordinate', value = 'coordinate'})
								table.insert(elementiamministrazione, {label = 'Ripara Veicolo', value = 'ripveh'})
								table.insert(elementiamministrazione, {label = 'Ribalta Veicolo', value = 'giraveh'})

								ESX.UI.Menu.Open(
									'default', GetCurrentResourceName(), 'portafoglio',
									{
										title    = 'Amministrazione',
										posizione = 'destra-basso-f5',
										elements = elementiamministrazione
									},
									function(dataamministrazione, menuamministrazione)
										local val = dataamministrazione.current.value
										
										if val == 'nomi' then
											AbilitaNomi()
										elseif val == 'soldipuliti' then
											ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'give_soldi',
											{
												title = 'Importo',
											}, function(dataimportoclean, menuimportoclean)
													if dataimportoclean.value == nil or dataimportoclean.value == '0' then
														ESX.ShowNotification('Importo non valido')
													else
														TriggerServerEvent('babydrill_menuf5:givesoldi', 'puliti', dataimportoclean.value)
														menuimportoclean.close()
													end
												end, function(dataimportoclean, menuimportoclean)
													menuimportoclean.close()
											end)
										elseif val == 'soldisporchi' then
											ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'give_soldi_sporchi',
											{
												title = 'Importo',
											}, function(dataimportosporchi, menuimportosporchi)
													if dataimportosporchi.value == nil or dataimportosporchi.value == '0' then
														ESX.ShowNotification('Importo non valido')
													else
														TriggerServerEvent('babydrill_menuf5:givesoldi', 'sporchi', dataimportosporchi.value)
														menuimportosporchi.close()
													end
												end, function(dataimportosporchi, menuimportosporchi)
													menuimportosporchi.close()
											end)
										elseif val == 'coordinate' then
											MostraCoordinate()
										elseif val == 'ripveh' then
											if IsPedSittingInAnyVehicle(PlayerPedId()) then
												local auto = GetVehiclePedIsIn(PlayerPedId(), false)

												SetVehicleFixed(auto)
												SetVehicleDirtLevel(auto, 0.0)
											
												TriggerEvent('esx:showNotification', 'Veicolo Riparato!')
												TriggerServerEvent('babydrill_menuf5:riparaauto')
											else
												TriggerEvent('esx:showNotification', 'Devi essere in un veicolo per poterlo riparare!')
											end
										elseif val == 'giraveh' then
											local plyCoords = GetEntityCoords(PlayerPedId())
											local closestCar = GetClosestVehicle(plyCoords['x'], plyCoords['y'], plyCoords['z'], 10.0, 0, 70)
											local plyCoords = plyCoords + vector3(0, 2, 0)

											SetEntityCoords(closestCar, plyCoords)

											TriggerEvent('esx:showNotification', 'Veicolo Girato!')
										end
									end,				
								function(dataamministrazione, menuamministrazione)
									menuamministrazione.close()
								end)
							else
								TriggerEvent('esx:showNotification', 'Non hai i permessi!')
							end
						end)
					end
				end,
			function(data, menu)
				menu.close()
			end)
		end	

		if IsControlJustReleased(1, 121) then
			TeletrasportaSuWaypoint()
		end

	end
end)

RegisterCommand("tpm", function(source)
    TeletrasportaSuWaypoint()
end)

TeletrasportaSuWaypoint = function()
    ESX.TriggerServerCallback("babydrill_menuf5:dammestogruppo", function(playerRank)
        if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" then
            local WaypointHandle = GetFirstBlipInfoId(8)

            if DoesBlipExist(WaypointHandle) then
                local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        break
                    end

                    Citizen.Wait(5)
                end

                ESX.ShowNotification("Teletrasportato.")
            else
                ESX.ShowNotification("Imposta una meta!")
            end
        else
            ESX.ShowNotification("Non hai il permesso!")
        end
    end)
end
