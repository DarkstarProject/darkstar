-----------------------------------
-- Area: Den of Rancor
-- MOB:  Dire Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,796,1);
   checkGoVregime(killer,mob,797,1);
end;