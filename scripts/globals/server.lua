-----------------------------------
-- Note from Tenjou:
-- now you can customize it a little more in the settings!
--
-----------------------------------

require("scripts/globals/harvest_festivals");
require("scripts/globals/conquest");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/mobs");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/titles");

-----------------------------------
-- OnServerStart
-----------------------------------

function onServerStart()

    if (EXPLORER_MOOGLE == 1) then
        SetExplorerMoogles();
    end
    if (FIELD_MANUALS == 1) then
        SetFieldManual();
    end
    if (GROUNDS_TOMES == 1) then
        SetGroundsTome();
    end

    -- Harvest Festival
    if(isHalloweenEnabled() ~= 0) then
        applyHalloweenNpcCostumes();
    end

    SetRegionalConquestOverseers();

  -- Charybdis PH alternates, remove one
  DespawnMob(17498518);

  -- Timed Spawns
  SetTimedSpawns();

  -- Treasure Spawns;
  SetTreasureSpawns();

  -- Spawns Silk Caterpillar (temporary until someone implements a way to make it spawn properly)
  SpawnMob(17227782,300,660);

  -- Set random variable for determining Old Prof. Mariselle's spawn location
  local rand = math.random((2),(7));
  SetServerVariable("Old_Prof_Spawn_Location", rand);
end;

-----------------------------------
-- SetExplorerMoogles
----------------------------------

function SetExplorerMoogles()

    local Moogles  =
    {
        17723643,   -- Northern_San_d'Oria
        17735852,   -- Bastok_Mines
        17760446,   -- Port_Windurst
        17793127,   -- Selbina
        17797249,   -- Mhaura
    }

    i = 1;
    while i <= (table.getn(Moogles)) do
        local npc = GetNPCByID(Moogles[i]);
        if(npc == nil) then
            printf("'SetExplorerMoogles' Error trying to load undefined npc (%d)", Moogles[i]);
        else
            npc:setStatus(0);
        end
        i = i + 1;
    end

end;

-----------------------------------
-- SetFieldManual
----------------------------------

function SetFieldManual()

    local FieldManuals  =
    {
        17187532,17187531,17191530,17191531, -- West Ronfaure 2, East Ronfaure 2
        17195671,17195672,17199748,17199747, -- La Theine 2, Valkurm 2
        17199746,17203879,17203878,17207861, -- Valkurm 1, Jugner 2, Batallia 1
        17207860,17212074,17212075,17212076, -- Batallia 1, North Gustaberg 3
        17216160,17216161,17220159,17220160, -- South Gustaberg 2, Konschtat 2
        17224347,17224346,17228371,17228370, -- Pashhow 2, Rolanberry 2
        17232277,17232274,17232275,17232276, -- Beaucedine all 4
        17236342,17236341,17240510,17240509, -- Xarcabard 2, Cape Teriggan 2
        17244650,17244648,17244649,17248845, -- Eastern Altepa 3, West Sarutabaruta 1
        17248846,17248847,17253061,17253060, -- West Sarutabaruta 2, East Sarutabaruta 2`
        17253059,17257071,17257069,17257070, -- East Sarutabaruta 1, Tahrongi 3
        17261195,17261194,17265285,17265286, -- Buburimu 2, Meriphataud Mountains 2
        17265287,17269256,17269255,17273413, -- Meriphataud Mountains 1, Sauromugue 2, Zi'Tah 1
        17273412,17277206,17277205,17281641, -- Zi'Tah 1, Ro'Maeve 2, Yuhtunga Jungle 1
        17281642,17281643,17281644,17285693, -- Yuhtunga Jungle 3, Yhoator Jungle 1
        17285694,17285695,17289792,17289790, -- Yhoator Jungle 2, Western Altepa 2
        17289791,17293771,17293770,17297486, -- Western Altepa 1, Qufim 2, Behemoth's Dominion 1
        17301588,17301587,17310104,17310099, -- Valley of Sorrows 2, Ru'Aun Gardens 2
        17310100,17310101,17310102,17310103, -- Ru'Aun Gardens all 4 (6 total)
    }

    i = 1;
    while i <= (table.getn(FieldManuals)) do
        local npc = GetNPCByID(FieldManuals[i]);
        if(npc == nil) then
            printf("'SetFieldManual' Error trying to load undefined npc (%d)", FieldManuals[i]);
        else
            npc:setStatus(0);
        end
        i = i + 1;
    end

end;

-----------------------------------
-- SetGroundsTome
----------------------------------

function SetGroundsTome()

    local GroundsTomes  =
    {
        17457373,17457374,17457375,17461576, -- Ranguemont Pass (4)
        17461577,17461578,17469845,17469846, -- Bostaunieux Oubliette (2), Toraimarai Canal (2)
        17469847,17469848,17481843,17555961, -- Toraimarai Canal (2), Zeruhn Mines (1), King Ranperre's Tomb (1)
        17555962,17555963,17555964,17559930, -- King Ranperre's Tomb (3)
        17559931,17563918,17563919,17563920, -- Dangruf Wadi (1), Inner Horutoto Ruins (3)
        17568199,17568200,17572304,17572305, -- Ordelle's Caves (2), Outer Horutoto Ruins (2)
        17572306,17572307,17576424,17576425, -- Outer Horutoto Ruins (2), The Eldieme Necropolis (2)
        17576426,17576427,17580411,17580412, -- The Eldieme Necropolis (2), Gusgen Mines (2)
        17580413,17584491,17584492,17588783, -- Gusgen Mines (1), Crawlers' Nest (2), Maze of Shakhrami (1)
        17588784,17588785,17588786,17596848, -- Maze of Shakhrami (3), Garlaige Citadel (1)
        17596849,17596850,17613246,17613247, -- Garlaige Citadel (2), Fei'Yin (2)
        17404401,17404401,17404401,17404401, -- The Boyahda Tree (4)
        17486258,17486259,17486260,17486261, -- Korroloka Tunnel (4)
        17490317,17490318,17490319,17490320, -- Kuftal Tunnel (4)
        17502701,17502702,17502703,17502704, -- Ve'Lugannon Palace (4)
        17502705,17502706,17502707,17502708, -- Ve'Lugannon Palace (4)
        17502709,17502710,17506821,17506822, -- Ve'Lugannon Palace (2), The Shrine of Ru'Avitau (2)
        17506823,17506824,17506825,17506826, -- The Shrine of Ru'Avitau (4)
        17506827,17617259,17617260,17617261, -- The Shrine of Ru'Avitau (1), Ifrit's Cauldron (3)
        17617262,17617263,17617264,17617265, -- Ifrit's Cauldron (4)
        17617266,17645875,17645876,17645877, -- Ifrit's Cauldron (1), Gustav Tunnel (3)
        17645878,17649894,17649895,17649896, -- Gustav Tunnel (1), Labyrinth of Onzozo (3)
        17531227,17531228,17531229,17420674, -- Lower Delkfutt's Tower (3), Middle Delkfutt's Tower (1)
        17420675,17420676,17420677,17424559, -- Middle Delkfutt's Tower (3), Upper Delkfutt's Tower (1)
        17424560,17424561,17429002,17429003, -- Upper Delkfutt's Tower (2), Temple of Uggalepih (2)
        17429004,17429005,17429006,17433086, -- Temple of Uggalepih (3)
        17433087,17433088,17433089,17433090, -- Den of Rancor (4)
        17433091,17498648,17498649,17498650, -- Den of Rancor (1), Sea Serpent Grotto (3)
        17498651,17629762,17629763,17629764, -- Sea Serpent Grotto (2), Quicksand Caves (3)
        17629765,17629766,17629767,          -- Quicksand Caves (3)
    }

    i = 1;
    while i <= (table.getn(GroundsTomes)) do
        local npc = GetNPCByID(GroundsTomes[i]);
        if(npc == nil) then
            printf("'SetGroundsTome' Error trying to load undefined npc (%d)", GroundsTomes[i]);
        else
            npc:setStatus(0);
        end
        i = i + 1;
    end

end;

----------------------------------
-- SetTimedSpawns
----------------------------------

function SetTimedSpawns()

  local NMs  =
  {
    17649693, -- Mysticmaker Profblix
    17645578, -- Bune
    17240413, -- Kreutzet
    17490234, -- Guivre
    17289575, -- King Vinegarroon
    17244539, -- Cactrot Rapido
    17244372, -- Centurio_XII-I
    17408018, -- Fafnir
    17596720, -- Serket
    17596506, -- Old Two-Wings
    17596507, -- Skewer Sam
    17269106, -- Roc
    17297440, -- Behemoth
    17396134, -- Yagudo Avatar
    17228242, -- Simurgh
    17301537, -- Adamantoise
    17436923, -- Duke_Haborym
    17436913, -- Marquis_Allocen
    17436918, -- Marquis_Amon
    17436927, -- Grand_Duke_Batym
    17613130, -- Capricious_Cassie
    17617147, -- Ash Dragon
    17264828, -- Waraxe Beak
    17264946, -- Coo Keja the Unseen
    17207657, -- Ahtu
    17285460, -- Bisque-heeled Sunberry
    17285526, -- Bright-handed Kunberry
    17285220, -- Woodland Sage
    17461338, -- Drexerion the Condemned
    17461343, -- Phanduron the Condemned
    17568127, -- Morbolger
    17203447, -- Fraelissa
    16990252, -- Harvestman
    16785593, -- Tempest Tigon
    16875578, -- Padfoot
    17101099 -- Aynu-Kasey
  }

  local NM2  =
  {
    17461478 -- Bloodsucker
  }

  local NM3  =
  {
    17555890, -- Vrtra
    16806227, -- Tiamat
    16797969 -- Jormungand
  }

    SetRespawnTimes(NMs, 900, 10800); -- 15 minutes to 3 hours
    SetRespawnTimes(NM2, 75600, 86400); -- 21 to 24 hours
    SetRespawnTimes(NM3, 86400, 259200); -- 24 to 72 hours
end;

function SetRespawnTimes(ids, minTime, maxTime)

  i = 1;
  while i <= (table.getn(ids)) do
    local mob = GetMobByID(ids[i]);
    if(mob == nil) then
      printf("'SetTimedSpawns' Error trying to load undefined mob (%d)", ids[i]);
    else
      UpdateNMSpawnPoint(ids[i]);
      mob:setRespawnTime(math.random((minTime),(maxTime)));
    end
    i = i + 1;
  end
end

----------------------------------
-- SetTreasureSpawns
----------------------------------

function SetTreasureSpawns()
   local chests  =
   {
       16814556, -- Pso'Xja
       16822526, -- Oldton Movalpolos
       16892178, -- Sacrarium
       17355007, -- Fort Ghelsba
       17359047, -- Yughott Grotto
       17363365, -- Palborough Mines
       17371603, -- Giddeus
       17379837, -- Beadeaux
       17388022, -- Davoi
       17396205, -- Castle Oztroja
       17420671, -- Middle Delkfutt's Tower
       17424558, -- Upper Delkfutt's Tower
       17436992, -- Castle Zvahl Baileys
       17441083, -- Castle Zvahl Keep
       17498611, -- Sea Serpent Grotto
       17555949, -- King Ranperre's Tomb
       17559919, -- Dangruf Wadi
       17563909, -- Inner Horutoto Ruins
       17568187, -- Ordelle's Caves
       17572285, -- Outer Horutoto Ruins
       17576351, -- The Eldieme Necropolis
       17580398, -- Gusgen Mines
       17584470, -- Crawler's Nest
       17588768, -- Maze of Shakhrami
       17596804, -- Garlaige Citadel
       17613221, -- Fei'Yin
       17649892  -- Labyrinth of Onzozo
   }

   local coffers  =
   {
       16826622, -- Newton Movalpolos
       17310019, -- Ru'Aun Gardens
       17379838, -- Beadeaux
       17391844, -- Monastic Cavern
       17396206, -- Castle Oztroja
       17404385, -- The Boyahda Tree
       17428981, -- Temple of Uggalepih
       17433073, -- Den of Rancor
       17436993, -- Castle Zvahl Baileys
       17469830, -- Toraimarai Canal
       17490296, -- Kuftal Tunnel
       17498612, -- Sea Serpent Grotto
       17502694, -- Ve'Lugannon Palace
       17576352, -- The Eldieme Necropolis
       17584471, -- Crawler's Nest
       17596805, -- Garlaige Citadel
       17617216, -- Ifrit's Cauldron
       17629731  -- Quicksand Caves
   }

   i = 1;
   while i <= (table.getn(chests)) do
       UpdateTreasureSpawnPoint(chests[i], true);
       i = i + 1;
   end

   i = 1;
   while i <= (table.getn(coffers)) do
       UpdateTreasureSpawnPoint(coffers[i], true);
       i = i + 1;
   end
end;

SetServerVariable( 'server_start_time', os.time() );
