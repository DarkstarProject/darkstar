-----------------------------------
-- Area: Inner Horutoto Ruins
-- MOB:  Goblin Lurcher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,654,1);
end;