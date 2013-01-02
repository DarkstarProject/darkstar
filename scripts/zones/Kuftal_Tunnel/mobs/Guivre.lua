----------------------------------	
-- Area: Gustav Tunnel	
--   NM: Guivre
-----------------------------------	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Guivre's spawnpoint and respawn time (18-24 hours)
  Guivre = mob:getID();
  UpdateNMSpawnPoint(Guivre);
  SpawnMob(Guivre, '', math.random((64800),(86400)));

end;