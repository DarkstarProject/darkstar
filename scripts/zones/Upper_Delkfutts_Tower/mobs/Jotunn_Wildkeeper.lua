-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Jotunn Wildkeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,787,2);
    checkGoVregime(player,mob,789,1);
end;