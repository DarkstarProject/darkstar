-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Wind Bats
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,602,1);
end;
