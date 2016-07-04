-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Mold Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,782,2);
    checkGoVregime(player,mob,783,2);
end;