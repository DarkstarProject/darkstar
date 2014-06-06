-----------------------------------
-- Area: Lower Delkfutt's Tower
-- MOB:  Magic Pot
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,781,2);
end;