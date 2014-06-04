-----------------------------------
-- Area: Lower Delkfutt's Tower
-- MOB:  Ancient Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,777,1);
   checkGoVregime(killer,mob,778,1);
   checkGoVregime(killer,mob,779,1);
   checkGoVregime(killer,mob,780,1);
   checkGoVregime(killer,mob,781,1);
end;