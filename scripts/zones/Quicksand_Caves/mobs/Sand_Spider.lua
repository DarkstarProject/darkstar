-----------------------------------
-- Area: Quicksand Caves
-- MOB:  Sand Spider
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,812,1);
end;