-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Incubus Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,786,3);
    checkGoVregime(ally,mob,787,3);
end;