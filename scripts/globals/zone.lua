------------------------------------
--
-- Contains global functions and variables
-- related to area specific things
--
------------------------------------
require("scripts/globals/settings")
------------------------------------

dsp = dsp or {}

dsp.zoneType = {
    NONE = 0,
    CITY = 1,
    OUTDOORS = 2,
    DUNGEON = 3,
    BATTLEFIELD = 4,
    DYNAMIS = 5,
    INSTANCED = 6
}

dsp.continent = {
    THE_MIDDLE_LANDS = 1,
    THE_ARADJIAH_CONTINENT = 2,
    THE_SHADOWREIGN_ERA = 3,
    OTHER_AREAS = 4
}

dsp.region = {
    RONFAURE = 0,
    ZULKHEIM = 1,
    NORVALLEN = 2,
    GUSTABERG = 3,
    DERFLAND = 4,
    SARUTABARUTA = 5,
    KOLSHUSHU = 6,
    ARAGONEU = 7,
    FAUREGANDI = 8,
    VALDEAUNIA = 9,
    QUFIMISLAND = 10,
    LITELOR = 11,
    KUZOTZ = 12,
    VOLLBOW = 13,
    ELSHIMOLOWLANDS = 14,
    ELSHIMOUPLANDS = 15,
    TULIA = 16,
    MOVALPOLOS = 17,
    TAVNAZIANARCH = 18,
    SANDORIA = 19,
    BASTOK = 20,
    WINDURST = 21,
    JEUNO = 22,
    DYNAMIS = 23,
    TAVNAZIAN_MARQ = 24,
    PROMYVION = 25,
    LUMORIA = 26,
    LIMBUS = 27,
    WEST_AHT_URHGAN = 28,
    MAMOOL_JA_SAVAGE = 29,
    HALVUNG = 30,
    ARRAPAGO = 31,
    ALZADAAL = 32,
    RONFAURE_FRONT = 33,
    NORVALLEN_FRONT = 34,
    GUSTABERG_FRONT = 35,
    DERFLAND_FRONT = 36,
    SARUTA_FRONT = 37,
    ARAGONEAU_FRONT = 38,
    FAUREGANDI_FRONT = 39,
    VALDEAUNIA_FRONT = 40,
    ABYSSEA = 41,
    THE_THRESHOLD = 42,
    ABDHALJS = 43,
    ADOULIN_ISLANDS = 44,
    EAST_ULBUKA = 45,
    UNKNOWN = 255
}

dsp.nation = {
    SANDORIA = 0,
    BASTOK = 1,
    WINDURST = 2,
    BEASTMEN = 3,
    OTHER = 4
}

dsp.zone = {
    UNKNOWN = 0,
    PHANAUET_CHANNEL = 1,
    CARPENTERS_LANDING = 2,
    MANACLIPPER = 3,
    BIBIKI_BAY = 4,
    ULEGUERAND_RANGE = 5,
    BEARCLAW_PINNACLE = 6,
    ATTOHWA_CHASM = 7,
    BONEYARD_GULLY = 8,
    PSOXJA = 9,
    THE_SHROUDED_MAW = 10,
    OLDTON_MOVALPOLOS = 11,
    NEWTON_MOVALPOLOS = 12,
    MINE_SHAFT_2716 = 13,
    HALL_OF_TRANSFERENCE = 14,
    ABYSSEA_KONSCHTAT = 15,
    PROMYVION_HOLLA = 16,
    SPIRE_OF_HOLLA = 17,
    PROMYVION_DEM = 18,
    SPIRE_OF_DEM = 19,
    PROMYVION_MEA = 20,
    SPIRE_OF_MEA = 21,
    PROMYVION_VAHZL = 22,
    SPIRE_OF_VAHZL = 23,
    LUFAISE_MEADOWS = 24,
    MISAREAUX_COAST = 25,
    TAVNAZIAN_SAFEHOLD = 26,
    PHOMIUNA_AQUEDUCTS = 27,
    SACRARIUM = 28,
    RIVERNE_SITE_B01 = 29,
    RIVERNE_SITE_A01 = 30,
    MONARCH_LINN = 31,
    SEALIONS_DEN = 32,
    ALTAIEU = 33,
    GRAND_PALACE_OF_HUXZOI = 34,
    THE_GARDEN_OF_RUHMET = 35,
    EMPYREAL_PARADOX = 36,
    TEMENOS = 37,
    APOLLYON = 38,
    DYNAMIS_VALKURM = 39,
    DYNAMIS_BUBURIMU = 40,
    DYNAMIS_QUFIM = 41,
    DYNAMIS_TAVNAZIA = 42,
    DIORAMA_ABDHALJS_GHELSBA = 43,
    ABDHALJS_ISLE_PURGONORGO = 44,
    ABYSSEA_TAHRONGI = 45,
    OPEN_SEA_ROUTE_TO_AL_ZAHBI = 46,
    OPEN_SEA_ROUTE_TO_MHAURA = 47,
    AL_ZAHBI = 48,
    AHT_URHGAN_WHITEGATE = 50,
    WAJAOM_WOODLANDS = 51,
    BHAFLAU_THICKETS = 52,
    NASHMAU = 53,
    ARRAPAGO_REEF = 54,
    ILRUSI_ATOLL = 55,
    PERIQIA = 56,
    TALACCA_COVE = 57,
    SILVER_SEA_ROUTE_TO_NASHMAU = 58,
    SILVER_SEA_ROUTE_TO_AL_ZAHBI = 59,
    THE_ASHU_TALIF = 60,
    MOUNT_ZHAYOLM = 61,
    HALVUNG = 62,
    LEBROS_CAVERN = 63,
    NAVUKGO_EXECUTION_CHAMBER = 64,
    MAMOOK = 65,
    MAMOOL_JA_TRAINING_GROUNDS = 66,
    JADE_SEPULCHER = 67,
    AYDEEWA_SUBTERRANE = 68,
    LEUJAOAM_SANCTUM = 69,
    CHOCOBO_CIRCUIT = 70,
    THE_COLOSSEUM = 71,
    ALZADAAL_UNDERSEA_RUINS = 72,
    ZHAYOLM_REMNANTS = 73,
    ARRAPAGO_REMNANTS = 74,
    BHAFLAU_REMNANTS = 75,
    SILVER_SEA_REMNANTS = 76,
    NYZUL_ISLE = 77,
    HAZHALM_TESTING_GROUNDS = 78,
    CAEDARVA_MIRE = 79,
    SOUTHERN_SAN_DORIA_S = 80,
    EAST_RONFAURE_S = 81,
    JUGNER_FOREST_S = 82,
    VUNKERL_INLET_S = 83,
    BATALLIA_DOWNS_S = 84,
    LA_VAULE_S = 85,
    EVERBLOOM_HOLLOW = 86,
    BASTOK_MARKETS_S = 87,
    NORTH_GUSTABERG_S = 88,
    GRAUBERG_S = 89,
    PASHHOW_MARSHLANDS_S = 90,
    ROLANBERRY_FIELDS_S = 91,
    BEADEAUX_S = 92,
    RUHOTZ_SILVERMINES = 93,
    WINDURST_WATERS_S = 94,
    WEST_SARUTABARUTA_S = 95,
    FORT_KARUGO_NARUGO_S = 96,
    MERIPHATAUD_MOUNTAINS_S = 97,
    SAUROMUGUE_CHAMPAIGN_S = 98,
    CASTLE_OZTROJA_S = 99,
    WEST_RONFAURE = 100,
    EAST_RONFAURE = 101,
    LA_THEINE_PLATEAU = 102,
    VALKURM_DUNES = 103,
    JUGNER_FOREST = 104,
    BATALLIA_DOWNS = 105,
    NORTH_GUSTABERG = 106,
    SOUTH_GUSTABERG = 107,
    KONSCHTAT_HIGHLANDS = 108,
    PASHHOW_MARSHLANDS = 109,
    ROLANBERRY_FIELDS = 110,
    BEAUCEDINE_GLACIER = 111,
    XARCABARD = 112,
    CAPE_TERIGGAN = 113,
    EASTERN_ALTEPA_DESERT = 114,
    WEST_SARUTABARUTA = 115,
    EAST_SARUTABARUTA = 116,
    TAHRONGI_CANYON = 117,
    BUBURIMU_PENINSULA = 118,
    MERIPHATAUD_MOUNTAINS = 119,
    SAUROMUGUE_CHAMPAIGN = 120,
    THE_SANCTUARY_OF_ZITAH = 121,
    ROMAEVE = 122,
    YUHTUNGA_JUNGLE = 123,
    YHOATOR_JUNGLE = 124,
    WESTERN_ALTEPA_DESERT = 125,
    QUFIM_ISLAND = 126,
    BEHEMOTHS_DOMINION = 127,
    VALLEY_OF_SORROWS = 128,
    GHOYUS_REVERIE = 129,
    RUAUN_GARDENS = 130,
    MORDION_GAOL = 131,
    ABYSSEA_LA_THEINE = 132,
    DYNAMIS_BEAUCEDINE = 134,
    DYNAMIS_XARCABARD = 135,
    BEAUCEDINE_GLACIER_S = 136,
    XARCABARD_S = 137,
    CASTLE_ZVAHL_BAILEYS_S = 138,
    HORLAIS_PEAK = 139,
    GHELSBA_OUTPOST = 140,
    FORT_GHELSBA = 141,
    YUGHOTT_GROTTO = 142,
    PALBOROUGH_MINES = 143,
    WAUGHROON_SHRINE = 144,
    GIDDEUS = 145,
    BALGAS_DAIS = 146,
    BEADEAUX = 147,
    QULUN_DOME = 148,
    DAVOI = 149,
    MONASTIC_CAVERN = 150,
    CASTLE_OZTROJA = 151,
    ALTAR_ROOM = 152,
    THE_BOYAHDA_TREE = 153,
    DRAGONS_AERY = 154,
    CASTLE_ZVAHL_KEEP_S = 155,
    THRONE_ROOM_S = 156,
    MIDDLE_DELKFUTTS_TOWER = 157,
    UPPER_DELKFUTTS_TOWER = 158,
    TEMPLE_OF_UGGALEPIH = 159,
    DEN_OF_RANCOR = 160,
    CASTLE_ZVAHL_BAILEYS = 161,
    CASTLE_ZVAHL_KEEP = 162,
    SACRIFICIAL_CHAMBER = 163,
    GARLAIGE_CITADEL_S = 164,
    THRONE_ROOM = 165,
    RANGUEMONT_PASS = 166,
    BOSTAUNIEUX_OUBLIETTE = 167,
    CHAMBER_OF_ORACLES = 168,
    TORAIMARAI_CANAL = 169,
    FULL_MOON_FOUNTAIN = 170,
    CRAWLERS_NEST_S = 171,
    ZERUHN_MINES = 172,
    KORROLOKA_TUNNEL = 173,
    KUFTAL_TUNNEL = 174,
    THE_ELDIEME_NECROPOLIS_S = 175,
    SEA_SERPENT_GROTTO = 176,
    VELUGANNON_PALACE = 177,
    THE_SHRINE_OF_RUAVITAU = 178,
    STELLAR_FULCRUM = 179,
    LALOFF_AMPHITHEATER = 180,
    THE_CELESTIAL_NEXUS = 181,
    WALK_OF_ECHOES = 182,
    MAQUETTE_ABDHALJS_LEGION = 183,
    LOWER_DELKFUTTS_TOWER = 184,
    DYNAMIS_SAN_DORIA = 185,
    DYNAMIS_BASTOK = 186,
    DYNAMIS_WINDURST = 187,
    DYNAMIS_JEUNO = 188,
    RESIDENTIAL_AREA = 189,
    KING_RANPERRES_TOMB = 190,
    DANGRUF_WADI = 191,
    INNER_HORUTOTO_RUINS = 192,
    ORDELLES_CAVES = 193,
    OUTER_HORUTOTO_RUINS = 194,
    THE_ELDIEME_NECROPOLIS = 195,
    GUSGEN_MINES = 196,
    CRAWLERS_NEST = 197,
    MAZE_OF_SHAKHRAMI = 198,
    RESIDENTIAL_AREA = 199,
    GARLAIGE_CITADEL = 200,
    CLOISTER_OF_GALES = 201,
    CLOISTER_OF_STORMS = 202,
    CLOISTER_OF_FROST = 203,
    FEIYIN = 204,
    IFRITS_CAULDRON = 205,
    QUBIA_ARENA = 206,
    CLOISTER_OF_FLAMES = 207,
    QUICKSAND_CAVES = 208,
    CLOISTER_OF_TREMORS = 209,
    GM_HOME = 210,
    CLOISTER_OF_TIDES = 211,
    GUSTAV_TUNNEL = 212,
    LABYRINTH_OF_ONZOZO = 213,
    RESIDENTIAL_AREA = 214,
    ABYSSEA_ATTOHWA = 215,
    ABYSSEA_MISAREAUX = 216,
    ABYSSEA_VUNKERL = 217,
    ABYSSEA_ALTEPA = 218,
    RESIDENTIAL_AREA = 219,
    SHIP_BOUND_FOR_SELBINA = 220,
    SHIP_BOUND_FOR_MHAURA = 221,
    PROVENANCE = 222,
    SAN_DORIA_JEUNO_AIRSHIP = 223,
    BASTOK_JEUNO_AIRSHIP = 224,
    WINDURST_JEUNO_AIRSHIP = 225,
    KAZHAM_JEUNO_AIRSHIP = 226,
    SHIP_BOUND_FOR_SELBINA_PIRATES = 227,
    SHIP_BOUND_FOR_MHAURA_PIRATES = 228,
    SOUTHERN_SAN_DORIA = 230,
    NORTHERN_SAN_DORIA = 231,
    PORT_SAN_DORIA = 232,
    CHATEAU_DORAGUILLE = 233,
    BASTOK_MINES = 234,
    BASTOK_MARKETS = 235,
    PORT_BASTOK = 236,
    METALWORKS = 237,
    WINDURST_WATERS = 238,
    WINDURST_WALLS = 239,
    PORT_WINDURST = 240,
    WINDURST_WOODS = 241,
    HEAVENS_TOWER = 242,
    RULUDE_GARDENS = 243,
    UPPER_JEUNO = 244,
    LOWER_JEUNO = 245,
    PORT_JEUNO = 246,
    RABAO = 247,
    SELBINA = 248,
    MHAURA = 249,
    KAZHAM = 250,
    HALL_OF_THE_GODS = 251,
    NORG = 252,
    ABYSSEA_ULEGUERAND = 253,
    ABYSSEA_GRAUBERG = 254,
    ABYSSEA_EMPYREAL_PARADOX = 255,
    WESTERN_ADOULIN = 256,
    EASTERN_ADOULIN = 257,
    RALA_WATERWAYS = 258,
    RALA_WATERWAYS_U = 259,
    YAHSE_HUNTING_GROUNDS = 260,
    CEIZAK_BATTLEGROUNDS = 261,
    FORET_DE_HENNETIEL = 262,
    YORCIA_WEALD = 263,
    YORCIA_WEALD_U = 264,
    MORIMAR_BASALT_FIELDS = 265,
    MARJAMI_RAVINE = 266,
    KAMIHR_DRIFTS = 267,
    SIH_GATES = 268,
    MOH_GATES = 269,
    CIRDAS_CAVERNS = 270,
    CIRDAS_CAVERNS_U = 271,
    DHO_GATES = 272,
    WOH_GATES = 273,
    OUTER_RAKAZNAR = 274,
    OUTER_RAKAZNAR_U = 275,
    RAKAZNAR_INNER_COURT = 276,
    RAKAZNAR_TURRIS = 277,
    MOG_GARDEN = 280,
    LEAFALLIA = 281,
    MOUNT_KAMIHR = 282,
    SILVER_KNIFE = 283,
    CELENNIA_MEMORIAL_LIBRARY = 284,
    FERETORY = 285,
    ESCHA_ZITAH = 288,
    ESCHA_RUAUN = 289,
    DESUETIA_EMPYREAL_PARADOX = 290,
    REISENJIMA = 291,
    REISENJIMA_HENGE = 292,
    REISENJIMA_SANCTORIUM = 293,
    DYNAMIS_SAN_DORIA_D = 294,
    DYNAMIS_BASTOK_D = 295,
    DYNAMIS_WINDURST_D = 296,
    DYNAMIS_JEUNO_D = 297
}

dsp.expansionZone.ORIGINAL_ROTZ = {
    [dsp.zone.WEST_RONFAURE] = true,
    [dsp.zone.EAST_RONFAURE] = true,
    [dsp.zone.LA_THEINE_PLATEAU] = true,
    [dsp.zone.VALKURM_DUNES] = true,
    [dsp.zone.JUGNER_FOREST] = true,
    [dsp.zone.BATALLIA_DOWNS] = true,
    [dsp.zone.NORTH_GUSTABERG] = true,
    [dsp.zone.SOUTH_GUSTABERG] = true,
    [dsp.zone.KONSCHTAT_HIGHLANDS] = true,
    [dsp.zone.PASHHOW_MARSHLANDS] = true,
    [dsp.zone.ROLANBERRY_FIELDS] = true,
    [dsp.zone.BEAUCEDINE_GLACIER] = true,
    [dsp.zone.XARCABARD] = true,
    [dsp.zone.CAPE_TERIGGAN] = true,
    [dsp.zone.EASTERN_ALTEPA_DESERT] = true,
    [dsp.zone.WEST_SARUTABARUTA] = true,
    [dsp.zone.EAST_SARUTABARUTA] = true,
    [dsp.zone.TAHRONGI_CANYON] = true,
    [dsp.zone.BUBURIMU_PENINSULA] = true,
    [dsp.zone.MERIPHATAUD_MOUNTAINS] = true,
    [dsp.zone.SAUROMUGUE_CHAMPAIGN] = true,
    [dsp.zone.THE_SANCTUARY_OF_ZITAH] = true,
    [dsp.zone.ROMAEVE] = true,
    [dsp.zone.YUHTUNGA_JUNGLE] = true,
    [dsp.zone.YHOATOR_JUNGLE] = true,
    [dsp.zone.WESTERN_ALTEPA_DESERT] = true,
    [dsp.zone.QUFIM_ISLAND] = true,
    [dsp.zone.BEHEMOTHS_DOMINION] = true,
    [dsp.zone.VALLEY_OF_SORROWS] = true,
    [dsp.zone.RUAUN_GARDENS] = true,
    [dsp.zone.MORDION_GAOL] = true,
    [dsp.zone.DYNAMIS_BEAUCEDINE] = true,
    [dsp.zone.DYNAMIS_XARCABARD] = true,
    [dsp.zone.HORLAIS_PEAK] = true,
    [dsp.zone.GHELSBA_OUTPOST] = true,
    [dsp.zone.FORT_GHELSBA] = true,
    [dsp.zone.YUGHOTT_GROTTO] = true,
    [dsp.zone.PALBOROUGH_MINES] = true,
    [dsp.zone.WAUGHROON_SHRINE] = true,
    [dsp.zone.GIDDEUS] = true,
    [dsp.zone.BALGAS_DAIS] = true,
    [dsp.zone.BEADEAUX] = true,
    [dsp.zone.QULUN_DOME] = true,
    [dsp.zone.DAVOI] = true,
    [dsp.zone.MONASTIC_CAVERN] = true,
    [dsp.zone.CASTLE_OZTROJA] = true,
    [dsp.zone.ALTAR_ROOM] = true,
    [dsp.zone.THE_BOYAHDA_TREE] = true,
    [dsp.zone.DRAGONS_AERY] = true,
    [dsp.zone.MIDDLE_DELKFUTTS_TOWER] = true,
    [dsp.zone.UPPER_DELKFUTTS_TOWER] = true,
    [dsp.zone.TEMPLE_OF_UGGALEPIH] = true,
    [dsp.zone.DEN_OF_RANCOR] = true,
    [dsp.zone.CASTLE_ZVAHL_BAILEYS] = true,
    [dsp.zone.CASTLE_ZVAHL_KEEP] = true,
    [dsp.zone.SACRIFICIAL_CHAMBER] = true,
    [dsp.zone.THRONE_ROOM] = true,
    [dsp.zone.RANGUEMONT_PASS] = true,
    [dsp.zone.BOSTAUNIEUX_OUBLIETTE] = true,
    [dsp.zone.CHAMBER_OF_ORACLES] = true,
    [dsp.zone.TORAIMARAI_CANAL] = true,
    [dsp.zone.FULL_MOON_FOUNTAIN] = true,
    [dsp.zone.ZERUHN_MINES] = true,
    [dsp.zone.KORROLOKA_TUNNEL] = true,
    [dsp.zone.KUFTAL_TUNNEL] = true,
    [dsp.zone.SEA_SERPENT_GROTTO] = true,
    [dsp.zone.VELUGANNON_PALACE] = true,
    [dsp.zone.THE_SHRINE_OF_RUAVITAU] = true,
    [dsp.zone.STELLAR_FULCRUM] = true,
    [dsp.zone.LALOFF_AMPHITHEATER] = true,
    [dsp.zone.THE_CELESTIAL_NEXUS] = true,
    [dsp.zone.LOWER_DELKFUTTS_TOWER] = true,
    [dsp.zone.DYNAMIS_SAN_DORIA] = true,
    [dsp.zone.DYNAMIS_BASTOK] = true,
    [dsp.zone.DYNAMIS_WINDURST] = true,
    [dsp.zone.DYNAMIS_JEUNO] = true,
    [dsp.zone.RESIDENTIAL_AREA] = true,
    [dsp.zone.KING_RANPERRES_TOMB] = true,
    [dsp.zone.DANGRUF_WADI] = true,
    [dsp.zone.INNER_HORUTOTO_RUINS] = true,
    [dsp.zone.ORDELLES_CAVES] = true,
    [dsp.zone.OUTER_HORUTOTO_RUINS] = true,
    [dsp.zone.THE_ELDIEME_NECROPOLIS] = true,
    [dsp.zone.GUSGEN_MINES] = true,
    [dsp.zone.CRAWLERS_NEST] = true,
    [dsp.zone.MAZE_OF_SHAKHRAMI] = true,
    [dsp.zone.RESIDENTIAL_AREA] = true,
    [dsp.zone.GARLAIGE_CITADEL] = true,
    [dsp.zone.CLOISTER_OF_GALES] = true,
    [dsp.zone.CLOISTER_OF_STORMS] = true,
    [dsp.zone.CLOISTER_OF_FROST] = true,
    [dsp.zone.FEIYIN] = true,
    [dsp.zone.IFRITS_CAULDRON] = true,
    [dsp.zone.QUBIA_ARENA] = true,
    [dsp.zone.CLOISTER_OF_FLAMES] = true,
    [dsp.zone.QUICKSAND_CAVES] = true,
    [dsp.zone.CLOISTER_OF_TREMORS] = true,
    [dsp.zone.GM_HOME] = true,
    [dsp.zone.CLOISTER_OF_TIDES] = true,
    [dsp.zone.GUSTAV_TUNNEL] = true,
    [dsp.zone.LABYRINTH_OF_ONZOZO] = true,
    [dsp.zone.RESIDENTIAL_AREA] = true,
    [dsp.zone.RESIDENTIAL_AREA] = true,
    [dsp.zone.SHIP_BOUND_FOR_SELBINA] = true,
    [dsp.zone.SHIP_BOUND_FOR_MHAURA] = true,
    [dsp.zone.SAN_DORIA_JEUNO_AIRSHIP] = true,
    [dsp.zone.BASTOK_JEUNO_AIRSHIP] = true,
    [dsp.zone.WINDURST_JEUNO_AIRSHIP] = true,
    [dsp.zone.KAZHAM_JEUNO_AIRSHIP] = true,
    [dsp.zone.SHIP_BOUND_FOR_SELBINA_PIRATES] = true,
    [dsp.zone.SHIP_BOUND_FOR_MHAURA_PIRATES] = true,
    [dsp.zone.SOUTHERN_SAN_DORIA] = true,
    [dsp.zone.NORTHERN_SAN_DORIA] = true,
    [dsp.zone.PORT_SAN_DORIA] = true,
    [dsp.zone.CHATEAU_DORAGUILLE] = true,
    [dsp.zone.BASTOK_MINES] = true,
    [dsp.zone.BASTOK_MARKETS] = true,
    [dsp.zone.PORT_BASTOK] = true,
    [dsp.zone.METALWORKS] = true,
    [dsp.zone.WINDURST_WATERS] = true,
    [dsp.zone.WINDURST_WALLS] = true,
    [dsp.zone.PORT_WINDURST] = true,
    [dsp.zone.WINDURST_WOODS] = true,
    [dsp.zone.HEAVENS_TOWER] = true,
    [dsp.zone.RULUDE_GARDENS] = true,
    [dsp.zone.UPPER_JEUNO] = true,
    [dsp.zone.LOWER_JEUNO] = true,
    [dsp.zone.PORT_JEUNO] = true,
    [dsp.zone.RABAO] = true,
    [dsp.zone.SELBINA] = true,
    [dsp.zone.MHAURA] = true,
    [dsp.zone.KAZHAM] = true,
    [dsp.zone.HALL_OF_THE_GODS] = true,
    [dsp.zone.NORG] = true
}

-----------------------------------
-- SetExplorerMoogles
----------------------------------

function SetExplorerMoogles(moogle)
    if EXPLORER_MOOGLE == 1 then
        local npc = GetNPCByID(moogle)
        if npc == nil then
            printf("'SetExplorerMoogles' Error trying to load undefined npc (%d)", moogle)
        else
            npc:setStatus(0)
        end
    end
end
