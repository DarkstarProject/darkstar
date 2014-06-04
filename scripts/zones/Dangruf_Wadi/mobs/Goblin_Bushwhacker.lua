-----------------------------------   
-- Area: Dangruf Wadi   
-- MOB:  Goblin Bushwhacker   
-----------------------------------   

require("scripts/globals/groundsofvalor");   

-----------------------------------   
-- onMobDeath   
-----------------------------------   

function onMobDeath(mob,killer)   
   checkGoVregime(killer,mob,645,3);
end;   