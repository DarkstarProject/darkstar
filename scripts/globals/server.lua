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
		17723643,	-- Northern_San_d'Oria
		17735852,	-- Bastok_Mines
		17760446,	-- Port_Windurst
		17793127,	-- Selbina
		17797249,	-- Mhaura
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
        17187542,17187543,17191524,17191525, -- West Ronfaure 2, East Ronfaure 2
        17195671,17195672,17199745,17199746, -- La Theine 2, Valkurm 2
        17199746,17203877,17203878,17207859, -- Valkurm 1, Jugner 2, Batallia 1
        17207860,17212103,17212104,17212105, -- Batallia 1, North Gustaberg 3
        17216171,17216172,17220159,17220160, -- South Gustaberg 2, Konschtat 2
        17224345,17224346,17228369,17228370, -- Pashhow 2, Rolanberry 2
        17232273,17232274,17232275,17232276, -- Beaucedine all 4
        17236340,17236341,17240508,17240509, -- Xarcabard 2, Cape Teriggan 2
        17244647,17244648,17244649,17248845, -- Eastern Altepa 3, West Sarutabaruta 1
        17248846,17248847,17253061,17253060, -- West Sarutabaruta 2, East Sarutabaruta 2`
        17253059,17257071,17257069,17257070, -- East Sarutabaruta 1, Tahrongi 3
        17261195,17261194,17265285,17265286, -- Buburimu 2, Meriphataud Mountains 2
        17265287,17269254,17269255,17273411, -- Meriphataud Mountains 1, Sauromugue 2, Zi'Tah 1
        17273412,17277204,17277205,17281640, -- Zi'Tah 1, Ro'Maeve 2, Yuhtunga Jungle 1
        17281641,17281642,17281643,17285690, -- Yuhtunga Jungle 3, Yhoator Jungle 1
        17285691,17285692,17289789,17289790, -- Yhoator Jungle 2, Western Altepa 2
        17289791,17293769,17293770,17297485, -- Western Altepa 1, Qufim 2, Behemoth's Dominion 1
        17301586,17301587,17310098,17310099, -- Valley of Sorrows 2, Ru'Aun Gardens 2
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
