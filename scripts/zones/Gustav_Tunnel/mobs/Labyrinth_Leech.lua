-----------------------------------
-- Area: Gustav Tunnel
-- MOB:  Labyrinth Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,763,2);
end;