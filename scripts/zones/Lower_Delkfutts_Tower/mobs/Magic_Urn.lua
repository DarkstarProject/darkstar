-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Magic Urn
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,781,2);
end;