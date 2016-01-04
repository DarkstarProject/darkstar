-----------------------------------
-- Area: Den of Rancor
--  MOB: Succusbus Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,799,1);
end;