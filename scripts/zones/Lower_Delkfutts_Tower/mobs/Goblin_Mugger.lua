-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Goblin Mugger
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,777,2);
end;