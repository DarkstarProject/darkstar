-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Mucoid Mass
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(5400,6000)); -- 90 to 100 minutes
end;
