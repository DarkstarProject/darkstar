-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Mourning Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,726,3);
end;