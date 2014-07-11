-----------------------------------
-- Area: Upper Delkfutt's Tower
--  NM:  Autarch
-----------------------------------
require("scripts/globals/status");
-----------------------------------


-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addStatusEffect(EFFECT_SHOCK_SPIKES,40,0,0);
    mob:getStatusEffect(EFFECT_SHOCK_SPIKES):setFlag(32);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    -- UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((7200),(10800))); -- 2 to 3 hrs
end;
