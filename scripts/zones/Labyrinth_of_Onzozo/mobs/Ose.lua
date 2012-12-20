----------------------------------	
-- Area: Labyrinth of Onzozo
--   NM: Ose
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Ose's Window Open Time
  SetServerVariable("[POP]Ose", os.time(t) + 3600); -- 1 hour
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Ose");
  SetServerVariable("[PH]Ose", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;