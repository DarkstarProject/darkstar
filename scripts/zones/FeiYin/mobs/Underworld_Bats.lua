-----------------------------------
-- Area: Fei'Yin
--  MOB: Underworld Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,713,1);
    checkGoVregime(ally,mob,714,1);
    checkGoVregime(ally,mob,715,1);
end;