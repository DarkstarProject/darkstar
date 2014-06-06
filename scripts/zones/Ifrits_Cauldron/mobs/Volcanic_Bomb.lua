-----------------------------------
-- Area: Ifrit's Cauldron
-- MOB:  Volcanic Bomb
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,760,2);
   checkGoVregime(killer,mob,761,2);
   checkGoVregime(killer,mob,762,2);
end;