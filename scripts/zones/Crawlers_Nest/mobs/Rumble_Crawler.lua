-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  Rumble Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,691,1);
end;