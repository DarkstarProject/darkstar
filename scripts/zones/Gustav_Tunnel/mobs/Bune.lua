----------------------------------	
-- Area: Gustav Tunnel	
--   NM: Bune
-----------------------------------	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Bune's spawnpoint and respawn time (21-24 hours)
  Bune = mob:getID();
  UpdateNMSpawnPoint(Bune);
  SpawnMob(Bune, '', math.random((75600),(86400)));
  
end;