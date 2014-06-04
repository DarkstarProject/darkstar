-----------------------------------
-- Area: Quicksand Caves
-- MOB:  Sand Lizard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,817,1);
end;