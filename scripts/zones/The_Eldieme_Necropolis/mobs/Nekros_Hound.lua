-----------------------------------
-- Area: The Eldieme Necropolis
-- MOB:  Nekros Hound
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,677,2);
   checkGoVregime(killer,mob,678,2);
end;