-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Saa_Doyi_the_Fervid
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(3600, 7200)); -- 1 to 2 hours
end;
