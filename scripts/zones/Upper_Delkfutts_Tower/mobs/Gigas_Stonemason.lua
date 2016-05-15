-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Gigas Stonemason
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,785,1);
end;