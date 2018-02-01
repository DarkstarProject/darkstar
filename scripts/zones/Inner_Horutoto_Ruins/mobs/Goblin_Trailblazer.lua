-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Trailblazer
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,651,2);
end;