-----------------------------------
-- Note from Tenjou:
-- now you can customize it a little more in the settings!
-- 
-----------------------------------

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
	SetRegionalConquestOverseers()
  
  -- Charybdis PH alternates, remove one
  DespawnMob(17498518);
  
  -- Timed Spawns
  SetTimedSpawns();
  
  -- Spawns Silk Caterpillar (temporary until someone implements a way to make it spawn properly)
  SpawnMob(17227782,300,660);
end;

-----------------------------------
-- SetExplorerMoogles
----------------------------------

function SetExplorerMoogles()

	local Moogles  = 
	{
		17723639,	-- Northern_San_d'Oria
		17735848,	-- Bastok_Mines
		17760442,	-- Port_Windurst
		17793123,	-- Selbina
		17797245,	-- Mhaura
	}
	
	i = 1;
	while i <= (table.getn(Moogles)) do	
		npc = GetNPCByID(Moogles[i]);
		npc:setStatus(0);
		i = i + 1;
	end

end;

-----------------------------------
-- SetFieldManual
----------------------------------

function SetFieldManual()

	local FieldManuals  = 
	{
        17187512,17187513,17191493,17191494,
        17195670,17195671,17199744,17199745,
        17199746,17203876,17203877,17207858,
        17207859,17212072,17212073,17212074,
        17216140,17216141,17220158,17220159,
        17224344,17224345,17228368,17228369,
        17232272,17232273,17232274,17232275,
        17236336,17236337,17240507,17240508,
        17244644,17244645,17244646,17248814,
        17248815,17248816,17253022,17253023,
        17253024,17257067,17257068,17257069,
        17261191,17261192,17265284,17265285,
        17265286,17269253,17269254,17273410,
        17273411,17277203,17277204,17281639,
        17281640,17281641,17281642,17285689,
        17285690,17285691,17289788,17289789,
        17289790,17293768,17293769,17297484,
        17301585,17301586,17310097,17310098,
        17310099,17310100,17310101,17310102,
	}
	
	i = 1;
	while i <= (table.getn(FieldManuals)) do	
		npc = GetNPCByID(FieldManuals[i]);
		npc:setStatus(0);
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
    17228242, -- Simurgh
    17301537, -- Adamantoise
    17436923, -- Duke_Haborym
    17436913, -- Marquis_Allocen
    17436918, -- Marquis_Amon
    17436927, -- Grand_Duke_Batym
    17568127  -- Morbolger
  }

  i = 1;
  while i <= (table.getn(NMs)) do
    UpdateNMSpawnPoint(NMs[i]);
    GetMobByID(NMs[i]):setRespawnTime(math.random((900),(10800))); -- 15-180 minute
    i = i + 1;
  end

end;