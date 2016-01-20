-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Olid Funguar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,694,2);
end;