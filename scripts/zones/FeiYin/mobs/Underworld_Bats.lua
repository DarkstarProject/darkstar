-----------------------------------
-- Area: Fei'Yin
-- MOB:  Underworld Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,713,1);
   checkGoVregime(killer,mob,714,1);
   checkGoVregime(killer,mob,715,1);
end;