-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Wraith
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,708,3);
end;