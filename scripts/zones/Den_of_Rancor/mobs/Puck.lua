-----------------------------------
-- Area: Den of Rancor
-- MOB:  Puck
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,802,2);
end;