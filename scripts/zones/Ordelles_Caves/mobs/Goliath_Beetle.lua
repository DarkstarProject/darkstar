-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Goliath Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,660,1);
end;