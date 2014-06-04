-----------------------------------
-- Area: Quicksand Caves
-- MOB:  Sabotender Bailaor
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,816,1);
end;