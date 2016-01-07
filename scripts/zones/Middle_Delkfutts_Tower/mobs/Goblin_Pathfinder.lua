-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Goblin Pathfinder
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,782,1);
    checkGoVregime(ally,mob,784,1);
end;