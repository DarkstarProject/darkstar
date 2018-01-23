-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Blood Soul
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,674,2);
end;