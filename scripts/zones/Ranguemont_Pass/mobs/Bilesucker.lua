-----------------------------------
-- Area: Ranguemont Pass
-- MOB:  Bilesucker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,607,1);
end;
