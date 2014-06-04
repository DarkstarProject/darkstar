-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Shrieker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,656,2);
end;