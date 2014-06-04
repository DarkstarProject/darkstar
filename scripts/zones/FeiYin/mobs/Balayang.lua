-----------------------------------
-- Area: Fei'Yin
-- MOB:  Balayang
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,717,1);
   checkGoVregime(killer,mob,718,1);
end;