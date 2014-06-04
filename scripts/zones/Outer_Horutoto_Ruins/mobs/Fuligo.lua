-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Fuligo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,669,2);
   checkGoVregime(killer,mob,670,2);
end;