-----------------------------------
-- Area: Rolanberry Fields (110)
--  HMN: Simurgh
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

	killer:addTitle(SIMURGH_POACHER);
  
    -- Set Simurgh's spawnpoint and respawn time (21-24 hours)
    Simurgh = mob:getID();
    UpdateNMSpawnPoint(Simurgh);
    SpawnMob(Simurgh, '', math.random((75600),(86400)));
  
end;