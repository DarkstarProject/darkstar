-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Troika Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,651,1);
end;