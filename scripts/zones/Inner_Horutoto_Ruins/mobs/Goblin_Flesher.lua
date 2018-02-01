-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Flesher
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,652,2);
end;