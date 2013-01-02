----------------------------------	
-- Area: Kuftal Tunnel	
--   NM: Yowie
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Yowie's Window Open Time
  wait = math.random((2),(8)) * 3600
  SetServerVariable("[POP]Yowie", os.time(t) + wait); -- 2-8 hours
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Yowie");
  SetServerVariable("[PH]Yowie", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH)
  
end;