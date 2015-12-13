-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Jelly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,659,2);
end;