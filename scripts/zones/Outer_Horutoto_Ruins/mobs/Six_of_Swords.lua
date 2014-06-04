-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Six of Swords
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,665,3);
end;