-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Wingrats
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,703,1);
end;