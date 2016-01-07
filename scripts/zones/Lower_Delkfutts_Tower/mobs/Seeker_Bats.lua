-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Seeker Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,777,1);
    checkGoVregime(ally,mob,778,1);
    checkGoVregime(ally,mob,779,1);
    checkGoVregime(ally,mob,780,1);
    checkGoVregime(ally,mob,781,1);
end;