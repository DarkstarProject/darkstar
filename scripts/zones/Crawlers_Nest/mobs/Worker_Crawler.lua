-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Worker Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,687,1);
end;