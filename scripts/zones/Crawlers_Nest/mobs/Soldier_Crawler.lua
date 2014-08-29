-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  Soldier Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,688,1);
end;