----------------------------------	
-- Area: Gustav Tunnel
--   NM: Wyvernpoacher Drachlox
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Wyvernpoacher Drachlox's Window Open Time
  wait = math.random((2),(8)) * 3600
  SetServerVariable("[POP]Wyvernpoacher_Drachlox", os.time(t) + wait); -- 2-8 hours
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Wyvernpoacher_Drachlox");
  SetServerVariable("[PH]Wyvernpoacher_Drachlox", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;