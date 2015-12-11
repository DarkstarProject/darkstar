-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Vespo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,693,2);
end;