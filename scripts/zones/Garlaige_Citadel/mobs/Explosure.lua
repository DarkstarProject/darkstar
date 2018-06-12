-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Explosure
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,706,2);
end;