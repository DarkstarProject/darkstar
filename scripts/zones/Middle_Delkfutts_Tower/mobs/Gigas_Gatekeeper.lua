-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Gigas Gatekeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,783,1);
    checkGoVregime(player,mob,784,2);
end;