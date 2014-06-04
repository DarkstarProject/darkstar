-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Maze Maker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,696,1);
end;