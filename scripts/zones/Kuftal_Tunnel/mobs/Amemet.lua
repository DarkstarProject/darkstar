----------------------------------	
-- Area: Kuftal Tunnel	
--   NM: Amemet
-- ToDo: Amemet should walk in a big circle
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

  -- Set Amemet's Window Open Time
  wait = math.random((2),(12)) * 3600
  SetServerVariable("[POP]Amemet", os.time(t) + wait); -- 2-12 hours
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Amemet");
  SetServerVariable("[PH]Amemet", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;