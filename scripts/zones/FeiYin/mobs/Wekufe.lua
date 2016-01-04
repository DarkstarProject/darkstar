-----------------------------------
-- Area: Fei'Yin
--  MOB: Wekufe
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,717,2);
end;