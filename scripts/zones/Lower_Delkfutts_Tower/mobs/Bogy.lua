-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Bogy
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,780,2);
end;