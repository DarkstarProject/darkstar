-----------------------------------
-- Area: Upper Delkfutt's Tower
-- MOB:  Jotunn Hallkeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,787,1);
   checkGoVregime(killer,mob,788,2);
end;