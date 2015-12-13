-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Jotunn Wildkeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,787,2);
    checkGoVregime(ally,mob,789,1);
end;