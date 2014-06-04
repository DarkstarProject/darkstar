-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Four of Batons
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,663,2);
end;