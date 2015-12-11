-----------------------------------
-- Area: Fei'Yin
--  MOB: Balayang
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,717,1);
    checkGoVregime(ally,mob,718,1);
end;