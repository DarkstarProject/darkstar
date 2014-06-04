-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  Hornfly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,690,2);
end;