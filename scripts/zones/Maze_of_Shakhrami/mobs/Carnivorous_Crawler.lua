-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Carnivorous Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,697,2);
end;