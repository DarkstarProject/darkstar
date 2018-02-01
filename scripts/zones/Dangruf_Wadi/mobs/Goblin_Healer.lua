-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Healer
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,640,1);
    checkGoVregime(player,mob,644,2);
end;