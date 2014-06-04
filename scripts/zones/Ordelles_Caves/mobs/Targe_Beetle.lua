-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Targe Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,661,2);
end;