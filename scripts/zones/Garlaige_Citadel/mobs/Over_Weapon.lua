-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Over Weapon
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,705,1);
    checkGoVregime(player,mob,708,1);
end;