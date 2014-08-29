-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  Olid Funguar
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,694,2);
end;