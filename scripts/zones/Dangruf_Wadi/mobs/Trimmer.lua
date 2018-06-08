-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Trimmer
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,646,1);
end;