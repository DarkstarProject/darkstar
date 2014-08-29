-----------------------------------
-- Area: The Labyrinth of Onzozo
-- MOB:  Goblin Poacher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,771,2);
   checkGoVregime(killer,mob,772,2);
   checkGoVregime(killer,mob,774,2);
end;