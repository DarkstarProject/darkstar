-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Kaboom
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,709,2);
end;