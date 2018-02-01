-----------------------------------
-- Area: Ve'Lugannon Palace
--  MOB: Fire Elemental
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,748,1);
end;