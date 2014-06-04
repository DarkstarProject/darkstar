-----------------------------------
-- Area: The Boyahda Tree
-- MOB:  Skimmer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,723,1);
end;