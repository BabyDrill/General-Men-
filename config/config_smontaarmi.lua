SmontaArmi = {}

SmontaArmi.Weapons = {
    -- MELEE
    WEAPON_DAGGER = {label = 'Coltello antico', item = 'antico'},
    WEAPON_BAT = {label = 'Mazza', item = 'mazza'},
    WEAPON_CROWBAR = {label = 'Piede di porco', item = 'piede'},
    WEAPON_FLASHLIGHT = {label = 'Torcia', item = 'torcia'},
    WEAPON_HATCHET = {label = 'Accetta', item = 'accetta'},
    WEAPON_KNUCKLE = {label = 'Tirapugni', item = 'tirapugni'},
    WEAPON_KNIFE = {label = 'Coltello', item = 'coltello'},
    WEAPON_MACHETE = {label = 'Machete', item = 'machete'},
    WEAPON_SWITCHBLADE = {label = 'Switchblade', item = 'switchblade'},
    WEAPON_NIGHTSTICK = {label = 'Manganello', item = 'manganello'},
    WEAPON_WRENCH = {label = 'Giratubi', item = 'giratubi'},
    WEAPON_BATTLEAXE = {label = 'Ascia', item = 'ascia'},

    -- PISTOLE
    WEAPON_PISTOL = {
        label = 'Pistola',
        item = 'pistola',
        clip_item = 'pAmmo',
        rpc = 36
    },
    WEAPON_PISTOL_MK2 = {
        label = 'Pistola MK2',
        item = 'pistolamk2',
        clip_item = 'pAmmo',
        rpc = 36
    },
    WEAPON_VINTAGEPISTOL = {
        label = 'Pistola Vintage',
        item = 'pistolavintage',
        clip_item = 'pAmmo',
        rpc = 36
    },
    WEAPON_COMBATPISTOL = {
        label = 'Pistola da combattimento',
        item = 'pistoladacombattimento',
        clip_item = 'pAmmo',
        rpc = 36
    },
    WEAPON_APPISTOL = {
        label = 'AP Pistol',
        item = 'appistol',
        clip_item = 'pAmmo',
        rpc = 36
    },
    WEAPON_STUNGUN = {
        label = 'Storditore',
        item = 'storditore'
    },
    WEAPON_PISTOL50 = {
        label = 'Pistola calibro 50',
        item = 'pistola50',
        clip_item = 'pAmmo',
        rpc = 36
    },
    WEAPON_SNSPISTOL = {
        label = 'Pistola SNS',
        item = 'snspistol',
        clip_item = 'pAmmo',
        rpc = 36
    },
    WEAPON_HEAVYPISTOL = {
        label = 'Pistola Pesante',
        item = 'heavypistol',
        clip_item = 'pAmmo',
        rpc = 36
    },
    WEAPON_REVOLVER = {
        label = 'Revolver',
        item = 'revolver',
        clip_item = 'pAmmo',
        rpc = 36
    },
    WEAPON_DOUBLEACTION = {
        label = 'Revolver a Doppia Azione',
        item = 'doubleaction',
        clip_item = 'pAmmo',
        rpc = 36
    },

    -- AUTOMATICHE LEGGERE
    WEAPON_MICROSMG = {
        label = 'Micro SMG',
        item = 'uzi',
        clip_item = 'mgAmmo',
        rpc = 60
    },
    WEAPON_SMG = {
        label = 'SMG', 
        item = 'smg', 
        clip_item = 'mgAmmo', 
        rpc = 60
    },
    WEAPON_ASSAULTSMG = {
        label = 'P90',
        item = 'assaultsmg',
        clip_item = 'mgAmmo',
        rpc = 60
    },
    WEAPON_COMBATPDW = {
        label = 'PDW Da Combattimento',
        item = 'combatpdw',
        clip_item = 'mgAmmo',
        rpc = 60
    },
    WEAPON_MACHINEPISTOL = {
        label = 'Machine Pistol',
        item = 'machinepistol',
        clip_item = 'mgAmmo',
        rpc = 60
    },
    WEAPON_MINISMG = {
        label = 'Mini SMG',
        item = 'minismg',
        clip_item = 'mgAmmo',
        rpc = 60
    },	

    -- FUCILI A POMPA
    WEAPON_PUMPSHOTGUN = {
        label = 'Fucile a pompa',
        item = 'pompa',
        clip_item = 'sgAmmo',
        rpc = 36
    },
    WEAPON_SAWNOFFSHOTGUN = {
        label = 'Sawn off',
        item = 'sawnoff',
        clip_item = 'sgAmmo',
        rpc = 24
    },
    WEAPON_DBSHOTGUN = {
        label = 'Canne mozze',
        item = 'dbshotgun',
        clip_item = 'sgAmmo',
        rpc = 24
    },

    -- FUCILI D'ASSALTO
    WEAPON_ASSAULTRIFLE = {
        label = 'AK',
        item = 'ak',
        clip_item = 'arAmmo',
        rpc = 60
    },
    WEAPON_CARBINERIFLE = {
        label = 'Carabina',
        item = 'carabina',
        clip_item = 'arAmmo',
        rpc = 60
    },
    WEAPON_CARBINERIFLE_MK2 = {
        label = 'Carabina MK2',
        item = 'carabinamk2',
        clip_item = 'arAmmo',
        rpc = 36
    },
    WEAPON_ADVANCEDRIFLE = {
        label = 'Fucile avanzato',
        item = 'advancedrifle',
        clip_item = 'arAmmo',
        rpc = 60
    },
    WEAPON_SPECIALCARBINE = {
        label = 'G36',
        item = 'specialcarbine',
        clip_item = 'arAmmo',
        rpc = 60
    },
    WEAPON_BULLPUPRIFLE = {
        label = 'Famas',
        item = 'famas',
        clip_item = 'arAmmo',
        rpc = 60
    },
    WEAPON_COMPACTRIFLE = {
        label = 'Compact rifle',
        item = 'compactrifle',
        clip_item = 'arAmmo',
        rpc = 60
    },

    -- GUSENBERG
    WEAPON_GUSENBERG = {
        label = 'Thompson',
        item = 'thompson',
        clip_item = 'mgAmmo',
        rpc = 60
    },

    -- CECCHINI
    WEAPON_SNIPERRIFLE = {
        label = 'Cecchino',
        item = 'cecchino2',
        clip_item = 'cecAmmo',
        rpc = 6 -- GTA 10
    },
    WEAPON_MARKSMANRIFLE = {
        label = 'Fucile di precisione',
        item = 'cecchino',
        clip_item = 'cecAmmo',
        rpc = 6 -- GTA 8
    }--[[,

    -- THROWABLES
    WEAPON_BZGAS = {
        label = 'Granata a gas',
        item = 'gasdue'
    },
    WEAPON_SMOKEGRENADE = {
        label = 'Granata a gas',
        item = 'gas'
    },

    -- MISC
    WEAPON_PETROLCAN = {
        label = 'Tanica di benzina',
        item = 'tanica'
    }--]]
    
}