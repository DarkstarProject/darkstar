-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Six of Batons
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,665,2);
end;