-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Incubus Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,786,3);
    checkGoVregime(player,mob,787,3);
end;