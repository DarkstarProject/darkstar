-----------------------------------
-- Area: Dangruf Wadi
-- MOB:  Goblin Mugger
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,640,1);
end;
