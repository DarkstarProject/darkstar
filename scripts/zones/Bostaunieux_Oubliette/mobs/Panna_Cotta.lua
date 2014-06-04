-----------------------------------
-- Area: Bostaunieux Oubliette
-- MOB:  Panna Cotta
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,614,2);
   checkGoVregime(killer,mob,615,2);
end;
