-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Funnel Bats
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,706,1);
end;