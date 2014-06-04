-----------------------------------
-- Area: Dangruf Wadi
-- MOB:  Goblin Thug
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,640,1);
end;
