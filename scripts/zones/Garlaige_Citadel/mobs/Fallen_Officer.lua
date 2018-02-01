-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Fallen Officer
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,703,2);
end;