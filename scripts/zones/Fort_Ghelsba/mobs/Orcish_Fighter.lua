-----------------------------------
-- Area: Fort Ghelsba
--  MOB: Orcish Fighter
-----------------------------------
require("scripts/zones/Fort_Ghelsba/MobIDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    if (mob:getID() == (ORCISH_PANZER + 1)) then
        DisallowRespawn(ORCISH_PANZER, false);
        GetMobByID(ORCISH_PANZER):setRespawnTime(math.random(3600,4200)); -- 60 to 70 min
    end
end;
