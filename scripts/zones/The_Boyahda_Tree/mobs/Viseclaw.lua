-----------------------------------
-- Area: The Boyahda Tree
-- MOB:  Viseclaw
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,726,1);
end;