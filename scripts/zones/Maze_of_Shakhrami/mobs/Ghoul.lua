-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Ghoul
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,697,1);
end;