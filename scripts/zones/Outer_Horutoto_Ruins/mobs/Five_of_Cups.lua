-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Five of Cups
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,664,1);
end;