-----------------------------------
-- Area: Crawlers' Nest
-- MOB:  Witch Hazel
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,689,2);
end;