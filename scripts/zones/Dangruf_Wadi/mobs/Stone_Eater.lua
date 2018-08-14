-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Stone Eater
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,639,1);
end;
