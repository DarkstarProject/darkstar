-----------------------------------   
-- Area: Dangruf Wadi   
-- MOB:  Goblin Ambusher   
-----------------------------------   

require("scripts/globals/groundsofvalor");   

-----------------------------------   
-- onMobDeath   
-----------------------------------   

function onMobDeath(mob,killer)   
   checkGoVregime(killer,mob,640,1);
end;   
