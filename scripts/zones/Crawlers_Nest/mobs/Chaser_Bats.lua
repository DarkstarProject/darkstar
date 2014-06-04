-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Chaser Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,701,1);
end;