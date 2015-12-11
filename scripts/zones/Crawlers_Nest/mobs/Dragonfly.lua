-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Dragonfly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,691,3);
end;