-----------------------------------
-- Area: Den of Rancor
-- MOB:  Cave Worm
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,796,2);
end;