-----------------------------------
-- Area: Quicksand Caves
-- MOB:  Sand Tarantula
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,819,1);
end;