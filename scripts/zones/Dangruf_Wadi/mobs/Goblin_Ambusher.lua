-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Ambusher
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,640,1);
end;
