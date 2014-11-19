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
        17723644,   -- Northern San d'Oria
        17735853,   -- Bastok Mines
        17760447,   -- Port Windurst
        17793128,   -- Selbina
        17797250,   -- Mhaura
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
        17187562,17187563,17191531,17191532, -- West Ronfaure (2), East Ronfaure (2)
        17195673,17195674,17199747,17199748, -- La Theine (2), Valkurm (2)
        17199749,17203879,17203880,17207864, -- Valkurm (1), Jugner (2), Batallia (1)
        17207865,17212105,17212106,17212107, -- Batallia (1), North Gustaberg (3)
        17216196,17216197,17220164,17220165, -- South Gustaberg (2), Konschtat (2)
        17224349,17224350,17228374,17228375, -- Pashhow (2), Rolanberry (2)
        17232275,17232276,17232277,17232278, -- Beaucedine (4)
        17236342,17236343,17240510,17240511, -- Xarcabard (2), Cape Teriggan (2)
        17244649,17244650,17244651,17248865, -- Eastern Altepa (3), West Sarutabaruta (1)
        17248866,17248867,17253060,17253061, -- West Sarutabaruta (2), East Sarutabaruta (2)
        17253062,17257070,17257071,17257072, -- East Sarutabaruta (1), Tahrongi (3)
        17261195,17261196,17265290,17265291, -- Buburimu (2), Meriphataud Mountains (2)
        17265292,17269256,17269257,17273413, -- Meriphataud Mountains (1), Sauromugue (2), Zi'Tah (1)
        17273414,17277206,17277207,17281642, -- Zi'Tah (1), Ro'Maeve (2), Yuhtunga Jungle (1)
        17281643,17281644,17281645,17285694, -- Yuhtunga Jungle (3), Yhoator Jungle (1)
        17285695,17285696,17289791,17289792, -- Yhoator Jungle (2), Western Altepa (2)
        17289793,17293771,17293772,17297487, -- Western Altepa (1), Qufim (2), Behemoth's Dominion (1)
        17301588,17301589,17310100,17310101, -- Valley of Sorrows (2), Ru'Aun Gardens (2)
        17310102,17310103,17310104,17310105, -- Ru'Aun Gardens (4)
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
        17457374,17457375,17457376,17461577, -- Ranguemont Pass (3), Bostaunieux Oubliette (1)
        17461578,17461579,17469846,17469847, -- Bostaunieux Oubliette (2), Toraimarai Canal (2)
        17469848,17469849,17481844,17555962, -- Toraimarai Canal (2), Zeruhn Mines (1), King Ranperre's Tomb (1)
        17555963,17555964,17555965,17559931, -- King Ranperre's Tomb (3), Dangruf Wadi (1)
        17559932,17563919,17563920,17563921, -- Dangruf Wadi (1), Inner Horutoto Ruins (3)
        17568200,17568201,17572305,17572306, -- Ordelle's Caves (2), Outer Horutoto Ruins (2)
        17572307,17572308,17576425,17576426, -- Outer Horutoto Ruins (2), The Eldieme Necropolis (2)
        17576427,17576428,17580412,17580413, -- The Eldieme Necropolis (2), Gusgen Mines (2)
        17580414,17584492,17584493,17588784, -- Gusgen Mines (1), Crawlers' Nest (2), Maze of Shakhrami (1)
        17588785,17588786,17588787,17596849, -- Maze of Shakhrami (3), Garlaige Citadel (1)
        17596850,17596851,17613247,17613248, -- Garlaige Citadel (2), Fei'Yin (2)
        17404400,17404401,17404402,17404403, -- The Boyahda Tree (4)
        17486259,17486260,17486261,17486262, -- Korroloka Tunnel (4)
        17490318,17490319,17490320,17490321, -- Kuftal Tunnel (4)
        17502702,17502703,17502704,17502705, -- Ve'Lugannon Palace (4)
        17502706,17502707,17502708,17502709, -- Ve'Lugannon Palace (4)
        17502710,17502711,17506822,17506823, -- Ve'Lugannon Palace (2), The Shrine of Ru'Avitau (2)
        17506824,17506825,17506826,17506827, -- The Shrine of Ru'Avitau (4)
        17506828,17617260,17617261,17617262, -- The Shrine of Ru'Avitau (1), Ifrit's Cauldron (3)
        17617263,17617264,17617265,17617266, -- Ifrit's Cauldron (4)
        17617267,17645876,17645877,17645878, -- Ifrit's Cauldron (1), Gustav Tunnel (3)
        17645879,17649895,17649896,17649897, -- Gustav Tunnel (1), Labyrinth of Onzozo (3)
        17531228,17531229,17531230,17420675, -- Lower Delkfutt's Tower (3), Middle Delkfutt's Tower (1)
        17420676,17420677,17420678,17424560, -- Middle Delkfutt's Tower (3), Upper Delkfutt's Tower (1)
        17424561,17424562,17429003,17429004, -- Upper Delkfutt's Tower (2), Temple of Uggalepih (2)
        17429005,17429006,17429007,17433087, -- Temple of Uggalepih (3), Den of Rancor (1)
        17433088,17433089,17433090,17433091, -- Den of Rancor (4)
        17433092,17498649,17498650,17498651, -- Den of Rancor (1), Sea Serpent Grotto (3)
        17498652,17498653,17629763,17629764, -- Sea Serpent Grotto (2), Quicksand Caves (2)
        17629765,17629766,17629767,17629768, -- Quicksand Caves (4)
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
       16814557, -- Pso'Xja
       16822527, -- Oldton Movalpolos
       16892179, -- Sacrarium
       17355008, -- Fort Ghelsba
       17359048, -- Yughott Grotto
       17363366, -- Palborough Mines
       17371604, -- Giddeus
       17379838, -- Beadeaux
       17388023, -- Davoi
       17396206, -- Castle Oztroja
       17420672, -- Middle Delkfutt's Tower
       17424559, -- Upper Delkfutt's Tower
       17436993, -- Castle Zvahl Baileys
       17441084, -- Castle Zvahl Keep
       17498612, -- Sea Serpent Grotto
       17555950, -- King Ranperre's Tomb
       17559920, -- Dangruf Wadi
       17563910, -- Inner Horutoto Ruins
       17568188, -- Ordelle's Caves
       17572286, -- Outer Horutoto Ruins
       17576352, -- The Eldieme Necropolis
       17580399, -- Gusgen Mines
       17584471, -- Crawler's Nest
       17588769, -- Maze of Shakhrami
       17596805, -- Garlaige Citadel
       17613222, -- Fei'Yin
       17649893  -- Labyrinth of Onzozo
   }

   local coffers  =
   {
       16826623, -- Newton Movalpolos
       17310020, -- Ru'Aun Gardens
       17379839, -- Beadeaux
       17391845, -- Monastic Cavern
       17396207, -- Castle Oztroja
       17404386, -- The Boyahda Tree
       17428982, -- Temple of Uggalepih
       17433074, -- Den of Rancor
       17436994, -- Castle Zvahl Baileys
       17469831, -- Toraimarai Canal
       17490297, -- Kuftal Tunnel
       17498613, -- Sea Serpent Grotto
       17502695, -- Ve'Lugannon Palace
       17576353, -- The Eldieme Necropolis
       17584472, -- Crawler's Nest
       17596806, -- Garlaige Citadel
       17617217, -- Ifrit's Cauldron
       17629732  -- Quicksand Caves
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
