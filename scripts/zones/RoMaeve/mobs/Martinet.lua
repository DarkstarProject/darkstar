-----------------------------------
-- Area: RoMaeve
--  NM:  Martinet
-----------------------------------
require("scripts/globals/status");
-----------------------------------


-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:addStatusEffect(EFFECT_SHOCK_SPIKES,55,0,0);
    mob:getStatusEffect(EFFECT_SHOCK_SPIKES):setFlag(32);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    -- UpdateNMSpawnPoint(mob:getID());
    -- mob:setRespawnTime(math.random((?),(?))); -- Uncertain repop time
end;
