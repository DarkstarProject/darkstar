-----------------------------------   
-- Area: Dangruf Wadi   
-- MOB:  Goblin Bladesmith   
-----------------------------------   

require("scripts/globals/groundsofvalor");   

-----------------------------------   
-- onMobDeath   
-----------------------------------   

function onMobDeath(mob,killer)   
   checkGoVregime(killer,mob,645,2);
end;   