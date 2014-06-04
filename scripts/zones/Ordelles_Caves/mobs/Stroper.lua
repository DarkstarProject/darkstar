-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Stroper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,660,2);
end;