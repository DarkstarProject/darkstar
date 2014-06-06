-----------------------------------
-- Area: The Boyahda Tree
-- MOB:  Moss Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,721,2);
end;