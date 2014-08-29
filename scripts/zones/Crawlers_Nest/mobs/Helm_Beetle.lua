-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  Helm Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,692,1);
end;