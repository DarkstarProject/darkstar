-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Wadi Hare
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,641,1);
end;