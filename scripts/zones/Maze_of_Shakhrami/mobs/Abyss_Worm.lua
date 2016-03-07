-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Abyss Worm
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,699,1);
    checkGoVregime(ally,mob,700,1);
end;