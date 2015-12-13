-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Nest Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,688,2);
end;