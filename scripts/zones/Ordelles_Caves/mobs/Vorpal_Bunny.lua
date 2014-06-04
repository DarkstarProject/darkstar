-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Vorpal Bunny
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,658,1);
end;