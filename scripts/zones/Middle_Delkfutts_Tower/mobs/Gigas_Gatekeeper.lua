-----------------------------------
-- Area: Middle Delkfutt's Tower
-- MOB:  Gigas Gatekeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,783,1);
   checkGoVregime(killer,mob,784,2);
end;