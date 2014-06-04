-----------------------------------
-- Area: Den of Rancor
-- MOB:  Tormentor
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,802,1);
   checkGoVregime(killer,mob,803,1);
end;