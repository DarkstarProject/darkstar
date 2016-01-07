-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Soldier Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,688,1);
end;