-----------------------------------
-- Area: Middle Delkfutt's Tower
--  MOB: Tower Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,782,2);
    checkGoVregime(ally,mob,783,2);
end;