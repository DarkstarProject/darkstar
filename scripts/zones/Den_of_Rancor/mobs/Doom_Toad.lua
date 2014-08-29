-----------------------------------
-- Area: Den of Rancor
-- MOB:  Doom Toad
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,801,2);
end;