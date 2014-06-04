-----------------------------------
-- Area: The Boyahda Tree
-- MOB:  Steelshell
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,723,2);
end;