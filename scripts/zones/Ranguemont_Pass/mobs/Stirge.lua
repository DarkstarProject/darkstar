-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Stirge
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,606,1);
end;
