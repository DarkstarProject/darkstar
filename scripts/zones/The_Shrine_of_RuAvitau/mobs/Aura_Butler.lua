-----------------------------------
-- Area: Shrine of Ru'Avitau
-- MOB:  Aura Butler
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,749,1);
   checkGoVregime(killer,mob,752,1);
end;