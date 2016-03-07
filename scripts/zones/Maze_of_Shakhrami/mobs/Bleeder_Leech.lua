-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Bleeder Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,701,2);
end;