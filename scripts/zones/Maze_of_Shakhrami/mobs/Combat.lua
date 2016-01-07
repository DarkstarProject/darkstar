-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Combat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,696,2);
end;
