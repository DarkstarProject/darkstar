----------------------------------	
-- Area: Cape Teriggan	
--   NM: Kruetzet
-----------------------------------	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Kruetzet's spawnpoint and respawn time (9-12 hours)
  Kruetzet = mob:getID();
  UpdateNMSpawnPoint(Kruetzet);
  SpawnMob(Kruetzet, '', math.random((32400),(43200)));

end;