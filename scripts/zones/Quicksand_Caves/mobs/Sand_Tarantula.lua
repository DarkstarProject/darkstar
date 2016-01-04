-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Tarantula
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,819,1);
end;