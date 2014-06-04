-----------------------------------
-- Area: Upper Delkfutt's Tower
-- MOB:  Magic Urn
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,788,3);
   checkGoVregime(killer,mob,789,3);
end;