----------------------------------	
-- Area: Cape Teriggan	
--   NM: Frostmane
-----------------------------------	
  
require("scripts/globals/fieldsofvalor");	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  checkRegime(killer,mob,108,2);
  
  -- Set Frostmane's Window Open Time
  wait = math.random((1),(6)) * 3600
  SetServerVariable("[POP]Frostmane", os.time(t) + wait); -- 1-6 hours
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Frostmane");
  SetServerVariable("[PH]Frostmane", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;