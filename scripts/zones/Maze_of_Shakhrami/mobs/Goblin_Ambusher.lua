-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Goblin Ambusher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,695,1);
end;