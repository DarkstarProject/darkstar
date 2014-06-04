-----------------------------------
-- Area: Dangruf Wadi
-- MOB:  Prim Pika
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,644,1);
end;