----------------------------------	
-- Area: Labyrinth of Onzozo	
--   NM: Mysticmaker Profblix
-----------------------------------	

-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
  -- Set Mysticmaker's spawnpoint and respawn time (2-2.5 hours)
  Mysticmaker_Profblix = mob:getID();
  UpdateNMSpawnPoint(Mysticmaker_Profblix);
  SpawnMob(Mysticmaker_Profblix, '', math.random((7200),(9000)));
  
end;