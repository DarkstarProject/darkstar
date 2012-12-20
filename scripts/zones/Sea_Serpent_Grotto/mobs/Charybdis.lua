----------------------------------	
-- Area: Valkurm Dunes	
--   NM: Charybdis
-----------------------------------	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Charybdis Window Open Time
  wait = math.random((8),(12)) * 3600 -- 8-12 hours 
  SetServerVariable("[POP]Charybdis", os.time(t) + wait ); 
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Charybdis");
  SetServerVariable("[PH]Charybdis", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;