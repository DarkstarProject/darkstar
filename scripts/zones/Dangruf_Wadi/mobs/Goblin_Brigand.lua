-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Brigand
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,640,1);
    checkGoVregime(player,mob,642,2);
end;