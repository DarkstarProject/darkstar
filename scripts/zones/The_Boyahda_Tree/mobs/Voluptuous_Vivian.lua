-----------------------------------
-- Area: The Boyahda Tree
-- NM:   Voluptuous Vivian (NM)
-----------------------------------

require("scripts/zones/The_Boyahda_Tree/MobIDs");
require("scripts/globals/titles");

function onMobInitialize(mob)
mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
mob:setMobMod(MOBMOD_DRAW_IN, 2);
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

		killer:addTitle(THE_VIVISECTOR);

		-- Set VV's ToD
		SetServerVariable("[POP]Voluptuous_Vivian", os.time(t) + math.random((57600),(86400))); -- 16-24 hours
		DeterMob(mob:getID(), true);

		-- Set PH back to normal, then set to respawn spawn
		local PH = GetServerVariable("[PH]Voluptuous_Vivian");
		SetServerVariable("[PH]Voluptuous_Vivian", 0);
		DeterMob(PH, false);
		GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;