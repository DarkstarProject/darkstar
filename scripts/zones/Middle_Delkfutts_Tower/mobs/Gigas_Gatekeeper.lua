-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Gigas Gatekeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,783,1);
    checkGoVregime(ally,mob,784,2);
end;