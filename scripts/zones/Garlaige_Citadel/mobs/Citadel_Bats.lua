-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Citadel Bats
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,705,2);
end;