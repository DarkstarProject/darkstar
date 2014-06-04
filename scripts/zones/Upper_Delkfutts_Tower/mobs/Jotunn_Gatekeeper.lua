-----------------------------------
-- Area: Upper Delkfutt's Tower
-- MOB:  Jotunn Gatekeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,786,2);
   checkGoVregime(killer,mob,788,1);
end;