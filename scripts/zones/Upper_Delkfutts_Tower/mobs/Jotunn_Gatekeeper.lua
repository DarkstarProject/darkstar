-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Jotunn Gatekeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,786,2);
    checkGoVregime(ally,mob,788,1);
end;