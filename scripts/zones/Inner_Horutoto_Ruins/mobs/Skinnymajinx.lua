-----------------------------------
-- Area: Inner Horutoto Ruins
-- MOB:  Skinnymajinx
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,653,2);
   checkGoVregime(killer,mob,654,2);
end;