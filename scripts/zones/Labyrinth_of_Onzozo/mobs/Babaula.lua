-----------------------------------
-- Area: The Labyrinth of Onzozo
-- MOB:  Babaula
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,776,1);
end;