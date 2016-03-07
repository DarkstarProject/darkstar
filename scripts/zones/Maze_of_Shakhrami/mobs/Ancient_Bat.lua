-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Ancient Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,698,2);
    checkGoVregime(ally,mob,699,2);
end;