-----------------------------------
-- Area: Outer Horutoto
-- MOB:  Five of Swords
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,664,3);
end;