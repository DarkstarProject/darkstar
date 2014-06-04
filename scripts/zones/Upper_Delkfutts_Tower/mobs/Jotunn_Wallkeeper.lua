-----------------------------------
-- Area: Upper Delkfutt's Tower
-- MOB:  Jotunn Wallkeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,786,1);
   checkGoVregime(killer,mob,789,2);
end;