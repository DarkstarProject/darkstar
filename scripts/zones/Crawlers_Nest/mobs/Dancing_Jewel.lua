-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Dancing Jewel
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,694,1);
end;