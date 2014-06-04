-----------------------------------
-- Area: Garlaige Citadel
-- MOB:  Demonic Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,705,1);
end;