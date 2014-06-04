-----------------------------------
-- Area: The Boyahda Tree
-- MOB:  Elder Goobbue
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,722,2);
end;