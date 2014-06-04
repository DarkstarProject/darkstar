-----------------------------------
-- Area: The Labyrinth of Onzozo
-- MOB:  Cockatrice
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,772,1);
   checkGoVregime(killer,mob,773,2);
end;