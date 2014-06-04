-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Bilis Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,662,1);
end;