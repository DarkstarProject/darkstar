-----------------------------------
-- Area: Ranguemont Pass
-- MOB:  Goblin Leecher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,605,1);
end;
