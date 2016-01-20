-----------------------------------
-- Area: Den of Rancor
--  MOB: Cave Worm
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,796,2);
end;