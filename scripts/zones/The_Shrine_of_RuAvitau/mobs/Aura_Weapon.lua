-----------------------------------
-- Area: Shrine of Ru'Avitau
-- MOB:  Aura Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,753,1);
end;