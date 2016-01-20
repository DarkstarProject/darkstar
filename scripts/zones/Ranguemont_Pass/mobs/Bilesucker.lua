-----------------------------------
-- Area: Ranguemont Pass
--  MOB: Bilesucker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,607,1);
end;
