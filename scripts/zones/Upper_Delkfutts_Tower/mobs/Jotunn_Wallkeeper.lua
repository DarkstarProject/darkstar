-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Jotunn Wallkeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,786,1);
    checkGoVregime(ally,mob,789,2);
end;