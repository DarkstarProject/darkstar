-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Prim Pika
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,644,1);
end;