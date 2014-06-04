-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Jelly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,659,2);
end;