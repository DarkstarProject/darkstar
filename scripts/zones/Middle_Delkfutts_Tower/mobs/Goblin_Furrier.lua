-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Goblin Furrier
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,782,1);
    checkGoVregime(player,mob,784,1);
end;