-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Dabilla
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,612,1);
    checkGoVregime(player,mob,614,1);
end;
