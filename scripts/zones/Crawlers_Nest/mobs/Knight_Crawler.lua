-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  Knight Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,692,2);
end;