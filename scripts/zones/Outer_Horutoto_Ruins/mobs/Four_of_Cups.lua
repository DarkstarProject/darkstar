-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Four Of Cups
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,663,1);
end;