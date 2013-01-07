-----------------------------------
--  Area: Eastern Altepa Desert (114)
--    NM: Centurio_XII-I
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

  -- Set Centurio XII-I's spawnpoint and respawn time (21-24 hours)
  Centurio_XII_I = mob:getID();
  UpdateNMSpawnPoint(Centurio_XII_I);
  SpawnMob(Centurio_XII_I, '', math.random((75600),(86400)));
  
end;

