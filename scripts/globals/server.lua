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
  -- Mysticmaker Profblix (5-30 minutes)
  UpdateNMSpawnPoint(17649693);
  SpawnMob(17649693, '', math.random((300),(1800))) 
  
  -- Bune (5-60 minutes)
  UpdateNMSpawnPoint(17645578);
  SpawnMob(17645578, '', math.random((300),(3600))) 
	
end;

-----------------------------------
-- SetExplorerMoogles
----------------------------------

function SetExplorerMoogles()

	local Moogles  = 
	{
		17723638,	-- Northern_San_d'Oria
		17735847,	-- Bastok_Mines
		17760441,	-- Port_Windurst
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
        17187512,17187513,17191494,17191495,
        17195671,17195672,17199745,17199746,
        17199747,17203877,17203878,17207859,
        17207860,17212073,17212074,17212075,
        17216141,17216142,17220159,17220160,
        17224345,17224346,17228369,17228370,
        17232270,17232271,17232272,17232273,
        17236337,17236338,17240507,17240508,
        17244645,17244646,17244647,17248815,
        17248816,17248817,17253023,17253024,
        17253025,17257068,17257069,17257070,
        17261192,17261193,17265285,17265286,
        17265287,17269247,17269248,17273411,
        17273412,17277203,17277204,17281640,
        17281641,17281642,17281643,17285690,
        17285691,17285692,17289789,17289790,
        17289791,17293769,17293770,17297484,
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