-----------------------------------
-- Area: Middle Delkfutt's Tower
-- MOB:  Gigas Jailer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,783,1);
   checkGoVregime(killer,mob,784,2);
end;