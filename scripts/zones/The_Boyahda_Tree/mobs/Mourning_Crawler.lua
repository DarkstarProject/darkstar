-----------------------------------
-- Area: The Boyahda Tree
-- MOB:  Mourning Crawler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,726,3);
end;