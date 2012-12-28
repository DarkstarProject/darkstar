----------------------------------	
-- Area: Gustav Tunnel
--   NM: Ungur
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Ungur's Window Open Time
  SetServerVariable("[POP]Ungur", os.time(t) + 7200); -- 2 hours
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Ungur");
  SetServerVariable("[PH]Ungur", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;