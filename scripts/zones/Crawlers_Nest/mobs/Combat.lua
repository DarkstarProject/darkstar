-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Combat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,696,2);
end;