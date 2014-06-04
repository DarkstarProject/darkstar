-----------------------------------
-- Area: Dangruf Wadi
-- MOB:  Goblin Healer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,644,2);
end;