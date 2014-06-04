-----------------------------------
-- Area: Fei'Yin
-- MOB:  Wekufe
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,717,2);
end;