-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Ancient Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,659,1);
end;