-----------------------------------
-- Area: Fei'Yin
-- MOB:  Specter
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,712,1);
end;