---------------------------------------------------------------------------------------------------
-- func: zone
-- auth: <Unknown> :: Modded by atom0s.
-- desc: Teleports a player to the given zone.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

local placenames_1 = 
{
   xA9 = 1,    -- Phanauet Channel
   xAA = 2,    -- Carpenter's Landing
   x84 = 3,    -- Manaclipper
   x85 = 4,    -- Bibiki Bay
   x8A = 5,    -- Uleguerand Range
   x8B = 6,    -- Bearclaw Pinnacle
   x86 = 7,    -- Attohwa Chasm
   x87 = 8,    -- Boneyard Gully
   x88 = 9,    -- Pso'Xja
   x89 = 10,   -- The Shrouded Maw
   x8C = 11,   -- Oldton Movalpolos
   x8D = 12,   -- Newton Movalpolos
   xDC = 13,   -- Mine Shaft #2716
   xAB = 14,   -- Hall of Transference
   x9B = 16,   -- Promyvion-Holla
   x9C = 17,   -- Spire of Holla
   x9D = 18,   -- Promyvion-Dem
   x9E = 19,   -- Spire of Dem
   xA1 = 20,   -- Promyvion-Mea
   xA2 = 21,   -- Spire of Mea
   xA4 = 22,   -- Promyvion-Vahzl
   xA8 = 23,   -- Spire of Vahzl
   x90 = 24,   -- Lufaise Meadows
   x91 = 25,   -- Misareaux Coast
   x8F = 26,   -- Tavnazian Safehold
   x93 = 27,   -- Phomiuna Aquaducts
   x94 = 28,   -- Sacrarium
   x96 = 29,   -- Riverne Site #B01
   x98 = 30,   -- Riverne Site #A01
   x99 = 31,   -- Monarch Linn
   x92 = 32,   -- Sealion's Den
   xAC = 33,   -- Al'Taieu
   xAD = 34,   -- Grand Palace of Hu'Xzoi
   xAE = 35,   -- The Garden of Ru'Hmet
   xB0 = 36,   -- Empyreal Paradox
   xB1 = 37,   -- Temenos
   xB2 = 38,   -- Apollyon
   xB4 = 39,   -- Dynamis - Valkurm
   xB5 = 40,   -- Dynamis - Buburimu
   xB6 = 41,   -- Dynamis - Qufim
   xB7 = 42,   -- Dynamis - Tavnazia
   xAF = 43,   -- Diorama Abdhaljs-Ghelsba
   xB8 = 44,   -- Abhaljs Isle-Purgonorgo
   xB9 = 46,   -- Open sea route to Al Zhabi
   xBA = 47,   -- Open sea route to Mhaura
   xBB = 48,   -- Al Zahbi
   xBC = 50,   -- Aht Urghan Whitegate
   xBD = 51,   -- Wajaom Woodlands
   xE0 = 52,   -- Bhaflau Thickets
   xBF = 53,   -- Nashmau
   xC0 = 54,   -- Arrapago Reef
   xC1 = 55,   -- Ilrusi Atoll
   xC2 = 56,   -- Periqia
   xC3 = 57,   -- Talacca Cove
   xC4 = 58,   -- Silver Sea route to Nashmau
   x59 = 59,   -- Silver Sea route to Al Zhabi
   xC6 = 60,   -- The Ashu Talif
   xC7 = 61,   -- Mount Zhayolm
   xC8 = 62,   -- Halvung
   xC9 = 63,   -- Lebros Cavern
   xCA = 64,   -- Navukgo Execution Chamber
   xCB = 65,   -- Mamook
   xCC = 66,   -- Mamool Ja Training Grounds
   xCD = 67,   -- Jade Sepulcher
   xCE = 68,   -- Aydeewa Subterrane
   xCF = 69,   -- Leujaoam Sanctum
   xDD = 72,   -- Alzadaal Undersea Ruins
   xDE = 73,   -- Zhayolm Remnants
   xDF = 74,   -- Arrapago Remnants
   xE0 = 75,   -- Bhaflau Remnants
   xE1 = 76,   -- Silver Sea Remnants
   xE2 = 77,   -- Nyzul Isle
   xDA = 78,   -- Hazhalm Testing Grounds
   xD0 = 79,   -- Caedarva Mire
   x11 = 100,  -- West Ronfaure
   x0F = 101,  -- East Ronfaure
   x51 = 102,  -- La Theine Plateau
   x60 = 103,  -- Valkurm Dunes
   x01 = 104,  -- Jugner Forest 
   x02 = 105,  -- Batallia Downs
   x64 = 106,  -- North Gustaberg
   x63 = 107,  -- South Gustaberg
   x69 = 108,  -- Konschtat Highlands
   x2B = 109,  -- Pashhow Marshlands
   x07 = 110,  -- Rolanberry Fields
   x24 = 111,  -- Beaucedine Glacier
   x4D = 112,  -- Xarcabard
   x3D = 113,  -- Cape Teriggan
   x3E = 114,  -- Eastern Altepa Desert
   x18 = 115,  -- West Sarutabaruta
   x27 = 116,  -- East Sarutabaruta
   x17 = 117,  -- Tahrongi Canyon
   x16 = 118,  -- Buburimu Peninsula
   x2E = 120,  -- Sauromugue Champaign
   x3F = 121,  -- The Sanctuary of Zi'Tah
   x7D = 122,  -- Ro'Maeve
   x40 = 123,  -- Yuhtunga Jungle
   x41 = 124,  -- Yhoator Jungle
   x42 = 125,  -- Western Altepa Desert
   x08 = 126,  -- Qufim Island
   x43 = 128,  -- Valley of Sorrows
   x6F = 130,  -- Ru'Aun Gardens
   x82 = 134,  -- Dynamis - Beaucedine
   x83 = 135,  -- Dynamis - Xarcabard
   x64 = 139,  -- Horlais Peak
   x6C = 140,  -- Ghelsba Outpost
   x1F = 141,  -- Fort Ghelsba
   x5E = 142,  -- Yughott Grotto
   x66 = 143,  -- Palborough Mines
   x1A = 144,  -- Waughroon Shrine
   x21 = 145,  -- Giddeus
   x19 = 146,  -- Balga's Dais
   x2A = 147,  -- Beadeaux
   x28 = 148,  -- Qulun Dome
   x68 = 149,  -- Davoi
   x6D = 150,  -- Monastic Cavern
   x23 = 151,  -- Castle Oztroja
   x04 = 152,  -- Altar Room
   x44 = 153,  -- The Boyahda Tree
   x37 = 154,  -- Dragon's Aery
   x36 = 159,  -- Temple of Uggalepih
   x35 = 160,  -- Den of Rancor
   x25 = 161,  -- Castle Zvahl Baileys
   x4F = 162,  -- Castle Zvahl Keep
   x39 = 163,  -- Sacrificial Chamber
   x5D = 165,  -- Throne Room
   x2D = 166,  -- Ranguemont Pass
   x32 = 167,  -- Bostaunieux Oubliette
   x3B = 168,  -- Chamber of Oracles
   x1D = 169,  -- Toraimarai Canal
   x5C = 170,  -- Full Moon Fountain
   x61 = 172,  -- Zehurn Mines
   x5B = 173,  -- Korroloka Tunnel
   x5A = 174,  -- Kuftal Tunnel
   x59 = 176,  -- Sea Serpent Grotto
   x71 = 177,  -- Ve'Lugannon Palace
   x72 = 178,  -- The Shrine of Ru'Avitau
   xB3 = 179,  -- Stellar Fulcrum
   x73 = 180,  -- La'Loff Amphitheater
   x74 = 181,  -- The Celestial Nexus
   x7E = 185,  -- Dynamis - San d'Oria
   x7F = 186,  -- Dynamis - Bastok
   x80 = 187,  -- Dynamis - Windurst
   x81 = 188,  -- Dynamis - Jeuno
   x6E = 190,  -- King Ranperre's Tomb
   x62 = 191,  -- Dangruf Wadi
   x1C = 192,  -- Inner Horutoto Ruins
   x03 = 193,  -- Ordelle's Caves
   x1B = 194,  -- Outer Horutoto Ruins
   x6A = 195,  -- The Eldieme Necropolis
   x67 = 196,  -- Gusgen Mines
   x2C = 197,  -- Crawlers' Nest
   x15 = 198,  -- Maze of Shakhrami
   x14 = 200,  -- Garlaige Citadel
   x77 = 201,  -- Cloister of Gales
   x75 = 202,  -- Cloister of Storms
   x7A = 203,  -- Cloister of Frost
   x4A = 204,  -- Fei'Yin
   x58 = 205,  -- Ifrit's Cauldron
   x6B = 206,  -- Qu'Bia Arena
   x78 = 207,  -- Cloister of Flames
   x57 = 208,  -- Quicksand Caves
   x76 = 209,  -- Cloister of Tremors
   x79 = 211,  -- Cloister of Tides
   x34 = 212,  -- Gustav Tunnel
   x33 = 213,  -- Labyrinth of Onzozo
   x4C = 230,  -- Southern San d'Oria
   x30 = 231,  -- Northern San d'Oria
   x52 = 232,  -- Port San d'Oria
   x22 = 233,  -- Chateaux d'Oraguille
   x46 = 234,  -- Bastok Mines
   x56 = 235,  -- Bastok Markets
   x3C = 236,  -- Port Bastok
   x2F = 237,  -- Metalworks
   x3A = 238,  -- Windurst Waters
   x54 = 239,  -- Windurst Walls
   x3C = 240,  -- Port Windurst
   x38 = 241,  -- Windurst Woods
   x55 = 242,  -- Heavens Tower
   x13 = 243,  -- Ru'Lude Gardens
   x4E = 244,  -- Upper Jeuno
   x0E = 245,  -- Lower Jeuno
   x06 = 246,  -- Port Jeuno
   x31 = 247,  -- Rabao
   x5F = 248,  -- Selbina
   x1E = 249,  -- Mhaura
   x29 = 250,  -- Kazham
   x7B = 251   -- Hall of the Gods
};

local placenames_2 = 
{
   x0F = 70,   -- Chocobo Circuit
   x10 = 71,   -- The Colosseum
   x11 = 80,   -- Southern San d'Oria [S]
   x13 = 81,   -- East Ronfaure [S]
   x15 = 82,   -- Jugner Forest [S]
   x23 = 83,   -- Vunkerl Inlet [S]
   x17 = 84,   -- Batallia Downs [S]
   x3E = 85,   -- La Vaule [S]
   x19 = 86,   -- Everbloom Hollow
   x1C = 87,   -- Bastok Markets [S]
   x1E = 88,   -- North Gustaberg [S]
   x25 = 91,   -- Rolanberry Fields [S]
   x42 = 92,   -- Beadeaux [S]
   x22 = 93,   -- Ruhotz Silvermines
   x2B = 94,   -- Windurst Waters [S]
   x2D = 95,   -- West Sarutabaruta [S]
   x2F = 96,   -- Fort Karugo-Narugo [S]
   x32 = 97,   -- Meriphataud Mountains [S]
   x34 = 98,   -- Sauromugue Champaign [S]
   x44 = 99,   -- Castle Oztroja [S]
   x31 = 129,  -- Ghoyu's Reverie
   x46 = 136,  -- Beaucedine Glacier [S]
   x48 = 137,  -- Xarcabard [S]
   x36 = 164,  -- Garlaige Citadel [S]
   x29 = 171,  -- Crawler's Nest [S]
   x1A = 175,  -- The Eldieme Necropolis [S]
   x4C = 256,  -- Western Adoulin
   x4D = 257,  -- Eastern Adoulin
   x4E = 258,  -- Rala Waterways
   x4F = 260,  -- Yahse Hunting Grounds
   x50 = 261,  -- Ceizak Battlegrounds
   x51 = 262,  -- Foret de Hennetiel
   x52 = 265,  -- Morimar Basalt Fields
   x53 = 268,  -- Sih Gates
   x54 = 269,  -- Moh Gates
   x55 = 270   -- Cirdas Caverns
};

function onTrigger(player, zoneId)
    local word  = "";
    local i     = 0;
    local zone  = zoneId;

    -- Ensure a zone was given..
    if (zoneId == nil) then
        player:PrintToPlayer( "You must enter a zone id." );
        return;
    end
    
    -- Did the user enter a auto-translate word..
    if (string.sub( zoneId, 1, 2) == '\253\02' and string.byte( zoneId, 5 ) ~= nil and string.byte( zoneId, 6 ) == 0xFD) then
        -- Obtain the zone id word..
        word = string.format( "%X", string.byte( zoneId, 5 ) );
        print( 'Word is: ' .. word );
        if (string.len( word ) == 1) then
            word = 0 ..word;
        end
        word = "x" .. word;
    
        -- Place Names (List 1)
        if (string.byte( zoneId, 4 ) == 0x14) then
            zone = placenames_1[ word ];
    
        -- Place Names (List 2)
        elseif (string.byte( zoneId, 4 ) == 0x27) then
            zone = placenames_2[ word ];
        end
    end
        
    player:setPos( 0, 0, 0, 0, zone );
end
