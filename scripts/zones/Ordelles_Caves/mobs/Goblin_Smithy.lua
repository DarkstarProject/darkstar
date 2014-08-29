-----------------------------------
-- Area: Ordelle's Caves
-- MOB:  Goblin Smithy
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,657,1);
end;