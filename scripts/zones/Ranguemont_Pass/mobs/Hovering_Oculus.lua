-----------------------------------
-- Area: Ranguemont Pass
-- MOB:  Hovering Oculus
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,607,2);
end;
