-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Jotunn Gatekeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,786,2);
    checkGoVregime(player,mob,788,1);
end;