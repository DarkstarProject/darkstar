-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Warren Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,702,1);
end;