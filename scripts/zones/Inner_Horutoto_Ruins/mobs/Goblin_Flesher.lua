-----------------------------------
-- Area: Inner Horutoto Ruins
-- MOB:  Goblin Flesher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,652,2);
end;