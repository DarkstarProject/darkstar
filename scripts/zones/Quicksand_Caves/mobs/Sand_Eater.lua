-----------------------------------
-- Area: Quicksand Caves
-- MOB:  Sand Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,814,1);
end;