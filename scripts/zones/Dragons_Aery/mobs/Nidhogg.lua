-----------------------------------
-- Area: Dragons Aery
--  HNM: Nidhogg
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

	killer:addTitle(NIDHOGG_SLAYER);
  
  -- Set Nidhogg's Window Open Time
  wait = 72 * 3600
  SetServerVariable("[POP]Nidhogg", os.time(t) + wait); -- 3 days
  
  -- Set Fafnir's spawnpoint and respawn time (21-24 hours)
  SetServerVariable("[PH]Nidhogg", 0);
  DeterMob(PH, false);
  UpdateNMSpawnPoint(17408018);
  SpawnMob(17408018, '', math.random((75600),(86400)));
  
end;