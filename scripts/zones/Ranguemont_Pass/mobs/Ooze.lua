-----------------------------------
-- Area: Ranguemont Pass
-- MOB:  Ooze
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,603,2);
end;
