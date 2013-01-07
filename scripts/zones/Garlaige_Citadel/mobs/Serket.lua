-----------------------------------
-- Area: Garlaige Citadel (200)
-- NPC:  Serket
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

  killer:addTitle(SERKET_BREAKER);

  -- Set Serket's spawnpoint and respawn time (21-24 hours)
  Serket = mob:getID();
  UpdateNMSpawnPoint(Serket);
  SpawnMob(Serket, '', math.random((75600),(86400)));
  
end;