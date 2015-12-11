-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Battue Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,647,1);
end;