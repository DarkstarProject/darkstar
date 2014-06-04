-----------------------------------
-- Area: Dangruf Wadi
-- MOB:  Witchetty Grub
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,643,1);
end;