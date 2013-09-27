-----------------------------------
-- Area: The Boyahda Tree
-- Mob:  Voluptuous Vivian (NM)
-- @pos -198.000 5.000 203.000 153
-----------------------------------

require("/scripts/zones/The_Boyahda_Tree/MobIDs");
require("scripts/globals/titles");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

		killer:addTitle(THE_VIVISECTOR);

		-- Set VV's ToD
		SetServerVariable("[POP]Voluptuous_Vivian", os.time(t) + math.random((57600),(86400))); -- 16-24 hours
		DeterMob(mob:getID(), true);

		-- Set PH back to normal, then set to respawn spawn
		PH = GetServerVariable("[PH]Voluptuous_Vivian");
		SetServerVariable("[PH]Voluptuous_Vivian", 0);
		DeterMob(PH, false);
		GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;