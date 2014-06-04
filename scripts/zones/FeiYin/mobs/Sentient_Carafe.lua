-----------------------------------
-- Area: Fei'Yin
-- MOB:  Sentient Carafe
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,718,2);
end;