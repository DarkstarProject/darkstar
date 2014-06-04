-----------------------------------
-- Area: Ranguemont Pass
-- MOB:  Goblin Gambler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,604,2);
   checkGoVregime(killer,mob,605,2);
end;
