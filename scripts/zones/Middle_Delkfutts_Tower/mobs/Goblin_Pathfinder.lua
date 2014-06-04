-----------------------------------
-- Area: Middle Delkfutt's Tower
-- MOB:  Goblin Pathfinder
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,782,1);
   checkGoVregime(killer,mob,784,1);
end;