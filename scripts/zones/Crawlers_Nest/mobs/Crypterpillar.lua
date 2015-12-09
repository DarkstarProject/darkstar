-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Crypterpillar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,702,2);
end;