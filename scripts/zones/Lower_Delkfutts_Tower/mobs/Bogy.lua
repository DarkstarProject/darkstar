-----------------------------------
-- Area: Lower Delkfutt's Tower
-- MOB:  Bogy
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,780,2);
end;