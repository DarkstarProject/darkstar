-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Amphisbaena
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,682,2);
end;