---------------| Developed by BabyDrill#7768 |---------------
Config = {

    Settings = {

        rprogress = true,

        ox_inventory = true,

        staff = {
            "superadmin",
            "admin",
            "mod"
        }
    },

    Gps = {
        polizia = { x = 436.58587646484, y = -981.98114013672, z = 25.694826126099 },

        ambulanza = { x = 298.06539916992, y = -585.27691650391, z = 43.260852813721},

        banca = { x = 233.33680725098, y = 216.09443664551, z = 106.28665924072},

        scuolaguida = { x = 230.83009338379, y = -1390.2214355469, z = 30.495403289795}
    },

    Trigger = {
        Fatture = "esx_billing:OpenBillingMenu",
        Wipe = "wolf_development:faiwipe",--don't touch
        Money = "wolf_development:dai_soldi"--don't touch
    },

}

Config.Armi = {

	WEAPON_PISTOL = {
        label = 'Pistola',
        item = 'pistolasmont',
        clip_item = 'ammo-9'
    },

    WEAPON_SNS = {
        label = 'Pistola Sns',
        item = 'snssmont',
        clip_item = 'ammo-9'
    },

    WEAPON_PISTOL_MK2 = {
        label = 'Pistola Mk2',
        item = 'mk2smont',
        clip_item = 'ammo-9'
    },

    WEAPON_ASSAULTRIFLE = {
        label = 'AK 47',
        item = 'aksmont',
        clip_item = 'ammo-rifle2'
    },

	WEAPON_SMG = {
        label = 'Smg',
        item = 'smgsmont',
        clip_item = 'ammo-rifle'
    },

    WEAPON_MICROSMG = {
        label = 'Micro Smg',
        item = 'microsmgsmont',
        clip_item = 'ammo-45'
    },

    WEAPON_HEAVYSNIPER = {
        label = 'Micro Smg',
        item = 'cecchinosmont',
        clip_item = 'ammo-heavysniper'
    },
}

Lang = {
-------------------------ESSENZIALI----------------------------
    ["nessuno"] = "Non c\'è nessuno nelle vicinanze!",
    ["permessi"] = "Non puoi apire questo menù!",
    ["player"] = "Player non Trovato",
-------------------------GESTIONE DOCUMENTI----------------------------
    ["documenti"] = "GESTIONE DOCUMENTI",
    ["lavoro"] = "Lavoro: ",
    ["nome"] = "Nome Steam: ",
    ["id"] = "ID: ",
    ["carta1guarda"] = "Guarda Carta di Identità",
    ["carta1mostra"] = "Mostra Carta di Identità",
    ["carta2guarda"] = "Guarda Patente",
    ["carta2mostra"] = "Mostra Patente",
    ["carta3guarda"] = "Guarda Porto d\'armi",
    ["carta3mostra"] = "Mostra Porto d\'armi",
-------------------------MENU' VESTITI----------------------------
    ["menuvestiti"] = "GESTIONE VESTITI",
    ["torso"] = "Torso",
    ["panta"] = "Pantaloni",
    ["scarpe"] = "Scarpe",
    ["zaino"] = "Zaino",
    ["giubbo"] = "Giubbotto Antiproiettile",
-------------------------MENU' ACCESSORI----------------------------
    ["menuaccessori"] = "GESTIONE ACCESSORI",
    ["occhiali"] = "Occhiali",
    ["orecchino"] = "Orecchini",
    ["casco"] = "Casco",
    ["maschera"] = "Maschera",
-------------------------MENU' ANIMAZIONI----------------------------
    ["menuanimazioni"] = "ANIMAZIONI PEGI18",
    ["occhiali"] = "Occhiali",
    ["orecchino"] = "Orecchini",
    ["casco"] = "Casco",
    ["maschera"] = "Maschera",
    ["ani1"] = "B*cchino in macchina",
    ["ani2"] = "Fa b*cchino",
    ["ani3"] = "S*sso in macchina",
    ["ani4"] = "S*sso in macchina 2",
    ["ani5"] = "Si tocca le palle",
    ["ani6"] = "Movimenti sensuali",
    ["ani7"] = "Mostra T*tte",
    ["ani8"] = "Posa Sexy 1",
    ["ani9"] = "Posa Sexy 2",
    ["ani10"] = "Posa Sexy 3",
-------------------------MENU' SMONTARMI----------------------------
    ["menusmonta"] = "SMONTA ARMI",
    ["smontaon"] = "Smonta ",
    ["progresson"] = "Smontando..",
    ["mostrame"] = "Sta Smontando",
-------------------------MENU' GPS----------------------------
    ["menugps"] = "GESTIONE GPS",
    ["poli"] = "Posizione Polizia",
    ["ambu"] = "Posizione Ambulanza",
    ["banca"] = "Posizione Banca",
    ["scuol"] = "Posizione Scuola Guida",
    ["poliziafatt"] = "Hai impostato il gps alla Polizia!",
    ["ambulanzafatt"] = "Hai impostato il gps all'Ambulatorio!",
    ["bancafatt"] = "Hai posizionato il gps alla Banca centrale!",
    ["scuolafatt"] = "Hai posizionato il gps alla Scuola Guida!",
-------------------------MENU' FPS----------------------------
    ["menufps"] = "GESTIONE FPS",
    ["colore"] = "Colore",
    ["dist1"] = "Distanza Bassa",
    ["dist2"] = "Distanza Media",
    ["dist3"] = "Distanza Alta",
    ["colore2"] = "Hai impostato i Colori",
    ["colore3"] = "Hai riempostato i Colori",
    ["ondist1"] = "Hai Attivato la Distanza Bassa",
    ["ondist2"] = "Hai Attivato la Distanza Media",
    ["ondist3"] = "Hai Attivato la Distanza Alta",
-------------------------MENU' FPS----------------------------
    ["menuadmin"] = "GESTIONE AMMINISTRATORE",
    ["tpm"] = "Tpm",
    ["godmode"] = "Godmode",
    ["metaon"] = "Teletrasportato con successo!",
    ["metaoff"] = "Devi mettere una meta!",
    ["godmodeon"] = "GodMode Attivata!",
    ["godmodeoff"] = "GodMode Disattivata!",
    ["ripa"] = "Ripara Veicolo",
    ["riba"] = "Ribalta Veicolo",
    ["vrip"] = "Veicolo Riparato!",
    ["vripn"] = "Devi essere in un veicolo per ripararlo!",
    ["vgirato"] = "Veicolo Girato!",
    ["giubb"] = "Givvati Giubbotto Antiproiettile",
    ["cargive"] = "Givvati un Auto",
    ["giubbon"] = "Giubbotto Antiproiettile inserito!",
    ["soldipuliti"] = "Givvati Soldi Puliti",
    ["soldisporchi"] = "Givvati Soldi Sporchi",
    ["givvato"] = "Ti sei givvato ",
    ["givvatosporchi"] = "soldi sporchi",
    ["importo"] = "Importo di soldi",
    ["importo2"] = "Importo non valido!",
    ["skin"] = "Dai Skin Menù",
    ["wipe"] = "Wipe Player",
    ["titlewipe"] = "Inserisci l'id della persona da fare il wipe!"
}
---------------| Developed by BabyDrill#7768 |---------------
