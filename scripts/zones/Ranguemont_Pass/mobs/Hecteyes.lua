-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Hecteyes
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,606,2);
end;
