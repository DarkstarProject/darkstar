-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Jotunn Wallkeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,786,1);
    checkGoVregime(player,mob,789,2);
end;