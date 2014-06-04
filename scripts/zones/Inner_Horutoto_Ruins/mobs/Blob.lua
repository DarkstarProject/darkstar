-----------------------------------
-- Area: Inner Horutoto Ruins
-- MOB:  Blob
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,649,2);
end;