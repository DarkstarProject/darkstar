-----------------------------------
-- Area: Inner Horutoto Ruins
-- MOB:  Battle Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,649,1);
end;