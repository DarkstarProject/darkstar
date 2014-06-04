-----------------------------------
-- Area: Middle Delkfutt's Tower
-- MOB:  Stirge
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,782,2);
   checkGoVregime(killer,mob,783,2);
end;