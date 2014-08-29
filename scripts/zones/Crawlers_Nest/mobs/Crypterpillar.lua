-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Crypterpillar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,702,2);
end;