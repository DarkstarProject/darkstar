-----------------------------------
-- Area: Fei'Yin
--  MOB: Shadow
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,712,1);
end;