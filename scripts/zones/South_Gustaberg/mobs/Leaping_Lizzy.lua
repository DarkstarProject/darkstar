----------------------------------	
-- Area: South Gustaberg	
-- NM:  Leaping Lizzy	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  checkRegime(killer,mob,80,1);
  
  -- Set LL's ToD
  SetServerVariable("[POP]Leaping_Lizzy", os.time(t) + 3600); -- 1 hour 
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Leaping_Lizzy");
  SetServerVariable("[PH]Leaping_Lizzy", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;