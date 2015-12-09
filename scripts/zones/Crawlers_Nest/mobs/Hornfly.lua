-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Hornfly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,690,2);
end;