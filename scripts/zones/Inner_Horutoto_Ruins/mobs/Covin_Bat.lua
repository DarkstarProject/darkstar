-----------------------------------
-- Area: Inner Horutoto Ruins
-- MOB:  Covin Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,653,1);
end;