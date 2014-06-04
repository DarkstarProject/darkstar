-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  Death Jacket
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,687,2);
end;