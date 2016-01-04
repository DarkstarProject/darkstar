-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Ooze
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,603,2);
end;
