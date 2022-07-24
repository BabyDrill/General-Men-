---------------| Developed by BabyDrill#7768 |---------------
ESX = exports.es_extended:getSharedObject()

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterKeyMapping('Menu_F5', 'Menu Principale', 'keyboard', 'f5')
RegisterCommand("Menu_F5", function ()
    ApriMenuF5()
end)

function ApriMenuF5()
    ESX.UI.Menu.CloseAll()
	baby()

	local elements = {
		{label = '📑Documenti', value = 'portafoglio'},
		{label = '📋Fatture', value = 'fatture'},
		{label = '👕Vestiti', value = 'vestiti'},
		{label = '🧤Accessori', value = 'accessori'},
		{label = '🔞Animazioni', value = 'animazioni'},
		{label = '🔫Smonta Armi', value = 'smonta'},
		{label = '🧭Gestione Gps', value = 'gps'},
		{label = '🔧Gestione FPS', value = 'fps'},
		{label = '🔒Amministrazione', value = 'admin'},
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'babydrill', {
		title    = "WOLF - MENU",
		align    = 'top-left',
		elements = elements

	},function(data, menu)

		if data.current.value == 'portafoglio' then
			ApriPortafoglio()
		elseif data.current.value == 'fatture' then
			TriggerEvent(Config.Trigger.Fatture)
		elseif data.current.value == 'vestiti' then
			VestitiMenu()
		elseif data.current.value == 'accessori' then
			AccessoriMenu()
		elseif data.current.value == 'animazioni' then
			AnimazioniMenu()
		elseif data.current.value == 'smonta' then
			SmontaArmi()
		elseif data.current.value == 'gps' then
			GpsMenu()
		elseif data.current.value == 'fps' then
			FpsMenu()
		elseif data.current.value == 'admin' then
			ESX.TriggerServerCallback("Wolf_development:controllagruppo", function(RankGiocatore)
				if RankGiocatore == "mod" or RankGiocatore == "admin" or RankGiocatore == "superadmin" then
					AdminMenu()
				else
					ESX.ShowNotification(Lang.permessi)
				end
			end)
		end

	end, function(data, menu)
		menu.close()
	end)
end

function ApriPortafoglio()
	ESX.UI.Menu.CloseAll()

	local elements = {
		{label = Lang.nome..GetPlayerName(PlayerId()), value = ''},
		{label = Lang.id..GetPlayerServerId(PlayerId()), value = ''},
		{label = Lang.lavoro.. ESX.PlayerData.job.label .. ' - ' .. ESX.PlayerData.job.grade_label, value = ''},
		{label = Lang.carta1mostra, value = 'mostracart'},
		{label = Lang.carta1guarda, value = 'guardacart'},
		{label = Lang.carta2mostra, value = 'mostrapat'},
		{label = Lang.carta2guarda, value = 'guardapat'},
		{label = Lang.carta3mostra, value = 'mostraport'},
		{label = Lang.carta3guarda, value = 'guardaport'},
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'portafoglio', {
		title    = Lang.documenti,
		align    = 'top-left',
		elements = elements

	},function(data, menu)

	    if data.current.value == 'mostracart' then
			local pedDist2, pedDista = ESX.Game.GetClosestPlayer()
			if pedDist2 ~= -1 and pedDista <= 3.0 then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(pedDist2))
			else
				ESX.ShowNotification(Lang.nessuno)				
			end
		elseif data.current.value == 'guardacart' then
			menu.close()
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))

		elseif data.current.value == 'mostrapat' then
			local pedDist2, pedDista = ESX.Game.GetClosestPlayer()
			if pedDist2 ~= -1 and pedDista <= 3.0 then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(pedDist2), 'driver')
			else
				ESX.ShowNotification(Lang.nessuno)
			end
		elseif data.current.value == 'guardapat' then
			menu.close()
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(pedDist2), 'driver')

		elseif data.current.value == 'mostraport' then
			local pedDist2, pedDista = ESX.Game.GetClosestPlayer()
			if pedDist2 ~= -1 and pedDista <= 3.0 then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(pedDist2), 'weapon')
			else
				ESX.ShowNotification(Lang.nessuno)
			end
		elseif data.current.value == 'guardaport' then
			menu.close()
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(pedDist2), 'weapon')
		end
	end, function(data, menu)
		menu.close()
	end)
end

function VestitiMenu()
local elementivestiti = {
	{label = Lang.torso, value = 'torso'}, 
	{label = Lang.panta, value = 'pantaloni'}, 
	{label = Lang.scarpe, value = 'scarpe'}, 
	{label = Lang.zaino, value = 'zaino'}, 
	{label = Lang.giubbo, value = 'antiproiettile'}}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu_vestiti_f5',
		{
			title    = Lang.menuvestiti,
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

function GpsMenu()
	local elementi = {
		{label = Lang.poli, value = 'polizia'}, 
		{label = Lang.ambu, value = 'ambulanza'}, 
		{label = Lang.banca, value = 'banca'}, 
		{label = Lang.scuol, value = 'scuola'},
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gps',
		{
			title    = Lang.menugps,
			posizione = 'destra-basso-f5',
			elements = elementi
		},
		function(datagps, menugps)
		local val = datagps.current.value
		local pos = Config.Gps

		if val == 'polizia' then
			SetNewWaypoint(pos.polizia.x, pos.polizia.y, pos.polizia.z)
			ESX.ShowNotification(Lang.poliziafatt)
		elseif val == 'ambulanza' then
			SetNewWaypoint(pos.ambulanza.x, pos.ambulanza.y, pos.ambulanza.z)
			ESX.ShowNotification(Lang.ambulanzafatt)
		elseif val == 'banca' then
			SetNewWaypoint(pos.banca.x, pos.banca.y, pos.banca.z)
			ESX.ShowNotification(Lang.bancafatt)
		elseif val == 'scuola' then
			SetNewWaypoint(pos.scuolaguida.x, pos.scuolaguida.y, pos.scuolaguida.z)
			ESX.ShowNotification(Lang.scuolafatt)
		end
	end,
function(datagps, menugps)
	menugps.close()
	end)
end

function AccessoriMenu()
	elementiaccessori = {
		{label = Lang.occhiali, value = 'occhiali'}, 
		{label = Lang.orecchino, value = 'accorecc'}, 
		{label = Lang.casco, value = 'casco'}, 
		{label = Lang.maschera, value = 'maschera'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'menu_accessori_f5',
		{
			title    = Lang.menuaccessori,
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
end

function AnimazioniMenu()
	local elementianimazioni = {
		{label = Lang.ani1, value = 'boccauto'},
		{label = Lang.ani2, value = 'faboccauto'},
		{label = Lang.ani3, value = 'sessoauto'},
		{label = Lang.ani4, value = 'sessoauto2'},
		{label = Lang.ani5, value = 'toccapalle'},
		{label = Lang.ani6, value = 'movsensuali'},
		{label = Lang.ani7, value = 'mostrtette'},
		{label = Lang.ani8, value = 'possexy1'},
		{label = Lang.ani9, value = 'possexy2'},
		{label = Lang.ani10, value = 'possexy3'},
	}

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'animpegi21',
		{
			title    = Lang.menuanimazioni,
			posizione = 'destra-basso',
			elements = elementianimazioni
		},
		function(wolfdev, menuanimazioni)
			local val = wolfdev.current.value
			
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
	function(wolfdev, menuanimazioni)
		menuanimazioni.close()
	end)
end

local inGodMode = false

function AdminMenu()
	local elementi = {
		{label = Lang.tpm, value = 'tpm'},
		{label = Lang.godmode, value = 'god'},
		{label = Lang.wipe, value = 'wipe'},
		{label = Lang.ripa, value = 'ripa'},
		{label = Lang.riba, value = 'riba'},
		{label = Lang.cargive, value = 'cargive'},
		{label = Lang.soldipuliti, value = 'soldipuliti'},
		{label = Lang.soldisporchi, value = 'soldisporchi'},
		{label = Lang.giubb, value = 'giubb'},
	}

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'admin_menu',
		{
			title    = Lang.menuadmin,
			posizione = 'destra-basso',
			elements = elementi
		},
		function(wolfdev, babydrilltop)
			local val = wolfdev.current.value

			if val == 'tpm' then
				TpmPoint()
			elseif val == 'god' then
				if inGodMode == false then
					ESX.ShowNotification(Lang.godmodeon)
					inGodMode = true
					ApriGodMode()
				elseif inGodMode == true then
					ESX.ShowNotification(Lang.godmodeoff)
					inGodMode = false
				end
			elseif val == 'ripa' then
				if IsPedSittingInAnyVehicle(PlayerPedId()) then
					local auto = GetVehiclePedIsIn(PlayerPedId(), false)
					SetVehicleFixed(auto)
					SetVehicleDirtLevel(auto, 0.0)
					ESX.ShowNotification(Lang.vrip)
				else
					ESX.ShowNotification(Lang.vripn)
				end
			elseif val == 'riba' then
				local plyCoords = GetEntityCoords(PlayerPedId())
				local closestCar = GetClosestVehicle(plyCoords['x'], plyCoords['y'], plyCoords['z'], 10.0, 0, 70)
				local plyCoords = plyCoords + vector3(0, 2, 0)
                SetEntityCoords(closestCar, plyCoords)
                ESX.ShowNotification(Lang.vgirato)
			elseif val == 'giubb' then
				SetPedArmour(GetPlayerPed(-1), 100)
                ESX.ShowNotification(Lang.giubbon)
			elseif val == 'soldipuliti' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'give_soldi',
				{
					title = Lang.importo,
				}, function(dataimportoclean, menuimportoclean)
						if dataimportoclean.value == nil or dataimportoclean.value == '0' then
							ESX.ShowNotification(Lang.importo2)
						else
							TriggerServerEvent(Config.Trigger.Money, 'puliti', dataimportoclean.value)
							menuimportoclean.close()
						end
					end, function(dataimportoclean, menuimportoclean)
						menuimportoclean.close()
				end)
			elseif val == 'soldisporchi' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'give_soldi_sporchi',
				{
					title = Lang.importo,
				}, function(dataimportosporchi, menuimportosporchi)
						if dataimportosporchi.value == nil or dataimportosporchi.value == '0' then
							ESX.ShowNotification(Lang.importo2)
						else
							TriggerServerEvent(Config.Trigger.Money, 'sporchi', dataimportosporchi.value)
							menuimportosporchi.close()
						end
					end, function(dataimportosporchi, menuimportosporchi)
						menuimportosporchi.close()
				end)
			elseif val == 'wipe' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), "wipe", {
					title = Lang.titlewipe,
					default = ""
				}, function(data, menu)
					TriggerServerEvent(Config.Trigger.Wipe, data.value)
				end, function(data, menu)
					menu.close()
				end)
			elseif val == 'cargive' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), "cargive", {
					title = Lang.titlewipe,
					default = ""
				}, function(data, menu)
					ExecuteCommand("car "..data.value)
				end, function(data, menu)
					menu.close()
				end)
			end
	    end,
	function(wolfdev, babydrilltop)
		babydrilltop.close()
	end)
end

function TpmPoint()
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

		ESX.ShowNotification(Lang.metaon)
	else
		ESX.ShowNotification(Lang.metaoff)
	end
end


function FpsMenu()
	local fixfps = {
		{label = Lang.colore, value = 'colore'},
		{label = Lang.dist1, value = 0.5},
		{label = Lang.dist2, value = 1.0},
		{label = Lang.dist3, value = 75.0},
	}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fps', {
		title    = Lang.menufps,
		align    = 'top-left',
		elements = fixfps
	}, function(data, menu)
		
		if data.current.value == 'colore' then
			if not boostabilitato then
				SetTimecycleModifier("cinema")
				SetForceVehicleTrails(false)
				SetForcePedFootstepsTracks(false)
				boostabilitato = true
				ESX.ShowNotification(Lang.colore2)
			elseif boostabilitato then
				SetTimecycleModifier("default")
				boostabilitato = false
				ESX.ShowNotification(Lang.colore3)
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
				ESX.ShowNotification(Lang.ondist1)
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
				ESX.ShowNotification(Lang.ondist2)
				
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
				ESX.ShowNotification(Lang.ondist3)

			
			end
		
		end


	end, function(data, menu)
		menu.close()
	end)
end

function ApriGodMode()
	local ped = PlayerPedId()

	Citizen.CreateThread(function()
    	while true do
    		Citizen.Wait(1)
			if inGodMode == true then
				SetEntityInvincible(ped, true)
			elseif inGodMode == false then
				SetEntityInvincible(ped, false)
			end
		end
	end)
end

function SmontaArmi()
	local elements = {}

    for k, v in pairs(Config.Armi) do
        if HasPedGotWeapon(PlayerPedId(), GetHashKey(k), false) then
            table.insert(elements, {label = Lang.smontaon .. v.label, value = k, nome = v.label})
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'smontaggio', {
        title = Lang.menusmonta,
        align = 'top-left',
        elements = elements
    }, function(data, menu)
        local smonta = 1
        local ped = PlayerPedId()

        if smonta == 1 then
            if HasPedGotWeapon(ped, GetHashKey(data.current.value), false) then
                local colpi = GetAmmoInPedWeapon(ped, GetHashKey(data.current.value))
                ESX.UI.Menu.CloseAll()
                ExecuteCommand("me "..Lang.mostrame)
                RequestAnimDict("mini@repair")
                while (not HasAnimDictLoaded("mini@repair")) do Citizen.Wait(0) end
                TaskPlayAnim(ped,"mini@repair","fixing_a_ped",8.0, 8.0, -1, 80, 0, 0, 0, 0)
                progress(Lang.progresson,5000)
                ClearPedTasks(ped)
                TriggerServerEvent("wolf_development:smontaitem", data.current.value, colpi)
                SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
            end
        end

    end, function(data, menu)
        menu.close()
    end)
end

function progress(k,t)
    if Config.Settings.rprogress then
        exports.rprogress:Start(k, t)
    else
        exports['progressBars']:startUI(t, k)
        Citizen.Wait(t)
    end
end

function baby()
	print("^2BabyDrill on Top^0")
end

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(GetPlayerPed(-1), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
		RemoveAnimDict(lib)
	end)
end
---------------| Developed by BabyDrill#7768 |---------------
