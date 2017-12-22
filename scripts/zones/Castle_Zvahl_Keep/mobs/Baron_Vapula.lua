-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  MOB: Baron_Vapula
-----------------------------------
require("scripts/globals/titles");


function onMobDeath(mob, player, isKiller)
    player:addTitle(HELLSBANE);
end;

function onMobDespawn(mob)
end;
