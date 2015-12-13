-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Rumble Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,691,1);
end;