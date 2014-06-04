-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Swagger Spruce
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,662,2);
end;