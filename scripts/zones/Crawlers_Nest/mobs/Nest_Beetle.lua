-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  Nest Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,688,2);
end;