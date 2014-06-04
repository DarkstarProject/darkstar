-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Doom Mage
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,765,2);
end;