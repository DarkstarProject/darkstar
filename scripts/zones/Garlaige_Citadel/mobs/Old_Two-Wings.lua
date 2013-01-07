-----------------------------------
--  Area: Garlaige Citadel (200)
--    NM: Old_Two_Wings
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

  -- Set Old_Two_Wings's spawnpoint and respawn time (21-24 hours)
  Old_Two_Wings = mob:getID();
  UpdateNMSpawnPoint(Old_Two_Wings);
  SpawnMob(Old_Two_Wings, '', math.random((64800),(86400)));
	
end;

