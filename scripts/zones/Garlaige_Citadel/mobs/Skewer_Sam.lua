-----------------------------------
--  Area: Garlaige Citadel (200)
--    NM: Skewer_Sam
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

  -- Set Skewer_Sam's spawnpoint and respawn time (21-24 hours)
  Skewer_Sam = mob:getID();
  UpdateNMSpawnPoint(Skewer_Sam);
  SpawnMob(Skewer_Sam, '', math.random((75600),(86400)));

end;

