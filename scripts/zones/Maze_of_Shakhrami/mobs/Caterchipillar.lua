-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Caterchipillar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,698,1);
end;