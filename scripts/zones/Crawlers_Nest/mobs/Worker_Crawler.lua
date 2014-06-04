-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  Worker Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,687,1);
end;