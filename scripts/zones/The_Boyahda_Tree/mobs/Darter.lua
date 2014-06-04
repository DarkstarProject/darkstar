-----------------------------------
-- Area: The Boyahda Tree
-- MOB:  Darter
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,724,2);
end;