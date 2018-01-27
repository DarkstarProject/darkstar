-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Droma
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,707,1);
end;