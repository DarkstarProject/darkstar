-----------------------------------
-- Area: Upper Delkfutt's Tower
-- MOB:  Dire Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,786,3);
   checkGoVregime(killer,mob,787,3);
end;