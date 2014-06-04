-----------------------------------
-- Area: Upper Delkfutt's Tower
-- MOB:  Gigas Bonecutter
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,785,1);
end;