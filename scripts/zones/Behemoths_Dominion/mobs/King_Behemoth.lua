-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: King Behemoth
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
	
	if(mob:getBattleTime() == 3600) then
		mob:rageMode();
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	killer:addTitle(BEHEMOTH_DETHRONER);
  
  -- Set King_Behemoth's Window Open Time
  wait = 72 * 3600
  SetServerVariable("[POP]King_Behemoth", os.time(t) + wait); -- 3 days
  
  -- Set Behemoth's spawnpoint and respawn time (21-24 hours)
  SetServerVariable("[PH]King_Behemoth", 0);
  DeterMob(PH, false);
  UpdateNMSpawnPoint(17297440);
  SpawnMob(17297440, '', math.random((75600),(86400)));
  
end;