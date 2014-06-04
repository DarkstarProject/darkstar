-----------------------------------   
-- Area: Dangruf Wadi   
-- MOB:  Goblin Brigand   
-----------------------------------   

require("scripts/globals/groundsofvalor");   

-----------------------------------   
-- onMobDeath   
-----------------------------------   

function onMobDeath(mob,killer)   
   checkGoVregime(killer,mob,642,2);
end;   