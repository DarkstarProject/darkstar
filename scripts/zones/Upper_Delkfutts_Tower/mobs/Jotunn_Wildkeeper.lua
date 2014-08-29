-----------------------------------
-- Area: Upper Delkfutt's Tower
-- MOB:  Jotunn Wildkeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,787,2);
   checkGoVregime(killer,mob,789,1);
end;