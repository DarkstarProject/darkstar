----------------------------------	
-- Area: Gustav Tunnel
--   NM: Goblinsavior Heronox
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Goblinsavior Heronox's Window Open Time
  wait = math.random((3),(5)) * 3600
  SetServerVariable("[POP]Goblinsavior_Heronox", os.time(t) + wait); -- 3-5 hours
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Goblinsavior_Heronox");
  SetServerVariable("[PH]Goblinsavior_Heronox", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;