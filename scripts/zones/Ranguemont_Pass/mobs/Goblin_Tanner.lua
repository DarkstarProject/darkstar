-----------------------------------
-- Area: Ranguemont Pass
-- MOB:  Goblin Tanner
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,609,1);
end;
