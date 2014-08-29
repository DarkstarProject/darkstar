-----------------------------------
-- Area: Shrine of Ru'Avitau
-- MOB:  Aura Statue
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,749,1);
   checkGoVregime(killer,mob,754,1);
end;