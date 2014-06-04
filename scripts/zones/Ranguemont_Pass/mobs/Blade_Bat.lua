-----------------------------------
-- Area: Ranguemont Pass
-- MOB:  Blade Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,602,2);
end;
