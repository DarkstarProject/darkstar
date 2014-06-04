-----------------------------------
-- Area: Gusgen Mines
-- MOB:  Ore Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,681,1);
end;