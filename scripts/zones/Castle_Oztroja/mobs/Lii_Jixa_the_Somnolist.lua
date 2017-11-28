-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Lii_Jixa_the_Somnolist
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(3600, 5400)); -- 60 to 90 minutes
end;
