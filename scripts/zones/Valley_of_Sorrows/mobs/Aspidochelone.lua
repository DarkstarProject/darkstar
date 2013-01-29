-----------------------------------
-- Area: Valley of Sorrows
-- NPC:  Aspidochelone
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- OnMobInitialise Action
-----------------------------------

function onMobInitialize(mob)
	mob:addStatusEffect(EFFECT_REGAIN,15,3,0);
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
	killer:addTitle(ASPIDOCHELONE_SINKER);
	
  -- Set Aspidochelone's Window Open Time
  wait = 72 * 3600
  SetServerVariable("[POP]Aspidochelone", os.time(t) + wait); -- 3 days
  
  -- Set Adamantoise's spawnpoint and respawn time (21-24 hours)
  SetServerVariable("[PH]Aspidochelone", 0);
  DeterMob(17301537, false);
  UpdateNMSpawnPoint(17301537);
  SpawnMob(17301537, '', math.random((75600),(86400)));
end;