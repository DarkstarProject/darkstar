-----------------------------------
-- Area: Eastern Altepa Desert
--   NM:  Cactrot Rapido
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

	killer:addTitle(CACTROT_DESACELERADOR);
  
  -- Set Cactrot Rapido's spawnpoint and respawn time (24-72 hours)
  Cactrot_Rapido = mob:getID();
  UpdateNMSpawnPoint(Cactrot_Rapido);
  SpawnMob(Cactrot_Rapido, '', math.random((86400),(259200)));
  
end;