-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Digger
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,814,1);
end;