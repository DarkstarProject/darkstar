-----------------------------------
-- Area: Western Altepa Desert
--   NM: King Vinegarroon
-- ToDo: Should spawn only in earth weather
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

	killer:addTitle(VINEGAR_EVAPORATOR);
  
  -- Set King_Vinegarroon's spawnpoint and respawn time (21-24 hours)
  King_Vinegarroon = mob:getID();
  UpdateNMSpawnPoint(King_Vinegarroon);
  SpawnMob(King_Vinegarroon, '', math.random((75600),(86400)));
  
end;