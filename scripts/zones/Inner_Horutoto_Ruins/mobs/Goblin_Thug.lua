-----------------------------------
-- Area: Inner Horutoto Ruins
-- MOB:  Goblin Thug
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,647,2);
end;