-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Exoray
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,690,1);
end;