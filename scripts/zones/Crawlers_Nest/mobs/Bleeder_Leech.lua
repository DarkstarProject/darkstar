-----------------------------------
-- Area: Maze of Shakhrami
-- MOB:  Bleeder Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,701,2);
end;