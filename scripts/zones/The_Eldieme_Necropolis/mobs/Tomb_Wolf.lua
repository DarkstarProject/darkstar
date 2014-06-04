-----------------------------------
-- Area: The Eldieme Necropolis
-- MOB:  Tomb Wolf
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,675,1);
end;