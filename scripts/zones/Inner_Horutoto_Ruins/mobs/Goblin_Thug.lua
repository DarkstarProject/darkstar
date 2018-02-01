-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Goblin Thug
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,647,2);
end;