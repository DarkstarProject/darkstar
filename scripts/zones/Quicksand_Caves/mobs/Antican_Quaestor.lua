-----------------------------------
-- Area: Quicksand Caves
-- MOB:  Antican Quaestor
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,812,2);
   checkGoVregime(killer,mob,813,2);
   checkGoVregime(killer,mob,814,2);
   checkGoVregime(killer,mob,815,1);
   checkGoVregime(killer,mob,816,2);
   checkGoVregime(killer,mob,817,2);
   checkGoVregime(killer,mob,818,2);
   checkGoVregime(killer,mob,819,2);
end;