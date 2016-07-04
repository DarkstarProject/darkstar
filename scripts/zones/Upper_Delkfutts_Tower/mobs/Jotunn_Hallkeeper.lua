-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Jotunn Hallkeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,787,1);
    checkGoVregime(player,mob,788,2);
end;