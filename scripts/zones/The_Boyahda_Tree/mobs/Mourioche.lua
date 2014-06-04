-----------------------------------
-- Area: The Boyahda Tree
-- MOB:  Mourioche
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,720,1);
   checkGoVregime(killer,mob,721,1);
end;