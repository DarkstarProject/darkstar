-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  King Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,693,1);
end;