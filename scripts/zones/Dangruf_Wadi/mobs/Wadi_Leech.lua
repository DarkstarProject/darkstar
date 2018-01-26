-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Wadi Leech
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,641,2);
end;