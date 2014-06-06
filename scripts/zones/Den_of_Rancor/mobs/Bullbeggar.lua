-----------------------------------
-- Area: Den of Rancor
-- MOB:  Bullbeggar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,803,2);
end;