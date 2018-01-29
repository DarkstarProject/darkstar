-----------------------------------
-- Area: Toraimorai Canal
--  MOB: Poroggo Excavator
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,625,2);
end;
