-----------------------------------   
-- Area: Temple Of Uggalepih
-- MOB:  Hover Tank   
-----------------------------------   

require("scripts/globals/groundsofvalor");   

-----------------------------------   
-- onMobDeath   
-----------------------------------   

function onMobDeath(mob,killer)   
   checkGoVregime(killer,mob,794,2);
end;   