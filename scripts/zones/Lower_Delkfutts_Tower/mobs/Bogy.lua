-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Bogy
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,780,2);
end;