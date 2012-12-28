----------------------------------	
-- Area: Gustav Tunnel
--   NM: Taxim
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Taxim's Window Open Time
  SetServerVariable("[POP]Taxim", os.time(t) + 7200); -- 2 hours
  
  -- Set PH back to normal, then set to respawn spawn
  PH = GetServerVariable("[PH]Taxim");
  SetServerVariable("[PH]Taxim", 0);
  DeterMob(PH, false);
  SpawnMob(PH, '', GetMobRespawnTime(PH));
  
end;