-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Stalking Sapling
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,655,1);
end;