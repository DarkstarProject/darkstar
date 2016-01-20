-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Death Jacket
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,687,2);
end;