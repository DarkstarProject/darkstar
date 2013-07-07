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
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((75600),(86400)));
    
end;