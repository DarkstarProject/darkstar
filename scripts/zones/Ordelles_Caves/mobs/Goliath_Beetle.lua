-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Goliath Beetle
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,660,1);
end;