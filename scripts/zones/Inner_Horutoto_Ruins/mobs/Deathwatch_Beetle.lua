-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Deathwatch Beetle
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,652,1);
end;