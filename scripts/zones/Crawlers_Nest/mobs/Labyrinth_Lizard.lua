-----------------------------------
-- Area: Crawlers' Nest
--  MOB: Labyrinth Lizard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,689,1);
end;