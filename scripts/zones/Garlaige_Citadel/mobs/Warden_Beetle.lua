-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Warden Beetle
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,710,2);
end;