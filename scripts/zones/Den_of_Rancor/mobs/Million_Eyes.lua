-----------------------------------
-- Area: Den of Rancor
-- MOB:  Million Eyes
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,800,1);
end;