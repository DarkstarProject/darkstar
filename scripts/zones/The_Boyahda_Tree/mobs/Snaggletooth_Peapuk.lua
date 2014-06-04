-----------------------------------
-- Area: The Boyahda Tree
-- MOB:  Snaggletooth Peapuk
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,726,2);
end;