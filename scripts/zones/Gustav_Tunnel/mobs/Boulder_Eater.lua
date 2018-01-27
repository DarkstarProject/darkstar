-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Boulder Eater
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,770,1);
end;