-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Donjon Bat
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,709,1);
end;