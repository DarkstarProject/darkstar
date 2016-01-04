-----------------------------------
-- Area: Quicksand Caves
--  MOB: Helm Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,813,1);
end;