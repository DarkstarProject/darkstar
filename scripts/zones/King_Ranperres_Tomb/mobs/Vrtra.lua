-----------------------------------
-- Area: King Ranperre's Tomb
-- NPC:  Vrtra
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/titles");

-----------------------------------
-- OnMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_REGEN, 30);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:addTitle(VRTRA_VANQUISHER);
    
    -- Set Vrtra's spawnpoint and respawn time (3-5 days)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((259200),(432000)));
    
end;