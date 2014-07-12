-----------------------------------
-- Area: Maze of Shakhrami
--  NM:  Aqrabuamelu
-----------------------------------
require("scripts/globals/status");
-----------------------------------


-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addStatusEffect(EFFECT_ICE_SPIKES,45,0,0);
    mob:getStatusEffect(EFFECT_ICE_SPIKES):setFlag(32);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((7200),(7800))); -- 120 to 130 min
end;