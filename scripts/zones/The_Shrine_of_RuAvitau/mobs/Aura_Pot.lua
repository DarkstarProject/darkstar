-----------------------------------
-- Area: Shrine of Ru'Avitau
-- MOB:  Aura Pot
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,749,1);
   checkGoVregime(killer,mob,751,1);
end;