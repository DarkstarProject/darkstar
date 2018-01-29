-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Fume Lizard
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,642,1);
end;