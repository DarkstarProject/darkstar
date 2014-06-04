-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Eight of Batons
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,667,2);
end;