-----------------------------------
-- Area: Den of Rancor
--  MOB: Puck
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,802,2);
end;