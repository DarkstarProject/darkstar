-----------------------------------
-- Area: The Labyrinth of Onzozo
-- MOB:  Boribaba
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,776,2);
end;