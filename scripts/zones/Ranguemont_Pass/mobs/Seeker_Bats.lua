-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Seeker Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,603,1);
end;
