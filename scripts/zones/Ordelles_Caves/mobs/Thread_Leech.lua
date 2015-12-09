-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Thread Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,655,2);
end;