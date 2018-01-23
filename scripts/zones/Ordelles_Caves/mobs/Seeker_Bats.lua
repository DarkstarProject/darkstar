-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Seeker Bats
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,658,1);
end;