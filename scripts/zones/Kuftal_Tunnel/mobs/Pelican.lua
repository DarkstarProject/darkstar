----------------------------------	
-- Area: Kuftal Tunnel	
--   NM: Pelican
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Pelican's Window Open Time
  wait = math.random((4),(12)) * 3600
  SetServerVariable("[POP]Pelican", os.time(t) + wait); -- 4-12 hours
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Pelican");
  SetServerVariable("[PH]Pelican", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH)
  
end;