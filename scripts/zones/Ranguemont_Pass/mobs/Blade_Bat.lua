-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Blade Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,602,2);
end;
