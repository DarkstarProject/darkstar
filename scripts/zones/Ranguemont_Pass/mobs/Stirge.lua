-----------------------------------
-- Area: Ranguemont Pass
-- MOB:  Stirge
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,606,1);
end;
