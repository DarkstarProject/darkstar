-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Chaser Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,701,1);
end;