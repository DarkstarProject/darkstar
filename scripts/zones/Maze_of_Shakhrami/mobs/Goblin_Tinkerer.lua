-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Goblin Tinkerer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,695,1);
end;