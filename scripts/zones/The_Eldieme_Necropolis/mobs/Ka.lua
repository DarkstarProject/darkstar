-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Ka
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,672,1);
    checkGoVregime(player,mob,673,1);
end;