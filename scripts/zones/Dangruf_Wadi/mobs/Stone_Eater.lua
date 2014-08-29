-----------------------------------
-- Area: Dangruf Wadi
-- MOB:  Stone Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,639,1);
end;
