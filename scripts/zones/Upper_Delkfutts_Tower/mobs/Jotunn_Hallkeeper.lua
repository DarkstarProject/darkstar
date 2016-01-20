-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Jotunn Hallkeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,787,1);
    checkGoVregime(ally,mob,788,2);
end;