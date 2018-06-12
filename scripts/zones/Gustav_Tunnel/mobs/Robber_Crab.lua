-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Robber Crab
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,765,1);
end;