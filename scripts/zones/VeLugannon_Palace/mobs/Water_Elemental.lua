-----------------------------------
-- Area: Ve'Lugannon Palace
--  MOB: Water Elemental
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,748,1);
end;