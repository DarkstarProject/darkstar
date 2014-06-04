-----------------------------------
-- Area: The Labyrinth of Onzozo
-- MOB:  Mushussu
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,773,1);
end;