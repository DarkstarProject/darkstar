-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Goblin Furrier
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,695,1);
end;
