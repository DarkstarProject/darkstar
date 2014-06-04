-----------------------------------
-- Area: The Boyahda Tree
-- MOB:  Processionaire
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,724,1);
end;