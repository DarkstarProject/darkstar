-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Ying
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	-- Spawn ying after 21sec if lord is not spawned, else he's respawned by dyna lord
	if(mob:getBattleTime() % 21 == 0 and GetMobAction(17330184) == 0) then
		SpawnMob(17330184):updateEnmity(target);
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	if(GetMobAction(17330177) == 0 and GetMobAction(17330184) == 0) then
		GetMobByID(17330177):setExtraVar(os.time() + 1800); -- Time for the 30min limit
		SpawnMob(17330177); -- Dynamis Lord
	end
	
end;