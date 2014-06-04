-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Fetor Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,669,1);
end;