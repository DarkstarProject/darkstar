-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Weaver
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,648,2);
end;