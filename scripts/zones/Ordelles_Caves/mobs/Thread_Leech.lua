-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Thread Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,655,2);
end;