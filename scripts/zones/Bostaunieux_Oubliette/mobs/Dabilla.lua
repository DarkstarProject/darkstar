-----------------------------------
-- Area: Bostaunieux Oubliette
-- MOB:  Dabilla
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,612,1);
   checkGoVregime(killer,mob,614,1);
end;
